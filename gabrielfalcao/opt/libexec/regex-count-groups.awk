#!/usr/bin/env gawk -f

BEGIN {
    regexes["brackets"]="([[][()]+[]])"
    regexes["backslash"]="([\\][()])"
}

function redact(value) {
    value=sprintf("%s", value);
    len=length(value);
    result="";
    for (i=0;i<len;i++) {
        result=sprintf("%s_", result);
    }
    return result;
}
function validate_type(varname, value, type_name) {
    actual_type=typeof(value);
    if (value) {
        display=sprintf("%s (%s)", varname, value)
    } else {
        display=sprintf("%s", varname)

    }
    if (actual_type != type_name) {
        error = sprintf("expected %s to be of type %s but got a %s instead", display, type_name, actual_type);
        print error > /dev/stderr
        exit 1
    }

}
function fix_with_named_regex(input, regex_name) {
    validate_type("regex_name", regex_name, "string");
    regex=regexes[regex_name]
    validate_type(sprintf("regexes[\"%s\"]", regex_name), regex, "string");

    if (!input) {
        input=$0;
    }
    count=0
    data=sprintf("%s", input);
    # RSTART
    # RLENGTH
    printf("input=%s\n", data);
    printf("input length=%s\n\n", length(data));

    match(data, regex);
    while(RLENGTH >= 0) {
        count++;
        printf("(fix_%s) count=%s\n", regex_name, count);
        printf("\tdata=%s\n", data);
        printf("\tdata length=%s\n", length(data));
        printf("\tRSTART=%s\n", RSTART);
        printf("\tRLENGTH=%s\n", RLENGTH);
        found= substr(data, RSTART, RLENGTH);
        modified= gensub(regex, redact(found), 1, data);
        printf("\tfound=%s\n", found);
        printf("\tmodified=%s\n", modified);
        data=modified;
        match(data, regex);
        printf("\n");
    }
    return data
}

function fix_brackets(input) {
    return fix_with_named_regex(input, "brackets")
}
function fix_backslash(input) {
    return fix_with_named_regex(input, "backslash")
}

{
    input=$0;
    brackets_fix=fix_brackets(input);
    backslash_fix=fix_backslash(input);
    fixed=sprintf("%s", backslash_fix);
    par_open=gensub(/[^)]+/, "", "g", fixed);
    par_close=gensub(/[^(]+/, "", "g", fixed);
    total_par=length(fixed);
    total_open=length(par_open);
    total_close=length(par_close);

    printf(" line: %s\n data: %s\nfixed: %s\n\n", NR, input, fixed);

    if (total_open == total_close) {
        printf("groups: %s\n\n", total_open);
    } else {
        printf("open parenthesis: %s\nclose parenthesis: %s\n\n", total_open, total_close);
    }
}
