#!/usr/bin/env gawk -f
BEGIN {
    IGNORECASE = 1
    root_filesystem_dev = "/dev/disk3s3s1"
    root_filesystem_regex = sprintf("^%s$", root_filesystem_dev)
    filesystem_regex = "^/(dev|Volumes)/([^/]+)(/([^/]+)+)?$"
    delete devices
    delete device_entries
    delete mountpoints
    row_index = 0
    delete factor_by_unit
    delete unit_by_factor
    factor_by_unit["B"] = 1
    unit_by_factor[1] = "B"
    factor_by_unit[""] = 1
    unit_by_factor[1] = ""
    factor_by_unit["K"] = 1024
    unit_by_factor[1024] = "K"
    factor_by_unit["M"] = 1024 * 1024
    unit_by_factor[1024 * 1024] = "M"
    factor_by_unit["G"] = 1024 * 1024 * 1024
    unit_by_factor[1024 * 1024 * 1024] = "G"
    factor_by_unit["T"] = 1024 * 1024 * 1024 * 1024
    unit_by_factor[1024 * 1024 * 1024 * 1024] = "T"
}

{
    if (NR == 1) {
        if ($2 ~ /1(K|024)-blocks/) {
            blocK_size = 1024
        } else {
            printf("[input error]: input of diskstats.gawk should be the stdoud of the command `BLOCKSIZE=1024 df' to ensure correct block size\n") > "/dev/stderr"
            exit 1
        }
    }
    filesystem = $1
    delete fs_subexps
    size_bytes = strtonum($2)
    used_bytes = strtonum($3)
    available_bytes = strtonum($4)
    printf "<%s>\n", NR
    if (match(filesystem, filesystem_regex, fs_subexps)) {
        printf ("<filesystem>\n")
        for (key in fs_subexps) {
            if (key ~ /^[0-9]+$/) {
                printf "filesystem[%d]='%s'\n", key, fs_subexps[key]
            }
        }
        printf ("</filesystem>\n")
    }
    use_percent = strtonum($5)
    mounted_on = ""
    for (i = 6; i < NF; i++) {
        if ((i + 1) < NF) {
            mounted_suffix = FS
        } else {
            mounted_suffix = ""
        }
        mounted_on = sprintf("%s%s%s", mounted_on, $i, mounted_suffix)
    }
    device_entries[filesystem]["filesystem"] = filesystem
    parse_bytes($2, "size", device_entries[filesystem])
    parse_bytes($3, "used", device_entries[filesystem])
    parse_bytes($4, "available", device_entries[filesystem])
    device_entries[filesystem]["use_percent"] = use_percent
    device_entries[filesystem]["mounted_on"] = mounted_on
    devices[row_index] = filesystem
    mountpoints[row_index] = mounted_on
    row_index++
    printf "</%s>\n\n", NR
}

END {
}


function parse_bytes(value, field_name, array_ref)
{
    if (! value) {
        printf("[parse_bytes error]: missing 'value' argument\n") > "/dev/stderr"
        exit 1
    }
    if (typeof(value) != "string" && typeof(value) != "number" && typeof(value) != "strnum") {
        printf("[parse_bytes error]: invalid type of 'value' argument, expected number but got: %s\n", typeof(value)) > "/dev/stderr"
        exit 1
    }
    if (! field_name) {
        printf("[parse_bytes error]: missing 'field_name' argument\n") > "/dev/stderr"
        exit 1
    }
    if (typeof(field_name) != "string") {
        printf("[parse_bytes error]: invalid type of 'field_name' argument, expected string but got: %s\n", typeof(field_name)) > "/dev/stderr"
        exit 1
    }
    if (typeof(array_ref) != "array") {
        printf("[parse_bytes error]: invalid type of 'array_ref' argument, expected array but got: %s\n", typeof(array_ref)) > "/dev/stderr"
        exit 1
    }
    delete parse_byte_unit_info
    absolute_value = 0
    unit_char = "B"
    factor = 1
    if (match(value, /^([0-9]+)(([A-Za-z])([i]([Bb])?)?)/, parse_byte_unit_info)) {
        absolute_value = strtonum(parse_byte_unit_info[1])
        unit_char = toupper(parse_byte_unit_info[3])
        value_scalar = strtonum(value) * factor
        factor = factor_by_unit[unit_char]
        if (typeof(factor) != "number") {
            printf("[parse_bytes error]: invalid/unexpected unit char from column 2: %q\n", $2) > "/dev/stderr"
            exit 1
        }
        array_ref[sprintf("%s_bytes", field_name)]=value_scalar
        array_ref[sprintf("%s", field_name)]=absolute_value;
        return 1
    } else if (value ~ /^[0-9]+([.][0-9]+)?$/) {
        array_ref[sprintf("%s_bytes", field_name)]=strtonum(value)
        array_ref[sprintf("%s", field_name)]=strtonum(value)
        return strtonum(value)
    } else {
        printf("error: %s\n", value) > "/dev/stderr"
        exit 1
    }
}
