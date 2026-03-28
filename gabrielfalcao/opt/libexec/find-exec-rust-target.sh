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
    1>/dev/null 2>/dev/null bash -c "#!/usr/bin/env bash

exec 1>/dev/null 2>/dev/null </dev/null

set -umeTE;set +f; set -o pipefail;
rm -f ${stderr@Q} &
disown -a

1>/dev/null 2>/dev/null stty sane
"
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

declare -a argv=(${@})
declare -i argc=${#argv[@]}
declare -a stdin_lines=()
declare -i stdin_line_count=0

declare -i code=0

declare -i current=0

declare -i index=0
declare -- arg=''
declare -- param=''
declare -i index=0
declare -i current=0
declare -- arg=""
declare -- pos=""

declare -- parent_path=''
declare -- filename=''
declare -- path=''
declare -- key=''
declare -- value=''
declare -- manifest_path=""
declare -- build_target_path=""
declare -- git_repo_path=""
if git_repo_path=$(2>${stderr} git rev-parse --show-toplevel); then
    code=0
else
    code=$?
    1>&2 echo -en "[${script_name} warning]" "$(pwd) does not appear to be under git versioning"
    if [ -s "${stderr}" ]; then
        1>&2 cat "${stderr}"
    else
        1>&2 echo ""
    fi
fi
export IFS=$'\n'

main() {
    for index in ${!argv[@]}; do
        current=$((${index} + 1))
        arg="${argv[${index}]}"
        pos="$(printf '%*s of %s' ${#argc} ${current} ${argc})"
        path=""
        filename=""
        parent_path=""
        if [ -n "${manifest_path}" ] && [ -e "${manifest_path}" ] && [ -n "${build_target_path}" ] && [ -e "${build_target_path}" ]; then
            1>&2 echo -en "[${script_name} warning]" "ignoring argument ${arg@Q} at ${pos} since ${build_target_path@Q} and ${manifest_path@Q} already defined"
            continue
        fi
        if [ -e "${arg}" ]; then
            path=$(path canon "${arg}")
            filename=$(basename "${path}")
            parent_path=$(dirname "${path}")
            if [[ "${filename}" =~ Cargo[.]toml$ ]] && [ ! -d "${path}" ]; then
                manifest_path="${path}"
                build_target_path="${parent_path}/target"
                continue
            fi
            if [[ "${path}" =~ .*/target/(debug|release) ]] && [ -d "${path}" ]; then
                path="${parent_path}"
                filename=$(basename "${path}")
                parent_path=$(dirname "${path}")
            fi

            if [[ "${path}" =~ .*/target[/]?$ ]] && [ -d "${path}" ]; then
                build_target_path="${path}"
                manifest_path="${parent_path}/Cargo.toml"
                if [ ! -f "${manifest_path}" ]; then
                    1>&2 echo -en "[${script_name} error]" "Cargo manifest not found at ${manifest_path}"
                    if [ -s "${stderr}" ]; then
                        1>&2 cat "${stderr}"
                    else
                        1>&2 echo ""
                    fi
                    exit 39
                fi
            fi
        else
            1>&2 echo -en "[${script_name} warning]" "ignoring non-path argument ${arg@Q}"
        fi
    done
    # echo "${build_target_path}"
    # echo "${manifest_path}"
    1>&2 echo "rm -rf \"${build_target_path}\""
    rm -rf "${build_target_path}"
}

if [ "${0}" == "${BASH_SOURCE[0]}" ]; then
    main
else
    1>&2 echo -e "${BASH_SOURCE[0]} appears to being used as a library by ${0@Q}"
fi
