# . ${HOME}/.bashrc.env.static

# exec 5>${HOME}/.shell.d/trace.pid_$$.ppid_${PPID}.log
# export BASH_XTRACEFD=5
# set -x

export TZ=UTC
declare -gir shell_d_started_at=$(date --utc +%s)
declare -gi shell_d_pid=${$}
# declare -g shell_d_default_tmp_stderr=$(mktemp)
declare -g default_shell_d_path="${HOME}/.shell.d"
declare -g default_x_d_path="${default_shell_d_path}/x.d"

declare -gr shell_d_internal_log_dir="${default_shell_d_path}/logs/$(date -u +'%Y-%m-%d')"
mkdir -p "${shell_d_internal_log_dir}"
declare -gA shell_d_internal_benchmark_load_source_started_at_map=()
declare -gA shell_d_internal_benchmark_load_source_finished_at_map=()
declare -gA shell_d_internal_benchmark_xd_started_at_map=()
declare -gA shell_d_internal_benchmark_xd_finished_at_map=()

# (replace-regexp
#    regexp: "\\(trap\\(\\s-+\\)\\|^\\(function\\s-+\\)\\)\\s-*\\(\\([_]+shell_d_sh_\\)\\(ps4\\|trap\\)\\([_]\\)\\(function\\)[_]?\\([a-z0-9]+[a-zA-Z0-9_]*\\|[a-z0-9_]+?\\)\\([_]+\\)\\)\\s-*\\([]\\)"
#    to-string: \,(regex!)
# )
# (replace-regexp
#     regexp: "^\\(\\s-*[#]\\s-*\\)?\\(\\s-*\\)\\(trap\\)\\s-+\\([a-zA-Z0-9_]+[^[:space:]\n]*\\)\\s-*\\([[:space:]\\n]+\\)\\([a-zA-Z0-9_]+\\)\\(\\s-*\\)$"
#    to-string: \,(regex!)
# )

#;; \(\([_]+shell_d_sh_\)\(ps4\|trap\)\([_]\)\(function\)[_]?\([a-z0-9]+[a-zA-Z0-9_]*\|[a-z0-9_]+?\)\([_]+\)\)
declare -gr shell_d_internal_default_artifact_suffix="pid_${$}.ppid_${PPID}.$(builtin printf '%010x' ${shell_d_started_at})"

if [[ -v WEZTERM_PANE ]]; then
    declare -gr shell_d_internal_log_path="${shell_d_internal_log_dir}/wezterm_pane.${WEZTERM_PANE}.${shell_d_internal_default_artifact_suffix}.log"
else
    declare -gr shell_d_internal_log_path="${shell_d_internal_log_dir}/${shell_d_internal_default_artifact_suffix}.log"
fi
declare -gar shell_d_sh_env_vars_to_observe=(
    'XPC_FLAGS'
    'XPC_SERVICE_NAME'
    '__CFBundleIdentifier'
    '__CF_USER_TEXT_ENCODING'
)

shell_d_sh_log_error() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -- line=''

    local -- line=$(echo -en "${argv[@]}") # | tee -a 1>${shell_d_internal_log_path} strip-ansi-escapes
    local -- noansi=$(strip-ansi-escapes <<<"${line}")
    (
        echo
        echo "${noansi}"
        echo
    ) | tee -a 1>${shell_d_internal_log_path}

}

if [ "${BASH_VERSINFO[0]}" -lt 5 ]; then
    shell_d_sh_log_error "[shell.d warning]" "${BASH_SOURCE[0]} requires bash version 5.2 or greater"
fi
# declare -g my_tty_name=$(basename $(tty))
# echo "${$}" > "${HOME}/.shell.d/entrypoint.${my_tty_name}.${WEZTERM_PANE}.started"

export IFS=$'\n'

declare -gA shell_d_sh_env_var_defaults=()
shell_d_sh_env_var_defaults["INFOPATH"]="/opt/homebrew/share/info:/opt/homebrew/share/info:"
shell_d_sh_env_var_defaults["MANPATH"]="/opt/homebrew/share/man:/opt/homebrew/share/man::"
shell_d_sh_env_var_defaults["PATH"]="/opt/homebrew/bin:${HOME}/opt/libexec:${HOME}/.cargo/bin:${HOME}/.elixir-install/installs/elixir/1.18.2-otp-27/bin:${HOME}/.elixir-install/installs/otp/27.1.2/bin:${HOME}/.local/bin:${HOME}/.shell.d/.venv/bin:${HOME}/.nvm/versions/node/v22.18.0/bin:/opt/homebrew/Cellar/gnu-sed/4.9/libexec/gnubin:/opt/homebrew/Cellar/gnu-sed/4.9/bin:/opt/homebrew/Cellar/findutils/4.10.0/libexec/gnubin:/opt/homebrew/Cellar/findutils/4.10.0/bin:/opt/homebrew/Cellar/git/2.47.0/libexec/git-core:/opt/homebrew/sbin:${HOME}/.bun/bin:${HOME}/.deno/bin:${HOME}/go/install/1.25.0/go/bin:/opt/homebrew/Cellar/gawk/5.3.0/libexec/gnubin:/opt/homebrew/Cellar/gawk/5.3.0/bin:/opt/homebrew/Cellar/bzip2/1.0.8/bin:/opt/homebrew/Cellar/coreutils/9.5/libexec/gnubin:/opt/homebrew/Cellar/coreutils/9.5/bin:/opt/homebrew/Cellar/curl/8.10.1/bin:/opt/homebrew/Cellar/gnu-tar/1.34_1/libexec/gnubin:/opt/homebrew/Cellar/gnu-tar/1.34_1/bin:/opt/homebrew/Cellar/gnu-time/1.9/libexec/gnubin:/opt/homebrew/Cellar/gnu-time/1.9/bin:/opt/homebrew/Cellar/make/4.4.1/libexec/gnubin:/opt/homebrew/Cellar/make/4.4.1/bin:/opt/homebrew/Cellar/openssl@3/3.6.0/bin:${HOME}/go/bin:${HOME}/.zig:${HOME}/.shell.d/scripts:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/Applications/Emacs.app/Contents/MacOS:./tools:./scripts:./node_modules/.bin:/opt/homebrew/bin:/opt/homebrew/sbin"
shell_d_sh_env_var_defaults["CDPATH"]="${HOME}/projects/work/poems.codes/tools/noon-cli/packages:${HOME}/projects/work/poems.codes/tools:${HOME}/projects/work/poems.codes:${HOME}/projects/work/poems.codes/paas:${HOME}/projects/work/poems.codes/pro-bono:${HOME}/projects/work/poems.codes/sandbox:${HOME}/projects/work/poems.codes/poc:${HOME}/projects/personal:${HOME}/projects/personal/chrome-extensions:${HOME}/projects/work:${HOME}/projects/third_party:${HOME}/projects:${HOME}/projects/опенсорси:${HOME}/.shell.d/CDPATH:${HOME}"
shell_d_sh_env_var_defaults["EMACS_SOCKET_NAME"]="${HOME}/.emacs.d/socket/server"
declare -gAr shell_d_sh_env_var_defaults

declare -gA shell_d_sh_history_env_var_defaults=()
shell_d_sh_history_env_var_defaults["HISTCONTROL"]="ignorespace"
shell_d_sh_history_env_var_defaults["HISTFILE"]="${HOME}/.bash_history"
shell_d_sh_history_env_var_defaults["HISTFILESIZE"]="211776"
shell_d_sh_history_env_var_defaults["HISTIGNORE"]="[bf]g:exit:clear:cls:history*:hist-*:hist_*:[ \\t]*:git[ \\t]*st*"
shell_d_sh_history_env_var_defaults["HISTSIZE"]="211776"
shell_d_sh_history_env_var_defaults["HISTTIMEFORMAT"]="@%s:%Z     "
declare -gAr shell_d_sh_history_env_var_defaults

shell_d_sh_initialize_hist_env_vars() {
    local -- env_var=''
    local -- env_value=''
    for env_var in ${!shell_d_sh_history_env_var_defaults[@]}; do
        env_value="${shell_d_sh_history_env_var_defaults[${env_var}]}"
        export "${env_var@U}"="${env_value}"
    done
}
shell_d_sh_initialize_env_vars() {
    shell_d_sh_initialize_hist_env_vars

    local -- env_var=''
    local -- env_value=''
    local -a paths=()
    local -A paths_map_before=()
    local -A paths_map_after=()
    # (export IFS=$':'; echo "${shell_d_load_source_queue[*]}")
    # (export IFS=$'^'; echo "${shell_d_load_source_queue[*]}")

    for env_var in ${!shell_d_sh_env_var_defaults[@]}; do
        paths=()
        env_value="${shell_d_sh_env_var_defaults[${env_var}]}"
        if [[ "${env_var}" =~ PATH$ ]]; then
            if [[ ! -v paths_map_before["${env_var}"] ]]; then
                paths_map_before["${env_var}"]=$(
                    export IFS=$':'
                    echo ${PATH}
                )
                paths=($(
                    export IFS=$':'
                    printf '%s\n' ${env_value} | unique-lines
                ))
                paths_map_after["${env_var}"]=$(
                    export IFS=$':'
                    echo "${paths[*]}"
                )
            fi
        fi
        export "${env_var@U}"="${env_value}"
    done
}
shell_d_internal_security_checks() {
    local -i cargo_bin_created=-1
    local -i cargo_bin_modified=-1
    local -- cargo_bin_item=""
    local -- name=""

    for cargo_bin_item in ${shell_d_rust_bin_path}/*; do
        cargo_bin_created=$(gstat -c '%W' "${cargo_bin_item}")
        cargo_bin_modified=$(gstat -c '%W' "${cargo_bin_item}")
        name=$(basename "${cargo_bin_item}")

        if [ -x "${cargo_bin_item}" ]; then
            if [ -x "/bin/${name}" ]; then
                shadow="/bin/${name}"
                shell_d_internal_fn_log 'CRITICAL' "removing executable permissions from ${cargo_bin_item@Q} because it shadows the path ${shadow@Q}"
                chmod a-x "${cargo_bin_item}"
                shell_d_internal_fn_log 'CRITICAL' "you should probably investigate what third-party rust crate installed (.i.e. \"created\") ${cargo_bin_item@Q} on $(date --date=@${cargo_bin_created} +'%Y/%m-%d %H:%M:%S %Z')"
                hash -r "${name}"
            fi
        fi
    done

    # for varname in ${shell_d_sh_env_vars_to_observe[@]}; do
    #     if [[ -v refvar ]]; then
    #         unset -n refvar
    #     fi
    #     if [[ -v "${varname}" ]]; then
    #         local -I -n refvar="${varname}"
    #         shell_d_internal_fn_log "INFO" "env var ${varname} is set to ${refvar[@]@Q}"
    #         unset -n refvar
    #     fi
    # done

}
shell_d_sh_history_entries_suffixed_with_entry_id_and_timestamp() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -i max_entries=-1
    local -- pos=''
    local -i numval=-1
    local -A ignored_args_by_argv_index=()
    local -a lines=()
    local -A entries_by_id=()
    local -A timestamps_by_id=()
    local -i total_lines=${#lines[@]}
    local -i total_entries_by_id=${#entries_by_id[@]}
    local -i total_timestamps_by_id=${#timestamps_by_id[@]}

    for index in ${!argv[@]}; do
        numval=-1
        current=$(($index + 1))
        arg="${argv[$index]}"
        pos=$(printf '%*s of %s' "${#argc}" "${current}" "${argx}")

        if [[ "${arg}" =~ ^[0-9]+$ ]]; then
            numval="${arg}"
            if [ "${max_entries}" -lt 0 ]; then
                if [[ "${arg}" =~ ^([0][0-9]+)$ ]]; then
                    1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring leading zeroes from argument value ${pos}, so ${arg@Q} becomes ${numval}"
                fi

                max_entries="${numval}"
            elif [ "${numval}" -gt "${max_entries}" ]; then
                if [[ "${arg}" =~ ^([0][0-9]+)$ ]]; then
                    1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring leading zeroes from argument value ${pos}, so ${arg@Q} becomes ${numval}"
                fi

                1>&2 echo -e "[${FUNCNAME[0]} warning]" "overwriting current value of \${max_entries} from ${max_entries} to ${numval}"
                max_entries="${numval}"
            elif [ "${numval}" -lt "${max_entries}" ]; then
                ignored_args_by_argv_index["${index}"]="${arg}"
                1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring value of argument ${pos} ${numval@Q} because is lesser than \${max_entries} ${max_entries@Q}"
                continue
            else
                ignored_args_by_argv_index["${index}"]="${arg}"
                1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring value of argument ${pos} ${numval@Q}"
                continue
            fi
        else
            ignored_args_by_argv_index["${index}"]="${arg}"

            1>&2 echo -e "[${FUNCNAME[0]} warning]" "ignoring argument ${pos}: ${arg@Q}"
            continue
        fi
    done

    export IFS=$'\n'
    lines=($())

    total_lines=${#lines[@]}
    total_entries_by_id=${#entries_by_id[@]}
    total_timestamps_by_id=${#timestamps_by_id[@]}
}

# Enable function tracing
set -o functrace

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
declare -g fn=''
declare -i now=$(date --utc +%s)
for fn in $(declare -p -F); do
    shell_d_declared_functions_colon_sep_by_timestamp[${fn}]=${now}
done

#<TODO read/map shopts from `man bash'>
shopt -s checkwinsize cmdhist extglob
shopt -u dotglob failglob globstar nocaseglob nullglob extdebug extquote
#(dotglob|failglob|globstar|nocaseglob|nullglob|extglob|extquote)
#</TODO read/map shopts from `man bash'>  pandoc -f man -i $(man -w bash) -t markdown
declare -g env_name=''
declare -g env_value=''
declare -g env_var=''
declare -g env_var_name=''
declare -g env_var_value=''
declare -g key=''
declare -g value=''
declare -g var_name=''
declare -g var_value=''

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

__shell_d_sh_trap_function_return__() {
    # set +x
    # trap - RETURN
    local -- key=''
    local -i index=0
    local -- value=''
    if [[ ! -v FUNCNAME[1] ]]; then
        return
    fi

    if [[ "${FUNCNAME[1]}" =~ ^((shell)_d_(sh_)?([a-z_]+)) ]]; then
        1>&2 echo -e "\x1b[0m\x1b[1;38;2;114;159;207m$(declare -p BASH_REMATCH)"
    elif [[ "${FUNCNAME[1]}" =~ ^entrypoint ]]; then
        1>&2 echo -e "\x1b[0m\x1b[1;38;2;245;121;0m$(declare -p BASH_REMATCH)"
        return
    else
        return
    fi

    for key in ${!FUNCNAME[@]}; do
        value=${FUNCNAME[${key}]}
        # if [[ "${value}" =~ __shell_d.* ]]; then
        #     continue
        # fi
        1>&2 echo "$(printf '%*s' $((key * 4)) '')\${FUNCNAME[${key}]} => ${FUNCNAME[${key}]}"
    done
    1>&2 echo -e "\x1b[0m"
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
    # unset PS2
    # unset PS3
    # unset PS4

    export IFS=$'\n'
    local -i i
    # local -- padding_left=''
    # local -- indent='    '

    local -- stack_size=${#FUNCNAME[@]}
    if [ ${stack_size} -eq 1 ]; then
        return
    fi
    local -a backtrace_lines=()
    backtrace_lines+=($(echo -e "\nBash backtrace:"))
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
        backtrace_lines+=($(printf "  at %s (%s:%s)\n" "$func" "$src" "$line"))
    done
    1>&2 echo "${backtrace_lines[*]}"
}

__shell_d_sh_trap_function_exit__() {
    2>/dev/random 1>/dev/random stty sane
}
__shell_d_sh_trap_function_ctrlc__() {
    shell_d_sh_log_error "\x1b[0m\rAborted with Ctrl-C\x1b[0m"
    exit 1
}
trap __shell_d_sh_trap_function_exit__ EXIT
trap __shell_d_sh_trap_function_ctrlc__ HUP

# trap __shell_d_sh_trap_function_return__ RETURN
# trap __shell_d_sh_trap_function_debug__ DEBUG

# <ensure ERR trap is inherited by functions>
set -o errtrace
set -o functrace
set -o pipefail
trap __shell_d_sh_trap_function_backtrace__ ERR
# </ensure ERR trap is inherited by functions>

if [[ ! -v workbench_path ]]; then
    declare -- _workbench_path="${HOME}/workbench/2026-02-12"
    if [ -e "${_workbench_path}" ] && [ ! -d "${_workbench_path}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "workbench path ${_workbench_path@Q} exists but is not a directory: $(gstat -c '%F' "${_workbench_path}")"
    else
        mkdir -p "${_workbench_path}"
        declare -g workbench_path=${_workbench_path}
        unset _workbench_path
    fi
fi

if [[ -v workbench_path ]] && [ -n "${workbench_path}" ] && [ -d "${workbench_path}" ]; then
    declare -g shell_d_fs_stdout=${workbench_path}/shell_d_stdout.$$.log
    declare -g shell_d_fs_stderr=${workbench_path}/shell_d_stderr.$$.log
fi

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
    #set +x
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""

    if [ ${argc} -eq 0 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>"
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

shell_d_sh_show_error() {
    local -- prefix="$1"
    shift
    local -- msg="$@"

    local -- rgb_color_error="$((0xFF));$((0x32));$((0x4B))m"
    local -- rgb_color_dark_grey="$((0xF1));$((0xF1)); $((0xF1))m"
    shell_d_sh_log_error "\x1b[1;48;2;${rgb_color_error}\x1b[1;38;2;${rgb_color_dark_grey}[${prefix}]\x1b[0m" "\x1b[1;38;2;${rgb_color_error}${msg}\x1b[0m"
}
shell_d_sh_show_warning() {
    local -- prefix="$1"
    shift
    local -- msg="$@"

    local -- rgb_color_warning="$((0xFF));$((0x83)); $((0x32))m"
    local -- rgb_color_dark_grey="$((0xF1));$((0xF1)); $((0xF1))m"
    shell_d_sh_log_error "\x1b[1;48;2;${rgb_color_warning}\x1b[1;38;2;${rgb_color_dark_grey}[${prefix}]\x1b[0m" "\x1b[1;38;2;${rgb_color_warning}${msg}\x1b[0m"
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
shell_d_sh_wezterm_cli() {
    local -a argv=($@)
    local -i argc=${#argv[@]}

    if [[ -v WEZTERM_PANE ]] && [[ -v WEZTERM_UNIX_SOCKET ]]; then
        if [ -S "${WEZTERM_UNIX_SOCKET}" ] && [[ "${WEZTERM_PANE}" =~ ^[0-9]+$ ]]; then
            if [ ${argc} -eq 0 ]; then
                1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments for wezterm cli"
            fi
            wezterm cli ${argv[@]}
        fi
    fi
}
shell_d_sh_prompt_command() {
    local -r pwd_canon_folded="$(path canon -uf .)"

    local -- parent=$(path parent .)
    local -- name=$(path name .)

    local -- title_path=''

    local -- beg="${parent}"
    local -- end="${name}"

    title_path="${pwd_canon_folded}"
    if [ ${#title_path} -gt 12 ]; then
        if [ ${#beg} -gt 4 ]; then
            beg="${beg:0:4}"
        fi
        if [ ${#end} -gt 5 ]; then
            end="${end:0:5}"
        fi
        title_path="${beg}...${end}"
    fi
    shell_d_sh_wezterm_cli set-tab-title "${title_path}"
}

shell_d_sh_prompt_command_set_wezterm_title_last_history_entry_command() {
    shell_d_sh_wezterm_cli set-tab-title "${tab_title}"
}

shell_d_sh_history_disable_ignores() {
    unset HISTIGNORE
}
shell_d_sh_history_enable_ignores() {
    export HISTCONTROL="ignorespace"
    export HISTFILE="${HOME}/.bash_history"
    export HISTFILESIZE="211776"
    export HISTIGNORE="[bf]g:exit:clear:cls:history*:hist-*:hist_*:[ \\t]*:git[ \\t]*st*"
    export HISTSIZE="211776"
    export HISTTIMEFORMAT="@%s:%Z     "

}

set -umTE
set +f
set -o pipefail
unset IFS

declare -g shell_d_entrypoint_source_path_relative="${BASH_SOURCE[0]}"

declare -g gnu_bash_libexec="/opt/homebrew/bin/bash"
declare -gA function_definitions=()

set -o pipefail
export PATH="${HOME}/opt/libexec:${PATH}"
export IFS=$'\n'

# shell_d_sh_load_source   ~/.shell.d/x.d/history.sh
# shell_d_sh_load_source   ~/.shell.d/x.d/varfunctions.sh

################################################################################
#                ____  _______     _____ ____  _____ ____                      #
#                |  _ \| ____\ \   / /_ _/ ___|| ____|  _ \                    #
#                | |_) |  _|  \ \ / / | |\___ \|  _| | | | |                   #
#                |  _ <| |___  \ V /  | | ___) | |___| |_| |                   #
#                |_| \_\_____|  \_/  |___|____/|_____|____/                    #
#                                                                              #
# ack 'declare\s+[-][Inlaixr-]*[r][Inlaixr-]*\s+([^=]+)=([^#]+)$' ~/.shell.d/  #
################################################################################

declare -ga shell_d_load_source_queue=()
declare -ga shell_d_load_source_stack=()
declare -gA shell_d_load_source_stack_map=()
declare -gA shell_d_load_source_queue_map=()

if [[ ! -v shell_d_tty_path ]]; then
    declare -g shell_d_tty_path=""
    shell_d_tty_path="$(shell_d_fs_get_tty_path)"
    if [ -n "${shell_d_tty_path}" ]; then
        declare -r shell_d_tty_path="${shell_d_tty_path}"
    fi
fi

if [[ ! -v shell_d_kernel_name ]]; then
    declare -g shell_d_kernel_name=""
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
            shell_d_sh_log_error "\x1b[1;38;5;220m~/shell.d running in neither linux nor macos: ${shell_d_kernel_name}\x1b[0m"
            ;;
    esac
fi

if [ -s "${HOME}/.rustup/settings.toml" ]; then
    declare -g shell_d_rust_toolchain=$(${shell_d_root_path}/rust/get-default-toolchain.sh) # WIP
fi

shell_d_internal_fn_log() {
    # shell_d_internal_fn_log 'CRITICAL' "removing executable permissions from ${cargo_bin_item@Q} because it shadows the path ${shadow@Q}"
    local -- message=""
    local -- level="INFO"
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- pos=""
    local -- pot_level=""

    local -i now=$(date -u +'%s')
    local -- log_timestamp="$(date --date=@${now} +'%Y/%m/%d %H:%M:%S %Z')"

    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments: <LOG_LEVEL> <MESSAGE> [...MESSAGE]"
        return 1
    elif [ ${argc} -ge 2 ]; then
        pot_level="${argv[@]:0:1}"
        case "${pot_level@U}" in
            "TRACE" | "DEBUG" | "INFO" | "WARN" | "WARNING" | "ERROR" | "CRITICAL")
                level="${pot_level@U}"
                argv=(${argv[@]:1})
                ;;
            *)
                level="INFO"
                ;;
        esac
    fi

    # unset IFS
    export IFS=$'\x20'

    message=$(builtin printf '%s ' ${argv[@]} | /opt/homebrew/Cellar/gnu-sed/4.9/libexec/gnubin/sed -E 's/\s+$//g')
    local -- message_prefix="[${level@U}] [${log_timestamp}]"
    local -a message_parts=("${message_prefix}" "${message}")

    local -- log_output="$(builtin echo -e "${message_parts[@]}")"
    1>&2 builtin echo -e "${log_output}"
    1>${shell_d_internal_log_path} builtin echo -e "${log_output}"
}

# <RUST>
if [ -s "${HOME}/.cargo/env" ] && [ -x "${HOME}/.cargo/bin/cargo" ]; then
    declare -g shell_d_rust_root_path="${HOME}/.cargo"
    declare -g shell_d_rust_bin_path="${shell_d_rust_root_path}/bin"
    declare -g shell_d_rust_env_path="${shell_d_rust_root_path}/env"

    shell_d_internal_security_checks
else
    declare -g shell_d_rust_root_path=""
    declare -g shell_d_rust_bin_path=""
    declare -g shell_d_rust_env_path=""
fi
# </RUST>

# <PYTHON>
if [ -s "${shell_d_root_path}/pyproject.toml" ]; then
    declare -g shell_d_python_manifest="${shell_d_root_path}/pyproject.toml"
else
    declare -g shell_d_python_manifest=""
fi

if [ -s "${shell_d_root_path}/.venv/bin/activate" ] && [ -x "${shell_d_root_path}/.venv/bin/python3" ]; then
    declare -g shell_d_python_root_path="${shell_d_root_path}/.venv"
    declare -g shell_d_python_bin_path="${shell_d_python_root_path}/bin"
elif [ -n "${shell_d_python_manifest}" ]; then
    declare -g shell_d_python_root_path="$(dirname "${shell_d_python_manifest}")/.venv"
    declare -g shell_d_python_bin_path="${shell_d_python_root_path}/bin"
else
    declare -g shell_d_python_root_path=""
    declare -g shell_d_python_bin_path=""
fi
#
# declare -g shell_d_python_script="$(cat ~/.shell.d/py3/shell_d.py)"
#
# if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
#     echo "${shell_d_python_script@Q}"
#     exit 1
# fi
#
# </PYTHON>

# <NODE>
declare -g shell_d_nvm_root_path="${HOME}/.nvm"

if [ -d "${shell_d_nvm_root_path}" ]; then
    declare -g shell_d_nvm_alias_default_path="${shell_d_nvm_root_path}/alias/default"
    declare -g shell_d_nvm_versions_path="${shell_d_nvm_root_path}/versions"
    if [ -s "${shell_d_nvm_alias_default_path}" ]; then
        declare -g shell_d_nvm_default_version="$(grep -E '^v' "${shell_d_nvm_alias_default_path}" | head -1)"
        declare -g shell_d_nvm_current_version_path="${HOME}/.nvm/versions/node/${shell_d_nvm_default_version}"
    else
        declare -ga shell_d_nvm_installed_versions=($(find "${HOME}/.nvm/versions/node" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort -rn))
        declare -g shell_d_nvm_default_version="${shell_d_nvm_installed_versions[0]}"
    fi
    declare -g shell_d_nvm_current_version_path="${HOME}/.nvm/versions/node/${shell_d_nvm_default_version}"
    declare -g shell_d_nvm_current_version_bin_path="${shell_d_nvm_current_version_path}/bin"
fi
# </NODE>

# initialize_shell_d_core_global_vars() {
#     if [[ ! -v shell_d_entrypoint_source_path_relative ]]; then
#         shell_d_sh_log_error "[shell.d entrypoint error]" "core global variable undefined: shell_d_entrypoint_source_path_relative "
#         return 1
#     fi
#     declare -gr shell_d_entrypoint_source_directory_path="$(cd "$(dirname "${shelL_d_entrypoint_source_path_relative}")" && pwd)"
#     declare -gr shell_d_entrypoint_source_filename="$(basename "${shell_d_entrypoint_source_path_relative}")"
#     declare -gr actual_shell_d_path="${shelL_d_entrypoint_source_directory_path}"
#     declare -gr actual_x_d_path="${actual_shell_d_path}/x.d"

#     if [ "${actual_shell_d_path}" != "${default_shell_d_path}" ]; then
#         shell_d_sh_log_error "[shell.d entrypoint error]" "actual_shell_d_path different than default_shell_d_path: ${actual_shell_d_path@Q} != ${default_shell_d_path@Q}"
#         return 1
#     fi
#     if [ "${actual_x_d_path}" != "${default_x_d_path}" ]; then
#         shell_d_sh_log_error "[shell.d entrypoint error]" "actual_x_d_path different than default_x_d_path: ${actual_x_d_path@Q} != ${default_x_d_path@Q}"
#         return 1
#     fi
#     if ! "$(cd "${entrypoint_dirname}" && pwd)"; then
#         SHELL_D_PATH="${HOME}/.shell.d"
#     fi

#     local -- X_D_PATH="${SHELL_D_PATH}/x.d"

# }
declare -gA shell_d_sh_uptime_map=()

shell_d_internal_bash_uptime() {
    local -ri uptime_seconds=$((SECONDS))
    local -i side_effect_seconds=${uptime_seconds}
    local -i seconds_left=${uptime_seconds}

    ## 0=`        time_parts+=("$(( seconds_left / day ))d")`
    ## 1=`        `
    ## 2=`time_parts+=("$(( seconds_left / day ))d")`
    ## 3=``
    ## 4=`"$(( seconds_left / day ))d"`
    ## 5=``
    ## 6=`$(( seconds_left / day ))`
    ## 7=`$(( seconds_left / `
    ## 8=`day`
    ## 9=` ))`
    ## 10=``
    ## 11=``
    ## 12=`d`
    ## 13=``
    ## ^\(\s-*\)\(time_parts[+][=][(]\(\s-*\)\("\(\s-*\)\(\([^"\n]+\)\(day\|hour\|minute\|second\)\([^"\n]+\)\(\s-*\)\)\(\s-*\)\([dhms]\)"\)\(\s-*\)[)]\) → \,(let* ((time-unit (match-string 8)) (arith-display (match-string 6)) (arith-unit (match-string 12)) (tmp-var-decl (format "tmp_%s_with_time_unit=%s" time-unit arith-display)) (time-parts-new-item (match-string 4)) (time-parts-push (format "time_parts+=(\"%s\")" time-parts-new-item ))) (string-join (list tmp-var-decl (format "time_parts+=(%s)" time-parts-new-item)  ) "          \n"))
    local -ri minute=$((60))
    local -ri hour=$((minute * 60))
    local -ri day=$((hour * 24))
    local -ri days=$((day * 2))
    local -a time_parts=()
    local -i tmp_day=0
    local -i tmp_hour=0
    local -i tmp_minute=0
    local -i tmp_second=0

    if [[ ${side_effect_seconds} -ge ${day} ]]; then
        time_parts+=("$((seconds_left / day))d")
        seconds_left=$((side_effect_seconds % day))
        side_effect_seconds=$(((side_effect_seconds / day) + seconds_left))
    fi
    if [[ ${side_effect_seconds} -ge ${hour} ]]; then
        time_parts+=("$((seconds_left / hour))h")
        seconds_left=$((side_effect_seconds % hour))
        side_effect_seconds=$(((side_effect_seconds / hour) + seconds_left))
    fi
    if [[ ${side_effect_seconds} -ge ${minute} ]]; then
        time_parts+=("$((seconds_left / minute))m")
        seconds_left=$((side_effect_seconds % minute))
        side_effect_seconds=$(((side_effect_seconds / minute) + seconds_left))
    fi
    time_parts+=("$((seconds_left))s")
    printf '%s' ${time_parts[@]}
}
entrypoint() {
    # shell_d_sh_load_libs "${BASH_SOURCE[0]}"

    local -- entrypoint_script_path="$(shell_d_fs_get_canonical_path ${BASH_SOURCE[0]})"
    local -- entrypoint_dirname="$(dirname "${entrypoint_script_path}")"
    if [ "${entrypoint_dirname}" != "${default_shell_d_path}" ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} warning]" "entrypoint.sh should be at ${default_shell_d_path} not ${entrypoint_dirname}"
    fi
    local -- SHELL_D_PATH="${entrypoint_dirname}"
    local -- X_D_PATH="${SHELL_D_PATH}/x.d"
    local -- STAGING_PATH="${SHELL_D_PATH}/fn.staging.d"
    # shell_d_sh_load_source "${X_D_PATH}/boot.sh"

    if [ -x "${HOME}/.cargo/bin/ps1" ]; then
        eval "$(${HOME}/.cargo/bin/ps1 --env)"
        # export PROMPT_COMMAND='shell_d_sh_prompt_command'
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

    export PS1="\[\r\][#\${HISTCMD}][\\\$?=\$?][\\\$!=\$!][up \$(shell_d_internal_bash_uptime)][level \${SHLVL}] [\\\$\\\$=\$\$] ${PS1}"
    # # See `man bash'
    # export EXECIGNORE=""
    xD "locale.sh"
    xD "homebrew.sh"
    xD "path.sh"
    xD "cdpath.sh"

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

    xD "cdpath.sh"
    xD "path.sh"
    xD "homebrew.sh"
    xD "sec.sh"
    xD "io.sh"
    xD "workbench.sh"
    xD "ansi.sh"

    shell_d_sh_load_source "${X_D_PATH}/completions.sh"
    shell_d_sh_load_source "${X_D_PATH}/hooks.sh"
    shell_d_sh_load_source "${X_D_PATH}/string.sh"
    shell_d_sh_load_source "${X_D_PATH}/pandoc.sh"
    shell_d_sh_load_source "${X_D_PATH}/git.sh"
    shell_d_sh_load_source "${X_D_PATH}/emacs.sh"

    shell_d_sh_load_source "${STAGING_PATH}/export_shell_env_vars.sh"
    shell_d_sh_load_source "${STAGING_PATH}/history.sh"
    shell_d_sh_load_source "${X_D_PATH}/coreutils.sh"
    shell_d_sh_load_source "${X_D_PATH}/py3.sh"

    unset s brew_path path gq
}
shell_d_fs_get_canonical_path() {
    if [ ${#} -eq 0 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing argument: <RELATIVE_PATH>"
        return 1
    elif [ ${#} -gt 1 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "too many arguments"
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
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing argument: <RELATIVE_PATH>"
        return 1
    elif [ ${#} -gt 1 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "too many arguments"
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
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "undefined variable \${FUNCNAME[1]}this function should be called from another shell function"
        return 1
    elif [[ ! -v LINENO[1] ]]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "undefined variable \${LINENO[1]}this function should be called from another shell function"
        return 1
    fi
    local -- caller_funcname=${FUNCNAME[1]}
    local -- caller_lineno=${LINENO[1]}
    local -- caller_frame="${caller_funcname}:${caller_lineno}"

    local -a argv=($@)
    local -i argc=${#argv[@]}

    if [ ${argc} -lt 2 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing arguments: <ARGUMENT_NAME> <ARGUMENT_VALUE>"
        return 1
    elif [ ${argc} -gt 2 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "too many arguments, this function takes exacly 2 arguments: <ARGNAME> and <VALUE>"
        return 1
    fi

    local -- caller_argument_name="${argv[@]:0:1}"
    local -- caller_argument_value="${argv[@]:1:1}"

    if [ -z "${caller_argument_name}" ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "${caller_frame} missing argument: <ARGUMENT_NAME>"
        return 1
    elif [[ ! "${caller_argument_name}" =~ ^[a-zA-Z_]+[a-zA-Z0-9_]*$ ]]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "${caller_frame} invalid variable name {caller_argument_name@Q}"
        return 1
    fi

    if [ -z "${caller_argument_value}" ]; then
        shell_d_sh_log_error "[${caller_funcname} error]" "missing argument: <${caller_argument_name@U}>"
        return 1
    fi
}
shell_d_sh_validate_non_empty_regular_file_argument() {
    if [[ ! -v FUNCNAME[1] ]]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "undefined variable \${FUNCNAME[1]} this function should be called from another shell function"
        return 1
    elif [[ ! -v BASH_LINENO[1] ]]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "undefined variable \${BASH_LINENO[1]} this function should be called from another shell function"
        return 1
    fi
    local -- caller_funcname=${FUNCNAME[1]}
    local -- caller_lineno=${BASH_LINENO[1]}
    local -- caller_frame="${caller_funcname}:${caller_lineno}"

    local -a argv=($@)
    local -i argc=${#argv[@]}

    if [ ${argc} -lt 2 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing arguments: <ARGUMENT_NAME> <ARGUMENT_VALUE>"
        return 1
    elif [ ${argc} -gt 2 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "too many arguments, this function takes exacly 2 arguments: <ARGNAME> and <VALUE>"
        return 1
    fi

    local -- caller_argument_name="${argv[@]:0:1}"
    local -- caller_argument_value="${argv[@]:1:1}"

    if [ -z "${caller_argument_name}" ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "${caller_frame} missing argument: <ARGUMENT_NAME>"
        return 1
    elif [[ ! "${caller_argument_name}" =~ ^[a-zA-Z_]+[a-zA-Z0-9_]*$ ]]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "${caller_frame} invalid variable name {caller_argument_name@Q}"
        return 1
    fi

    if [ -z "${caller_argument_value}" ]; then
        shell_d_sh_log_error "[${caller_funcname} error]" "missing argument: <${caller_argument_name@U}>"
        return 1
    elif [ ! -e "${caller_argument_value}" ]; then
        shell_d_sh_log_error "[${caller_funcname} error]" "path does not exist: ${caller_argument_value@Q}"
        return 1
    elif [ ! -f "${caller_argument_value}" ]; then
        shell_d_sh_log_error "[${caller_funcname} error]" "not a file: ${caller_argument_value@Q}"
        return 1
    elif [ ! -r "${caller_argument_value}" ]; then
        shell_d_sh_log_error "[${caller_funcname} error]" "file not readable: ${caller_argument_value@Q}"
        return 1
    elif [ ! -s "${caller_argument_value}" ]; then
        shell_d_sh_log_error "[${caller_funcname} error]" "empty file: ${caller_argument_value@Q}"
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
    local -i subscript_load_source_started_at=-1
    local -i subscript_load_source_finished_at=-1

    if [ ${argc} -eq 0 ]; then
        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>"
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
    #     shell_d_sh_log_error "[${FUNCNAME[0]} error]" "too many arguments"
    #     return 1
    fi

    shell_d_sh_validate_non_empty_regular_file_argument "shell_script_path" "${shell_script_path}"
    shell_script_path=$(shell_d_fs_get_canonical_path "${shell_script_path}")

    if ! shell_d_sh_shfmt_check "${shell_script_path}"; then
        return $?
    fi
    if [ -s "${shell_script_path}" ]; then
        shell_d_load_source_queue_map["${shell_script_path}"]=$(date -u +%s)
        shell_d_load_source_queue+=("${shell_script_path}")

        local -- shell_script_path_display="${shell_script_path}"
        if [[ "${shell_script_path_display}" =~ ^${HOME}/ ]]; then
            shell_script_path_display="~/${shell_script_path#${HOME}/}"
        fi
        local -- prefix="loading"
        if ((${shell_d_entrypoint_dry_run})); then
            prefix="would load"
        fi
        if ((shell_d_entrypoint_verbose)) || ((shell_d_entrypoint_dry_run)); then
            shell_d_sh_log_error "\x1b[1;38;5;202m${prefix} \x1b[1;38;5;231m${shell_script_path_display}\x1b[0m"
        elif ! ((shell_d_entrypoint_dry_run)); then
            export IFS=$'\n'

            # 1>&2 echo -e "\x1b[1;38;2;252;233;79mloading ${shell_script_path@Q}\x1b[0m"

            if [[ ! -v shell_d_load_source_stack_map["${shell_script_path}"] ]]; then
                local -- func="${FUNCNAME[1]}"
                local -- line="${BASH_LINENO[$((1 - 1))]}"
                # shell_d_sh_log_error ""
                # shell_d_sh_log_error "\x1b[0m\x1b[1;38;2;245;121;0m\x1b[1;48;2;46;52;54m$(declare -p callers stack_size)\x1b[0m"
                # shell_d_sh_log_error ""
                subscript_load_source_started_at=$(date -u +'%s')
                shell_d_internal_benchmark_load_source_started_at_map["${shell_script_path}"]="${subscript_load_source_started_at}"

                eval "$(cat "${shell_script_path}")" # #ff4444
                # 1>&2 echo -e "\x1b[1;38;2;115;210;22mloaded ${shell_script_path@Q}\x1b[0m"
                subscript_load_source_finished_at=$(date -u +'%s')
                shell_d_internal_benchmark_load_source_finished_at_map["${shell_script_path}"]="${subscript_load_source_finished_at}"

                shell_d_load_source_stack+=("${shell_script_path}")
                shell_d_load_source_stack_map["${shell_script_path}"]="${func}:${line}"
            else
                local -- called_by=${shell_d_load_source_stack_map["${shell_script_path}"]}
                local -- called_by_func=${called_by%%:*}
                local -- called_by_ty=$(type -t "${called_by_func}")
                local -i called_by_line=${called_by##*:}
                local -- func="${FUNCNAME[1]}"
                local -- line="${BASH_LINENO[$((1 - 1))]}"
                shell_d_sh_log_error "\x1b[0m\x1b[1;48;2;238;238;236m\x1b[1;38;2;239;41;41m${shell_script_path@Q} already loaded by ${called_by_ty} ${called_by_func} line ${called_by_line}\x1b[0m"

                subscript_load_source_started_at=$(date -u +'%s')
                shell_d_internal_benchmark_load_source_started_at_map["${shell_script_path}"]="${subscript_load_source_started_at}"

                shell_d_sh_log_error "\x1b[0m\x1b[1;38;2;238;238;236m\x1b[1;48;2;239;41;41mcurrent caller is ${func} at line ${line}\x1b[0m"
                eval "$(cat "${shell_script_path}")" # #ff4444
                subscript_load_source_finished_at=$(date -u +'%s')
                shell_d_internal_benchmark_load_source_finished_at_map["${shell_script_path}"]="${subscript_load_source_finished_at}"
                # 1>&2 echo -e "\x1b[1;38;2;245;121;0mre-loaded ${shell_script_path@Q}\x1b[0m"
                return 0
            fi
            return 0
        fi
        # shell_d_dump_vars_to_file_and_stderr FUNCNAME LINENO BASH_SOURCE BASH_LINENO BASH_SUBSHELL

    else
        shell_d_sh_log_error "\x1b[1;38;5;196mcannot load empty file \x1b[1;38;5;231m${shell_script_path}\x1b[0m"
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

#shell_d_dump_vars_to_file_and_stderr() {
#    local -a argv=($@)
#    local -i argc=${#argv[@]}
#    local -i index=0
#    local -i current=0
#    local -- arg=""
#    local -- name=""
#    local -- var_value=""
#    local -- var_type=""
#    local -- ty_char=""
#    local -- value=""
#    local -- declaration=""
#    local -a varnames_to_dump=()
#    local -A varname_type_char_map=()
#    local -A var_declaration_map=()
#    local -A var_value_map=()
#    local -i widest_varname=0
#    local -i widest_value=0
#    local -a dump_filename_parts=()
#
#    logfile_parts+=("bash.pid.${$}")
#    if [[ -v WEZTERM_PANE ]] && [[ "${WEZTERM_PANE}" =~ ^[0-9]+$ ]]; then
#        logfile_parts+=("wezterm.pane_id.${WEZTERM_PANE}")
#    fi
#    if [ ${argc} -eq 0 ]; then
#        shell_d_sh_log_error "[${FUNCNAME[0]} error]" "missing arguments"
#        return 1
#    fi
#
#    for index in ${!argv[@]}; do
#        current=$(($index + 1))
#        arg="${argv[$index]}"
#        if [[ -v refvar ]]; then
#            unset -n refvar
#        fi
#        if [[ -v "${arg}" ]]; then
#            if [[ -v shell_d_dumped_varname_map["${arg}"] ]]; then
#                continue
#            fi
#
#            local -I -n refvar="${arg}"
#            shell_d_dumped_varname_map["${arg}"]="${refvar}"
#            if [[ ! -v varname_type_char_map["${arg}"] ]]; then
#                varname_type_char_map["${arg}"]="${refvar@a}"
#                var_declaration_map["${arg}"]="${refvar[@]@A}"
#                var_value="${refvar[@]}"
#                var_value_map["${arg}"]="${var_value}"
#                varnames_to_dump+=("${arg}")
#                if [ ${widest_value} -lt ${#var_value} ]; then
#                    widest_value=${#var_value}
#                fi
#                if [ ${widest_varname} -lt ${#arg} ]; then
#                    widest_varname=${#arg}
#                fi
#            fi
#            unset -n refvar
#        else
#            shell_d_sh_log_error "[${FUNCNAME[0]} warning]" "var does not exist: ${arg@Q}"
#            continue
#        fi
#    done
#
#    export IFS=$'\n'
#
#    local -- declaration_flags=""
#    local -- declaration_name=""
#    local -- declaration_value=""
#    local -a declaration_values=()
#    for index in ${!varnames_to_dump[@]}; do
#        name="${varnames_to_dump[${index}]}"
#        var_value="${var_value_map[${name}]}"
#        declaration="${var_declaration_map[${name}]}"
#        declaration_flags="$(awk '{ print $2 }' <<<"${declaration}")"
#        declaration_name="$(awk '{ print(gensub(/=.*$/, "", "g", $3)) }' <<<"${declaration}")"
#        ty_char="${varname_type_char_map[${name}]}"
#        declaration_value="$(awk '{ print(gensub(/^[^=]=/, "", "g", $NF)) }' <<<"${declaration}")"
#
#        1>&2 printf '%s' $'\x1b[0m\x1b[0;38;2;115;210;22m\n'
#        1>&2 declare -p ${!arg*} ${!index*} ${!current*} ${!name*} ${!var*} ${!val*} ${!declaration*} ${!wide*} ${!dump*} ${!ty*}
#        1>&2 printf '%s' $'\x1b[0m\n'
#        if [[ -v refvar ]]; then
#            1>&2 declare -p refvar
#        fi
#
#        if [[ -v refvar ]]; then
#            unset -n refvar
#        fi
#
#        if [[ "${ty_char}" =~ [Aa] ]]; then
#            local -I -n refvar="${name}"
#            declaration_values=($(echo "${refvar[*]}"))
#        else
#            declaration_values=("${declaration_value}")
#        fi
#        local -- sed_regexp='^\s*((declare|local)\s+([-]([-]|[a-zA-Z]+))?\s*)?([a-zA-Z_]+[a-zA-Z0-9_]*)=(.*)'
#        local -- sed_replacement='\x1b[1;38;5;242m\5\x1b[1;48;5;222m\x1b[1;38;5;233m \4 \x1b[0m=\x1b[1;38;5;231m\6\x1b[0m'
#        local -- sed_command="s/${sed_regexp}/${sed_replacement}/gp"
#
#        # shell_d_sh_log_error ""
#        # shell_d_sh_log_error "${name[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${var_value[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${declaration[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${declaration_name[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${declaration_flags[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${declaration_values[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${declaration_value[@]@A}" | sed -n -E "${sed_command}"
#        # shell_d_sh_log_error "${ty_char[@]@A}" | sed -n -E "${sed_command}"
#        # 1>&2 echo -en "\x1b[0m"
#        # shell_d_sh_log_error ""
#        # TODO: use bash variable parser
#
#    done
#}
xD() {
    export PS4=''
    local -a path_list=($@)
    local -i path_count=${#path_list[@]}
    local SHELL_D_PATH="${HOME}/.shell.d"
    local X_D_PATH="${SHELL_D_PATH}/x.d"
    local -- sh=""

    # declare -gA shell_d_internal_benchmark_xd_started_at_map=()
    # declare -gA shell_d_internal_benchmark_xd_finished_at_map=()

    local -i subscript_load_xd_started_at=-1
    local -i subscript_load_xd_finished_at=-1

    if [ ${path_count} -eq 0 ]; then
        shell_d_sh_log_error "[error]" "xD missing argument(s): <PATH> [PATH...]"
        return 1
    fi
    for sh in ${path_list[@]}; do
        if [ -z "${sh}" ]; then
            shell_d_sh_log_error "[warning]" "xD skipping empty arg"
            return 1
        fi
        if [ -e "${SHELL_D_PATH}/${sh}" ] && [ -r "${SHELL_D_PATH}/${sh}" ] && [ -s "${SHELL_D_PATH}/${sh}" ]; then
            # shell_d_sh_log_error "[xD debug]" "loading ${SHELL_D_PATH}/${sh}"
            local -- source_path_to_load="${SHELL_D_PATH}/${sh}"
            subscript_load_xd_started_at=$(date -u +'%s')
            shell_d_internal_benchmark_xd_started_at_map["${source_path_to_load}"]="${subscript_load_xd_started_at}"
            shell_d_sh_load_source "${source_path_to_load}"
            subscript_load_xd_finished_at=$(date -u +'%s')
            shell_d_internal_benchmark_xd_finished_at_map["${source_path_to_load}"]="${subscript_load_xd_finished_at}"
            # shell_d_sh_load_libs "${SHELL_D_PATH}/${sh}"
        elif [ -e "${X_D_PATH}/${sh}" ] && [ -r "${X_D_PATH}/${sh}" ] && [ -s "${X_D_PATH}/${sh}" ]; then
            # shell_d_sh_log_error "[xD debug]" "loading ${X_D_PATH}/${sh}"
            local -- source_path_to_load="${X_D_PATH}/${sh}"

            subscript_load_xd_started_at=$(date -u +'%s')
            shell_d_internal_benchmark_xd_started_at_map["${source_path_to_load}"]="${subscript_load_xd_started_at}"
            shell_d_sh_load_source "${source_path_to_load}"
            subscript_load_xd_finished_at=$(date -u +'%s')
            shell_d_internal_benchmark_xd_finished_at_map["${source_path_to_load}"]="${subscript_load_xd_finished_at}"
            # shell_d_sh_load_libs "${X_D_PATH}/${sh}"
        else
            shell_d_sh_log_error "[error]" "xD could not find readable non-empty file ${sh@Q}"
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
    unset PS2
    unset PS3
    unset PS4
}
if [[ -v SHELL_D_DEBUG ]] && [ -n "${SHELL_D_DEBUG}" ]; then
    export PS3='${BASH_SOURCE[0]}${LINENO[0]}'
fi

if [ "${0}" == "${gnu_bash_libexec}" ]; then
    entrypoint
    postentry
else
    shell_d_sh_log_error "\"${0}\" != \"${gnu_bash_libexec}\""
fi
unset entrypoint postentry

# for fn in $(grep -i -E '^[a-z_]+[(][^)]*[)]([[:space:]]*|\n)[{]' "${BASH_SOURCE[0]}" | sed -E 's/^[[:space:]]*([[:space:]]*function[[:space:]]*)\?([a-zA-Z_-][a-zA-Z0-9_-]+).*[(][^)]*[)]([[:space:]]*|\n)*[{]/\2/g'); do
#     2>/dev/random 1>/dev/random unset "${function_name}"
# done

umask 007

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
# declare -g my_tty_name=$(basename $(tty))
# echo "${$}" > "${HOME}/.shell.d/entrypoint.${my_tty_name}.${WEZTERM_PANE}.finished"

# if [[ -v SHLVL ]] && [[ "${SHLVL}" -eq 1 ]]; then
#     declare -i shell_d_internal_subshell_level_2_exit_code=0
#     declare -a shell_d_internal_subshell_level_2_argv=()
#     shell_d_internal_subshell_level_2_argv=( ${gnu_bash_libexec} --init-file "${BASH_SOURCE[0]}" -l  )
#     if ${shell_d_internal_subshell_level_2_argv[@]}; then
#         shell_d_internal_subshell_level_2_exit_code=0
#     else
#         shell_d_internal_subshell_level_2_exit_code=$?
#         1>&2 echo -e "command \x1b[1;38;2;F13976m${shell_d_internal_subshell_level_2_argv[@]}"
#     fi
# fi

find ~/.emacs.d -regextype egrep -regex '.*[.]el[nc]$' -exec rm -f {} \; || true
