. ~/.bashrc.static

shell_d_sh_check_shell_script() {
    set +x
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""

    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>"
        return 1
    fi

    local -- shell_script_path="${argv[0]}"
    shell_d_sh_validate_non_empty_regular_file_argument "shell_script_path" "${shell_script_path}"

    shell_script_path=$(shell_d_fs_get_canonical_path "${shell_script_path}")
    local -- ps_var="\${BASH_SOURCE[0]}:\${BASH_LINENO[0]} "
    local -a shell_d_shell_d_sh_check_shell_script_lines=(
        'set -mTE; set +f; set -o pipefail;'
        # "export PS3=${ps_var@Q}"
        # "export PS4=${ps_var@Q}"

        ''
        ''

        # 'echo "${PS3@Q}"'
        # 'echo "${PS4@Q}"'

        ''
        ''

        # 'set -x'

        "$(cat "${shell_script_path}")"
    )
    shell_d_shell_d_sh_check_shell_script_command="$(printf '%s\n' ${shell_d_shell_d_sh_check_shell_script_lines[@]})"
    local -a call_args=("bash" "--noprofile" "--norc" "-s")

    local -- logprefix="$(slugify-string "${shell_script_path}")"
    local -- stderr_path="${HOME}/workbench/2026-02-08/${logprefix}.pid.${$}.stderr"
    local -- stdout_path="${HOME}/workbench/2026-02-08/${logprefix}.pid.${$}.stdout"

    local -i code=0

    1>&2 echo

    if ! 2>${stderr_path} 1>${stdout_path} ${call_args[@]} <<<"${shell_d_shell_d_sh_check_shell_script_command}"; then
        code=$?
    fi

    # TODO: open a new shell without errors
    # HOW: use this func to debug entrypoint.sh and find offending lines
    local -- stderr=$(sed -E '/^\s*$/d' "${stderr_path}")
    local -i stderr_linecount=0
    if [ -n "${stderr}" ]; then
        local -i stderr_linecount=$(wc -l <<<"${stderr}")
    fi
    local -- stderr_attrs=""
    if [ ${stderr_linecount} -gt 0 ]; then
        # stderr_attrs="$(printf 'lines=\x22%s\x22' ${stderr_linecount})"
        # 1>&2 echo "# <stderr ${stderr_attrs}> ${stderr_path}"
        1>&2 echo "found errors in ${shell_script_path@Q}:"
        1>&2 echo "${stderr}"
        return ${stderr_linecount}
    fi
}


shell_d_sh_check_shell_script ~/.shell.d/entrypoint.sh

#. ~/.shell.d/entrypoint.sh
