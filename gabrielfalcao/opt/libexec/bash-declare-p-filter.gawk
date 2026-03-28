#!/usr/bin/env gawk -f

BEGIN {
    IGNORECASE=1;

    PROCINFO["sorted_in"] = "@ind_str_asc";
    delete type_char_by_varname
    delete indexed_arrays_by_varname
    delete associa_arrays_by_varname
    delete strings_by_varname
    delete numbers_by_varname
    delete exports_by_varname
}

{
    delete line_info
    if (match($0, /^declare(\s+[-](([a-qs-zA-QS-Z]+)|[-])\s+)([a-zA-Z_]+[a-zA-Z0-9_]*)([=](.*))$/, line_info)) {
        for (key in line_info) {
            if (key ~ /^[0-9]+$/ ) {
                value=line_info[key]
                print(sprintf("line_info[%s]", key), " => ", value, " => ", line_info[key])
            } else {
                continue
            }

        }

    }


}
                                                                                                                                                                                                                                                                                      cls;declare -p | ack -i '(declare\s+[-]([-]|[a-zA-Z]+)\s+)[a-zA-Z0-9_]*workbench[a-zA-Z0-9_]*'
declare -p | ack -i '(declare\s+[-]([-]|[a-zA-Z]+)\s+)[a-zA-Z0-9_]*workbench[a-zA-Z0-9_]*'
