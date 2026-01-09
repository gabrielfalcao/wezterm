export IFS=$'\n'
set -umTE
set +f
set -o pipefail
unset IFS

#<TODO read/map shopts from `man bash'>
shopt -s checkwinsize
shopt -s cmdhist
#</TODO read/map shopts from `man bash'>
#declare -i now=$(date +%s)
#
#on_exit() {
#    return 0
#}
#on_ctrlc() {
#    1>&2 echo -e "\x1b[1;38;2;${error_color_rgb}m\rAborted with Ctrl-C\x1b[0m"
#    exit 1
#}
#on_error() {
#    local -- log_path_declare="${HOME}/.shell.d/entrypoint.on_error.declare.${now}.log"
#    local -- log_path_env="${HOME}/.shell.d/entrypoint.on_error.env.${now}.log"
#    local -- log_path_bash_vars="${HOME}/.shell.d/entrypoint.on_error.bash_vars.${now}.log"
#
#    builtin declare -p > ${log_path_declare}
#    env > ${log_path_env}
#    1>${log_path_bash_vars} builtin echo -e "
#${BASH_SOURCE[@]@A}
#${BASH_LINENO[@]@A}
#${FUNCNAME[@]@A}
#${LINENO[@]@A}
#"
#    local -i tmp=0
#    1>&2 echo -e "log_path_declare=${log_path_declare@Q}"
#    1>&2 echo -e "log_path_env=${log_path_env@Q}"
#    1>&2 echo -e "log_path_bash_vars=${log_path_bash_vars@Q}"
#    local -i delta=0
#    for tmp in {0..4}; do
#        delta=$(( 5 - tmp ))
#        sleep 1
#        1>&2 echo -e "${delta}..."
#    done
#
#    # export IFS=$'\n'
#    # local -a decls=(
#    #     $(declare -p)
#    # )
#    # local -- lastarg="$_"
#    # local -- varname=""
#    # 1>&2 echo -e "\x1b[1;38;5;202m${BASH_SOURCE[@]}\x1b[0m"
#    # 1>&2 echo -e "\x1b[1;38;5;202m${BASH_LINENO[@]}\x1b[0m"
#    # 1>&2 echo -e "\x1b[1;38;5;202m${FUNCNAME[@]}\x1b[0m"
#    # 1>&2 echo -e "\x1b[1;38;5;202m${LINENO[@]}\x1b[0m"
#    return 1
#}
#on_exit() {
#    true
#}
#on_return() {
#    true
#}
## # echo -en "\x1b[2J\x1b[3J\x1b[H"
## trap on_exit exit
## trap on_return return
## trap on_error err
#
## # trap on_debug debug
## trap on_exit exit
## trap on_ctrlc hup
## trap on_ctrlc int
## trap on_ctrlc bus
## trap on_ctrlc segv
## trap on_ctrlc sys

set -o pipefail
export PATH="$HOME/opt/libexec:$PATH"
export IFS=$'\n'

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

if [ -s "$HOME/.rustup/settings.toml" ]; then
    declare -- shell_d_rust_toolchain=$(${shell_d_root_path}/rust/get-default-toolchain.sh) # WIP
fi

if [ -s "$HOME/.cargo/env" ] && [ -x "$HOME/.cargo/bin/cargo" ]; then
    declare -- shell_d_rust_root_path="$HOME/.cargo"
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
    declare -- shell_d_python_root_path=""
    declare -- shell_d_python_bin_path=""
else
    declare -- shell_d_python_root_path=""
    declare -- shell_d_python_bin_path=""
fi

declare -- shell_d_python_script="$(cat ~/.shell.d/py3/shell_d.py)"

if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    echo "${shell_d_python_script@Q}"
    exit 1
fi

shell_d_load_libs() {
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
entrypoint() {
    shell_d_load_libs "${BASH_SOURCE[0]}"
    ps1bin="$HOME/.cargo/bin/ps1"
    if [ -x "${ps1bin}" ]; then
        eval "$($ps1bin --env)"
    fi
    # export PS1="[\\\$_=\$_; \\\$?=\$?; \\\$!=\$!] ${PS1}"
    export PS1="\[\r\][\\\$?=\$?] ${PS1}"
    local SHELL_D_PATH="${HOME}/.shell.d"
    local X_D_PATH="$SHELL_D_PATH/x.d"
    local sh

    xD \
        "locale.sh" \
        "homebrew.sh" \
        "paths.sh" \
        "cdpaths.sh"

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
        "cdpaths.sh" \
        "paths.sh" \
        "homebrew.sh" \
        "sec.sh" \
        "io.sh" \
        "workbench.sh" \
        "ansi.sh"

    unset s brew_path path gq
    builtin source "${X_D_PATH}/completions.sh"
    builtin source "${X_D_PATH}/boot.sh"
}

xD() {
    local -a path_list=($@)
    local -i path_count=${#path_list[@]}
    local SHELL_D_PATH="${HOME}/.shell.d"
    local X_D_PATH="$SHELL_D_PATH/x.d"
    local -- sh=""
    if [ ${path_count} -eq 0 ]; then
        1>&2 echo -e "[error]" "xD missing argument(s): <PATH> [PATH...]"

    fi
    for sh in ${path_list[@]}; do
        if [ -e "$SHELL_D_PATH/$sh" ] && [ -r "$SHELL_D_PATH/$sh" ] && [ -s "$SHELL_D_PATH/$sh" ]; then
            builtin source "${SHELL_D_PATH}/${sh}"
            shell_d_load_libs "${SHELL_D_PATH}/${sh}"
        elif [ -e "$X_D_PATH/$sh" ] && [ -r "$X_D_PATH/$sh" ] && [ -s "$X_D_PATH/$sh" ]; then
            builtin source "${X_D_PATH}/${sh}"
            shell_d_load_libs "${X_D_PATH}/${sh}"
        else
            1>&2 echo -e "[error]" "xD could not find readable non-empty file ${sh@Q}"
            return 5
        fi
    done
    unset sh
}

if [[ -v SHELL_D_DEBUG ]] && [ -n "${SHELL_D_DEBUG}" ]; then
    export PS3='${BASH_SOURCE[0]}${LINENO[0]}'
fi
entrypoint
# for fn in $(grep -i -E '^[a-z_]+[(][^)]*[)]([[:space:]]*|\n)[{]' "${BASH_SOURCE[0]}" | sed -E 's/^[[:space:]]*([[:space:]]*function[[:space:]]*)\?([a-zA-Z_-][a-zA-Z0-9_-]+).*[(][^)]*[)]([[:space:]]*|\n)*[{]/\2/g'); do
#     2>/dev/random 1>/dev/random unset "$function_name"
# done

declare -i shell_d_finished_at=$(date +%s)

set -m
set +u
set -f
set +f
# set +u

# # # # ${parameter/pattern/string}   # erstes
# # # # ${parameter//pattern/string}  # alles
# # # # ${parameter/#pattern/string}  # start
# # # # ${parameter/%pattern/string}  # end
# export PROMPT_COMMAND="history -a;"
# export PROMPT_COMMAND="history -n; history -r; history -a"
# cls
export HISTTIMEFORMAT='@%s:%Z     '

umask 007
