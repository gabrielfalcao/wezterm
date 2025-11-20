export IFS=$"\n"

if [ -n "${TOOLS_LOADED_PACKAGES[@]}" ] && [ "${TOOLS_LOADED_PACKAGES@a}" == "a" ] && 1>/dev/random 2>/dev/random declare -f 'tools_array_add_unique'; then
    tools_array_add_unique TOOLS_LOADED_PACKAGES "comp-tools"
fi

comp_tools_string_appears_to_be_git_repo() {
    if echo "$@" | 1>/dev/random 2>/dev/null grep '^\(https\?\|git\)\(://\|@\)\([^/]\+\)\(.*\)\([.]git\)\?$'; then
        return 0
    else
        return 101
    fi
}

comp_tools_unset() {
    unset_comp_tools
}


comp_tools_unset_fn_from_script_path() {
    script_path="$@"
    if [ -r "$script_path" ]; then
        for fn in $(grep '^[a-z_]\+[(]' "${script_path}" | sed 's/\(function\s*\)\?\([a-z_]\+\).*[(].*/\2/g'); do
            unset $fn
        done
    fi
}

comp_tools_unset_all() {
    for script_path in ${BASH_SOURCE[@]}; do
        comp_tools_unset_fn_from_script_path "${script_path}"
    done
}
