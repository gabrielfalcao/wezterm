if [ "${BASH_VERSINFO[0]}" -lt 5 ]; then
    1>&2 echo -e "[shell.d warning]" "${BASH_SOURCE[0]} requires bash version 5.2 or greater"
fi
# declare -- my_tty_name=$(basename $(tty))
# echo "${$}" > "${HOME}/.shell.d/entrypoint.${my_tty_name}.${WEZTERM_PANE}.started"

export IFS=$'\n'

export INFOPATH="/opt/homebrew/share/info:/opt/homebrew/share/info:"
export MANPATH="/opt/homebrew/share/man:/opt/homebrew/share/man::"
export PATH="/opt/homebrew/bin:${HOME}/opt/libexec:${HOME}/.cargo/bin:${HOME}/.elixir-install/installs/elixir/1.18.2-otp-27/bin:${HOME}/.elixir-install/installs/otp/27.1.2/bin:${HOME}/.local/bin:${HOME}/.shell.d/.venv/bin:${HOME}/.nvm/versions/node/v22.18.0/bin:/opt/homebrew/Cellar/gnu-sed/4.9/libexec/gnubin:/opt/homebrew/Cellar/gnu-sed/4.9/bin:/opt/homebrew/Cellar/findutils/4.10.0/libexec/gnubin:/opt/homebrew/Cellar/findutils/4.10.0/bin:/opt/homebrew/Cellar/git/2.47.0/libexec/git-core:/opt/homebrew/sbin:${HOME}/.bun/bin:${HOME}/.deno/bin:${HOME}/go/install/1.25.0/go/bin:/opt/homebrew/Cellar/gawk/5.3.0/libexec/gnubin:/opt/homebrew/Cellar/gawk/5.3.0/bin:/opt/homebrew/Cellar/bzip2/1.0.8/bin:/opt/homebrew/Cellar/coreutils/9.5/libexec/gnubin:/opt/homebrew/Cellar/coreutils/9.5/bin:/opt/homebrew/Cellar/curl/8.10.1/bin:/opt/homebrew/Cellar/gnu-tar/1.34_1/libexec/gnubin:/opt/homebrew/Cellar/gnu-tar/1.34_1/bin:/opt/homebrew/Cellar/gnu-time/1.9/libexec/gnubin:/opt/homebrew/Cellar/gnu-time/1.9/bin:/opt/homebrew/Cellar/make/4.4.1/libexec/gnubin:/opt/homebrew/Cellar/make/4.4.1/bin:/opt/homebrew/Cellar/openssl@3/3.6.0/bin:${HOME}/go/bin:${HOME}/.zig:${HOME}/.shell.d/scripts:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/Applications/Emacs.app/Contents/MacOS:./tools:./scripts:./node_modules/.bin:/opt/homebrew/bin:/opt/homebrew/sbin"
export CDPATH="${HOME}/projects/work/poems.codes/tools/noon-cli/packages:${HOME}/projects/work/poems.codes/tools:${HOME}/projects/work/poems.codes:${HOME}/projects/work/poems.codes/paas:${HOME}/projects/work/poems.codes/pro-bono:${HOME}/projects/work/poems.codes/sandbox:${HOME}/projects/work/poems.codes/poc:${HOME}/projects/personal:${HOME}/projects/personal/chrome-extensions:${HOME}/projects/work:${HOME}/projects/third_party:${HOME}/projects:${HOME}/projects/опенсорси:${HOME}/.shell.d/CDPATH:${HOME}"
export EMACS_SOCKET_NAME="${HOME}/.emacs.d/socket/server"
# Enable function tracing
set -o functrace

export TZ=UTC
declare -gir shell_d_started_at=$(date --utc +%s)
declare -gi shell_d_pid=${$}
set -mTE

declare -gi shell_d_entrypoint_verbose=0
declare -gi shell_d_entrypoint_dry_run=0

declare -gA shell_d_dumped_varname_map=()

declare -gA shell_d_checked_shell_scripts_stderr_map=()
declare -gA shell_d_checked_shell_scripts_stdout_map=()
declare -gA shell_d_checked_shell_scripts_result_map=()

declare -gA shell_d_declared_functions_colon_sep_by_source=()
declare -gA shell_d_declared_functions_colon_sep_by_caller=()
declare -gA shell_d_declared_functions_colon_sep_by_timestamp=()
declare -- fn=''
declare -i now=$(date --utc +%s)
for fn in $(declare -p -F); do
    shell_d_declared_functions_colon_sep_by_timestamp
done

#<TODO read/map shopts from `man bash'>
shopt -s checkwinsize cmdhist extglob
shopt -u dotglob failglob globstar nocaseglob nullglob extdebug extquote
#(dotglob|failglob|globstar|nocaseglob|nullglob|extglob|extquote)
#</TODO read/map shopts from `man bash'>  pandoc -f man -i $(man -w bash) -t markdown

export HISTCONTROL="ignorespace"
export HISTFILE="${HOME}/.bash_history"
export HISTFILESIZE="211776"
export HISTIGNORE="[bf]g:exit:clear:cls:history*:hist-*:hist_*:[ \\t]*"
export HISTSIZE="211776"
export HISTTIMEFORMAT="@%s:%Z     "
# history -n
# export HISTFILE="${HOME}/.bash_history.$(date +%Y-%m-%d)"
# # export HISTFILE="${HOME}/.bash_history"

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
    if [ -n "${caller_bash_source}" ] && [ -n "${caller_lineno}" ] && [ -n "${caller_funcname}" ]; then
        echo "+ ${caller_bash_source}:${caller_lineno}: ${caller_funcname}(): "
    elif [ -n "${caller_bash_source}" ] && [ -n "${caller_lineno}" ] && [ -z "${caller_funcname}" ]; then
        echo "+ ${caller_bash_source}:${caller_lineno}: "
    elif [ -n "${caller_bash_source}" ] && [ -z "${caller_lineno}" ] && [ -z "${caller_funcname}" ]; then
        echo "+ ${caller_bash_source}: "
    fi
    # export PS4='+ $(__shell_d_sh_ps4_function__): '

}
export PS4='$(__shell_d_sh_ps4_function__)'
# Now trace output will show file, line, and function name

__shell_d_sh_trap_function_return__() {
    set +x
    # local -- key=''
    # local -i index=0;
    # local -- value=''

    # for key in ${!FUNCNAME[@]}; do
    #     value=${FUNCNAME[${key}]}
    #     if [[ "${value}" =~ __shell_d.* ]]; then
    #         continue
    #     fi
    #     1>&2 echo "\${FUNCNAME[${key}]} => ${FUNCNAME[${key}]}"
    # done
}
cls() {

    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
}
__shell_d_sh_trap_function_debug__() {
    local -a argv=(${@})
    local -i argc=${#}

    local -- func=''
    local -- lineno=''
    local -- key=''
    local -i index=0
    local -- value=''

    local -i stdin_is_tty=0

    if [ -t 0 ]; then
        stdin_is_tty=1
    fi

    local -i total=${#FUNCNAME[@]}
    for index in ${!FUNCNAME[@]}; do
        func=${FUNCNAME[${index}]}
        lineno=${BASH_LINENO[${index}]}
        if [ ${index} -eq 0 ]; then
            padding=""
        else
            padding=$(printf '%*s' "$((index * 4))" " ")
        fi
    done
    1>&2 echo "\${#FUNCNAME[@]} => ${#FUNCNAME[@]}  (argc: ${argc}, stdin_is_tty: ${stdin_is_tty})"
    1>&2 echo "\${#BASH_LINENO[@]} => ${#BASH_LINENO[@]}"

    # 1>&2 echo "\${FUNCNAME[0]} => ${FUNCNAME[0]} (argc: ${argc}, stdin_is_tty: ${stdin_is_tty})"

}
__shell_d_sh_trap_function_backtrace__() {
    set +x
    local -i i
    # local -- padding_left=''
    # local -- indent='    '

    local -- stack_size=${#FUNCNAME[@]}
    if [ ${stack_size} -eq 1 ]; then
        return
    fi
    1>&2 echo -e "\nBash backtrace:"
    # Loop from the second element (index 1) to skip the backtrace function itself
    for ((i = 1; i < $stack_size; i++)); do
        local func="${FUNCNAME[$i]}"
        [ -z "$func" ] && func=main
        local line="${BASH_LINENO[$((i - 1))]}"
        local src="${BASH_SOURCE[$i]}"
        [ -z "$src" ] && src=non_file_source
        # for ((pl=0; pl<=${i}; pl++)) {
        #     padding_left="$(builtin printf '%s%s' "${padding_left}" "${indent}")"
        # }
        # padding_left=$(seq "${i}" | sed -z -E 's/[0-9]+//g; s/[\n]+/    /g')
        1>&2 printf "  at %s (%s:%s)\n" "$func" "$src" "$line"
    done
    set +x
}

__shell_d_sh_trap_function_exit__() {
    2>/dev/random 1>/dev/random stty sane
}
__shell_d_sh_trap_function_ctrlc__() {
    1>&2 echo -e "\x1b[0m\rAborted with Ctrl-C\x1b[0m"
    exit 1
}
trap __shell_d_sh_trap_function_exit__ exit
trap __shell_d_sh_trap_function_ctrlc__ hup

trap __shell_d_sh_trap_function_exit__ exit
trap __shell_d_sh_trap_function_return__ RETURN
# trap __shell_d_sh_trap_function_debug__ DEBUG
trap __shell_d_sh_trap_function_backtrace__ ERR
set -o errtrace # Ensure ERR trap is inherited by functions
set -o functrace
set -o pipefail

shell_d_fs_get_tty_path() {
    lsof -p "${$}" | awk '{ print $NF }' | grep /dev/tty | sort -u | head -1
}
shell_d_sh_shfmt_check() {
    local -r shfmt_path="${HOME}/go/bin/shfmt"
    local -i code=0
    local -- output=""
    if [ -x "${shfmt_path}" ]; then
        if ! output=$(${shfmt_path} $@); then
            code=$?
        fi
    fi
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

#### TODO #### shell_d_sh_get_history_entry_by_id() {
#### TODO ####     local -a argv=($@)
#### TODO ####     local -i argc=${#argv[@]}
#### TODO ####     local -i entry_index=1
#### TODO ####     local -i given_entry=1
#### TODO ####     local -i last_entry_id=$(( HISTCMD - 1 ))
#### TODO ####
#### TODO ####     history | awk '
#### TODO ####
#### TODO #### BEGIN {
#### TODO ####     delete entries_by_id;
#### TODO ####     delete cli_params;
#### TODO ####     cli_param_count=ARGC;
#### TODO ####
#### TODO ####     for (idx=0;idx<ARGC; idx++) {
#### TODO ####         arg_value=PROCINFO["argv"][idx];
#### TODO ####         cli_params[idx]=arg_value;
#### TODO ####         if ((!given_entry_id) && (arg_value ~ /^[1-9][0-9]*$/)) {
#### TODO ####             given_entry_id=arg_value
#### TODO ####             continue;
#### TODO ####         }
#### TODO ####     }
#### TODO ####     ARGC=1
#### TODO #### }
#### TODO ####
#### TODO #### {
#### TODO #### for
#### TODO ####
#### TODO ####
#### TODO ####
#### TODO #### }
#### TODO ####
#### TODO #### END {
#### TODO ####
#### TODO ####
#### TODO #### }
#### TODO ####
#### TODO #### '
#### TODO ####
#### TODO ####     if [ ${argc} -eq 0 ]; then
#### TODO ####         1>&2 echo -e "[${FUNCNAME[0]} error]" "missing argument: <ENTRY_INDEX>"
#### TODO ####         return 1
#### TODO ####     fi
#### TODO #### }

shell_d_sh_show_error() {
    local -- prefix="$1"
    shift
    local -- msg="$@"

    local -- rgb_color_error="$((0xFF));$((0x32));$((0x4B))m"
    local -- rgb_color_dark_grey="$((0xF1));$((0xF1)); $((0xF1))m"
    1>&2 echo -e "\x1b[1;48;2;${rgb_color_error}\x1b[1;38;2;${rgb_color_dark_grey}[${prefix}]\x1b[0m" "\x1b[1;38;2;${rgb_color_error}${msg}\x1b[0m"
}
shell_d_sh_show_warning() {
    local -- prefix="$1"
    shift
    local -- msg="$@"

    local -- rgb_color_warning="$((0xFF));$((0x83)); $((0x32))m"
    local -- rgb_color_dark_grey="$((0xF1));$((0xF1)); $((0xF1))m"
    1>&2 echo -e "\x1b[1;48;2;${rgb_color_warning}\x1b[1;38;2;${rgb_color_dark_grey}[${prefix}]\x1b[0m" "\x1b[1;38;2;${rgb_color_warning}${msg}\x1b[0m"
}

shell_d_sh_get_history_entry_by_id() {
    history 1 | awk 'BEGIN {result="";} $0 ~ /^\s*[0-9]+\s+@([0-9]+):([^[:space:]\n]+)\s+([^[:space:]].*)$/ { result=" "; for (i=1;i<NF;i++) { result=sprintf("%s%s ", result, $i) }} END { print(gensub(/\s*$/, "", "g", result)) }'

}
shell_d_sh_prompt_command_enable() {
    declare -gi shell_d_prompt_command_no_auto_title=1
}
shell_d_sh_prompt_command_disable() {
    unset shell_d_prompt_command_no_auto_title=1
}
shell_d_sh_prompt_command() {
    # history -n
    history -a

    if [[ -v WEZTERM_PANE ]] && [[ -v WEZTERM_UNIX_SOCKET ]]; then
        if [ -S "${WEZTERM_UNIX_SOCKET}" ] && [[ "${WEZTERM_PANE}" =~ ^[0-9]+$ ]]; then
            if [[ ! -v shell_d_prompt_command_no_auto_title ]]; then
                # 1>&2 echo "${BASH_SOURCE[@]}"
                local -- last_cmd=$(history 1 | sed -E 's/^\s*[0-9]+\s*@[0-9]{8,}:[^[:space:]]+\s*([^[:space:]]+.*)$/\1/g')
                local -- tab_title="${last_cmd}"
                if [ ${#last_cmd} -gt 12 ]; then
                    tab_title="${last_cmd:0:9}..."
                fi

                wezterm cli set-tab-title "${tab_title}"
            fi
        fi
    else
        # declare -p HISTSIZE HISTFILESIZE HISTTIMEFORMAT HISTCONTROL HISTIGNORE
        true
    fi
    # set +x
    #    if [[ ${HISTCMD} -ge 1 ]]; then
    #        declare -gi last_history_entry=$(( HISTCMD -1 ))
    #    fi
    #    local -A history_entries=();
    #    local -i history_entry_count_to_retrieve=10
    #    local -i latest_entry_id_to_retrieve=$(( HISTCMD - 1 ))
    #    local -- original_histtimeformat=""
    #    if [[ -v HISTTIMEFORMAT ]]; then
    #        original_histtimeformat="${HISTTIMEFORMAT}"
    #    else
    #        unset original_histtimeformat
    #    fi
    #    local -i oldest_entry_id_to_retrieve=$(( latest_entry_id_to_retrieve - history_entry_count_to_retrieve ))
    #    local -- last_history_entry=$(unset HISTTIMEFORMAT; history 1)
    #
    #    if [[ -v original_histtimeformat ]]; then
    #        export HISTTIMEFORMAT="${original_histtimeformat}"
    #    fi
    #    history -a
    #    local -i wezterm_pane_id_from_env=-1;
    #    if [ ! "${WEZTERM_PANE}" =~ ^[0-9]+$ ]; then
    #        wezterm_pane_id_from_env=${WEZTERM_PANE}
    #    elif [[ ! -v WEZTERM_PANE ]]; then
    #        shell_d_sh_show_warning "[${FUNCNAME[0]} warning]" "WEZTERM_PANE env var not defined"
    #        return
    #    elif [ ! "${WEZTERM_PANE}" =~ [^0-9] ]; then
    #        shell_d_sh_show_error "[${FUNCNAME[0]} error]" "WEZTERM_PANE has invalid (non-number) characters: ${WEZTERM_PANE@Q}"
    #        return 1
    #    fi
    #
    #    local -- last_history_entry_raw="$(history 1)"
    #    local -i last_history_entry_id="$(awk '{ print $1 }' <<< "${last_history_entry_raw}")"
    #    local -i last_history_entry_timestamp_raw="$(awk '{ print $2 }' <<< "${last_history_entry_raw}")"
    #    local -- last_history_entry_command_and_args="$(awk 'BEGIN { delete cmd_and_args; result=""; } { for (i=3;i<NF; i++) { cmd_and_args[cmd_and_args_count++]=$i; result=sprintf("%s%s ", result, $i); } } END { print(gensub(/\s*$/, "", "g", result));  }' <<< "${last_history_entry_raw}")"
    #    local -- last_history_entry_prog_name="$(awk '{ $1 }' <<< "${last_history_entry_command_and_args}")"
    #    local -a last_history_entry_prog_args=( $(awk 'NF >= 2 {
    #for (i=2;i<NF; i++) { printf("%s%s\n", result, $i); }
    # }' <<< "${last_history_entry_command_and_args}") )
    #
    #    local -- last_prog=""
    #    if [[ -v WEZTERM_PANE ]] && [ "${WEZTERM_PANE}" =~ ^[0-9]+$ ]; then
    #        if [ -n "${last_history_entry_prog_name}" ]; then
    #            2>/dev/null wezterm cli set-tab-title --pane-id "${wezterm_pane_id_from_env}"  "${last_history_entry_prog_name}"
    #        else
    #            shell_d_sh_show_error "[${FUNCNAME[0]} error]" "\${last_history_entry_prog_name} is empty $(declare -p last_history_entry_raw)"
    #        fi
    #    fi
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

declare -g shell_d_entrypoint_source_path_relative="${BASH_SOURCE[0]}"

declare -- gnu_bash_libexec="/opt/homebrew/bin/bash"
declare -gA function_definitions=()

set -o pipefail
export PATH="${HOME}/opt/libexec:${PATH}"
export IFS=$'\n'

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

declare -ga shell_d_load_source_stack=()

if [[ ! -v shell_d_tty_path ]]; then
    declare -- shell_d_tty_path=""
    shell_d_tty_path="$(shell_d_fs_get_tty_path)"
    if [ -n "${shell_d_tty_path}" ]; then
        declare -r shell_d_tty_path="${shell_d_tty_path}"
    fi
fi

if [[ ! -v shell_d_kernel_name ]]; then
    declare -- shell_d_kernel_name=""
    shell_d_kernel_name="$(uname -s | tr '[:upper:]' '[:lower:]' || true)" # revised
    # 1>&2 echo "${shell_d_kernel_name@A}"
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

####### DELETE_THIS >>>shell_d_sh_load_libs() {
####### DELETE_THIS >>>    export PS4=''
####### DELETE_THIS >>>
####### DELETE_THIS >>>    local -a argv=($@)
####### DELETE_THIS >>>    local -i argc=${#argv[@]}
####### DELETE_THIS >>>    local -- script_path="${BASH_SOURCE[0]}"
####### DELETE_THIS >>>    local -- input_script_path=""
####### DELETE_THIS >>>    if [ ${argc} -eq 1 ]; then
####### DELETE_THIS >>>        script_path="${argv[0]}"
####### DELETE_THIS >>>    elif [ ${argc} -gt 1 ]; then
####### DELETE_THIS >>>        if [ -s "${argv[@]}" ]; then
####### DELETE_THIS >>>            input_script_path="${argv[@]}"
####### DELETE_THIS >>>        else
####### DELETE_THIS >>>            for arg in ${argv[@]}; do
####### DELETE_THIS >>>                if [ -z "${input_script_path}" ] && [ -s "${arg}" ]; then
####### DELETE_THIS >>>                    input_script_path="${arg}"
####### DELETE_THIS >>>                elif [ -z "${input_script_path}" ] && [ -e "${arg}" ]; then
####### DELETE_THIS >>>                    1>&2 echo -e "[warning]" "ignoring empty script path ${arg@Q}"
####### DELETE_THIS >>>                elif [ -n "${input_script_path}" ]; then
####### DELETE_THIS >>>                    1>&2 echo -e "[warning]" "ignoring arg ${arg@Q} because input_script_path already set to ${input_script_path@Q}"
####### DELETE_THIS >>>                else
####### DELETE_THIS >>>                    1>&2 echo -e "[warning]" "ignoring arg ${arg@Q} because is not an existing path"
####### DELETE_THIS >>>                fi
####### DELETE_THIS >>>            done
####### DELETE_THIS >>>            script_path=$(python3 -c "${shell_d_python_script}" "${input_script_path}")
####### DELETE_THIS >>>        fi
####### DELETE_THIS >>>    fi
####### DELETE_THIS >>>
####### DELETE_THIS >>>    local -- script_filename="$(basename "${script_path}")"
####### DELETE_THIS >>>    local -- script_folder="$(dirname "${script_path}")"
####### DELETE_THIS >>>    local -- script_ui_path="${script_folder}/.${script_filename/%.sh/.ui}"
####### DELETE_THIS >>>    local -- script_lib_path="${script_folder}/.${script_filename/%.sh/.lib}"
####### DELETE_THIS >>>    local -a loaded=()
####### DELETE_THIS >>>    if [ -r "${script_path}" ]; then
####### DELETE_THIS >>>        shell_d_sh_load_source "${script_path}"
####### DELETE_THIS >>>        loaded+=("${script_path}")
####### DELETE_THIS >>>    fi
####### DELETE_THIS >>>    if [ -r "${script_ui_path}" ]; then
####### DELETE_THIS >>>        shell_d_sh_load_source "${script_ui_path}"
####### DELETE_THIS >>>        loaded+=("${script_ui_path}")
####### DELETE_THIS >>>    fi
####### DELETE_THIS >>>    if [ -r "${script_lib_path}" ]; then
####### DELETE_THIS >>>        shell_d_sh_load_source "${script_lib_path}"
####### DELETE_THIS >>>        loaded+=("${script_ui_path}")
####### DELETE_THIS >>>    fi
####### DELETE_THIS >>>    # if [ ${#loaded[@]} -gt 0 ]; then
####### DELETE_THIS >>>    #     printf '%s\n' "${loaded[@]}"
####### DELETE_THIS >>>    # fi
####### DELETE_THIS >>>    export PS4=''
####### DELETE_THIS >>>}
####### DELETE_THIS >>>
# initialize_shell_d_core_global_vars() {
#     if [[ ! -v shell_d_entrypoint_source_path_relative ]]; then
#         1>&2 echo -e "[shell.d entrypoint error]" "core global variable undefined: shell_d_entrypoint_source_path_relative "
#         return 1
#     fi
#     declare -gr shell_d_entrypoint_source_directory_path="$(cd "$(dirname "${shelL_d_entrypoint_source_path_relative}")" && pwd)"
#     declare -gr shell_d_entrypoint_source_filename="$(basename "${shell_d_entrypoint_source_path_relative}")"
#     declare -gr actual_shell_d_path="${shelL_d_entrypoint_source_directory_path}"
#     declare -gr actual_x_d_path="${actual_shell_d_path}/x.d"

#     if [ "${actual_shell_d_path}" != "${default_shell_d_path}" ]; then
#         1>&2 echo -e "[shell.d entrypoint error]" "actual_shell_d_path different than default_shell_d_path: ${actual_shell_d_path@Q} != ${default_shell_d_path@Q}"
#         return 1
#     fi
#     if [ "${actual_x_d_path}" != "${default_x_d_path}" ]; then
#         1>&2 echo -e "[shell.d entrypoint error]" "actual_x_d_path different than default_x_d_path: ${actual_x_d_path@Q} != ${default_x_d_path@Q}"
#         return 1
#     fi
#     if ! "$(cd "${entrypoint_dirname}" && pwd)"; then
#         SHELL_D_PATH="${HOME}/.shell.d"
#     fi

#     local -- X_D_PATH="${SHELL_D_PATH}/x.d"

# }
declare -g default_shell_d_path="${HOME}/.shell.d"
declare -g default_x_d_path="${default_shell_d_path}/x.d"

entrypoint() {
    # shell_d_sh_load_libs "${BASH_SOURCE[0]}"

    local -- entrypoint_script_path="$(shell_d_fs_get_canonical_path ${BASH_SOURCE[0]})"
    local -- entrypoint_dirname="$(dirname "${entrypoint_script_path}")"
    if [ "${entrypoint_dirname}" != "${default_shell_d_path}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} warning]" "entrypoint.sh should be at ${default_shell_d_path} not ${entrypoint_dirname}"
    fi
    local -- SHELL_D_PATH="${entrypoint_dirname}"
    local -- X_D_PATH="${SHELL_D_PATH}/x.d"
    # shell_d_sh_load_source "${X_D_PATH}/boot.sh"

    if [ -x "${HOME}/.cargo/bin/ps1" ]; then
        eval "$(${HOME}/.cargo/bin/ps1 --env)"
        export PROMPT_COMMAND='shell_d_sh_prompt_command'
    else
        export PS1='\u@\h:\w\$ '
    fi
    # declare -p "PROMPT_COMMAND"

    declare -gr shell_d_bash_pid=${$}
    declare -gr shell_d_bash_histcmd=${HISTCMD}
    #    declare -gA shell_d_sh_ps1_prefix_parts=(
    #	"[#\${HISTCMD}]"
    #
    #	"[\\\$?=\$?]"
    #
    #	"[\\\$!=\$!]"
    #
    #	"[up \$(( SECONDS ))s]"
    #
    #	$(if [[ "${SHLVL}" -gt 1 ]]; then echo -n "[level \${SHLVL}]"; fi)
    #
    #	"[\\\$\\\$=\$\$]"
    #    )

    export PS1="\[\r\][#\${HISTCMD}][\\\$?=\$?][\\\$!=\$!][up \$(( SECONDS ))s][level \${SHLVL}] [\\\$\\\$=\$\$] ${PS1}"
    # # See `man bash'
    # export EXECIGNORE=""
    # export BASH_XTRACEFD
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
    xD 0000110-env.sh #  \ xD 0001000-build-essential.sh
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
    shell_d_sh_load_source "${X_D_PATH}/string.sh"
    shell_d_sh_load_source "${X_D_PATH}/pandoc.sh"
    shell_d_sh_load_source "${X_D_PATH}/git.sh"
    shell_d_sh_load_source "${X_D_PATH}/emacs.sh"

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
    local -i dry_run=1
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- shell_script_path=""
    local -- shell_d_sh_load_source_verbose=${shell_d_entrypoint_verbose:-0}
    local -- shell_d_sh_load_source_dry_run=${shell_d_entrypoint_dry_run:-0}

    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>"
        return 1
    fi
    shell_script_path=""

    for index in ${!argv[@]}; do
        current=$(($index + 1))
        arg="${argv[$index]}"
        case "${arg@L}" in
            -d | --dry-run | --dryrun)
                shell_d_sh_load_source_dry_run=${current}
                ;;
            -v | --verbose | verbose | --no-quiet | --not-quiet)
                shell_d_sh_load_source_verbose=${current}
                ;;
            -q | --quiet | verbose | --no-verbose | --not-verbose)
                shell_d_sh_load_source_verbose=0
                ;;
            *)
                if [ -z "${shell_script_path}" ] && [ -f "${arg}" ] && [ -s "${arg}" ] && [ -r "${arg}" ]; then
                    shell_script_path="${arg}"
                    continue
                fi
                ;;
        esac
    done

    if [ ${#} -eq 0 ]; then
        return 1
    # elif [ ${#} -gt 1 ]; then
    #     1>&2 echo -e "[${FUNCNAME[0]} error]" "too many arguments"
    #     return 1
    fi

    shell_d_sh_validate_non_empty_regular_file_argument "shell_script_path" "${shell_script_path}"
    shell_script_path=$(shell_d_fs_get_canonical_path "${shell_script_path}")

    if ! shell_d_sh_shfmt_check "${shell_script_path}"; then
        return $?
    fi
    if [ -s "${shell_script_path}" ]; then
        local -- shell_script_path_display="${shell_script_path}"
        if [[ "${shell_script_path_display}" =~ ^${HOME}/ ]]; then
            shell_script_path_display="~/${shell_script_path#${HOME}/}"
        fi
        local -- prefix="loading"
        if ((${shell_d_entrypoint_dry_run})); then
            prefix="would load"
        fi
        if ((shell_d_entrypoint_verbose)) || ((shell_d_entrypoint_dry_run)); then
            1>&2 echo -e "\x1b[1;38;5;202m${prefix} \x1b[1;38;5;231m${shell_script_path_display}\x1b[0m"
        elif ! ((shell_d_entrypoint_dry_run)); then
            #            # 1>&2 echo -e "[shell_d_sh_load_source debug]" "${BASH_LINENO[1]}"
            #            local -- tmpwatline=''
            #
            #            while [[ ! "${tmpwatline@L}" =~ ^[[:space:]]*(y(es)?|n(o)?)[[:space:]]*$ ]]; do
            #                read -p "ready to load file ${shell_script_path@Q}? [yes/no]"
            #            done
            #            tmpwatline="${tmpwatline@L}"
            #            case "${tmpwatline:0:1}" in
            #                "y")
            #                    1>&2 echo -e "[shell_d_sh_load_source debug]" "loading ${shell_script_path}"
            #                    ;;
            #                "n")
            #                    1>&2 echo -e "[shell_d_sh_load_source debug]" "skipping ${shell_script_path}"
            #                    return 41
            #                    ;;
            #            esac
            #
            eval "$(cat "${shell_script_path}")"
        fi
        # shell_d_dump_vars_to_file_and_stderr FUNCNAME LINENO BASH_SOURCE BASH_LINENO BASH_SUBSHELL

        shell_d_load_source_stack+=("${shell_script_path}")
    else
        1>&2 echo -e "\x1b[1;38;5;196mcannot load empty file \x1b[1;38;5;231m${shell_script_path}\x1b[0m"
        return 1
    fi
}

#shell_d_startup_time_delta() {
#    local -i delta=0
#
#    local -i finished_at=${shell_d_finished_at}
#    local -i started_at=${shell_d_started_at}
#    local -p
#}

shell_d_dump_vars_to_file_and_stderr() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- name=""
    local -- var_value=""
    local -- var_type=""
    local -- ty_char=""
    local -- value=""
    local -- declaration=""
    local -a varnames_to_dump=()
    local -A varname_type_char_map=()
    local -A var_declaration_map=()
    local -A var_value_map=()
    local -i widest_varname=0
    local -i widest_value=0
    local -a dump_filename_parts=()

    logfile_parts+=("bash.pid.${$}")
    if [[ -v WEZTERM_PANE ]] && [[ "${WEZTERM_PANE}" =~ ^[0-9]+$ ]]; then
        logfile_parts+=("wezterm.pane_id.${WEZTERM_PANE}")
    fi
    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments"
        return 1
    fi

    for index in ${!argv[@]}; do
        current=$(($index + 1))
        arg="${argv[$index]}"
        if [[ -v refvar ]]; then
            unset -n refvar
        fi
        if [[ -v "${arg}" ]]; then
            if [[ -v shell_d_dumped_varname_map["${arg}"] ]]; then
                continue
            fi

            local -I -n refvar="${arg}"
            shell_d_dumped_varname_map["${arg}"]="${refvar}"
            if [[ ! -v varname_type_char_map["${arg}"] ]]; then
                varname_type_char_map["${arg}"]="${refvar@a}"
                var_declaration_map["${arg}"]="${refvar[@]@A}"
                var_value="${refvar[@]}"
                var_value_map["${arg}"]="${var_value}"
                varnames_to_dump+=("${arg}")
                if [ ${widest_value} -lt ${#var_value} ]; then
                    widest_value=${#var_value}
                fi
                if [ ${widest_varname} -lt ${#arg} ]; then
                    widest_varname=${#arg}
                fi
            fi
            unset -n refvar
        else
            1>&2 echo -e "[${FUNCNAME[0]} warning]" "var does not exist: ${arg@Q}"
            continue
        fi
    done

    export IFS=$'\n'

    local -- declaration_flags=""
    local -- declaration_name=""
    local -- declaration_value=""
    local -a declaration_values=()
    for index in ${!varnames_to_dump[@]}; do
        name="${varnames_to_dump[${index}]}"
        var_value="${var_value_map[${name}]}"
        declaration="${var_declaration_map[${name}]}"
        declaration_flags="$(awk '{ print $2 }' <<<"${declaration}")"
        declaration_name="$(awk '{ print(gensub(/=.*$/, "", "g", $3)) }' <<<"${declaration}")"
        ty_char="${varname_type_char_map[${name}]}"
        declaration_value="$(awk '{ print(gensub(/^[^=]=/, "", "g", $NF)) }' <<<"${declaration}")"

        if [[ -v refvar ]]; then
            unset -n refvar
        fi

        if [[ "${ty_char}" =~ [Aa] ]]; then
            local -I -n refvar="${name}"
            declaration_values=($(echo "${refvar[*]}"))
        else
            declaration_values=("${declaration_value}")
        fi
        local -- sed_regexp='^\s*((declare|local)\s+([-]([-]|[a-zA-Z]+))?\s*)?([a-zA-Z_]+[a-zA-Z0-9_]*)=(.*)'
        local -- sed_replacement='\x1b[1;38;5;242m\5\x1b[1;48;5;222m\x1b[1;38;5;233m \4 \x1b[0m=\x1b[1;38;5;231m\6\x1b[0m'
        local -- sed_command="s/${sed_regexp}/${sed_replacement}/gp"

        # 1>&2 echo -e ""
        # 1>&2 echo -e "${name[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${var_value[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${declaration[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${declaration_name[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${declaration_flags[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${declaration_values[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${declaration_value[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -e "${ty_char[@]@A}" | sed -n -E "${sed_command}"
        # 1>&2 echo -en "\x1b[0m"
        # 1>&2 echo -e ""
        # TODO: use bash variable parser

    done
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
            # 1>&2 echo -e "[xD debug]" "loading ${SHELL_D_PATH}/${sh}"
            shell_d_sh_load_source "${SHELL_D_PATH}/${sh}"
            # shell_d_sh_load_libs "${SHELL_D_PATH}/${sh}"
        elif [ -e "${X_D_PATH}/${sh}" ] && [ -r "${X_D_PATH}/${sh}" ] && [ -s "${X_D_PATH}/${sh}" ]; then
            # 1>&2 echo -e "[xD debug]" "loading ${X_D_PATH}/${sh}"
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
    entrypoint
    postentry
else
    1>&2 echo -e "\"${0}\" != \"${gnu_bash_libexec}\""
fi
unset entrypoint postentry

# for fn in $(grep -i -E '^[a-z_]+[(][^)]*[)]([[:space:]]*|\n)[{]' "${BASH_SOURCE[0]}" | sed -E 's/^[[:space:]]*([[:space:]]*function[[:space:]]*)\?([a-zA-Z_-][a-zA-Z0-9_-]+).*[(][^)]*[)]([[:space:]]*|\n)*[{]/\2/g'); do
#     2>/dev/random 1>/dev/random unset "${function_name}"
# done

umask 007

declare -gr shell_d_histcmd_at_startup_finished="${HISTCMD}"

declare -gir shell_d_finished_at=$(date --utc +%s)
# <TODO: write report of new shell session at end of entrypoint.sh>
# path: workbench/$(today)/.shell-sessions/session.pid.$$.tty.${tty_name}.$(nowdz).json
#
# containing:
# - started_at
# - finished_at
# - tty_name, tty_path
# - bash pid + `lsof -p` output of bash pid
# - bash ppid + `lsof -p` output of bash ppid
# - bash metadata:
#   - BASH_ARGV
#   - BASH_ARGC
#   - BASH_SUBSHELL
#   - et cetera
# - bash variables (declare -p)
# - bash function names (declare -p -F)
# - bash functions (declare -p -f)
# - bash history length
# <SUB-TODO>
#    report end-of-session via ~/.bash_logout
# </SUB-TODO>
# </TODO: write report of new shell session at end of entrypoint.sh>

# unset IFS
# exec 2>/dev/stderr
# Disable tracing and clean up
# unset BASH_XTRACEFD
# set +x
# exec 5>&- # Close the file descriptor
# declare -- my_tty_name=$(basename $(tty))
# echo "${$}" > "${HOME}/.shell.d/entrypoint.${my_tty_name}.${WEZTERM_PANE}.finished"
