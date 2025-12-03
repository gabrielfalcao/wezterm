set -o pipefail
# # set -o errexit # or -e
# # set -o noglob # or -f
# set -o errtrace # or set -E
# set -o functrace # or set -T
# set -o nounset # -u

export IFS=$'\n'

if ! declare -a TERM_WIDTH_BIN=$(2>/dev/random which term-columns); then
    declare -a TERM_WIDTH_BIN=( python3 -c 'import os;print(os.get_terminal_size().columns)' )
fi
if ! declare -a TERM_HEIGHT_BIN=$(2>/dev/random which term-rows); then
    declare -a TERM_HEIGHT_BIN=( python3 -c 'import os;print(os.get_terminal_size().lines)' )
fi

if [ -n "${TOOLS_LOADED_PACKAGES[@]}" ] && [ "${TOOLS_LOADED_PACKAGES@a}" == "a" ] && 1>/dev/random 2>/dev/random declare -f 'tools_array_add_unique'; then
    tools_array_add_unique TOOLS_LOADED_PACKAGES "ansi"
fi

# TODO: bash select
# https://www.gnu.org/software/bash/manual/bash.html#index-select

term_supports_256_colors() {
    [ "${TERM}" == "xterm-256color" ]
    return $?
}
term_supports_truecolor() {
    [ "${COLORTERM}" == "truecolor" ]
    return $?
}
get_term_width() {
    #set +x
    ${TERM_WIDTH_BIN[@]}
}
const_term_width=$(get_term_width)
term_width() {
    #set +x
    echo -n "$const_term_width"
}
get_term_height() {
    #set +x
    ${TERM_WIDTH_BIN[@]}
}
const_term_height=$(get_term_height)
term_height() {
    #set +x
    echo -n "$const_term_height"
}
term_reset() {
    #set +x
    reset
    ansi_clear
}
get_number() {
    #set +x
    function=$(get_caller)
    arg="$1"
    if [ -z "${arg}" ]; then
        panic "${function}: '${arg}' cannot be empty"
    fi
    echo -n $(($result + 0))
}
get_number_error() {
    #set +x
    function=$(get_caller)
    arg="$1"
    if [ -z "${arg}" ]; then
        panic "${function}: '${arg}' cannot be empty"
    elif ! result="$(2>/dev/null printf "%d" "${arg}")"; then
        panic "${function}: '${arg}' is not a number"
    fi
    echo -n $(($result + 0))
}
get_display_path() {
    #set +x
    full_path="$@"
    if [ ! -e "${path}" ]; then
        return
    fi
    path="${full_path/#${HOME}\//}"
    if [ ${#full_path} -gt ${#path} ]; then
        path="~/${path}"
    fi
    echo -n "${path}"
}
get_caller() {
    #set +x
    offset=$((${1:-0} + 0))
    stack_len=${#FUNCNAME[@]}
    last_caller_index=$((${stack_len} - 2 - ${offset}))
    caller_index=$((${stack_len} - ${last_caller_index}))
    echo -n "${FUNCNAME[$caller_index]}"
}
get_lineno() {
    #set +x
    offset=$((${1:-0} + 0))
    stack_len=${#BASH_LINENO[@]}
    last_lineno_index=$((${stack_len} - 1 - ${offset}))
    lineno_index=$((${stack_len} - ${last_lineno_index}))
    echo -n "${BASH_LINENO[$lineno_index]}"
}
get_location() {
    #set +x
    echo -n "$(get_caller $1):$(get_lineno $1)"
}
get_source_filename() {
    #set +x
    offset=$((${1:-0} + 0))
    bash_source_len=$((${#BASH_SOURCE[@]} + 0))
    for rev_index in $(seq $bash_source_len); do
        index=$((${bash_source_len} - $rev_index - ${offset}))
        path="${BASH_SOURCE[${index}]}"
        if [ -n "${path}" ] && [ -e "${path}" ]; then
            get_display_path "${path}"
            return
        fi
    done
    return 1
}
get_full_location() {
    #set +x
    location_index=$(get_number_error "${1:-0}")
    echo -n "line $(ansi_underline "$(get_lineno ${location_index})") of function $(ansi_underline "$(get_caller ${location_index})") in file $(ansi_underline "$(get_source_filename ${location_index})")"
}
bar_error_full_location() {
    #set +x
    location_index=$(get_number_error "${1:-0}")
    1>&2 bar_text_left 196 231 "$(ansi 196 231 "      ")$(ansi_spaced 196 231 "on")$(ansi_spaced 16 231 "line $(ansi_underline "$(get_lineno ${location_index})")")$(ansi_spaced 196 231 "of")$(ansi_spaced 16 231 "function $(ansi_underline "$(get_caller ${location_index})")")$(ansi 196 231 " in file $(ansi_spaced 16 231 "$(ansi_underline "$(get_source_filename ${location_index})")")")$(ansi 196 231)"
}

panic() {
    #set +x
    caller=$(get_caller 2)
    lineno=$(get_lineno 2)

    title="PANIC"
    title_width=${#title}
    half_title_width=$(($title_width / 2 + ($title_width % 2)))
    location="in function ${caller}:${lineno} of ${BASH_SOURCE[0]}"
    location_width=${#location}
    half_location_width=$(($location_width / 2 + ($location_width % 2)))
    location="in function $(ansi_underline "$(ansi_blink "${caller}:${lineno}")") of ${BASH_SOURCE[0]}"
    msg="${@}"
    msg_width=${#msg}
    cols=$(term_width)
    half_cols=$(($cols / 2 + ($cols % 2)))
    half_msg_width=$(($msg_width / 2 + ($msg_width % 2)))
    bar_1st_half_end=$(($half_cols - $half_title_width))
    bar_2nd_half_end=$(($half_cols - $half_location_width))
    bar_3rd_half_end=$(($half_cols - $half_msg_width))
    panic_start="$(echo -en "$(seq $bar_1st_half_end | sed 's/[0-9]\+/@/g' | tr -d '[:space:]' | sed 's/@/ /g')")"
    location_start="$(echo -en "$(seq $bar_2nd_half_end | sed 's/[0-9]\+/@/g' | tr -d '[:space:]' | sed 's/@/ /g')")"
    msg_start="$(echo -en "$(seq $bar_3rd_half_end | sed 's/[0-9]\+/@/g' | tr -d '[:space:]' | sed 's/@/ /g')")"
    hr="$(echo -en "$(seq $cols | sed 's/[0-9]\+/@/g' | tr -d '[:space:]' | sed 's/@/ /g')")"
    1>&2 echo -e "\r\n\x1b[1;48;5;160m\x1b[1;38;5;231m${hr}"
    1>&2 echo -e "\x1b[1;48;5;160m\x1b[1;38;5;231m${panic_start}\x1b[1;48;5;160m\x1b[1;38;5;231m${title}\x1b[1;48;5;160m"
    1>&2 echo -e "\x1b[1;48;5;160m\x1b[1;38;5;231m${msg_start}\x1b[1;48;5;231m\x1b[1;38;5;160m${msg}\x1b[1;48;5;160m"
    1>&2 echo -e "\x1b[1;48;5;160m\x1b[1;38;5;231m${location_start}\x1b[1;48;5;231m\x1b[1;38;5;124m${location}\x1b[1;48;5;160m"
    1>&2 echo -e "\x1b[1;48;5;160m\x1b[1;38;5;231m${hr}\x1b[0m\n"
    exit 1
}
require_color_argument() {
    #set +x
    function=$(get_caller)
    argument_description="${1}"
    shift
    actual="${1}"
    color=$((${actual:-0} + 0))
    if [ -z "$actual" ]; then
        panic "${function}: ${argument_description} must be a number, actual is empty"
    elif [ $actual -gt 255 ]; then
        panic "${function}: ${argument_description} max value should be 256, actual: ${actual}"
    elif [ $actual -lt 0 ]; then
        panic "${function}: ${argument_description} min value should be 0, actual: ${actual}"
    elif [ "${color}" != "$actual" ]; then
        panic "${function}: ${argument_description} must be a number between 0 and 255, actual: ${actual}"
    fi
    echo -n ${color}
}
require_number_argument() {
    #set +x
    function=$(get_caller)
    argument_description="${1}"
    shift
    actual="${1}"
    number=$(2>/dev/null printf "%d" ${actual:-0})
    if [ -z "$actual" ]; then
        panic "${function}: ${argument_description} must be a number, actual is empty"
    elif [ "${number}" != "$actual" ]; then
        panic "${function}: ${argument_description} must be a number, actual: ${actual}"
    fi
    echo -n ${number}
}
require_argument() {
    #set +x
    function=$(get_caller)
    argument_description="${1}"
    shift
    actual="${@}"
    if [ -z "$actual" ]; then
        panic "${function}: ${argument_description} cannot be empty"
    fi
    echo -n "${actual}"
}
ansi_clear() {
    #set +x
    echo -en "\x1b[2J\x1b[3J\x1b[H"
}
ansi_set_fg_color() {
    #set +x
    fg_color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    echo -en "\x1b[1;38;5;${fg_color}m"
}
ansi_set_bg_color() {
    #set +x
    bg_color=$(require_color_argument "first argument (.i.e: ansi background)" "${1}")
    shift
    echo -en "\x1b[1;48;5;${bg_color}m"
}
ansi() {
    #set +x
    bg_color=$(require_color_argument "first argument (.i.e: ansi background)" "${1}")
    shift
    fg_color=$(require_color_argument "second argument (.i.e: ansi foreground)" "${1}")
    shift
    echo -en "\x1b[1;48;5;${bg_color}m\x1b[1;38;5;${fg_color}m${@}"
}
ansi_spaced() {
    #set +x
    bg_color=$(require_color_argument "first argument (.i.e: ansi background)" "${1}")
    shift
    fg_color=$(require_color_argument "second argument (.i.e: ansi foreground)" "${1}")
    shift
    ansi ${bg_color} ${fg_color} " $@ "
}
ansi_underline() {
    #set +x
    echo -en "\x1b[4m${@}\x1b[24m"
}

ansi_blink() {
    #set +x
    echo -en "\x1b[5m${@}\x1b[25m"
}

ansi_reset() {
    #set +x
    echo -en "\x1b[0m$@\x1b[0m"
}
ansi_up() {
    #set +x
    echo -en "\r\x1b[A"
}
ansi_reset_up() {
    #set +x
    ansi_reset
    ansi_up
    ansi_reset
}
display_colored() {
    #set +x
    fg_color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    bg_color=$(require_color_argument "second argument (.i.e: ansi background)" "${1}")
    shift
    desc=$(require_argument "third argument (.i.e: prefix)" "${1}")
    shift
    echo -en "\x1b[1;48;5;${fg_color}m\x1b[1;38;5;${bg_color}m${desc}\x1b[0m"
    msg="$@"
    echo -e "\x1b[1;48;5;${bg_color}m\x1b[1;38;5;${fg_color}m${msg}\x1b[0m"
}
display_error() {
    #set +x
    msg=$(require_argument "message" "${1}")
    shift
    location_index=$(get_number_error "${1:-0}")
    1>&2 bar 196
    1>&2 bar_text_left 196 231 "ERROR" "\x1b[1;48;5;231m\x1b[1;38;5;196m $msg"
    1>&2 bar_error_full_location $location_index
    1>&2 bar 196
}
exit_error() {
    #set +x
    arg="${1}"
    code=$(("$(get_number "${arg}")"))
    if [ $code -gt 0 ]; then
        shift
    else
        code=101
    fi
    msg=$(require_argument "message" "${1}")
    shift
    location_index=$(get_number_error "${1:-0}")

    1>&2 bar 196
    1>&2 bar_text_left 196 231 "ERROR" "$(ansi_spaced 231 196 "$msg")$(ansi 196 231)"
    1>&2 bar_error_full_location $location_index
    1>&2 bar 196
    exit $code
}
error() {
    #set +x
    arg="${1}"
    code=$(("$(get_number "${arg}")"))
    if [ $code -gt 0 ]; then
        shift
    else
        code=101
    fi
    msg=$(require_argument "message" "${1}")
    shift
    location_index=$(get_number_error "${1:-0}")

    1>&2 bar 196
    1>&2 bar_text_left 196 231 "ERROR" "\x1b[1;48;5;231m\x1b[1;38;5;196m $msg"
    1>&2 bar_error_full_location $location_index
    1>&2 bar 196
    exit $code
}
error_function() {
    #set +x
    msg=$(require_argument "message" "${1}")
    shift
    location_index=$(get_number_error "${1:-0}")

    1>&2 bar 196
    1>&2 bar_text_left 196 231 "ERROR" "\x1b[1;48;5;231m\x1b[1;38;5;196m $msg"
    1>&2 bar_error_full_location $location_index
    1>&2 bar 196
}
calc_indent_text() {
    #set +x
    requested=$1
    padby=$1
    shift
    text="$@"
    plain_text=$(echo -e "$text" | ansistrip)
    text_width=${#plain_text}
    if [ -z "$text" ]; then
        display_error "calc_indent_text" "MISSING TEXT"
        exit 1
    fi
    if [ ${padby} -gt ${text_width} ]; then
        padby=$(($padby - ${text_width}))
    elif [ ${padby} -lt ${text_width} ]; then
        padby=$((${text_width} - $padby))
    elif [ ${text_width} -eq ${padby} ]; then
        padby=0
    fi
    if [ $padby -lt $requested ]; then
        padby=$requested
    fi
    if [ $padby -lt 0 ]; then
        padby=0
    fi
    echo -n $padby
}
make_indent() {
    #set +x
    padby=$(require_number_argument "first argument (.i.e: indent count)" "${1}")
    echo -en "$(seq $padby | sed 's/[0-9]\+/@/g' | tr -d '[:space:]' | sed 's/@/ /g')"
}
indent() {
    #set +x
    padby=$(require_number_argument "first argument (.i.e: indent count)" "${1}")
    shift
    text=$(require_argument "second argument (.i.e: text)" "${@}")
    padby=$(calc_indent_text $padby "${text}")
    echo -en "$(make_indent $padby)${text}"
}
indent_rev() {
    #set +x
    padby=$(require_number_argument "first argument (.i.e: indent count)" "${1}")
    shift
    text=$(require_argument "second argument (.i.e: text)" "${@}")
    padby=$(calc_indent_text $padby "${text}")
    echo -en "${text}$(make_indent $padby)"
}

bar() {
    #set +x
    color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    cols=$(term_width)
    hr=$(make_indent ${cols})
    echo -e "\r\x1b[0m\x1b[1;48;5;${color}m${hr}\x1b[0m"
}
bar_text_left() {
    #set +x
    fg_color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    bg_color=$(require_color_argument "second argument (.i.e: ansi background)" "${1}")
    shift
    text=$(require_argument "second argument (.i.e: text)" "${@}")
    plain_text=$(echo -e "$text" | ansistrip)
    text_width=${#plain_text}
    cols=$(term_width)
    bar_end=$(($cols - ${text_width}))
    hr=$(make_indent "$bar_end")
    echo -e "\r\x1b[1;48;5;${fg_color}m\x1b[1;38;5;${bg_color}m${text}${hr}\x1b[0m"
}
bar_text_right() {
    #set +x
    fg_color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    bg_color=$(require_color_argument "second argument (.i.e: ansi background)" "${1}")
    shift
    text=$(require_argument "second argument (.i.e: text)" "${@}")
    plain_text=$(echo -e "$text" | ansistrip)
    text_width=${#plain_text}
    cols=$(term_width)
    bar_start=$(($cols - ${text_width}))
    hr=$(make_indent "$bar_start")
    echo -e "\r\x1b[1;48;5;${fg_color}m\x1b[1;38;5;${bg_color}m${hr}${text}\x1b[0m"
}
bar_text_center() {
    #set +x
    fg_color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    bg_color=$(require_color_argument "second argument (.i.e: ansi background)" "${1}")
    shift
    text=$(require_argument "second argument (.i.e: text)" "${@}")
    plain_text=$(echo -e "$text" | ansistrip)
    export IFS=$'\n'
    local -a lines=($(echo -e "${plain_text}"))
    local -a result_lines=()
    local -- text=""
    # local -- text="STAT FORMATS"
    for text in ${lines[@]}; do
        local -- text_width=${#text}
        half_cols=$(($term_cols / 2 + ($term_cols % 2)))
        half_text_width=$(($text_width / 2 + ($text_width % 2)))
        first_pad=$(($half_cols - $half_text_width))
        last_pad=$(($term_cols - $text_width - $first_pad))
        left=$(printf '%*s' $first_pad " ")
        right=$(printf '%-*s' $last_pad " ")
        result=$(printf "%*s%s%-*s" ${first_pad} "" "${text}" ${last_pad} "")
        result_width=${#result}
        result_lines+=("\x1b[0\r\x1b[1;48;5;${fg_color}m\x1b[1;38;5;${bg_color}m${result}\x1b[0m")
    done
    printf '%s\n' "${result_lines[@]}"

    # ICAgICMgdGV4dF93aWR0aD0keyNwbGFpbl90ZXh0fQogICAgIyBjb2xzPSQodGVybV93aWR0aCkKICAgICMgaGFsZl9jb2xzPSQoKCRjb2xzIC8gMiArICgkY29scyAlIDIpKSkKICAgICMgaGFsZl90ZXh0X3dpZHRoPSQoKCR0ZXh0X3dpZHRoIC8gMiArICgkdGV4dF93aWR0aCAlIDIpKSkKICAgICMgZmlyc3RfcGFkPSQoKCRoYWxmX2NvbHMgLSAkaGFsZl90ZXh0X3dpZHRoKSkKICAgICMgdGV4dF9zdGFydD0kKG1ha2VfaW5kZW50ICRmaXJzdF9wYWQpCiAgICAjIGhyPSQobWFrZV9pbmRlbnQgJGNvbHMpCiAgICAjIGVjaG8gLWVuICJcclx4MWJbMTs0ODs1OyR7ZmdfY29sb3J9bSR7dGV4dF9zdGFydH1ceDFiWzE7Mzg7NTske2JnX2NvbG9yfW0ke3RleHR9XHgxYlsxOzQ4OzU7JHtmZ19jb2xvcn1tIgogICAgIyBmaXJzdF9wYWQ9JCgoJGhhbGZfY29scyAtICRoYWxmX3RleHRfd2lkdGgpKQogICAgIyBocj0kKG1ha2VfaW5kZW50ICIkZmlyc3RfcGFkIikKICAgICMgZWNobyAtZSAiXHgxYlsxOzQ4OzU7JHtmZ19jb2xvcn1tJHtocn1ceDFiWzBtIg==
}

usage_error() {
    #set +x
    # desc=$(require_argument "message" "${@}")
    # fallback="$(get_caller):$(get_lineno)"
    1>&2 bar 196
    1>&2 bar_text_center 124 231 "ERROR"
    1>&2 bar_text_center 231 124 "${@}"
    1>&2 bar 196
    1>&2 echo
    exit 1
}

ansi_unset() {
    #set +x
    unset_ansi
}
unset_ansi() {
    #set +x
    for fn in $(grep '^[a-z_]\+[(]' ${BASH_SOURCE[0]} | sed 's/\(function\s*\)\?\([a-z_]\+\).*[(].*/\2/g'); do
        unset $fn
    done
}
term_paint_full_bg() {
    #set +x
    fg_color=$(require_color_argument "first argument (.i.e: ansi foreground)" "${1}")
    shift
    ansi_clear
    echo -en "\x1b[H"
    for row in $(seq $(term_height)); do
        bar_text_center $fg_color 16 "$row"
    done
}
test_term_paint_full_bg() {
    #set +x
    term_reset
    for color in $(seq 255); do
        echo -en "$(term_paint_full_bg $color)\x1b[H\x1b[A"
    done
}
