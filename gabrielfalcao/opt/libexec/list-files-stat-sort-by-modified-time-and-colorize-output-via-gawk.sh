#!/usr/bin/env bash

set -umeTE
set +f
set -o pipefail
unset IFS
export IFS=$'\n'

declare -- script_name="$(basename "${BASH_SOURCE[0]}")"
declare -- script_path="$(2>/dev/random 1>/dev/random cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -- this_script_path="${script_path}/${script_name}"

on_exit() {
    set +x
    1>/dev/null 2>/dev/null stty sane
}
on_ctrlc() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\rAborted with Ctrl-C\x1b[0m"
    exit 130
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc bus
trap on_ctrlc segv
trap on_ctrlc sys
declare -r gstat_format=$'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m'

declare -a argv=(${@})
declare -i argc=${#argv[@]}

gstat -c

xurupira/ xurupira/src/* xurupira/* | sort -rn | gawk '{
modified=strtonum($1);
created=strtonum($2);
remaining=gensub(/^\s*[0-9]+\s+[0-9]+\s+/, "", $0);
result="";
cmd=sprintf("gdate --date=@%s --utc", modified);
    while ((cmd | getline line) > 0) {
        result=sprintf("%s%s%s\n", result, FS, line);
    }
close(cmd)
raw_result=result; result=gensub(/\s*[\n]+\s*/, "", "g", result);
printf("%s: %s\n", result, remaining);
}
'
