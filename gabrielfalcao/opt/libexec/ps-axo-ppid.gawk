#!/usr/bin/env gawk -f
BEGIN {
    delete ignored_rows
    pids_regex = sprintf("(%s|%s)", PROCINFO["pid"], PROCINFO["ppid"])
    # printf("\npids_regex=%s\n\n", pids_regex) > "/dev/stderr"
    ARGC = 0
    show_headers=0;
    delete fields_to_show
    actual_argc = length(PROCINFO["argv"])
    # printf "actual_argc=%s\n", actual_argc
    delete actual_regex_parts
    actual_regex = ""
    if (actual_argc >= 3) {
        for (key = 3; key < actual_argc; key++) {
            delete arg_subexps
            ty = typeof(PROCINFO["argv"][key])
            if (ty == "array") {
                for (subkey in PROCINFO["argv"][key]) {
                    ty_subkey=typeof(PROCINFO["argv"][key][subkey])
                    printf("PROCINFO['argv'][%s][%s]: %s = '%s'\n", key, subkey, ty_subkey, PROCINFO["argv"][key][subkey]) > "/dev/stderr"
                }
            }
            else {
                if (match(PROCINFO["argv"][key] ~ /[-]([0-9]+)/, arg_subexps)) {
                    for (subexp in arg_subexps) {
                        ty_subexp=typeof(arg_subexps[subexp])
                        printf("arg_subexps[%s]: %s = '%s'\n", key, ty_subexp, arg_subexps[subexp]) > "/dev/stderr"
                    }
                } else {

                    print("\nPROCINFO['argv'] => ", key, " => ", PROCINFO["argv"][key], typeof(PROCINFO["argv"][key])) > "/dev/stderr"
                    printf("PROCINFO['argv']['%s']: %s = '%s'\n", key, ty, val) > "/dev/stderr"
                    actual_regex_parts[arp++] = val
                    if ((key + 1) == actual_argc) {
                        regex_suffix = ""
                    } else {
                        regex_suffix = "|"
                    }
                    actual_regex = sprintf("%s%s%s", actual_regex, val, regex_suffix)
                }
            }
        }
    }
    printf("actual_regex = %s\n", actual_regex) > "/dev/stderr"
    ARGC = 0
}

{
   user = $1
   pid = $2
   ppid = $3
   shell_command = ""
   for (i = 4; i <= NF; i++) {
       shell_command = sprintf("%s%s%s", shell_command, $i, FS)
   }
   if ((NR == 1) && show_headers) {
       print $0
   } else if ((pid ~ pids_regex) || (! ppid ~ pids_regex)) {
       ignored_rows[NR] = "$0"
   } else if (shell_command ~ actual_regex) {
       print ($0)
   }
}
