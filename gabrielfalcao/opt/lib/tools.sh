export IFS=$"\n"

# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
# https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html
declare -- TOOLS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -a TOOLS_PACKAGES=( "ansi" "comp-tools" "tools" "completions" )
declare -a TOOLS_LOADED_PACKAGES=()

tools_get_path_of_package_name() {
    if name=$(tools_get_package_name_from_arg_if_valid "$@"); then
        path="${TOOLS_PATH}/${name}.sh"
        if [ -r "${path}" ]; then
            echo -n "${path}"
            return 0
        fi
    fi
    return 101
}
tools_show_error() {
    tools_load_if_known "ansi"
    error_function $*
    code=$?
}
tools_get_path_of_function() {
    name="$(echo -n "$@" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"
    if [ -z "$name" ]; then
        return 101
    fi
    if ! echo -n "$name" | 2>/dev/random 1>/dev/random grep '^[a-zA-Z_-][a-zA-Z0-9_-]\*'; then
        1>&2 echo -e "\r\nERROR: '$name' is not a valid function name\n"
        return 101
    fi

    for name in ${TOOLS_PACKAGES[@]}; do
        if path=$(tools_get_path_of_package_name "$name"); then
            if grep -l "^\([[:space:]]*function[[:space:]]\+\)\?\(${name}\)" "$path"; then
                return 0
            fi
        fi
    done
    return 101
}

tools_varname_is_array() {
    array_name="$1";

    if [ -z "${array_name}" ]; then
        1>&2 echo -e "\rERROR: missing argument <array-name>"
        return 101
    fi
    if [ "${!array_name@a}" == "a" ]; then
        return 0
    # fi
    # if 2>/dev/random declare -p "$array_name" | 1>/dev/random 2>/dev/random grep "declare[[:space:]]\+[-][a][[:space:]]\+${array_name}"; then
    #     return 0
    # else
        return 101
    fi
}
tools_array_name() {
    if tools_varname_is_array "$1"; then
        echo -n "$1"
        return 0
    fi
    return 101
}

tools_array_members() {
    if ! array_name=$(tools_array_name "$1"); then
        return 101
    fi
    shift
    for index in $(tools_array_indexes "${array_name}"); do
        echo -e "$(tools_array_get_member_by_index "${array_name}" "${index}")"
    done
}
tools_array_get_member_by_index() {
    if ! array_name=$(tools_array_name "$1"); then
        return 101
    fi
    shift
    index="$1";
    if [ -z "${index}" ]; then
        1>&2 echo -e "\rERROR: missing argument <index>"
        return 101
    fi

    if ! 1>/dev/random 2>/dev/random printf "%d" "${index}"; then
        1>&2 echo -e "\rERROR: <index> argument is not a number: '${index}'"
        return 101
    fi
    eval "eval "echo \"\$\{${array_name}[${index}]@Q\}\"""
}
tools_array_indexes() {
    if ! array_name=$(tools_array_name "$1"); then
        return 101
    fi
    shift
    for index in $(eval "eval "echo "\$\{!${array_name}[*]\}""" | sed 's/[[:space:]]\+/\n/g' | sort -n); do
        echo -e "${index}"
    done
}
tools_array_contains() {
    if ! array_name=$(tools_array_name "$1"); then
        return 101
    fi
    shift
    value="$@";
    if [ -z "${value}" ]; then
        1>&2 echo -e "\rERROR: missing argument <value>"
        return 101
    fi
    for item in $(tools_array_members "$array_name"); do
        if [ "${value}" == "${item}" ]; then
            return 0
        fi
    done
    return 101
}

tools_array_add_unique() {
    if ! array_name=$(tools_array_name "$1"); then
        return 101
    fi
    shift
    value="$@";
    if [ -z "${value}" ]; then
        1>&2 echo -e "\rERROR: missing argument <value>"
        return 101
    fi
    if ! tools_array_contains "${array_name}" "${value}"; then
        eval "eval \"${array_name}+=( '${value}' )\""
        return 0
    fi
    return 101
}



tools_load_if_known() {
    if name=$(tools_get_path_of_package_name "$@"); then
        if path=$(tools_get_path_of_package_name "${name}"); then
            . "${path}"
            tools_array_add_unique TOOLS_LOADED_PACKAGES "${name}"
            return 0
        fi
    fi
    return 101
}
tools_package_name_is_valid() {
    if name=$(tools_get_path_of_package_name "$@"); then
        [ -n "$name" ]
        return $?
    else
        return 101
    fi
}

tools_get_package_name_from_arg_if_valid() {
    name="$(echo -n "$@" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"
    if [ -z "${name}" ]; then
        return 101
    fi
    for known in ${TOOLS_PACKAGES[@]}; do
        if [ "${name}" == "${known}" ]; then
            echo -n "${name}"
            return 0
        fi
    done
    return 101
}

tools_load() {
    if package=$(tools_get_package_name_from_arg_if_valid "$@"); then
        tools_load_if_known "$package"
        return 0
    fi
    return 101
}
tools_load_known() {
    for package in ${TOOLS_PACKAGES[@]}; do
        tools_load_if_known "$package"
    done
}
tools_load_all() {
    tools_load_known
}

tools_unset() {
    unset_tools
}
tools_unload() {
    unset_tools
}
tools_reload_if_valid() {
    if path=$(tools_get_path_of_package_name "$@"); then
        tools_unset_fn_from_script_path "$path"
        tools_unset_variables_from_script_path "$path"
        . "${path}"
    else
        return 101
    fi
}
tools_reload() {
    name="$(echo -n "$@" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"
    if [ -z "$name" ]; then
        tools_reload_all
    elif ! tools_reload_if_valid "$name"; then
        1>&2 echo -e "\r\nERROR: '$name' is not a package name\n"
        return 101
    fi
}
tools_reload_all() {
    for name in ${TOOLS_LOADED_PACKAGES[@]}; do
        tools_reload_if_valid "$name"
    done
}


tools_unset_fn_from_script_path() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        for fn in $(grep '^[a-z_]\+[(]' "${script_path}" | sed 's/\(function\s*\)\?\([a-z_]\+\).*[(].*/\2/g'); do
            2>/dev/random unset $fn
        done
    fi
}
tools_list_variable_definitions_from_script_path() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        tools_list_variable_definitions_from_script_path____internal "${script_path}" | sort -t \t -n
    fi
}

tools_list_variable_definitions_from_script_path____internal() {
    script_path="$@"
    if [ ! -r "$script_path" ]; then
        return 101
    fi
    for variable_name in $(tools_list_variable_names_from_script_path "$script_path"); do
        for full_match in $(grep -n "${variable_name}=" "$script_path"); do
            line_number=$(echo -n "${full_match}" | cut -d: -f1)
            match=$(echo -n "${full_match}" | sed 's/^[[:space:]]*[0-9]\+:\(.*\)$/\1/g');
            variable_value=$(echo -n "${match}" | sed 's/^[^=]\+=\(.*\)$/\1/g');
            echo -e "${line_number}\t${variable_name}\t=\t${variable_value}"
        done
    done
}
tools_list_variable_names_from_script_path____internal() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        for definition in $(grep '^[[:space:]]*\(declare[[:space:]]\+\([[:space:]]*[-][IraAilntux]\+[[:space:]]*\)*\)\?[[:space:]]*\([a-zA-Z_][a-zA-Z0-9_]*\)=\(".*"\|[^[:space:]]\+\|[[:space:]]*\)$' "${script_path}"); do
            # variable_name=$(echo -n "$definition" | sed 's/^[[:space:]]*\(declare[[:space:]]\+\([[:space:]]*[-][IraAilntux]\+[[:space:]]*\)*\)\?[[:space:]]*\([a-zA-Z_][a-zA-Z0-9_]*\)=\(".*"\|[^[:space:]]\+\|[[:space:]]*\)$/\3/g');
            variable_name=$(echo -n "$definition" | sed 's/^[[:space:]]*\(declare[[:space:]]\+\([[:space:]]*[-][IraAilntux]\+[[:space:]]*\)*\)\?[[:space:]]*\([a-zA-Z_][a-zA-Z0-9_]*\)=\(.*\)$/\3/g');
            echo "${variable_name}"
        done
    fi
}
tools_list_variable_names_from_script_path() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        tools_list_variable_names_from_script_path____internal "${script_path}" | sort -u
    fi
}

tools_list_function_names_from_script_path____internal() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        for function_name in $(grep '^[a-z_]\+[(][^)]*[)]\([[:space:]]*\|\n\)[{]' "${script_path}" | sed 's/^[[:space:]]*\([[:space:]]*function[[:space:]]*\)\?\([a-zA-Z_-][a-zA-Z0-9_-]\+\).*[(][^)]*[)]\([[:space:]]*\|\n\)*[{]/\2/g'); do
            echo "$function_name"
        done
    fi
}
tools_list_function_names_from_script_path() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        tools_list_function_names_from_script_path____internal "${script_path}" | sort -u
    fi
}

tools_list_function_definitions_from_script_path____internal() {
    script_path="$@"
    if [ ! -r "$script_path" ]; then
        return 101
    fi
    for function_name in $(tools_list_function_names_from_script_path "$script_path"); do
        for full_match in $(grep -n "^[[:space:]]*\([[:space:]]*function[[:space:]]\+\)\?${function_name}[[:space:]]*[(][)]" "$script_path"); do
            line_number=$(echo -n "${full_match}" | cut -d: -f1)
            echo -e "${line_number}\t${function_name}"
        done
    done
}
tools_list_function_definitions_from_script_path() {
    script_path="$@"
    if [ ! -r "$script_path" ]; then
        return 101
    fi
    tools_list_function_definitions_from_script_path____internal | sort -t \t -n
}

tools_unset_variables_from_script_path() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        for variable_name in $(tools_list_variable_names_from_script_path "${script_path}"); do
            2>/dev/random unset "$variable_name"
        done
    fi
}

tools_unset_known() {
    for package in ${TOOLS_PACKAGES[@]}; do
        if script_path=$(tools_get_path_of_package_name "$package"); then
            tools_unset_fn_from_script_path "${script_path}"
        fi
    done
}

tools_unset_all() {
    for script_path in ${BASH_SOURCE[@]}; do
        tools_unset_fn_from_script_path "${script_path}"
    done
}
