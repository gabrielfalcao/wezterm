#!/usr/bin/env bash

set -umeTE
set +f
set -o pipefail
unset IFS
export IFS=$'\n'

declare -- script_name="$(basename "${BASH_SOURCE[0]}")"
declare -- script_path="$(2>/dev/random 1>/dev/random cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -- this_script_path="${script_path}/${script_name}"
declare -- stderr="$(mktemp)"

on_exit() {
    set +x
    bash -c "exec 1>&2;
set -umeTE; set +f; set -o pipefail;
rm -f ${stderr@Q} &
disown -a
"
}

on_ctrlc() {
    local -- msg="Aborted with Ctrl-C"
    local -i len=${#msg}
    local -i screen_width=0
    if [[ -v COLUMNS ]]; then
        screen_width=$((COLUMNS))
    else
        local -- stty_info=$(stty -a | grep -E -i columns)
        screen_width=$(echo "${stty_info}" | sed -n -E "s,^.*[;]\s+((\s*columns\s+)([0-9]+)|([0-9]+)(\s+columns\s*))[;],\3\4,gp" | grep -E '^[0-9]+$' | sort -un)
    fi

    1>&2 echo -e "\r$(printf '%*s' ${screen_width} "\r\x1b[1;38;2;253;67;83m${msg}")\x1b[0m"
    exit 130
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc bus
trap on_ctrlc segv
trap on_ctrlc sys

declare -a argv=(${@})
declare -i argc=${#argv[@]}
declare -- arg=""
declare -- argument=""
declare -- field=""
declare -- key=""
declare -- line=""
declare -- name=""
declare -- filename=""
declare -- filename_extension=""
declare -- filename_base=""
declare -- param=""
declare -- path=""
declare -- pos=""
declare -- value=""
declare -i code=0
declare -i current=0
declare -i index=0
declare -i line_number=0
declare -i lineno=0
declare -i skip=0

if [ ${argc} -lt 2 ]; then
    1>&2 echo -e "[$(basename "${BASH_SOURCE[0]}") error]" "missing arguments: <FROM_STRING> <TO_STRING>"
    exit 1
fi
if [ ${argc} -gt 2 ]; then
    1>&2 echo -e "[$(basename "${BASH_SOURCE[0]}") error]" "too many arguments: ${argv[@]:2}"
    exit 1
fi

# <GIT>
if git_repo_path=$(2>${stderr} git rev-parse --show-toplevel); then
    code=0
else
    code=$?
fi
if [ ${code} -ne 0 ]; then
    1>&2 echo -e "\x1b[0m\x1b[1;48;2;253;67;83m[${script_name} warning]\x1b[7m $(pwd) is not under git version control\x1b[0m"
    exit 130
fi
# </GIT>
export IFS=$'\n'

declare -- refactor_from="CollapseTabs"
declare -a refactor_fs_pipeline=([0]="shouty_snake" [1]="shouty_kebab" [2]="pascal" [3]="camelCase" [4]="train" [5]="snake" [6]="kebab")
declare -a refactor_sed_pipeline=([0]="shouty_snake" [1]="shouty_kebab" [2]="pascal" [3]="camelCase" [4]="train" [5]="snake" [6]="kebab" [7]="title")
declare -- refactor_to="DevBooster"


declare -- from_string_raw="${argv[0]}"
declare -- to_string_raw="${argv[1]}"


declare -- from_string=$(heck-string --to="snake" "${from_string_raw}")
declare -- to_string=$(heck-string   --to="snake" "${to_string_raw}"  )

declare -a pending_commit=()
pending_commit=($(git status --porcelain | sed -n -E 's/^[a-zA-Z0-9[:space:]]([a-zA-Z[:space:]]|[0-9]+)\s+(.+)/\1/gp'))
declare -i total_pending=${#pending_commit[@]}

if [ ${total_pending} -gt 0 ]; then
    1>&2 echo -e "[$(basename "${BASH_SOURCE[0]}") error]" "git tree is dirty, commit changes before running ${script_name}"
    exit 1
fi

if [ -d "./src" ]; then
    builtin cd "./src"
fi
declare -- heck_ty=""
declare -i code=0
for heck_ty in ${refactor_sed_pipeline[@]}; do
    code=0
     from_string=$(heck-string --to="${heck_ty}" "${from_string_raw}")
     to_string=$(heck-string   --to="${heck_ty}" "${to_string_raw}"  )
     1>&2 echo refactors "${from_string@Q}" "${to_string@Q}" -wp $(path canon -f .)
     if refactors "${from_string}" "${to_string}" -wp .; then
         if git commit . -m "from ${from_string@Q} to ${to_string@Q}"; then
             code=0
         else
             code=$?
             1>&2 echo -e "[$(basename "${BASH_SOURCE[0]}") warning]" "failed to commit $(path canon -f .)" "from ${from_string@Q} to ${to_string@Q}"
         fi
     else
         code=$?
         1>&2 echo -e "[$(basename "${BASH_SOURCE[0]}") warning]" "failed to refactor $(path canon -f .)" "from ${from_string@Q} to ${to_string@Q}"
     fi
done
