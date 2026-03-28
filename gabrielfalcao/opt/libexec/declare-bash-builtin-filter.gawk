#!/usr/bin/env gawk -f

BEGIN {
    IGNORECASE=1;

    PROCINFO["sorted_in"] = "@ind_str_asc";
    delete parts;
    col3_var_name_regex  = "([A-Za-z_]+[A-Za-z0-9_]*)"
    col3_var_name_regex  = "(([A-Za-z_]+[A-Za-z0-9_]*)(COLOR|TERM)([A-Za-z_]+[A-Za-z0-9_]*))";

    col4_var_value_regex  = "([^=]+|.*\\[=].*|.*)"
    col4_var_value_regex  = "(true.*color|ansi.*color|.*color.*)"

    col3_full_regex  = sprintf("%s[=]%s", col3_var_name_regex, col4_var_value_regex);

    declare_stmt_options_regex = "([-]([-]|[a-zA-Z]+))"
    declare_stmt_keyword_regex = "(declare|local)"
    declare_stmt_line_regex = sprintf("^%s\s+(%s)\s+(%s)$", declare_stmt_keyword_regex, declare_stmt_options_regex, col3_full_regex)
    var_assignment_line_regex = sprintf("^%s[=]%s$", col3_any_var_name_regex, col4_var_value_regex);
    line_regex = sprintf("(%s|%s)", declare_stmt_line_regex, var_assignment_line_regex);
}


{
    delete parts
    if ($3 ~ /^\s*((declare|local)\s+([-]([-]|[a-zA-Z]+))\s+)(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
        if (split($3, parts, "=")) {
            # if split
            printf("# row %d\n\n", NR);

            for (key in parts) {
                printf("parts[%s]: %s\n", key, parts[key]);
            }
            printf("# %d\n\n", NR);
# endif:
        }
    }
}
