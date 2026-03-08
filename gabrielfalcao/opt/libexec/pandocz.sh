#!/usr/bin/env bash

set -e
set -o pipefail
set -u
# export IFS=$'\n'
# unset IFS

script_name="$(basename "${BASH_SOURCE[0]}")"
script_path="$(2>/dev/random 1>/dev/random cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
this_script_path="${script_path}/${script_name}"

declare -a argv=($@)
declare argc=${#argv[@]}

declare -- extension=""
declare -- format=""

declare -a input_formats=()
declare -A input_extensions=()
declare -A input_extensions_main=()
declare -A input_extension_additionals=()

declare -a output_formats=()
declare -A output_extensions=()
declare -A output_extensions_main=()
declare -A output_extension_additionals=()

main() {
    local -- item=""
    local -- format=""
    local -- extension=""
    local -- kind=""
    local -a formats=("input" "output")
    local -a extension_types=("main" "additionals")
    local -A extension_types_sed_commands=(
        ["main"]='s/^[+]([a-z0-9_-]+)/\1/gp'
        ["additionals"]='s/^[-]([a-z0-9_-]+)/\1/gp'
    )
    for kind in ${formats[@]}; do
        local -I -n target_array="${kind}_formats"
        target_array+=($(pandoc --list-${kind}-formats))
    done
    for kind in ${formats[@]}; do
        local -I -n source_array="${kind}_formats"
        local -I -n target_array="${kind}_extensions"
        for format in ${source_array[@]}; do
            target_array+=(["${format}"]=$(pandoc --list-extensions="${format}"))
        done
    done

}
# declare -a output_formats=(
#     $(pandoc --list-output-formats)
# )
# declare -a input_formats=(
#     $(pandoc --list-input-formats)
# )
# declare -a input_extensions_all=($(for format in ${input_formats[@]}; do
#     pandoc --list-extensions="${format}"
# done))
# declare -a input_extensions=($(for extension in ${input_extensions_all[@]}; do
#     sed -n -E 's/^[+]([a-z0-9_-]+)/\1/gp' <<<"${extension}"
# done))
# declare -a input_extension_additionals=($(for extension in ${input_extensions_all[@]}; do
#     sed -n -E 's/^[-]([a-z0-9_-]+)/\1/gp' <<<"${extension}"
# done))
#
# declare -a output_extensions_all=($(for format in ${output_formats[@]}; do
#     pandoc --list-extensions="${format}"
# done))
# declare -a output_extensions=($(for extension in ${output_extensions_all[@]}; do
#     sed -n -E 's/^[+]([a-z0-9_-]+)/\1/gp' <<<"${extension}"
# done))
# declare -a output_extension_additionals=($(for extension in ${output_extensions_all[@]}; do
#     sed -n -E 's/^[-]([a-z0-9_-]+)/\1/gp' <<<"${extension}"
# done))
#
#     declare -p | sed -n -E 's/declare\s+[-][a]\s+((in|out)put_(format|extension)[a-z_]+)=.*/\1/g'
# }
#
on_exit() {
    stty sane
}
on_ctrlc() {
    1>&2 echo -e "\rAborted with Ctrl-C"
    exit 1
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int

if [ "${0}" == "${BASH_SOURCE[0]}" ]; then
    main
    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
    # 1>&2 declare -p input_formats
    # 1>&2 declare -p input_extensions
    # 1>&2 declare -p input_extensions_main
    # 1>&2 declare -p input_extension_additionals

    # 1>&2 declare -p output_formats
    # 1>&2 declare -p output_extensions
    # 1>&2 declare -p output_extensions_main
    # 1>&2 declare -p output_extension_additionals

else
    1>&2 echo -e "${BASH_SOURCE[0]} appears to being used as a library by ${0@Q}"
fi
