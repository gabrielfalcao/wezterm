#!/usr/bin/env bash

declare -- RIGHT_OWNER="gabrielfalcao"
declare -- RIGHT_WORKING_PATH="/Users"

declare -a PATHS_TO_TRACK=( ".shell.d"  ".emacs.d"  "opt/libexec"  "opt/lib" )
declare -a DIRECTORIES_TO_EXCLUDE=(
    'melpa' 'elpa' '.hg' '3pty' '__pycache__' '.venv' '.git'
)

set -e
set -o pipefail
set -u
export IFS=$'\n'
unset IFS

script_name="$(basename "${BASH_SOURCE[0]}")"
script_path="$(2>/dev/random 1>/dev/random cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
this_script_path="${script_path}/${script_name}"

declare -a argv=($@)
declare argc=${#argv[@]}

declare -a subpaths_to_track=( $(printf "${USER}/%s\n" "${PATHS_TO_TRACK[@]}") )
declare -a find_patterns_to_exclude=( $(printf "*/%s/*\n" "${DIRECTORIES_TO_EXCLUDE[@]}") )

declare -- error_prefix_color_rgb="255;0;66"
declare -- error_color_rgb="255;62;92"
declare -- warn_prefix_color_rgb="255;106;50"
declare -- warn_color_rgb="255;161;50"
declare -- info_prefix_color_rgb="0;66;255"
declare -- info_color_rgb="62;92;255"
declare -- debug_prefix_color_rgb="50;255;106"
declare -- debug_color_rgb="50;255;161"

on_exit() {
    repl sane
}
on_ctrlc() {
    repl no echo
    1>&2 echo -e "\x1b[1;38;2;${error_color_rgb}m\rAborted with Ctrl-C\x1b[0m"
    repl sane
    exit 1
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc bus
trap on_ctrlc segv
trap on_ctrlc sys

repl() {
    local -a stty_args=()
    case "$1" in -*no*stdin | no*stdin | -*no*echo | no*echo | capture) args+=('-echo') ;; *) args+=('sane') ;; esac
    2>/dev/random 1>/dev/random stty ${stty_args[@]}
}
usage() {
    repl no echo
    1>&2 echo -e "$(basename $0) <ARGUMENT>"
    repl sane
}
exit_error() {
    error "${@}"
    exit 1
}
warn_prefixed() {
    local -- prefix="$1"
    shift
    local -- message="$@"
    1>&2 echo -e "\x1b[1;38;2;${warn_prefix_color_rgb}m${prefix}\x1b[1;38;2;${warn_color_rgb}m ${message}\x1b[0m"
}
warn() {
    local -- linenum="${BASH_LINENO[0]}"
    warn_prefixed "[warn]  [${script_name}:${linenum}]" "${@}"
}
error() {
    local -- linenum="${BASH_LINENO[0]}"
    error_prefixed "[error] [${script_name}:${linenum}]" "${@}"
}
error_prefixed() {
    local -- prefix="$1"
    shift
    local -- message="$@"
    1>&2 echo -e "\x1b[1;38;2;${error_prefix_color_rgb}m${prefix}\x1b[1;38;2;${error_color_rgb}m ${message}\x1b[0m"
}
info() {
    local -- linenum="${BASH_LINENO[0]}"
    info_prefixed "[info]  [${script_name}:${linenum}]" "${@}"
}
info_prefixed() {
    local -- prefix="$1"
    shift
    local -- message="$@"
    1>&2 echo -e "\x1b[1;38;2;${info_prefix_color_rgb}m${prefix}\x1b[1;38;2;${info_color_rgb}m ${message}\x1b[0m"
}
debug_prefixed() {
    local -- prefix="$1"
    shift
    local -- message="$@"
    1>&2 echo -e "\x1b[1;38;2;${debug_prefix_color_rgb}m${prefix}\x1b[1;38;2;${debug_color_rgb}m ${message}\x1b[0m"
}
debug() {
    local -- linenum="${BASH_LINENO[0]}"
    debug_prefixed "[debug] [${script_name}:${linenum}]" "${@}"
}
trace() {
    if [ -z "${BASH_TRACE}" ] && [ "${BASH_LOGLEVEL}" != "trace" ]; then
        return 0
    fi

    local -- linenum="${BASH_LINENO[0]}"
    local -- funcname="${FUNCNAME[1]}"
    debug_prefixed "[${FUNCNAME[0]} ${script_name}::${funcname}:${linenum}]" "${@}"
}


process_argv() {
    repl no echo
    repl sane
}

main() {
    # 1>&2 echo "subpaths_to_track=( ${subpaths_to_track[@]@Q} )"
    # 1>&2 echo "find_patterns_to_exclude=( ${find_patterns_to_exclude[@]@Q} )"
    set -e
    for path in ${subpaths_to_track[@]}; do
        echo -e "\x1b[1;38;5;231mfind \x1b[1;38;5;220m${path}\x1b[1;38;5;231m -maxdepth 1 -type f -exec git add {} \;\x1b[0m"
        local -- yesno=""
        local -i find_and_commit=0
        echo -e "continue? [\x1b[1;38;5;112my\x1b[0m/\x1b[1;38;5;196mn\x1b[0m]"
        until case "${yesno@L}" in
                  y|yes)
                      find_and_commit=1;
                      true
                      ;;
                  n|no)
                      find_and_commit=0
                      true
                      ;;
                  "")
                      false
                      ;;
                  *)
                      1>&2 echo -e "\x1b[A\r\x1b[1;38;5;197minvalid reply: ${yesno}\x1b[0m\n"
                      false
                      ;;
              esac; do
            echo -e "\x1b[A\rcontinue? [\x1b[1;38;5;112my\x1b[0m/\x1b[1;38;5;198mn\x1b[0m]"

            read yesno
        done
        if (( $find_and_commit )); then
            if [ -d "${path}/.git" ]; then
                mv -f "${path}/.git" "${path}/.gito"
            fi
            if find "${path}" -maxdepth 1 -type f -exec git add --verbose -f ./{} \;; then
                git commit -am "tracks files under ${path}"
            else
                1>&2 echo "failed $?"
            fi
            if [ -d "${path}/.gito" ]; then
                mv -f "${path}/.gito" "${path}/.git"
            fi

        fi
        path=""
    done


}

if [ "${USER}" != "${RIGHT_OWNER}" ]; then
    error "cannot run script ${0@Q} as user ${USER}"
    info "its right owner is \x1b[1;38;5;231m${RIGHT_OWNER}"
    exit 1
fi

if [ "${script_path}" != "${RIGHT_WORKING_PATH}" ]; then
    error "${0@Q} is located at the wrong path: ${script_path@Q}"
    info "the right path is \x1b[1;38;8;231m${RIGHT_WORKING_PATH}/${script_name}"
    exit 1
fi
if [ "$(pwd)" != "${RIGHT_WORKING_PATH}" ]; then
    error "$0@Q is located at the wrong path: ${script_path@Q}"
    info "the right path is \x1b[1;38;8;231m${RIGHT_WORKING_PATH}/${script_name}"
    exit 1
fi

if [ "${0}" == "${BASH_SOURCE[0]}" ]; then
    if process_argv ${argv[@]}; then
        main
    fi
else
    error "${BASH_SOURCE[0]} appears to being used as a library by ${0@Q}"
fi
repl sane
