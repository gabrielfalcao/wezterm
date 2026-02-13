export TZ=UTC
set -mTE

declare -i shell_d_started_at=$(date +%s)
declare -i shell_d_pid=${$}
#<TODO read/map shopts from `man bash'>
shopt -s checkwinsize
shopt -s cmdhist
#</TODO read/map shopts from `man bash'>  pandoc -f man -i $(man -w bash) -t markdown
set -o pipefail
__shell_d_sh_ps4_function__() {
    local -- caller_funcname=""
    if [[ -v FUNCNAME[1] ]]; then
        caller_funcname="${FUNCNAME[1]}"
    fi
    local -- caller_lineno=""
    if [[ -v LINENO[1] ]]; then
        caller_lineno="${LINENO[1]}"
    elif [[ -v BASH_LINENO[0] ]]; then
        caller_lineno="${BASH_LINENO[0]}"
    fi
    local -- caller_bash_source=""
    if [[ -v BASH_SOURCE[1] ]]; then
        caller_bash_source="${BASH_SOURCE[1]}"
    fi
    if [[ "${caller_bash_source}" =~ ^${HOME}/ ]]; then
        caller_bash_source="~/${caller_bash_source##${HOME}/}"
    fi
    # ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]}()
    if [ -n "${caller_bash_source}" ] &&  [ -n "${caller_lineno}" ] &&  [ -n "${caller_funcname}" ]; then
        echo "+ ${caller_bash_source}:${caller_lineno}: ${caller_funcname}(): "
    elif [ -n "${caller_bash_source}" ] &&  [ -n "${caller_lineno}" ] &&  [ -z "${caller_funcname}" ]; then
        echo "+ ${caller_bash_source}:${caller_lineno}: "
    elif [ -n "${caller_bash_source}" ] &&  [ -z "${caller_lineno}" ] &&  [ -z "${caller_funcname}" ]; then
        echo "+ ${caller_bash_source}: "
    fi
# export PS4='+ $(__shell_d_sh_ps4_function__): '


}
export PS4='$(__shell_d_sh_ps4_function__)'
# Now trace output will show file, line, and function name

declare -gA shell_d_checked_shell_scripts_stderr_map=()
declare -gA shell_d_checked_shell_scripts_stdout_map=()
declare -gA shell_d_checked_shell_scripts_result_map=()
set -x

__shell_d_sh_trap_function_return__() {
    set +x
    1>&2 echo "${FUNCNAME[1]}"
}

__shell_d_sh_trap_function_backtrace__() {
    set +x
    local -i  i
    local -- stack_size=${#FUNCNAME[@]}
    1>&2 echo -e "\nBash backtrace:"
    # Loop from the second element (index 1) to skip the backtrace function itself
    for ((i=1; i<$stack_size; i++)); do
        local func="${FUNCNAME[$i]}"
        [ -z "$func" ] && func=main
        local line="${BASH_LINENO[$((i-1))]}"
        local src="${BASH_SOURCE[$i]}"
        [ -z "$src" ] && src=non_file_source
        1>&2 printf "  at %s (%s:%s)\n" "$func" "$src" "$line"
    done
    set +x
    set -x
}

# trap __shell_d_sh_trap_function_return__ return
trap __shell_d_sh_trap_function_backtrace__ ERR
set -o errtrace # Ensure ERR trap is inherited by functions
set -o functrace


shell_d_sh_declare() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- value=""
    local -A param_map=()
    local -- pos=""
    local -i prev_arg_value_index=0
    local -- prev_arg_value_pos=''
    local -i var_ty_index=0
    local -- var_ty_pos=''
    local -- var_ty_letter=""
    if [ ${argc} -lt 2 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments"
        return 1
    fi
    local -ra param_order=(g a A i l u x r)

    for index in ${!argv[@]}; do
        current=$(($index + 1))
        arg="${argv[$index]}"
        value="${arg#-}"
        pos="$(printf '%*s of %s' "${#argc}" ${current} ${argc})"
        prev_arg_value_index=0
        prev_arg_value_pos=''

        if [[ -v param_map["${value}"] ]]; then
            prev_arg_value_index=${param_map["${value}"]}
            prev_arg_value_pos="$(printf '%s of %s' $((prev_arg_value_index + 1)) ${argc})"
        fi

        case "${arg}" in
            # -f => restrict action or display to function names and definitions
            # -F => restrict display to function names only (plus line number and source file when debugging)
            # -p => display the attributes and value of each NAME
            -f | -F | -p)
                1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid option ${pos} ${arg@Q} only acceptable in bash's builtin declare"
                return 1
                ;;
            # -t => to make NAMEs have the `trace' attribute
            -t)
                1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid option ${pos} ${arg@Q} only acceptable in bash's function definitions"
                return 1
                ;;
            # -I => if creating a local variable, inherit the attributes and value of a variable with the same name at a previous scope
            # -n => make NAME a reference to the variable named by its value
            -I | -n)
                1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid option ${pos} ${arg@Q} only acceptable in bash's builtin local"
                return 1
                ;;

            # -a => to make NAMEs indexed arrays (if supported)
            # -A => to make NAMEs associative arrays (if supported)
            # -i => to make NAMEs have the `integer' attribute
            # -x => to make NAMEs export
            # -- => default (string)
            -a | -A | -i | -x | --)
                if [ -n "${var_ty_letter}" ]; then
                    1>&2 echo -e "[${FUNCNAME[0]} error]" "invalid \"var type\" ${arg} option ${pos} already set to ${var_ty_letter} by argument ${var_ty_pos}"
                elif [[ -v param_map["${value}"] ]]; then
                    1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring option ${pos} ${arg@Q} already provided in position ${prev_arg_value_pos}"
                else
                    var_ty_letter="${value}"
                    var_ty_pos="${pos}"
                    var_ty_index="${index}"
                    param_map["${value}"]=${index}
                fi
                ;;
            # -g => create global variables when used in a shell function; otherwise ignored
            # -r => to make NAMEs readonly
            # -l => to convert the value of each NAME to lower case on assignment
            # -u => to convert the value of each NAME to upper case on assignment
            -g | -r | -l | -u)
                if [[ ! -v param_map["${value}"] ]]; then
                    param_map["${value}"]=${index}
                else
                    1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring option ${pos} ${arg@Q} already provided in position ${prev_arg_value_pos}"
                fi
                ;;
        esac

        local -- options=""
        for value in ${param_order[@]}; do
            if [[ -v param_map["${value}"] ]]; then
                options="${options}${value}"
            fi
        done
    done

}

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

# \(\(?:declare\|local\)\(?:\s-*[-][a-zA-Z-]+\s-+\)\(?:[a-zA-Z_]+[a-zA-Z0-9_]*\)\)\(\(?:[$]\|[^=\\n"'0-9(#]*\)\(?:[-]?[0-9]+\|\(?:["]\)\(?:[^"]*\)\(?:["]\)\|\(?:[']\)\(?:[^']*\)\(?:[']\)\|\(?:[(]\)\(?:[^()]*\)\(?:[)]\)\)\)$

# declare -g shell_state_script_path="${HOME}/.shell.d/x.d/shell-state.sh"

# if [ -s "${shell_state_script_path}" ]; then
#     builtin source ~/.shell.d/x.d/shell-state.sh
# fi

set -umTE
set +f
set -o pipefail
unset IFS

# export PS3=''
# export PS4=''
# export PS2=''

declare -g shell_d_entrypoint_source_path_relative="${BASH_SOURCE[0]}"


declare -- gnu_bash_libexec="/opt/homebrew/bin/bash"
declare -gA function_definitions=()


set -o pipefail
export PATH="${HOME}/opt/libexec:${PATH}"
export IFS=$'\n'
export PROMPT_COMMAND="history -a"
export HISTSIZE="211776"
export HISTFILESIZE="211776"
export HISTTIMEFORMAT='@%s:%Z     '
export HISTCONTROL='ignorespace'
# builtin source ~/.shell.d/x.d/history.sh
# builtin source ~/.shell.d/x.d/varfunctions.sh
#

################################################################################
#                ____  _______     _____ ____  _____ ____                      #
#                |  _ \| ____\ \   / /_ _/ ___|| ____|  _ \                    #
#                | |_) |  _|  \ \ / / | |\___ \|  _| | | | |                   #
#                |  _ <| |___  \ V /  | | ___) | |___| |_| |                   #
#                |_| \_\_____|  \_/  |___|____/|_____|____/                    #
#                                                                              #
# ack 'declare\s+[-][Inlaixr-]*[r][Inlaixr-]*\s+([^=]+)=([^#]+)$' ~/.shell.d/  #
################################################################################

if [[ ! -v shell_d_kernel_name ]]; then
    declare -- shell_d_kernel_name="$(uname -s | tr '[:upper:]' '[:lower:]')" # revised
    if [ -n "${shell_d_kernel_name}" ]; then
        declare -r shell_d_kernel_name="${shell_d_kernel_name}" # revised
    fi
fi

if [[ ! -v shell_d_entrypoint ]]; then
    declare -r shell_d_entrypoint="${BASH_SOURCE[0]}" # revised
fi

if [[ ! -v shell_d_root_path ]]; then
    declare -r shell_d_root_path="$(dirname "${shell_d_entrypoint}")" # revised
fi

if [[ ! -v shell_d_rc_files_path ]]; then
    declare -r shell_d_rc_files_path="${shell_d_root_path}/rc.d" # revised
fi
if [[ ! -v shell_d_config_files_path ]]; then
    declare -r shell_d_config_files_path="${shell_d_root_path}/conf.d" # revised
fi

if [[ ! -v shell_d_in_linux ]] && [[ ! -v shell_d_in_macos ]]; then
    case "${shell_d_kernel_name}" in
        linux)
            declare -ri shell_d_in_linux=1 # revised
            declare -ri shell_d_in_macos=0 # revised
            ;;
        darwin)
            declare -ri shell_d_in_linux=0 # revised
            declare -ri shell_d_in_macos=1 # revised
            ;;
        *)
            1>&2 echo -e "\x1b[1;38;5;220m~/shell.d running in neither linux nor macos: ${shell_d_kernel_name}\x1b[0m"
            ;;
    esac
fi

if [ -s "${HOME}/.rustup/settings.toml" ]; then
    declare -- shell_d_rust_toolchain=$(${shell_d_root_path}/rust/get-default-toolchain.sh) # WIP
fi

if [ -s "${HOME}/.cargo/env" ] && [ -x "${HOME}/.cargo/bin/cargo" ]; then
    declare -- shell_d_rust_root_path="${HOME}/.cargo"
    declare -- shell_d_rust_bin_path="${shell_d_rust_root_path}/bin"
    declare -- shell_d_rust_env_path="${shell_d_rust_root_path}/env"
else
    declare -- shell_d_rust_root_path=""
    declare -- shell_d_rust_bin_path=""
    declare -- shell_d_rust_env_path=""
fi

if [ -s "${shell_d_root_path}/pyproject.toml" ]; then
    declare -- shell_d_python_manifest="${shell_d_root_path}/pyproject.toml"
else
    declare -- shell_d_python_manifest=""
fi

if [ -s "${shell_d_root_path}/.venv/bin/activate" ] && [ -x "${shell_d_root_path}/.venv/bin/python3" ]; then
    declare -- shell_d_python_root_path="${shell_d_root_path}/.venv"
    declare -- shell_d_python_bin_path="${shell_d_python_root_path}/bin"
elif [ -n "${shell_d_python_manifest}" ]; then
    declare -- shell_d_python_root_path="$(dirname "${shell_d_python_manifest}")/.venv"
    declare -- shell_d_python_bin_path="${shell_d_python_root_path}/bin"
else
    declare -- shell_d_python_root_path=""
    declare -- shell_d_python_bin_path=""
fi

declare -- shell_d_python_script="$(cat ~/.shell.d/py3/shell_d.py)"

if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    echo "${shell_d_python_script@Q}"
    exit 1
fi

shell_d_sh_load_libs() {
    export PS4=''

    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -- script_path="${BASH_SOURCE[0]}"
    local -- input_script_path=""
    if [ ${argc} -eq 1 ]; then
        script_path="${argv[0]}"
    elif [ ${argc} -gt 1 ]; then
        if [ -s "${argv[@]}" ]; then
            input_script_path="${argv[@]}"
        else
            for arg in ${argv[@]}; do
                if [ -z "${input_script_path}" ] && [ -s "${arg}" ]; then
                    input_script_path="${arg}"
                elif [ -z "${input_script_path}" ] && [ -e "${arg}" ]; then
                    1>&2 echo -e "[warning]" "ignoring empty script path ${arg@Q}"
                elif [ -n "${input_script_path}" ]; then
                    1>&2 echo -e "[warning]" "ignoring arg ${arg@Q} because input_script_path already set to ${input_script_path@Q}"
                else
                    1>&2 echo -e "[warning]" "ignoring arg ${arg@Q} because is not an existing path"
                fi
            done
            script_path=$(python3 -c "${shell_d_python_script}" "${input_script_path}")
        fi
    fi

    local -- script_filename="$(basename "${script_path}")"
    local -- script_folder="$(dirname "${script_path}")"
    local -- script_ui_path="${script_folder}/.${script_filename/%.sh/.ui}"
    local -- script_lib_path="${script_folder}/.${script_filename/%.sh/.lib}"
    local -a loaded=()
    if [ -r "${script_ui_path}" ]; then
        builtin source "${script_ui_path}"
        loaded+=("${script_ui_path}")
    fi
    if [ -r "${script_lib_path}" ]; then
        builtin source "${script_lib_path}"
        loaded+=("${script_ui_path}")
    fi
    # if [ ${#loaded[@]} -gt 0 ]; then
    #     printf '%s\n' "${loaded[@]}"
    # fi
    export PS4=''
}

last_job_pid() {
    local -i pid=-1
    pid="${!}"
    if [ ${pid} -gt 0 ]; then
        printf '$!=%s' ${pid}
    fi
}
previous_command_exit_code() {
    local -i exit_code=-1
    exit_code="${?}"
    if [ ${exit_code} -ge 0 ]; then
        printf '$?=%s' ${exit_code}
    fi
}
ps1_prefix() {
    local -a parts=(
        $(last_job_pid)
        $(previous_command_exit_code)
    )
    printf '%s ' "[${parts[@]}]"
}
initialize_shell_d_core_global_vars() {
    if [[ ! -v shell_d_entrypoint_source_path_relative ]]; then
        1>&2 echo -e "[shell.d entrypoint error]" "core global variable undefined: shell_d_entrypoint_source_path_relative "
        return 1
    fi
    declare -gr shell_d_entrypoint_source_directory_path="$(cd "$(dirname "${shelL_d_entrypoint_source_path_relative}")" && pwd)"
    declare -gr shell_d_entrypoint_source_filename="$(basename "${shell_d_entrypoint_source_path_relative}")"
    declare -r actual_shell_d_path="${shelL_d_entrypoint_source_directory_path}"
    declare -r actual_x_d_path="${actual_shell_d_path}/x.d"

    if [ "${actual_shell_d_path}" != "${default_shell_d_path}" ]; then
        1>&2 echo -e "[shell.d entrypoint error]" "actual_shell_d_path different than default_shell_d_path: ${actual_shell_d_path@Q} != ${default_shell_d_path@Q}"
        return 1
    fi
    if [ "${actual_x_d_path}" != "${default_x_d_path}" ]; then
        1>&2 echo -e "[shell.d entrypoint error]" "actual_x_d_path different than default_x_d_path: ${actual_x_d_path@Q} != ${default_x_d_path@Q}"
        return 1
    fi
    if ! "$(cd "${entrypoint_dirname}" && pwd)"; then
        SHELL_D_PATH="${HOME}/.shell.d"
    fi

    local -- X_D_PATH="${SHELL_D_PATH}/x.d"

}
declare -g default_shell_d_path="${HOME}/.shell.d"
declare -g default_x_d_path="${default_shell_d_path}/x.d"

entrypoint() {
    # shell_d_sh_load_libs "${BASH_SOURCE[0]}"

    local -- entrypoint_script_path="$(shell_d_fs_get_canonical_path ${BASH_SOURCE[0]})"
    local -- entrypoint_dirname="$(dirname "${entrypoint_script_path}")"
    if [ "${entrypoint_dirname}" != "${default_shell_d_path}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} warning]"  "entrypoint.sh should be at ${default_shell_d_path} not ${entrypoint_dirname}"
    fi
    local -- SHELL_D_PATH="${entrypoint_dirname}"
    local -- X_D_PATH="${SHELL_D_PATH}/x.d"
    shell_d_sh_load_source "${X_D_PATH}/boot.sh"

    # <PS1>
    #     <~%2f.config%2fps1.toml>
    #         # ps1='{220}\u{231}:{220}\W{37}{git:branch}{220}${reset}  ';
    #         ps1='{220}\u{231}@{178}\\\$\\\${231}:{220}\W{37}{git:branch}{220}${reset}  ';
    #     </~%2f.config%2fps1.toml>
    # </PS1>

    if [ -x "${HOME}/.cargo/bin/ps1" ]; then
        eval "$(${HOME}/.cargo/bin/ps1 --env)"
    else
        export PS1='\u@\h:\w\$ '
    fi
    export PS1="\[\r\][#\${HISTCMD}][\\\$?=\$?] [\\\$\\\$=\$\$] ${PS1}"

    xD \
        "locale.sh" \
        "homebrew.sh" \
        "path.sh" \
        "cdpath.sh"

    # debuggin error `pop_var_context: head of shell_variables not a function context`:
    #   `rg --multiline '((uw_)?pop_(var_)?context)(\s+|\n+)*[\(][^)]*[)](\s+|\n+)*[;]'`
    xD 0000000.sh
    xD 0000010-editors.sh
    xD 0000101-functions.sh
    xD 0000110-aliases.sh
    xD 0000110-env.sh
    xD 0001000-build-essential.sh
    xD 0001010-cryptoccur.sh
    xD 0010000-stercet.sh
    xD 1100011.sh

    xD \
        "cdpath.sh" \
        "path.sh" \
        "homebrew.sh" \
        "sec.sh" \
        "io.sh" \
        "workbench.sh" \
        "ansi.sh"

    shell_d_sh_load_source "${X_D_PATH}/completions.sh"
    shell_d_sh_load_source "${X_D_PATH}/hooks.sh"

    unset s brew_path path gq
}
shell_d_fs_get_canonical_path() {
    if [ ${#} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing argument: <RELATIVE_PATH>"
        return 1
    elif [ ${#} -gt 1 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "too many arguments"
        return 1
    fi

    local -- relative_path="${1}"
    shell_d_sh_validate_non_empty_regular_file_argument "relative_path" "${relative_path}"

    if [ -x "${HOME}/.cargo/bin/path" ]; then
        ${HOME}/.cargo/bin/path canon "${relative_path}"
        return $?
    else
        shell_d_fallback_get_canonical_path "${relative_path}"
        return $?
    fi
}
shell_d_fallback_get_canonical_path() {
    if [ ${#} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing argument: <RELATIVE_PATH>"
        return 1
    elif [ ${#} -gt 1 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "too many arguments"
        return 1
    fi
    local -- working_dir=$(pwd)
    local -- relative_path="${1}"
    local -- relative_dirname="$(dirname "${relative_path}")"
    local -- filename="$(basename "${1}")"
    shell_d_sh_validate_non_empty_regular_file_argument "relative_path" "${relative_path}"

    local -- full_dirname="$(2>/dev/null 1>/dev/null cd "${relative_dirname}" && pwd)"
    local -- full_path="${full_dirname}/${filename}"
    2>&1 echo "${full_path}"
}

shell_d_sh_validate_non_empty_argument() {
    if [[ ! -v FUNCNAME[1] ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "undefined variable \${FUNCNAME[1]}this function should be called from another shell function"
        return 1
    elif [[ ! -v LINENO[1] ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "undefined variable \${LINENO[1]}this function should be called from another shell function"
        return 1
    fi
    local -- caller_funcname=${FUNCNAME[1]}
    local -- caller_lineno=${LINENO[1]}
    local -- caller_frame="${caller_funcname}:${caller_lineno}"

    local -a argv=($@)
    local -i argc=${#argv[@]}

    if [ ${argc} -lt 2 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments: <ARGUMENT_NAME> <ARGUMENT_VALUE>"
        return 1
    elif [ ${argc} -gt 2 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "too many arguments, this function takes exacly 2 arguments: <ARGNAME> and <VALUE>"
        return 1
    fi

    local -- caller_argument_name="${argv[@]:0:1}"
    local -- caller_argument_value="${argv[@]:1:1}"

    if [ -z "${caller_argument_name}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "${caller_frame} missing argument: <ARGUMENT_NAME>"
        return 1
    elif [[ ! "${caller_argument_name}" =~ ^[a-zA-Z_]+[a-zA-Z0-9_]*$ ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "${caller_frame} invalid variable name {caller_argument_name@Q}"
        return 1
    fi

    if [ -z "${caller_argument_value}" ]; then
        1>&2 echo -e "[${caller_funcname} error]" "missing argument: <${caller_argument_name@U}>"
        return 1
    fi
}
shell_d_sh_validate_non_empty_regular_file_argument() {
    if [[ ! -v FUNCNAME[1] ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "undefined variable \${FUNCNAME[1]} this function should be called from another shell function"
        return 1
    elif [[ ! -v BASH_LINENO[1] ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "undefined variable \${BASH_LINENO[1]} this function should be called from another shell function"
        return 1
    fi
    local -- caller_funcname=${FUNCNAME[1]}
    local -- caller_lineno=${BASH_LINENO[1]}
    local -- caller_frame="${caller_funcname}:${caller_lineno}"

    local -a argv=($@)
    local -i argc=${#argv[@]}

    if [ ${argc} -lt 2 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments: <ARGUMENT_NAME> <ARGUMENT_VALUE>"
        return 1
    elif [ ${argc} -gt 2 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "too many arguments, this function takes exacly 2 arguments: <ARGNAME> and <VALUE>"
        return 1
    fi

    local -- caller_argument_name="${argv[@]:0:1}"
    local -- caller_argument_value="${argv[@]:1:1}"

    if [ -z "${caller_argument_name}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "${caller_frame} missing argument: <ARGUMENT_NAME>"
        return 1
    elif [[ ! "${caller_argument_name}" =~ ^[a-zA-Z_]+[a-zA-Z0-9_]*$ ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "${caller_frame} invalid variable name {caller_argument_name@Q}"
        return 1
    fi

    if [ -z "${caller_argument_value}" ]; then
        1>&2 echo -e "[${caller_funcname} error]" "missing argument: <${caller_argument_name@U}>"
        return 1
    elif [ ! -e "${caller_argument_value}" ]; then
        1>&2 echo -e "[${caller_funcname} error]" "path does not exist: ${caller_argument_value@Q}"
        return 1
    elif [ ! -f "${caller_argument_value}" ]; then
        1>&2 echo -e "[${caller_funcname} error]" "not a file: ${caller_argument_value@Q}"
        return 1
    elif [ ! -r "${caller_argument_value}" ]; then
        1>&2 echo -e "[${caller_funcname} error]" "file not readable: ${caller_argument_value@Q}"
        return 1
    elif [ ! -s "${caller_argument_value}" ]; then
        1>&2 echo -e "[${caller_funcname} error]" "empty file: ${caller_argument_value@Q}"
        return 1
    fi
}
shell_d_sh_load_source() {
    if [ ${#} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>"
        return 1
    elif [ ${#} -gt 1 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "too many arguments"
        return 1
    fi

    local -- shell_script_path="${1}"
    shell_d_sh_validate_non_empty_regular_file_argument "shell_script_path" "${shell_script_path}"
    shell_script_path=$(shell_d_fs_get_canonical_path "${shell_script_path}")

}
xD() {
    export PS4=''
    local -a path_list=($@)
    local -i path_count=${#path_list[@]}
    local SHELL_D_PATH="${HOME}/.shell.d"
    local X_D_PATH="${SHELL_D_PATH}/x.d"
    local -- sh=""
    if [ ${path_count} -eq 0 ]; then
        1>&2 echo -e "[error]" "xD missing argument(s): <PATH> [PATH...]"
        return 1
    fi
    for sh in ${path_list[@]}; do
        if [ -z "${sh}" ]; then
            1>&2 echo -e "[warning]" "xD skipping empty arg"
            return 1
        fi
        if [ -e "${SHELL_D_PATH}/${sh}" ] && [ -r "${SHELL_D_PATH}/${sh}" ] && [ -s "${SHELL_D_PATH}/${sh}" ]; then
            shell_d_sh_load_source "${SHELL_D_PATH}/${sh}"
            # shell_d_sh_load_libs "${SHELL_D_PATH}/${sh}"
        elif [ -e "${X_D_PATH}/${sh}" ] && [ -r "${X_D_PATH}/${sh}" ] && [ -s "${X_D_PATH}/${sh}" ]; then
            shell_d_sh_load_source "${X_D_PATH}/${sh}"
            # shell_d_sh_load_libs "${X_D_PATH}/${sh}"
        else
            1>&2 echo -e "[error]" "xD could not find readable non-empty file ${sh@Q}"
            return 5
        fi
    done
}
postentry() {
    set -m
    set +u
    set -f
    set +f

    export PS2=''
    export PS3=''
    export PS4=''
    export IFS=$'\n'
}
if [[ -v SHELL_D_DEBUG ]] && [ -n "${SHELL_D_DEBUG}" ]; then
    export PS3='${BASH_SOURCE[0]}${LINENO[0]}'
fi

if [ "${0}" == "${gnu_bash_libexec}" ]; then
    set -x
    entrypoint
    postentry
fi
unset entrypoint postentry

# for fn in $(grep -i -E '^[a-z_]+[(][^)]*[)]([[:space:]]*|\n)[{]' "${BASH_SOURCE[0]}" | sed -E 's/^[[:space:]]*([[:space:]]*function[[:space:]]*)\?([a-zA-Z_-][a-zA-Z0-9_-]+).*[(][^)]*[)]([[:space:]]*|\n)*[{]/\2/g'); do
#     2>/dev/random 1>/dev/random unset "${function_name}"
# done

umask 007
declare -i shell_d_finished_at=$(date +%s)
export PS4=''
export PS3=''
set +x
