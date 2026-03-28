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

cls() {
    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
}
declare -a argv=(${@})
declare -i argc=${#argv[@]}

declare -a stdin_lines=()
declare -i stdin_line_count=0

# has_params "boolean flag" - .i.e.:  "(( ${has_params} ))"
#
# "false' if the sum of ${argc} + ${stdin_line_count} is 0
# otherwise, otherwise 1 (or any positive integer: true)
declare -i has_params=$((argc))
has_params=$((argc + stdin_line_count))

declare -i current=0
declare -i index=0
declare -- arg=""
declare -- argument=""
declare -- field=""
declare -- filename=""
declare -- key=""
declare -- name=""
declare -- param=""
declare -- path=""
declare -- value=""
declare -- item=""

declare -i ts_created=0
declare -i ts_modified=0
declare -i code=0

declare -- stderr="$(mktemp)"

declare -- git_repo_path=""
if ! git_repo_path=$(2>${stderr} git rev-parse --show-toplevel); then
    code=$?
fi

cls

##############################################################################################################################################################
##### ################################################################################################################################################## #####
##### ###                                                                                                                                           #### #####
##### ### DEBUG                                                                                                                                     #### #####
##### ###                                                                                                                                           #### #####
##### declare -gr sed_regexp='^([?][?]|[?][[:space:]])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$'           #### #####
##### declare -gr sed_to_string='[subexp 0] => \0\n[subexp 1] => \1\n[subexp 2] => \2\n[subexp 3] => \3\n[subexp 4] => \4\n'                        #### #####
##### declare -gr sed_command="s,${sed_regexp},${sed_to_string},g; t success q1; :success p"                                                        #### #####
##### 1>&2 echo -en "\x1b[0m\x1b[1;38;5;202m"                                                                                                       #### #####
##### 1>&2 declare -p ${!sed_*}                                                                                                                     #### #####
##### 1>&2 echo -en "\x1b[0m\n\x1b[1;38;5;222m"                                                                                                     #### #####
##### 2>&1 echo -n "$(git status --porcelain  | sed -E -n "${sed_command}")"                                                                        #### #####
##### 1>&2 echo -en "\n\x1b[0m\n" #####                                                                                                             #### #####
#####                                                                                                                                               #### #####
##### # [subexp 0] => ?? www.gnu.org-invalid-cert/R12.pem                                                                                           #### #####
##### # [subexp 1] => ??                                                                                                                            #### #####
##### # [subexp 2] => www.gnu.org-invalid-cert/R12.pem                                                                                              #### #####
##### # [subexp 3] => www.gnu.org-invalid-cert/R12                                                                                                  #### #####
##### # [subexp 4] => pem                                                                                                                           #### #####
#####                                                                                                                                               #### #####
##### # exit 11                                                                                                                                     #### #####
#####                                                                                                                                               #### #####
##### ###                                                                                                                                           #### #####
##### ### DEBUG                                                                                                                                     #### #####
##### ###                                                                                                                                           #### #####
##### ################################################################################################################################################## #####
##############################################################################################################################################################

declare -gr sed_regexp='^([A-Z][[:space:]]|[?][?])\s-+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$'
declare -gr subexp_start=$(sed -E 's/[^(]+//g' <<< "${sed_regexp}")
declare -gi total_sed_regexp_subexps=$(wc -c <<< "${subexp_start}")
declare -g  sed_to_string=$(sed-genrep-debug-groups ${total_sed_regexp_subexps})
declare -g  sed_to_string='0: \\0\\n  1: \\1\\n  2: \\2\\n  3: \\3\\n  4: \\4\\n  5: \\5\\n  6: \\6\\n  7: \\7'

# 1>&2 echo
# 1>&2 declare -p sed_regexp
# 1>&2 declare -p subexp_start
# 1>&2 declare -p total_sed_regexp_subexps
# 1>&2 echo
# 1>&2 declare -p sed_to_string
# exit 33
# declare -gr sed_to_string=$'\\'
declare -gr sed_command="s,${sed_regexp},${sed_to_string},g; t success H; :success p"

declare -- subshell_script=$(
    echo -e "\n"
    echo 'echo -e "\x1b[2J\x1b[3J\x1b[H\n";'
    echo '
set -umeTE; set +f; set -o pipefail;
on_exit() {
    set +x
}
trap on_exit exit;
'

    echo -e 'declare -- sed_stderr="$(mktemp)";'
    echo -e 'declare -i code=0;';
    echo -e 'set +x;'
    # echo -e 'set -x;'
    echo "if git status --porcelain | 2>\${sed_stderr} sed --debug -n -E ${sed_command@Q}; then"
    echo '    code=0;'
    echo 'else'
    echo '    code=$?;'
    echo 'fi'
    echo ''
    echo 'if [ ${code} -ne 0 ]; then'
    # echo '    echo -e "\x1b[2J\x1b[3J\x1b[H\n";'
    echo "    1>&2 echo \"command \\\"sed -n -E ${sed_command[@]@Q}\\\" failed with code \${code}\""
    echo "    1>&2 cat \${sed_stderr};"
    echo '    exit ${code}'
    echo 'fi'
    echo ''

    echo -e 'set +x;'
    echo -e '\n'
)
echo "${subshell_script}"  | sed -z -n -E 's,[[:space:]\n]*([^[:space:]\n]+?.*?)[[:space:]\n]*,\1,gp' # | shfmt-o
exit 0

# 2>&1 echo -e '\n'
# 2>&1 echo "$(git status --porcelain  | sed -E -n "${sed_command}" )"
# 2>&1 echo -e '\n'
# exit 1
declare -ga files_to_git_add=(
    # $(git status --porcelain  | sed -E -n "${sed_command}")
    $(git status --porcelain | sed -E -n "${sed_command}" | xargs -Ieachpath echo "${git_repo_path}/eachpath")
)
# 2>&1 echo -e '\n'
# 2>&1 echo "${files_to_git_add[*]}"
# 2>&1 echo -e '\n'
# exit 1
declare -g ext=""
declare -g base=""
declare -g absolute_path=""
declare -g relative_to_git_path=""
# declare -g canon_folded_path=""
# canon_folded_path=$(path canon -f "${absolute_path}")

for absolute_path in ${files_to_git_add[@]}; do
    # if [ ! -e "${absolute_path}" ]; then
    #     1>&2 echo -en "\x1b[0m\x1b[1;38;5;222m"
    #     1>&2 declare -p absolute_path
    #     1>&2 echo -en "\x1b[0m"
    #     continue
    # fi
    # path=${absolute_path##$(pwd)/}
    path=${absolute_path##${git_repo_path}/}
    name="$(path name "${absolute_path}")"
    base=$(path base "${name}")
    extension=$(path extension "${name}")
    ext=${extension#.}
    ts_created=$(gstat -c '%W' "${name}")
    ts_modified=$(gstat -c '%Y' "${name}")
    # 1>&2 echo -en "\x1b[0m\x1b[1;38;5;231m"
    # 1>&2 declare -p git_repo_path
    # 1>&2 echo -e "\x1b[0m\x1b[1;38;5;220m"
    # 1>&2 declare -p path absolute_path name base ext extension ts_created ts_modified
    # 1>&2 echo -e "\x1b[0m"
    # continue

    export GIT_AUTHOR_DATE="$(date --date=@${ts_created} +'%s %z')"
    export GIT_COMMITTER_DATE="$(date --date=@${ts_modified} +'%s %z')"

    # 1>&2 echo -e "\x1b[0m\x1b[1;38;5;154m"
    # 1>&2 declare -p path name base ext ts_created ts_modified GIT_AUTHOR_DATE GIT_COMMITTER_DATE
    # 1>&2 echo -e "\x1b[0m"

    git add -f "${name}" && git commit "${name}" -m "$(echo -en "[${ext}] ${name}\n\n$(declare -p absolute_path path name base ext extension ts_created ts_modified extension GIT_AUTHOR_DATE GIT_COMMITTER_DATE)")"

done
