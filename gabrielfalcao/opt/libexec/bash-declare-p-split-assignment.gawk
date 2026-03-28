#!/usr/bin/env gawk -f

function cls() {
    printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr"
}

BEGIN {
    delete line_subexps
}
 {
    delete line_subexps
    if (match($0, /^\s*((declare|local)([[:space:]]*([-]([-]|[a-zA-Z]+))[[:space:]]*)?)([a-zA-Z_]+[a-zA-Z0-9_]*)([=](.*))?$/, line_regexps
         delete path_subexps
         split($3, path_subexps, "=")
         printf("%s:\n\t%s\n\n",path_subexps[1], path_subexps[2])
     }
 }
