#!/usr/bin/env bash

set -umeTE
set +f
set -o pipefail
unset IFS
export IFS=$'\n'

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
declare -i widest_length=0

declare -gr color_name_regexp='^([a-z]+|[a-z]+[a-z[:space:]]*?)\s+(light|medium|dark)\s*(light|medium|dark)?$'
declare -gA ansi_truecolor_triplet_code_map_by_color_name=()
declare -gA ansi_truecolor_triplet_code_map_by_full_color_name=()
declare -gA ansi_truecolor_triplet_code_map_by_rgb_hex=()

declare -gA ansi_truecolor_demo_map_by_ansi_triplet=()
declare -gA ansi_truecolor_demo_map_by_color_name=()
declare -gA ansi_truecolor_demo_map_by_full_color_name=()
declare -gA ansi_truecolor_demo_map_by_rgb_hex=()

sed_debug_subexps() {
    local -- open_parens=$(sed -E 's/[^(]+//g' <<<"${color_name_regexp}")
    local -i op_count=${#open_parens}

    builtin echo -en '<\\0>\\n'
    for no in $(seq 1 ${op_count}); do
        builtin printf '%s\\x3c%d\\x3e\\%d\\x3c\\x2f%d\\x3e\\x0a' '    ' "${no}" "${no}" "${no}"
    done
    builtin echo -en '<\\0>\\n'
}
add_color() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- name=""
    local -- rgb_hex=""
    local -- ansi_rgb_triplet=""
    local -- ansi_rgb_contrast_triplet=""
    local -i red=0
    local -i green=0
    local -i blue=0

    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments: <NAME> <RGB_HEX> <ANSI_RGB_TRIPLET> <ANSI_RGB_CONTRAST_TRIPLET>"
        return 1
    elif [ ${argc} -ne 4 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "takes exactly 4 arguments, got ${argc} instead: ${argv[@]@Q}"
        exit 1
    fi

    local -a color_name_parts=()
    local -- raw_input_color_name="${argv[@]:0:1}"

    local -- full_color_name=""
    local -- color_name=""
    local -- color_tone=""
    local -- color_over_tone=""
    local -- tmp=''
    local -- key=''
    local -- item=''
    local -- val=''
    local -- pos=''

    color_name_parts=($(sed -n -E "s/${color_name_regexp}/\n\0\n\n\1\n\n\2\n\n\3/gp" <<<"${raw_input_color_name@L}"))
    local -i total_name_parts=${#color_name_parts[@]}

    full_color_name="${color_name_parts[@]:0:1}"
    color_name="${color_name_parts[@]:1:1}"
    color_tone="${color_name_parts[@]:2:1}"

    if [[ -v color_name_parts[3] ]]; then
        color_over_tone="${color_name_parts[@]:3:1}"
    fi

    name=$(printf '%-*s' 20 "${argv[@]:0:1}")
    rgb_hex="${argv[@]:1:1}"
    ansi_rgb_triplet="${argv[@]:2:1}"
    ansi_rgb_contrast_triplet="${argv[@]:3:1}"
    local -- repr_triplet=''
    if [[ "${rgb_hex@U}" =~ ^[#]?([A-F0-9]{6})$ ]]; then
        rgb_hex="${BASH_REMATCH[1]}"
    else
        1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid argument RGB_HEX: ${rgb_hex@Q}"
        return 1
    fi

    if [[ "${ansi_rgb_triplet@L}" =~ ^([0-9]{1,3})\;([0-9]{1,3})\;([0-9]{1,3})m$ ]]; then
        ansi_rgb_triplet="${BASH_REMATCH[0]}"
        repr_triplet="$(printf '%s' "\\\\x1b[1;38;2;${ansi_rgb_triplet}")"
        red=${BASH_REMATCH[1]}
        green=${BASH_REMATCH[2]}
        blue=${BASH_REMATCH[3]}
    else
        1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid argument ANSI_RGB_TRIPLET: ${ansi_rgb_triplet@Q}"
        return 1
    fi

    if [[ "${ansi_rgb_contrast_triplet@L}" =~ ^([0-9]{1,3})\;([0-9]{1,3})\;([0-9]{1,3})m$ ]]; then
        ansi_rgb_contrast_triplet="${BASH_REMATCH[0]}"
    else
        1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid argument ANSI_RGB_CONTRAST_TRIPLET: ${ansi_rgb_contrast_triplet@Q}"
        return 1
    fi
    local -a demo_chunks=()
    local -- last=''
    demo_chunks+=("$(echo -en "\x1b[0m\x1b[1;48;2;${ansi_rgb_triplet}\x1b[1;38;2;${ansi_rgb_contrast_triplet}#${rgb_hex}\x1b[0m ")")
    demo_chunks+=("$(echo -en "\x1b[0m\x1b[1;38;2;${ansi_rgb_triplet}$(printf '%-*s' 24 ${full_color_name})\x1b[0m")")
    demo_chunks+=("$(echo -en "\x1b[0m\x1b[1;38;2;${ansi_rgb_triplet}\x1b[1;38;2;$(printf '%b' 24 "${ansi_rgb_triplet}")\x1b[0m")")
    demo_chunks+=($(echo -en "\\x1b[0m\\x1b[1;48;2;${ansi_rgb_contrast_triplet}\\x1b[1;38;2;${ansi_rgb_triplet}"))
    demo_chunks+=($(printf '%-*s' 26 "${repr_triplet}"))
    demo_chunks+=($'\x1b[0m')
    local -- demo="$(builtin printf '%b' ${demo_chunks[@]})"

    ansi_truecolor_triplet_code_map_by_color_name["${color_name}"]="${ansi_rgb_triplet}"
    ansi_truecolor_triplet_code_map_by_full_color_name["${full_color_name}"]="${ansi_rgb_triplet}"
    ansi_truecolor_triplet_code_map_by_rgb_hex["${rgb_hex}"]="${ansi_rgb_triplet}"

    ansi_truecolor_demo_map_by_ansi_triplet["${ansi_rgb_triplet}"]="${demo}"
    ansi_truecolor_demo_map_by_color_name["${color_name}"]="${demo}"
    ansi_truecolor_demo_map_by_full_color_name["${full_color_name}"]="${demo}"
    ansi_truecolor_demo_map_by_rgb_hex["${rgb_hex}"]="${demo}"

    ansi_truecolor_order_color_name+=("${color_name}")
    ansi_truecolor_order_full_color_name+=("${full_color_name}")
    ansi_truecolor_order_ansi_rgb_triplet+=("${ansi_rgb_triplet}")
    ansi_truecolor_order_rgb_hex+=("${rgb_hex}")

}

add_color "aluminum light dark" \
    "#BABDB6" \
    "186;189;182m" \
    "200;200;220m"

add_color \
    "yellow light" \
    "#FCE94F" \
    "252;233;79m" \
    "22;22;22m"

add_color "aluminum dark dark" \
    "#2E3436" \
    "46;52;54m" \
    "200;200;220m"

add_color \
    "yellow medium" \
    "#EDD400" \
    "237;212;0m" \
    "66;66;66m"

add_color \
    "yellow dark" \
    "#C4A000" \
    "196;160;0m" \
    "200;200;220m"

add_color \
    "orange light" \
    "#FCAF3E" \
    "252;175;62m" \
    "22;22;22m"

add_color \
    "orange medium" \
    "#F57900" \
    "245;121;0m" \
    "66;66;66m"

add_color \
    "orange dark" \
    "#CE5C00" \
    "206;92;0m" \
    "200;200;220m"

add_color \
    "chocolate light" \
    "#E9B96E" \
    "233;185;110m" \
    "22;22;22m"

add_color \
    "chocolate medium" \
    "#C17D11" \
    "193;125;17m" \
    "66;66;66m"

add_color \
    "chocolate dark" \
    "#8F5902" \
    "143;89;2m" \
    "200;200;220m"

add_color \
    "brown light" \
    "#E9B96E" \
    "233;185;110m" \
    "22;22;22m"

add_color \
    "brown medium" \
    "#C17D11" \
    "193;125;17m" \
    "66;66;66m"

add_color \
    "brown dark" \
    "#8F5902" \
    "143;89;2m" \
    "200;200;220m"

add_color \
    "green light" \
    "#8AE234" \
    "138;226;52m" \
    "22;22;22m"

add_color \
    "green medium" \
    "#73D216" \
    "115;210;22m" \
    "66;66;66m"

add_color \
    "green dark" \
    "#4E9A06" \
    "78;154;6m" \
    "200;200;220m"

add_color \
    "sky blue light" \
    "#729FCF" \
    "114;159;207m" \
    "22;22;22m"

add_color \
    "sky blue medium" \
    "#3465A4" \
    "52;101;164m" \
    "66;66;66m"

add_color \
    "sky blue dark" \
    "#204A87" \
    "32;74;135m" \
    "200;200;220m"

add_color \
    "purple light" \
    "#AD7FA8" \
    "173;127;168m" \
    "22;22;22m"

add_color \
    "purple medium" \
    "#75507B" \
    "117;80;123m" \
    "22;22;22m"

add_color \
    "purple dark" \
    "#5C3566" \
    "92;53;102m" \
    "200;200;220m"

add_color \
    "scarlet red light" \
    "#EF2929" \
    "239;41;41m" \
    "22;22;22m"

add_color \
    "scarlet red medium" \
    "#CC0000" \
    "204;0;0m" \
    "66;66;66m"

add_color \
    "scarlet red dark" \
    "#A40000" \
    "164;0;0m" \
    "200;200;220m"

add_color "aluminum light light" \
    "#EEEEEC" \
    "238;238;236m" \
    "22;22;22m"

add_color "aluminum light medium" \
    "#D3D7CF" \
    "211;215;207m" \
    "66;66;66m"

add_color "aluminum dark light" \
    "#888A85" \
    "136;138;133m" \
    "22;22;22m"

add_color "aluminum dark medium" \
    "#555753" \
    "85;87;83m" \
    "66;66;66m"
