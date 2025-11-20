#!/usr/bin/env bash
# shellcheck disable=SC2004,SC2206,SC2068,SC2086

set -e
set -o pipefail
export IFS=$'\n'

this_script_path="${BASH_SOURCE[0]}"
script_name="$(basename "${this_script_path}")"
script_path="$(dirname "${this_script_path}")"

declare -a argv=($@)
declare argc=${#argv[@]}

declare -a target_file_path_array=()
error_prefix_color_rgb="$((0xFF));$((0x00));$((0x42))"
error_color_rgb="$((0xFF));$((0x32));$((0x32))"
error_color_rgb="$((0xFF));$((0x3E));$((0x5C))"
warn_prefix_color_rgb="$((0xFF));$((0x6A));$((0x32))"
warn_color_rgb="$((0xFF));$((0xA1));$((0x32))"

on_exit() {
    stty sane
}
on_ctrlc() {
    1>&2 echo -e "\x1b[1;38;2;${error_color_rgb}m\rAborted with Ctrl-C\x1b[0m"
    repl sane
    exit 1
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc emt
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
warn() {
    1>&2 echo -e "\x1b[1;38;2;${warn_prefix_color_rgb}m[warn]\x1b[1;38;2;${warn_color_rgb}m ${@}\x1b[0m"
}
error() {
    1>&2 echo -e "\x1b[1;38;2;${error_prefix_color_rgb}m[error]\x1b[1;38;2;${error_color_rgb}m ${@}\x1b[0m"
}

process_argv() {
    repl no echo
    if [ ${argc} -eq 0 ]; then
        exit_error "missing argument: <PATHS...>"
        exit 1
    fi
    for arg in ${argv[@]}; do
        if [ -f "${arg}" ]; then
            target_file_path_array+=("${arg}")
        else
            exit_error "invalid argument, not a path to existing file ${arg@Q}"
        fi
    done
    repl sane
}

main() {
    local -i target_file_path_array_count=${#target_file_path_array[@]}
    backup_suffix=".$(nowz).backup"

    if [ ${target_file_path_array_count} -gt 0 ]; then
        echo "${target_file_path_array_count} target_file_path_array passed as argument"
        for index in ${!target_file_path_array[@]}; do
            path="${target_file_path_array[$index]}"
            sed_cmd="sed \"s/\([a-zA-Z0-9+=(.|*){@}%,:<>\\\"'\`_-]\+\|[[]\|[]]\)\+//g\" -i${backup_suffix} \"${path}\""
            if ! sed "s/\([a-zA-Z0-9+=(.|*){@}%,:<>\"'\`_-]\+\|[[]\|[]]\)\+//g" -i${backup_suffix} "${path}"; then
                exit_code=$?
                1>&2 echo -e "command ${sed_cmd@Q} failed with status ${exit_code}"
                exit ${exit_code}
            fi
        done
    fi
}

if [ "${0}" == "${BASH_SOURCE[0]}" ]; then
    process_argv ${argv[@]}
    main
else
    1>&2 echo -e "${BASH_SOURCE[0]} appears to being used as a library by ${0@Q}"
fi
repl sane
