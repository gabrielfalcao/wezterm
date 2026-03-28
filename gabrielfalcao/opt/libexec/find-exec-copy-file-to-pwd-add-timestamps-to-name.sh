#!/usr/bin/env bash

set -umeTE
set +f
set -o pipefail
export IFS=$'\n'

declare -- current_dir=$(pwd)
declare -- script_name="$(basename "${BASH_SOURCE[0]}")"
declare -- script_path="$(2>/dev/random 1>/dev/random cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -- this_script_path="${script_path}/${script_name}"

declare -a argv=(${@})
declare -i argc=${#argv[@]}

declare -a stdin_lines=()
declare -i stdin_line_count=0

declare -i has_params=$((argc))
has_params=$((argc + stdin_line_count))

declare -i code=0

declare -i current=0

declare -i index=0
declare -- arg=''
declare -- param=''

declare -i next_index=0
declare -- next_arg=''
declare -- next_param=''

declare -i skip_next=0

declare -i lineno=0
declare -i line_number=0
declare -- line=''

declare -- argument=''
declare -- field=''
declare -- key=''
declare -- name=''
declare -- path=''
declare -- value=''

declare -a from_path_list=()

declare -A from_relative_path_map=()
declare -A from_path_origin_map=()
declare -A from_path_full_path_map=() # "$(path canon "${relative_path}")";
declare -A from_path_created_map=()   # $(gstat -c "%W" "${path}");
declare -A from_path_modified_map=()  # $(gstat -c "%Y" "${path}");
declare -A from_path_name_map=()      # $(basename "${path}")
declare -A from_path_ext_map=()       # $(path extension "${path}")
declare -A from_path_base_map=()      # $(path base "${path}")
declare -A from_path_new_name_map=()  # "${base}.${created}.${modified}${ext}"

process_input_path() {
    local -a local_argv=($@)
    local -i local_argc=${#local_argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""

    local -- full_path=""
    local -- created=""
    local -- modified=""
    local -- name=""
    local -- ext=""
    local -- base=""
    local -- new_name=""

    if [ ${local_argc} -lt 3 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments: <ORIGIN> <INDEX_IN_ORIGIN> <RELATIVE_PATH>"
        return 1
    fi

    local -- from="${local_argv[@]:0:1}"
    local -- index_in_origin="${local_argv[@]:1:1}"
    local -- relative_path="${local_argv[@]:2}"
    local -- from_ty=""

    local -i index=0
    local -i current=0
    local -i total=0
    local -- from_ty_index=""

    if [[ "${index_in_origin}" =~ [-][0-9]+ ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid <INDEX_IN_ORIGIN> argument, cannot be a negative number, got ${index_in_origin@Q}"
        return 1
    elif [[ "${index_in_origin}" =~ [^0-9]+ ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid <INDEX_IN_ORIGIN> argument, should be a non-negative number, got ${index_in_origin@Q}"
        return 1
    fi

    index=${index_in_origin}
    current=$((index + 1))

    case "${from@L}" in
        "argv")
            from_ty="command-line argument"
            total=${#argv[@]}
            ;;
        "stdin")
            from_ty="stdin argument"
            total=${#stdin_lines[@]}
            ;;
        *)
            1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid <ORIGIN> argument, should be either argv or stdin, got: ${from@Q}"
            return 1
            ;;
    esac
    from_ty_index="${from_ty} index ${current}/${total}"

    if [ -z "${relative_path}" ]; then
        1>&2 echo -e "[${script_name} warning]" "ignoring empty ${from_ty_index}: ${relative_path@Q}"
        return
    # elif [[ "${relative_path}" =~ (^[[:space:]]*$|[\n\t\r\x1b]|\n|\t|\r|\x1b) ]]; then
    #     1>&2 echo -e "[${script_name} warning]" "ignoring invalid ${from_ty_index}: ${relative_path@Q}"
    #     return
    elif [ ! -e "${relative_path}" ]; then
        1>&2 echo -e "[${script_name} warning]" "ignoring non-path ${from_ty_index}: ${relative_path@Q}"
        return
    elif [ ! -f "${relative_path}" ]; then
        1>&2 echo -e "[${script_name} warning]" "ignoring non-file ${from_ty_index}: ${relative_path@Q}"
        return
    elif [ ! -r "${relative_path}" ]; then
        1>&2 echo -e "[${script_name} warning]" "ignoring non-readable file ${from_ty_index}: ${relative_path@Q}"
        return 1
    fi

    path="$(path canon "${relative_path}")"
    full_path="${path}"
    if [[ -v from_path_origin_map["${path}"] ]]; then
        return
    fi

    full_path="$(path canon "${relative_path}")"
    created=$(gstat -c "%W" "${path}")
    modified=$(gstat -c "%Y" "${path}")
    name=$(basename "${path}")
    dot_ext=$(path extension "${path}")
    ext=${dot_ext##.}
    base=$(path base "${path}")
    new_name="${created}.${modified}.${base}.${ext}"

    from_path_list+=("${path}")

    from_relative_path_map["${path}"]="${relative_path}"
    from_path_full_path_map["${path}"]="${full_path}"
    from_path_created_map["${path}"]="${created}"
    from_path_modified_map["${path}"]="${modified}"
    from_path_name_map["${path}"]="${name}"
    from_path_ext_map["${path}"]="${ext}"
    from_path_base_map["${path}"]="${base}"
    from_path_new_name_map["${path}"]="${new_name}"

    from_path_origin_map["${path}"]="${from_ty_index}"
}

# <STDIN>
if [ ! -t 0 ]; then
    export IFS=$'\n'
    while read line; do
        if ! stdin_lines+=("${line}"); then
            continue
        fi
    done </dev/stdin
fi
stdin_line_count=${#stdin_lines[@]}
has_params=$((argc + stdin_line_count))
# </STDIN>

export IFS=$'\n'

if ! ((${has_params})); then
    1>&2 echo "[${script_name} error] missing command-line arguments (or stdin data)"
    exit 1
fi

for index in ${!stdin_lines[@]}; do
    process_input_path "stdin" "${index}" "${stdin_lines[${index}]}"
done
for index in ${!argv[@]}; do
    process_input_path "argv" "${index}" "${argv[${index}]}"
done

declare -- full_path=""
declare -- created=""
declare -- modified=""
declare -- name=""
declare -- ext=""
declare -- base=""
declare -- new_name=""
declare -- relative_path=""
declare -- new_path=""

for path in ${from_path_list[@]}; do

    relative_path=${from_relative_path_map["${path}"]}
    full_path=${from_path_full_path_map["${path}"]}
    created=${from_path_created_map["${path}"]}
    modified=${from_path_modified_map["${path}"]}
    name=${from_path_name_map["${path}"]}
    ext=${from_path_ext_map["${path}"]}
    base=${from_path_base_map["${path}"]}
    new_name=${from_path_new_name_map["${path}"]}

    new_path="${current_dir}/${new_name}"
    if [ -e "${new_path}" ]; then
        1>&2 echo -e "[${script_name} warning]" "skipping existing target path ${new_path@Q}"
        continue
    fi
    cp -fv "${full_path}" "${new_path}"
done
# cHJvY2Vzc19zdGRpbl9saW5lcygpIHsKICAgIGV4cG9ydCBJRlM9JCdcbicKCiAgICBsb2NhbCAtaSBpbmRleD0wCiAgICBsb2NhbCAtaSBjdXJyZW50PTAKICAgIGxvY2FsIC0tIGxpbmU9IiIKICAgIGxvY2FsIC0tIHZhbHVlPSIiCiAgICBsb2NhbCAtLSB0b3RhbD0keyNzdGRpbl9saW5lc1tAXX0KCiAgICBmb3IgaW5kZXggaW4gJHshc3RkaW5fbGluZXNbQF19OyBkbwogICAgICAgIGN1cnJlbnQ9JCgoJGluZGV4ICsgMSkpCiAgICAgICAgbGluZT0iJHtzdGRpbl9saW5lc1skaW5kZXhdfSIKCiAgICAgICAgZm9yIHZhbHVlIGluICQoc2VkIC1FICdzL1xzKy9cbi9nJyA8PDwgIiR7bGluZX0iKSBkbwogICAgICAgIGNhc2UgIiR7bGluZX0iIGluCiAgICAgICAgICAgIC1ofC0taGVscCkKICAgICAgICAgICAgICAgIDE+JjIgZWNobyAtZSAiSEVMUCIKICAgICAgICAgICAgICAgIDs7CiAgICAgICAgICAgICopCiAgICAgICAgICAgICAgICA7OwogICAgICAgIGVzYWMKICAgIGRvbmUKCgp9Cg==
