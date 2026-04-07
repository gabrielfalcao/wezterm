declare -gA function_definitions=()
declare -ga deferred_prog_commands=()
declare -gA deferred_prog_pids=()
declare -gA deferred_prog_stdout=()
declare -gA deferred_prog_psaux_lines=()
declare -gA deferred_prog_stderr=()
declare -gA deferred_prog_started_at_utc=()
declare -gA deferred_prog_finished_at_utc=()
declare -ga current_caller_frame=()
declare -gA current_caller_info=()

declare -ga global_set_ifs_values=()
declare -ga global_set_ifs_callers=()


set_ifs() {
    # head
    true
    # tail
}

declare -gA hist_commands_by_entry_id=()

declare -gr hist_time_format_timestamp_tz='@%s:%Z     '
declare -gr hist_time_regexp_timestamp_tz_no_entry_id='(@([1-9][0-9]{9,}):([+-]?[0-9]+|[A-Z]+))\s+(([^\n]*[\n]|[^\n]*)+|.*)$'
declare -gr hist_time_regexp_timestamp_tz="^\s*([0-9]+)\s*${hist_time_regexp_timestamp_tz_no_entry_id}"


declare  -gr shell_script_value_regexp_group_wrapped_in_double_quote="(([\"])([^\"]*.*)([\"]))"
declare  -gr shell_script_value_regexp_group_wrapped_in_single_quote="(([\'])([^\']*.*)([\']))"
declare  -gr shell_script_value_regexp_group_wrapped_in_parenthesis="(([(])([^()]*.*)([)]))"
declare  -gr shell_script_value_regexp_group_anything="(.*)"
declare -gar shell_script_var_assignment_nonempty_regexp_parts=(
    "${shell_script_value_regexp_group_wrapped_in_double_quote}"
    "${shell_script_value_regexp_group_wrapped_in_single_quote}"
    "${shell_script_value_regexp_group_wrapped_in_parenthesis}"
    "${shell_script_value_regexp_group_anything}"
)
declare -gr shell_script_var_declaration_regexp_non_line_bound="($(export IFS=$'|';echo "${shell_script_var_assignment_nonempty_regexp_parts}"))"
# declare -gr shell_script_var_declaration_regexp_non_line_bound='(\s*)((declare|local)\s+[-][a-zA-Z-]+\s+|(unset|export)\s+)?(([a-zA-Z_]+[a-zA-Z0-9_]*))((([^=]*)([=])(.*))|\s*)?'

declare -g shell_script_var_declaration_regexp='^(\s*)((declare|local)\s+[-][a-zA-Z-]+\s+|(unset|export)\s+)?(([a-zA-Z_]+[a-zA-Z0-9_]*))((([^=]*)([=])(.*))|\s*)?$'

# TODO: regexp-tool crate accepts relaive backref in regexp pattern such that:
#
# the regular expression:
# (['"])([^\1]*.*)(\1)
#
# can be achieved through any of the following variants:
#
# variant 1: backslash-g relative index
# /
# (['"])([^\g<-1>]*.*)([^\g<-2>])
# /
#
# variant 2: backslash-g absolute index
# /
# (['"])([^\g<1>]*.*)([^\g<1>])
# /
#
# variant 3: backslash-g named backref
# /
# /
# (?P<quote>['"])([^\g<quote>]*.*)([^\g<quote>])
# /
#
#
# variant 4: dollar-sign-curly-braced relative index
# /
# (['"])([^${-1}]*.*)([^${-2}])
# /
#
# variant 5: dollar-sign-curly-braced absolute index
# /
# (['"])([^${1}]*.*)([^${1}])
# /
#
# variant 6: dollar-sign-curly-braced named backref
# /
# /
# (?P<quote>['"])([^${quote}]*.*)([^${quote}])
# /
#
#
# variant 1: backslash-g relative index
# /
# (['"])([^\g<-1>]*.*)([^\g<-2>])
# /
#
# variant 2: backslash-g absolute index
# /
# (['"])([^\g<1>]*.*)([^\g<1>])
# /
#
# variant 3: backslash-g named backref
# /
# /
# (?P<quote>['"])([^\g<quote>]*.*)([^\g<quote>])
# /
#

# <emacs interactive funcall function="replace-regexp">
# <argument name="REGEXP">
#     \(variant \([0-9]+\)\|backslash-g\|\(\(\\g\|\|[?]P\)<\([^>]+\)>\)\)
# </argument> <!-- argument=REGEXP -->
#
# <argument name="REPLACEMENT">

# </argument> <!-- argument=REPLACEMENT -->



#
#
# <WIP codegen-for="regexp_group_variable_value_variants">
# <varname>variable_value_variants
export IFS=$'\n'
declare -a shell_value_variants=()
shell_value_variants=(

    # ICAgICdbXlw1XSonICAgICAgICAgICAgIyAidmFsdWUiCiAgICAnXFxcNVteXDVdKicgICAgICAgICMgIlwidmFsdWUiCiAgICAnXFxcNVteXDVdKlxcXDUnICAgICMgIlwidmFsdWVcIiIKICAgICdcXFw1W15cNV0qXFxcNScgICAgIyAidmFsdWUiCg==

    '[^\5]*'            # 'value'
    '\\\5[^\5]*'        # '\'value'
    '\\\5[^\5]*\\\5'    # '\'value\''
    '\\\5[^\5]*\\\5'    # 'value'

    '[^\5]*'            # 'value'
    '\\\5[^\5]*'        # '\'value'
    '\\\5[^\5]*\\\5'    # '\'value\''
    '\\\5[^\5]*\\\5'    # 'value'
)
# '\2($(echo "${shell_value_variants[*]}"))\5'
export IFS=$'|'
regexp_group_variable_value_variants="($(echo "${shell_value_variants[*]}"))"
export IFS=$'\n'

# regexp_group_variable_value_variants
declare -gr shell_script_var_declaration_regexp='^(\s*)((declare|local)\s+[-][a-zA-Z-]+\s+|(unset|export)\s+)?(([a-zA-Z_]+[a-zA-Z0-9_]*)([^=]+)?)([=]${regexp_group_variable_value_variants[*]})$'
#()(())()()

declare -gA map_pair_xcodepoint_value_by_hex_escaped=()
map_pair_xcodepoint_value_by_hex_escaped['\x60']="$(printf '\x60')"
map_pair_xcodepoint_value_by_hex_escaped['\x22']="$(printf '\x22')"
map_pair_xcodepoint_value_by_hex_escaped['\x27']="$(printf '\x27')"
map_pair_xcodepoint_value_by_hex_escaped['\x60']="$(printf '\x60')"
declare -gr map_pair_xcodepoint_value_by_hex_escaped;

declare -gA map_pair_xcodepoint_hex_escaped_by_value=()
map_pair_xcodepoint_hex_escaped_by_value["$(printf '\x60')"]='\x60'
map_pair_xcodepoint_hex_escaped_by_value["$(printf '\x22')"]='\x22'
map_pair_xcodepoint_hex_escaped_by_value["$(printf '\x27')"]='\x27'
map_pair_xcodepoint_hex_escaped_by_value["$(printf '\x60')"]='\x60'
declare -gr map_pair_xcodepoint_hex_escaped_by_value;

declare -gar list_pair_xcodepoint_escaped_list=(
    '\x22'
    '\x27'
    '\x60'
)
export IFS=$'\n'
declare -gar list_pair_xcodepoint_escaped=(
    $(echo "${list_pair_xcodepoint_escaped_list[*]}")
)
# </WIP codegen-for"regexp_group_variable_value_variants">






local_var_declarations() {
#
#
#<input>
#^(\s*)((declare|local)\s+[-][a-zA-Z-]+\s+)?([^=]*hist[^=]*)=(.*)$
#</input>
#
#
#
#
#<emacs>
#
#<command name="replace-regexp">
#
#<arg name="REGEXP">
#\([\^]?[(]\([^()\n]+[?]?\|[(]\([^()\n]+[?]?\)[)]\)+[)][$=?]?\)
#</arg>
#
#<arg name="TO-STRING">
#(\&)\n
#</arg>
#
#</command>
#
#</emacs>
#
#(replace-regexp \,{REGEXP} \,{TO-STRING}
#    "\([\^]?[(]\([^()\n]+[?]?\|[(]\([^()\n]+[?]?\)[)]\)+[)][$=?]?\)"
#    "(\&)\n" )
#
#
# result:
#
#(^(\s*))
#(((declare|local)\s+[-][a-zA-Z-]+\s+)?)
#(([^=]*hist[^=]*)=)
#((.*)$)
#
# </emacs>
    #  ()      1
    #  (       2
    #      ()  3
    #  )
    #  ()      4
    #  ()      5
    local -p | sed -E "s/${shell_script_var_declaration_regexp}/\1/g"
}

cdn() {
    local -a argv=($@)
    local -i argc=${#argv[@]}

    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing arguments"
        return 1
    fi
    1>/dev/null 2>/dev/null cd ${argv[@]}
}
git_clone_godot_oss_repos() {
    local -- input="$@"
    if [ -z "${input}" ]; then
        input="$(pbpaste)"
    fi
    if [ -z "${input}" ] && [ ! -t 0 ]; then
        local -a stdin_lines=()
        export IFS=$'\n'
        while read line; do
            if ! stdin_lines+=("$line"); then
                continue
            fi
        done </dev/stdin
        input="$(echo "${stdin_lines[*]}")"
    fi
    if [ -z "${input}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing urls via argv, clipboard or stdin"
        return 1
    fi
    local -A repos_to_clone=()
    local -a urls_to_clone=()
    local -a urls=($(printf '%s\n' "${input}" | grep -E "https://"))
    local -a github_urls=($(printf '%s\n' "${urls[@]}" | grep -E "github[.]com"))
    local -- gh_repo_owner=''
    local -- gh_repo_name=''
    local -a godot_games_oss_repos=()
    local -- godot_github_examples_path="$HOME/godot/github_examples"
    local -- clone_url=""
    local -- clone_path=""

    godot_games_oss_repos=($(printf '%s\n' "${github_urls[@]}" | grep -E -v 'github[.]com/topics' | grep -i -E "github[.]com/[a-z0-9_-]+/[a-z0-9_-]+"))
    mkdir -p "${godot_github_examples_path}"
    for url in ${godot_games_oss_repos[@]}; do
        local -- regexp='^.*github[.]com/([^/]+)/([^/]+)([/]?([.]git)?)?$'
        gh_repo_owner=$(sed -n -E "s,${regexp},\1,gp" <<<"${url}")
        gh_repo_name=$(sed -n -E "s,${regexp},\2,gp" <<<"${url}")
        if [ -z "${gh_repo_owner}" ]; then
            1>&2 echo -e "[${FUNCNAME[0]} warning]" "could not parse gh_repo_owner from url ${url@Q}"
            continue
        fi
        if [ -z "${gh_repo_name}" ]; then
            1>&2 echo -e "[${FUNCNAME[0]} warning]" "could not parse gh_repo_name from url ${url@Q}"
            continue
        fi
        local -- clone_dirname="${gh_repo_owner}__${gh_repo_name}"
        if [[ ! "${clone_dirname}" =~ ^([a-zA-Z0-9_-]+)__([a-zA-Z0-9_-]+)$ ]]; then
            1>&2 echo -e "[${FUNCNAME[0]} warning]" "could not parse determine clone_dirname from url ${url@Q}: ${clone_dirname@Q}"
            continue
        fi
        local -- clone_url="https://github.com/${gh_repo_owner}/${gh_repo_name}.git"
        local -- clone_path="${godot_github_examples_path}/${gh_repo_owner}__${gh_repo_name}"
        if [[ ! -v repos_to_clone["${clone_url}"] ]]; then
            repos_to_clone["${clone_url}"]="${clone_path}"
            urls_to_clone+=("${clone_url}")
        fi
    done
    local -i index=0
    local -i total=${#repos_to_clone[@]}
    local -- pos=""
    local -- action=""
    local -- remote=""
    local -- branch=""
    for index in ${!urls_to_clone[@]}; do
        remote="origin"
        branch=""
        clone_url=${urls_to_clone[$index]}
        clone_path=${repos_to_clone[${clone_url}]}
        pos="$(printf '%-*s of %s' ${#total} $((index + 1)) ${total})"
        if [ -d "${clone_path}/.git" ] && branch=$(cd "${clone_path}" && git branch | sed -n -E 's/[*]\s+([a-zA-Z0-9_-]+[^[:space:]]*)/\1/g; t success q1; :success p'); then
            action="updating existing clone"
        else
            action="cloning"
        fi

        1>&2 echo -e "${action} from ${clone_url} in ${clone_path}"
        if [ "${action}" == "cloning" ]; then
            git clone --depth=1 "${clone_url}" "${clone_path}"
        else
            (cd "${clone_path}" && git pull --rebase "${remote}" "${branch}")
        fi
    done
}
dbg() {
    local -- dbg_bash_rematch_value="$(dbg_bash_rematch)"
    echo -e "${dbg_bash_rematch_value@A}"
    local -- history_length_value="$(history_length)"
    echo -e "${history_length_value@A}"
    local -- get_callers_value="$(get_callers)"
    echo -e "${get_callers_value@A}"
}
dbg_bash_rematch() {
    export IFS=$'\n'
    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    local -- output=$(echo -e "\n$(history)\n")
    local -a lines=($(echo "${output}"))
    local -i lines_count=${#lines[@]}
    hist_time_regexp_timestamp_tz='^\s*([0-9]+)\s+(@([1-9][0-9]{9,}):([+-]?[0-9]+|[A-Z]+))\s+(.*)$'
    # (let* ((string "^\s*([0-9]+)\s+(@([1-9][0-9]{9,}):([+-]?[0-9]+|[A-Z]+))\s+(.*)$")
    #        (regexp "\\([^(]+[^)]+\\)\\((\\([^()]*\\)+)\\)"))
}


get_callers() {
    local -i count=${#LINENO[@]}
    if [ ${count} -gt 0 ]; then
        local -i last=$((count - 1))
        local -i index=0
        for index in $(seq -1 ${last} | sort -nr); do
            get_caller "${index}"
        done
        return 0
    fi
    return 1
}
get_caller() {
    local -a gc_argv=($@)
    local -i gc_argc=${#gc_argv[@]}
    local -- raw_printf_format=""
    local -- printf_format=""
    local -- raw_caller_index=""
    if [ ${gc_argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]}]" "missing argument <CALLER_INDEX>"
        return 1
    fi
    local -- raw_caller_index="${gc_argv[@]:0:1}"
    raw_printf_format="${gc_argv[@]:1}"
    printf_format="${raw_printf_format}"

    if [[ ! "${raw_caller_index}" =~ ^[-]?[0-9]+$ ]]; then
        1>&2 echo -e "[${FUNCNAME[0]}]" "argument <CALLER_INDEX> got invalid non-integer value: ${raw_caller_index@Q}"
        return 1
    fi
    local -i caller_index=$((raw_caller_index + 1))
    local -- caller_function_name=""
    local -- caller_line_number=""

    current_caller_frame=()
    current_caller_info=()

    if [[ -v LINENO[$caller_index] ]]; then
        caller_line_number="${LINENO[$caller_index]}"
        current_caller_frame+=("${caller_line_number}")

        current_caller_info["line"]="${caller_line_number}"
        current_caller_info["lineno"]="${caller_line_number}"
        current_caller_info["line_number"]="${caller_line_number}"
    fi
    if [[ -v FUNCNAME[$caller_index] ]]; then
        caller_function_name="${FUNCNAME[$caller_index]}"
        current_caller_frame+=("${caller_function_name}")

        current_caller_info["function"]="${caller_function_name}"
        current_caller_info["function_name"]="${caller_function_name}"
        current_caller_info["name"]="${caller_function_name}"
        current_caller_info["type"]="function"
    else
        current_caller_info["name"]="${BASH_SOURCE[0]}"
        current_caller_info["function"]="body of ${BASH_SOURCE[0]}"
        current_caller_info["function_name"]="body of ${BASH_SOURCE[0]}"
        current_caller_info["type"]="shell"
    fi
    if [ -n "${printf_format}" ]; then
        local -- key=""
        local -- value=""
        local -- raw_value=""
        local -- regex=""
        for key in ${!current_caller_info[@]}; do
            regex="[\x24\x25][{]${key}[}]"
            raw_value="${current_caller_info[${key}]}"
            value="${raw_value//\//\\\/}"
            local -- ctx="key=${key@Q} raw_value=${raw_value@Q} value=${value@Q}"
            1>&2 echo -e "\r\x1b[0m\n\x1b[1;38;5;247m"
            1>&2 echo "ctx=${ctx}"
            1>&2 echo -e "\n"
            1>&2 echo "before \${printf_format}=${printf_format@Q}"
            printf_format="$(sed -E "s/${regex}/${value}/g" <<<"${printf_format}")"
            1>&2 echo -e "\n"
            1>&2 echo "after \${printf_format}=${printf_format@Q}"
        done
        echo "${printf_format}"
    fi

    1>&2 echo -e "\r\x1b[0m\n\x1b[1;38;5;220m<\${current_caller_info[@]}>\x1b[0m"
    value="${current_caller_info[@]@A}"
    1>&2 printf '\x1b[0m\x1b[1;38;5;233m\x1b[1;48;5;220m%-*s\x1b[0m\n' "${COLUMNS}" "${value}"
    for key in ${!current_caller_info[@]}; do
        value="${current_caller_info[${key}]}"
        1>&2 printf '\x1b[0m\x1b[1;38;5;233m\x1b[1;48;5;220m%s=%-*s\x1b[0m\n' "${key}" "${COLUMNS}" "${value}"
    done
    1>&2 echo -e "\r\x1b[0m\x1b[1;38;5;220m</\${current_caller_info[@]}>\x1b[0m"
}

# count_regex_groups() {
#     local -a argv=($@)
#     local -i argc=${#argv[@]}
#     local -- command='h;s/[^()]+//g;H;z;g;p'
#     local -a results=()
#     local -- result=""

#     if [ ! -t 0 ]; then
#         results=($(sed -E "${command}" < /dev/stdin))
#     elif [ ${argc} -eq 0 ]; then
#         1>&2 echo -e "[${FUNCNAME[0]}]" "no arguments and stdin is a tty"
#         return 1
#     else
#         results=($(printf '%s\n' ${argv[@]} | sed -E "${command}"))
#     fi
#     for result in ${results[@]}; do
#         1>&2 echo -e "${result}"
#     done
# }

terminal_get_width() {
    builtin shopt -s checkwinsize
    local -- extecho=""
    local -- extgetwidth=""
    local -i width=${COLUMNS}

    if [ ${width} -le 0 ]; then
        if extecho=$(type -P echo); then
            ${extecho} -en ""
            width=${COLUMNS}
        elif extgetwidth=$(which term-columns); then
            width=$(${extgetwidth})
        fi
    fi
    if [ ${width} -le 0 ]; then
        width=130
    fi

    echo "${width}"
}
terminal_fill_string() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -- value=""

    if [ ${argc} -eq 0 ]; then
        return 1
    fi
    value=$(sed -E 's/[\t\r\n]+//g' <<<"${argv[@]}")
    local -i length=${#value}
    local -i terminal_width=${COLUMNS}
    if [ ${terminal_width} -eq 0 ]; then
        terminal_width=$(terminal_get_width)
    fi
    if [ ${terminal_width} -gt 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "\${terminal_width} should be greater than 0 at this point"
        return 1
    fi

    local -i total_width=${terminal_width}
    local -i total_length=${terminal_width}
    if [ ${length} -gt 0 ]; then
        length=${terminal_width}
    fi

    # total_length=$(( length + (length % terminal_width) + (length / terminal_width) ))
    # total_length=$(( (length + ( length % terminal_width )) / terminal_width))
    total_length=$((((length + (length % terminal_width)) / terminal_width) * terminal_width))
    printf '%-*s\n' "${total_length}" "${value}"
}
terminal_get_minwidth_to_string_unchecked() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -- value=""

    if [ ${argc} -eq 0 ]; then
        return 0
    fi
    value="${argv[@]}"
    value="${value//$'\t'/}"
    value="${value//$'\r'/}"
    value="${value//$'\n'/}"
    local -i length=${#value}
    local -i terminal_width=${COLUMNS}
    if [ ${terminal_width} -eq 0 ]; then
        terminal_width=$(terminal_get_width)
    fi
    if [ ${terminal_width} -gt 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "\${terminal_width} should be greater than 0 at this point"
        return 1
    fi

    local -i total_width=${terminal_width}
    local -i total_length=${terminal_width}
    if [ ${length} -gt 0 ]; then
        length=${terminal_width}
    fi

    # total_length=$(( length + (length % terminal_width) + (length / terminal_width) ))
    # total_length=$(( (length + ( length % terminal_width )) / terminal_width))
    total_length=$((((length + (length % terminal_width)) / terminal_width) * terminal_width))
    printf '%-*s\n' "${total_length}" "${value}"
}

third_party() {
    target="${@}"
    mkpushd "${HOME}/projects/third_party/${target}"
}
alias 3=third_party

# work() {
#     target="${@}"
#     mkpushd "${HOME}/projects/work/${target}"
# }
# alias w=work

cdmkd() {
    local -- target="${@}"
    local -- backup_cdpath=""
    local -i cdpath_was_defined=0
    if [[ -v CDPATH ]] && [ -n "${CDPATH}" ]; then
        backup_cdpath="${CDPATH}"
        cdpath_was_defined=1
        unset CDPATH
    fi
    mkdir -p "${target}" && cd "${target}"
    if (( $cdpath_was_defined )); then
        export CDPATH="${backup_cdpath}"
    fi
}
pushdmkd() {
    local -- target="${@}"
    local -- backup_cdpath=""
    local -i cdpath_was_defined=0
    if [[ -v CDPATH ]] && [ -n "${CDPATH}" ]; then
        backup_cdpath="${CDPATH}"
        cdpath_was_defined=1
        unset CDPATH
    fi
    mkdir -p "${target}" && pushd "${target}"
    if (( $cdpath_was_defined )); then
        export CDPATH="${backup_cdpath}"
    fi
}
alias mkpushd="pushdmkd"

cd_opt_home_path() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- target=""
    if [ ${argc} -eq 0 ]; then
        target=$HOME/opt/libexec
    else
        for index in ${!argv[@]}; do
            current=$(($index + 1))
            arg="${argv[$index]}"
            case "${arg}" in
                libexec)
                    target="$HOME/opt/libexec"
                    ;;
                lib)
                    target="$HOME/opt/lib"
                    ;;
                ~ | root)
                    target="$HOME/opt"
                    ;;
                *)
                    target="$HOME/opt/libexec"
                    ;;
            esac
        done
    fi
    local -- rgb="211;215;207m"
    1>&2 echo -e "\x1b[1;38;2;${rgb}${target}\x1b[0m"
    1>/dev/random 2>/dev/random pushd "${target}"
}
alias ~libexec="cd_opt_home_path libexec"
alias ~opt-libexec="cd_opt_home_path libexec"
alias ~opt-lib="cd_opt_home_path lib"
alias ~lib="cd_opt_home_path lib"
alias ~opt~="cd_opt_home_path root"
alias ~opt="cd_opt_home_path libexec"

cd_emacs_d_home_path() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- target=""
    if [ ${argc} -eq 0 ]; then
        target=$HOME/opt/libexec
    else
        for index in ${!argv[@]}; do
            current=$(($index + 1))
            arg="${argv[$index]}"
            case "${arg}" in
                c)
                    target="$HOME/.emacs.d/c"
                    ;;
                ~ | root)
                    target="$HOME/.emacs.d"
                    ;;
                *)
                    target="$HOME/.emacs.d/c"
                    ;;
            esac
        done
    fi
    local -- rgb="211;215;207m"
    1>&2 echo -e "\x1b[1;38;2;${rgb}${target}\x1b[0m"
    1>/dev/random 2>/dev/random pushd "${target}"
}

alias ~emacs.d="cd_emacs_d_home_path"
alias ~emacs="cd_emacs_d_home_path c"
alias ~emacs.d.c="cd_emacs_d_home_path c"

cd_shell_d_home_path() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -- target=""
    if [ ${argc} -eq 0 ]; then
        target=$HOME/.shell.d
    else
        for index in ${!argv[@]}; do
            current=$(($index + 1))
            arg="${argv[$index]}"
            case "${arg}" in
                x | x.d)
                    target="$HOME/.shell.d/x.d"
                    ;;
                *)
                    target="$HOME/.shell.d"
                    ;;
            esac
        done
    fi
    local -- rgb="211;215;207m"
    1>&2 echo -e "\x1b[1;38;2;${rgb}${target}\x1b[0m"
    1>/dev/random 2>/dev/random pushd "${target}"
}
alias ~shell="cd_shell_d_home_path"
alias ~shellxd="cd_shell_d_home_path x.d"
alias ~shell-d="cd_shell_d_home_path"
alias ~shell.d="cd_shell_d_home_path"
alias ~shell_d="cd_shell_d_home_path"
alias ~shell-d="cd_shell_d_home_path"
alias ~shell.x.d="cd_shell_d_home_path x.d"
alias ~shell.d.x.d="cd_shell_d_home_path x.d"
alias ~shell.x="cd_shell_d_home_path x.d"

k() {
    #set +x
    if [ -n "$*" ]; then
        1>&2 echo "unexpected arguments: \"$*\""
        return 1
    fi
    echo -e '\x1b[0m\x1b]1337;ClearCapturedOutput\a\x1b]1337;ClearScrollback\a\x1b[0m'
    tput clear
    echo -e "\x1b[2J\x1b[3J\x1b[H"
    reset
    export PS1_VARIANT=""
}

cls() {
    builtin history -a
    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
}

clsreset() {
    cls
    reset
}

K() {
    if [ -n "$*" ]; then
        1>&2 echo "unexpected arguments: \"$*\""
        return 1
    fi
    history_clear_and_disable
    history_enable_and_read
}

c() {
    if [ ! -f Cargo.toml ]; then
        return 1
    fi
    k
    if [ ${#@} -gt 0 ]; then
        if [ "$1" == "a" ]; then
            cargo cbt --all-targets && cargo cbt --release --all-targets
            return $?
        else
            cargo $@
            return $?
        fi
    else
        cargo c
        return $?
    fi
}
t() {
    # export RUSTFLAGS="-C opt-level=3 -C debuginfo=0 -Zmacro-backtrace"
    if [ ! -f Cargo.toml ]; then
        return 1
    fi
    local -a __t__argv=($@)
    local -a __t__argc=${#__t__argv}
    local -a __t__argv_index=($(seq 0 $(($__t__argc))))
    local -a __t__features=()
    local -a __t__args=()
    # declare -a __t__args=( "--all-features" );
    for index in ${__t__argv_index[@]}; do
        arg="${__t__argv[$index]}"
        if [ $index -gt 0 ]; then
            prev_arg="${__t__argv[$(($index - 1))]}"
        else
            prev_arg=""
        fi
        next_arg="${__t__argv[$(($index + 1))]}"
        case "$arg" in
            "-a")
                __t__args+=("--all-features")
                ;;
            "-f" | "--feature")
                if [ -z "${next_arg}" ]; then
                    1>&2 echo "unexpected empty argument for '${arg}'"
                    return 1
                else
                    __t__args+=("--feature=${next_arg}")
                fi
                ;;
        esac
    done
    k
    cargo test --offline -j 1 --color always ${__t__args[@]} -- --nocapture --color always --test-threads 1

}
tt() {
    # export RUSTFLAGS="-C opt-level=3 -C debuginfo=0 -Zmacro-backtrace"
    if [ ! -f Cargo.toml ]; then
        return 1
    fi
    local -a __t__argv=($@)
    local -a __t__argc=${#__t__argv}
    local -a __t__argv_index=($(seq 0 $(($__t__argc))))
    local -a __t__features=()
    local -a __t__args=()
    # declare -a __t__args=( "--all-features" );
    for index in ${__t__argv_index[@]}; do
        arg="${__t__argv[$index]}"
        if [ $index -gt 0 ]; then
            prev_arg="${__t__argv[$(($index - 1))]}"
        else
            prev_arg=""
        fi
        next_arg="${__t__argv[$(($index + 1))]}"
        case "$arg" in
            "-a")
                __t__args+=("--all-features")
                ;;
            "-f" | "--feature")
                if [ -z "${next_arg}" ]; then
                    1>&2 echo "unexpected empty argument for '${arg}'"
                    return 1
                else
                    __t__args+=("--feature=${next_arg}")
                fi
                ;;
        esac
    done
    k
    cargo test -j 1 --color always ${__t__args[@]} -- --nocapture --color always --test-threads 1

}
n() {
    export RUSTFLAGS="-C opt-level=3 -g -Zmacro-backtrace"
    if [ ! -f Cargo.toml ]; then
        return 1
    fi
    k
    cargo n $*
}
r() {
    if [ ! -f Cargo.toml ]; then
        return 1
    fi
    k
    # export RUSTFLAGS="-C opt-level=3 -g -Zmacro-backtrace"
    unset RUSTFLAGS
    cargo r $*
}
q() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    git q ${argv[@]}
}
x() {
    clsreset
    export PS1_VARIANT=x
    mkpushd ~/*scratch*/.x/
}

####cbt() {
####    if [ -n "${IFS@A}" ]; then
####        local -- declare_IFS="${IFS@A}"
####    else
####        local -- declare_IFS=""
####    fi
####
####    # export IFS=$'\n'
####    unset IFS
####    local -a cargo_subcommands=(
####        "check"
####        "build"
####        "test"
####    )
####    local -A subcommand_fg_colors=(
####        ["check"]=231
####        ["build"]=220
####        ["test"]=154
####    )
####    if [ ! -f Cargo.toml ]; then
####        if [ -n "${declare_IFS}" ] && 1>/dev/random 2>/dev/random ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' <<<"${declare_IFS}"; then
####            eval "${declare_IFS}"
####        fi
####        return 1
####    fi
####    for cargo_subc in ${cargo_subcommands[@]}; do
####        local -a cargo_call=(cargo "${cargo_subc}" "--offline")
####        if ! ${cargo_call[@]}; then
####            exit_code=$?
####            fg_color="${subcommand_fg_colors[$cargo_subc]}"
####            1>&2 echo -e "command \x1b[1;38;5;${fg_color}m${cargo_subc}\x1b[0m failed with status ${exit_code}: \x1b[1;38;5;202m${cargo_call[@]}\x1b[0m"
####            if [ -n "${declare_IFS}" ] && 1>/dev/random 2>/dev/random ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' <<<"${declare_IFS}"; then
####                eval "${declare_IFS}"
####            fi
####            return $exit_code
####        fi
####    done
####
####    if [ -n "${declare_IFS}" ] && 1>/dev/random 2>/dev/random ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' <<<"${declare_IFS}"; then
####        eval "${declare_IFS}"
####    fi
####    return $?
####}
####q() {
####    if [ ! -f Cargo.toml ]; then
####        return 1
####    fi
####    k
####    cargo q $*
####}
####x() {
####    clsreset
####    export PS1_VARIANT=x
####    cdmkd ~/*scratch*/.x/
####}
####l() {
####    local -- arg="${arg}"
####    if [ -z "${arg}" ]; then
####        l ~/.shell.d/0000101-functions.sh
####    elif [ ! -e "${arg}" ]; then
####        case "${arg}" in
####            "f" | "-f")
####                l ~/.shell.d/0000101-functions.sh
####                ;;
####            "e" | "-e")
####                l ~/.shell.d/0000110-env.sh
####                ;;
####            "h" | "-h")
####                l ~/.shell.d/x.d/history.sh
####                ;;
####            "ansi")
####                l ~/opt/lib/ansi.sh
####                ;;
####            "a" | "-a")
####                l ~/.shell.d/entrypoint.sh
####                ;;
####            "c" | "-c" | "--completions" | "--autocomplete" | "--auto-complete" | "--complete")
####                l ~/opt/lib/completions.sh
####                ;;
####            "t" | "-t" | "--tools" | "tools")
####                l ~/opt/lib/tools.sh
####                ;;
####            *)
####                1>&2 cat <<EOF
####USAGE: ${FUNCNAME[0]} [path] | [FLAG]
####EOF
####                ;;
####        esac
####    fi
####}
####

tn() {
    unset RUSTFLAGS
    unset RUST_BACKTRACE
    t $*
}
t1() {
    export RUSTFLAGS="-C opt-level=0 -g -Zmacro-backtrace"
    export RUST_BACKTRACE=1
    t $*
}
tfull() {
    export RUSTFLAGS="-C opt-level=0 -g -Zmacro-backtrace"
    export RUST_BACKTRACE=full
    t $*
}

craft() {
    set +e
    if path=$(cargo craft --script $*); then
        name=$(basename "$path")
        if [ -d "${path}/src" ]; then
            old_manifest_bin_entry_regex="[.]/${name}.rs"
            new_manifest_bin_entry="src/main.rs"
            old_main_path="${path}/${name}.rs"
            new_main_path="${path}/src/main.rs"
            if [ -f "${old_main_path}" ]; then
                (cd "${path}" && git commit -am 'save current state')
                mv -fv "${old_main_path}" "${new_main_path}"
                refactors "${old_main_path}" "${new_main_path}" -wp "${path}/Cargo.toml"
            fi
        fi
    else
        code=$?
        if [ ${code} -eq 0 ]; then
            code=101
        fi
        return $code
    fi
}

# __string_seems_git__() {
#     if echo "$@" | 1>/dev/random 2>/dev/null grep '^\(https\?\|git\)\(://\|@\)\([^/]\+\)\(.*\)\([.]git\)\?$'; then
#         return 0
#     else
#         return 1
#     fi
# }
gc3() {
    #set -x
    . ~/opt/lib/ansi.sh
    set +ue
    export IFS=$'\n'
    repo=""
    local -a argv=($@)
    local -- argc=$((${#argv} + 0))
    local -a git_argv=()
    repo_url=""
    default_target_path="$HOME/projects/third_party"
    target_path="$default_target_path"
    local -- argv_array_items="$(echo -n "${argv[@]}" | tr '[:space:]' ',')"
    for idx in ${!argv[@]}; do
        nidx=$(($idx + 1))
        arg=${argv[$idx]}
        next_arg=${argv[$nidx]}
        if [ -n "${next_arg}" ] && 1>/dev/random 2>/dev/random printf "%d" "${next_arg}"; then
            next_arg_num=$(("${next_arg}"))
        fi
        case "$arg" in
            "--help" | "help")
                echo -e 'NAME
    gc3 - git-clones third-party

SYNOPSIS
    gc3 [-d|--depth] [-b|--backup] [-n|--namespace] <URL>

DESCRIPTION

    shallow clones git repository inside of ~/projects/third_party and
    automatically tries to build the project, run tests, code examples
    and/or open the documentation of the project in the target git
    repository.

    (currently supports rust, nodejs and golang projects and works best in rust projects)

    Options:

      -n, --namespace
          places the git repository inside of `$HOME/projects/third_party/<REPOSITORY OWNER>/<REPOSITORY NAME>\x27
          instead of the default ($HOME/projects/third_party/<REPOSITORY NAME>)

      -d, --depth <NUMBER>
          if this option is provided, the <NUMBER> value must be
          an unsigned, non-zero number which is then forwarded to the corresponding `--depth\x27 option in the
          underlying git command (.i.e.: `git clone --depth <GIT_REMOTE_URL>\x27)

          Default value: 1

      -b, --backup
          by default gc3 skips cloning a git repository if the target
          path in the filesystem already exists, however, if this
          option is specified then an existing target path is
          backed-up and a new copy of the target repo is cloned there.
'
                return 0
                ;;
            "-d" | "--depth")
                if [ -n "${next_arg_num}" ]; then
                    depth=$next_arg_num
                else
                    error_function "missing numeric value of --depth argument on position ${nidx} of [${argv_array_items}]"
                    return 1
                fi
                git_argv+=("--depth" "${depth}")
                ;;
            "-b" | "--backup")
                backup="true"
                ;;
            "-n" | "--namespace")
                if [ -z "$target_path" ] || [ "${target_path}" == "${default_target_path}" ] || [ -e "$target_path" ]; then
                    target_path="${default_target_path}/${owner_name}"
                else
                    error_function "target_path already set to: ${target_path}"
                    return 1
                fi
                ;;
            *)
                if 2>/dev/random 1>/dev/random grep '^\(https\?\|git\)\(://\|@\)\([^/]\+\)\(.*\)\([.]git\)\?$' <<<"${arg}"; then
                    if [ -z "$repo" ]; then
                        repo="$arg"
                        repo_url="$arg"
                    else
                        error_function "repo already set to: ${repo@Q}"
                        return 1
                    fi
                else
                    1>&2 bar_text_left 231 196 "${arg@Q} does not seem to be a git repo address"
                    return 1
                fi
                ;;
        esac
    done
    if [ -z "$repo" ]; then
        clipboard="$(pbpaste)"
        if 2>/dev/random 1>/dev/random grep '^\(https\?\|git\)\(://\|@\)\([^:/]\+\)\(.*\)\([.]git\)\?$' <<<"${clipboard}"; then
            repo="${clipboard}"
        fi
    fi
    if [ -z "$repo" ]; then
        bar_text_left 231 196 "ERROR: missing git repo url"
        return 1
    fi
    repo="$(sed 's/git@\([^:]\+\):/https:\/\/\1\//g' <<<"${repo}")"
    repo="$(sed 's/\(^"\+\|"\+$\)//g' <<<"${repo}")"
    repo="$(sed "s/\(^'\+\|'\+$\)//g" <<<"${repo}")"
    gits="$(sed 's/^\(\(https\?:\/\/\|git@\|git:\/\/\)[^[:space:]]\+\([.]git\)\?\)$/gitrepo/g' <<<"$repo")"

    if 2>/dev/random 1>/dev/random grep "https://crates.io/crates/" <<<"${repo}"; then
        crate_name=$(echo "$repo" | sed 's/^\s*https:\/\/crates[.]io\/crates\/\+\([^\/?]\+\).*/\1/g')
        bar_text_left 82 16 "crate name: ${crate_name}"
        if ! repo=$(crates_io_get_git_repo_url "${crate_name}"); then
            bar_text_left 231 196 "ERROR: failed to fetch json from ${crates_api_url}"
            return 1
        fi
    elif 2>/dev/random 1>/dev/random grep "https://docs[.]rs/[a-z_-]\+" <<<"${repo}"; then
        crate_name=$(echo "$repo" | sed 's/^\s*https:\/\/docs[.]rs\/\+\([^\/?]\+\).*/\1/g')
        bar_text_left 82 16 "crate name: ${crate_name}"
        if ! repo=$(crates_io_get_git_repo_url "${crate_name}"); then
            bar_text_left 231 196 "ERROR: failed to fetch json from ${crates_api_url}"
            return 1
        fi
    fi
    if 1>/dev/random 2>/dev/random grep '[a-z0-9_+-]\+@' <<<"${repo}"; then
        repo="$(echo -n "$repo" | tr -d '[:space:]' | sed 's/\/\?\([.]git\)\?$//g' | sed 's/\(https:\/\/[^?]\+\)[?].*$/\1/g' | sed 's/git@[^:]\+://g')"
    else
        repo="$(echo -n "$repo" | tr -d '[:space:]' | sed 's/\/\?\([.]git\)\?$//g' | sed 's/\(https:\/\/[^?]\+\)[?].*$/\1/g')"
    fi

    owner_name="$(sed 's/^\(https:\/\/\|git:\/\/\|git@\)[^\/:]\+:\?\/\([^\/]\+\)\/\([^\/]\+\)/\2/g' <<<${repo})"
    repo_name="$(sed 's/^\(https:\/\/\|git:\/\/\|git@\)[^\/:]\+:\?\/\([^\/]\+\)\/\([^\/]\+\)/\3/g' <<<${repo})"
    # echo "owner_name=${owner_name@Q}";
    # echo "repo_name=${repo_name@Q}";

    if [ ${#git_argv} -eq 0 ]; then
        git_argv+=("--depth" "1")
    fi

    if [ -z "${repo_name}" ]; then
        bar_text_left 231 196 "ERROR: could not determine repo name from url: ${repo@Q}"
        return 1
    fi
    if [ -z "${owner_name}" ]; then
        bar_text_left 231 196 "ERROR: could not determine owner name from url: ${repo@Q}"
        return 1
    fi

    if [ "$gits" != "gitrepo" ]; then
        bar_text_left 231 196 "ERROR: invalid git repo url: ${repo_url@Q}"
        return 1
    fi

    tput clear
    mkdir -p "$target_path"
    target_repo_path="${target_path}/$repo_name"
    if [ -e "$target_repo_path" ]; then
        if [ "${backup}" == "true" ]; then
            mv "$target_repo_path" "$target_path/${repo_name}-$(t16g)"
        else
            bar_text_center 101 16 "into existing ${target_repo_display}"
        fi
    else
        bar_text_center 121 16 "cloning ${repo_name} to \x1b[1;38;5;233m${target_repo_path}"
        git clone "${repo}.git" ${git_argv[@]} "$target_repo_path"
    fi
    cd "$target_repo_path"
    ls -latrh
    if [ -f ".gitmodules" ]; then
        git submodule init
        git submodule update
    fi
    if [ -f "Cargo.toml" ]; then
        if [ -f "rust-toolchain.toml" ]; then
            sed 's/channel\s*=\s*"[^"]\+"/channel = "nightly-2025-09-09"/g' -i rust-toolchain.toml
        fi
        if [ -d "examples" ]; then
            varname="${repo_name//-/_}_path"
            varname="${varname@L}"
            cat >cargo-run-examples.sh <<EOF
#!/usr/bin/env bash

. \$HOME/opt/lib/ansi.sh

ctrlc() {
    echo -e "\r"
    ansi_up
    bar_text_left 196 231 "Cancelled with Control-C"
    reset
    2>/dev/null 1>/dev/null stty sane
    exit 1
}
trap ctrlc int

${varname}="${target_repo_path}"

bar 235
failed=""
for example in \$(2>/dev/null wc -l \${${varname}}/examples/*.rs | sort -n | grep -v 'total\$' | lastcol | xargs-each basename); do
    example=\${example/%.rs/}
    bar_text_left 222 233 "cargo run --example \${example}"
    if ! cargo run --example \${example}; then
        if [ -z "${failed}" ] || [ "${failed}" != "false" ]; then
            rm -rf target
            break
        else
            failed="true"
        fi
    else
        bar_text_left 222 233 "\$(ansi_spaced 233 222 "FINISHED")\$(ansi_spaced 222 233 "cargo run --example \${example}")"
        failed="false"
    fi
done

EOF

            chmod +x cargo-run-examples.sh
            ./cargo-run-examples.sh
        elif [ -f "src/main.rs" ] || [ $(ack '[[]bin[]]' Cargo.toml | wc -l) -gt 0 ]; then
            bar_text_left 222 233 "cargo run # (${target_repo_path})"
            if ! cargo run; then
                rm -rf target
            else
                bar_text_left 222 233 "$(ansi_spaced 233 222 "FINISHED")$(ansi_spaced 222 233 "cargo run")"
            fi
        elif [ $(ack '[[]workspace[]]' Cargo.toml | wc -l) -gt 0 ]; then
            bar 235
            failed=""
            for bin_name in $(find . -type f -name Cargo.toml -exec bash -c 'test -f $(dirname {})/src/main.rs && grep "^[[:space:]]*name\s*=\s*" {} | sed "s/^name\s*=\s*\"\([^\"]\+\)\".*/\1/g"' \;); do
                bar_text_left 222 233 "cargo run --bin ${bin_name} # (${target_repo_path})"
                if ! cargo run --bin ${bin_name}; then
                    if [ -z "${failed}" ] || [ "${failed}" != "false" ]; then
                        rm -rf target
                        break
                    else
                        failed="true"
                    fi
                else
                    bar_text_left 222 233 "$(ansi_spaced 233 222 "FINISHED")$(ansi_spaced 222 233 "cargo run --bin ${bin_name}")"
                    failed="false"
                fi
            done
        else
            bar_text_center 154 235 "running cargo cbt"
            cargo cbt
        fi
        if web_browser_is_open; then
            cargo doc --open
        else
            cargo doc
        fi
    fi
    if [ -f "package.json" ]; then
        bar_text_left 154 235 'package.json detected'

        node_run_command=(npm run)
        if [ -f "package-lock.json" ]; then
            npm i
            node_run_command=(npm run)
        elif [ -f "yarn-lock.json" ]; then
            yarn
            node_run_command=(yarn)
        elif [ -f "pnpm-lock.json" ]; then
            pnpm i
            node_run_command=(pnpm)
        fi
        local -a script_names=($(jq '.scripts | keys[]' package.json | ansistrip | tr -d '"'))
        local -a autorun_build=()
        local -a autorun_script_names=()

        if [ ${#script_names[@]} -gt 0 ]; then
            echo -e "\x1b[1;38;5;159mpackage.json scripts\x1b[0m"
            fgcolor=159
            for script_name in ${script_names[@]}; do
                case "${script_name}" in
                    "build" | "compile")
                        autorun_build+=("${script_name}")
                        fgcolor=220
                        ;;
                    "dev" | "start" | "start:dev" | "dev:start")
                        autorun_script_names+=("${script_name}")
                        fgcolor=154
                        ;;
                    *)
                        fgcolor=159
                        ;;
                esac
                echo -e "    \x1b[1;38;5;${fgcolor}m${node_run_command[@]} ${script_name}\x1b[0m"
            done
            for script_name in ${autorun_build[@]}; do
                fgcolor=220
                echo -e "\x1b[1;38;5;${fgcolor}m${node_run_command[@]} ${script_name}\x1b[0m"
                ${node_run_command[@]} ${script_name}
            done
            for script_name in ${autorun_script_names[@]}; do
                fgcolor=154
                echo -e "\x1b[1;38;5;${fgcolor}m${node_run_command[@]} ${script_name}\x1b[0m"
                ${node_run_command[@]} ${script_name}
            done
        fi
    fi
    if [ -f "go.mod" ]; then
        go_version=$(2>/dev/random go version)
        go_version=${go_version/#go version go/}
        go_version=${go_version/% */}
        if [ -n "${go_version}" ]; then
            go build .
        fi
    fi
}

export IFS="
"
rf() {
    #set -x
    export RUSTFLAGS="-C opt-level=0 -g -Zmacro-backtrace"
    export RUST_BACKTRACE=1
    #set +x
}
ro() {
    #set -x
    unset RUSTFLAGS
    unset RUST_BACKTRACE
    #set +x
}
ssh_ag() {
    2>/dev/random 1>/dev/random g p -r ssh -k
    eval "$(ssh-agent)"
    ssh-add -k
    ssh-add ~/.ssh/id_gafagomo
    ssh-add ~/.ssh/gabrielteratos@gmail.com
}
alias ssh-ag=ssh_ag

spawn_wezterm_cli() {
    if [ -n "$(ps aux | ack -i 'wezterm[.]app' | ack -v ack)" ]; then
        wezterm cli spawn ${@}
    else
        echo "wezterm cli spawn ${@}"
    fi
}

ordinal() {
    unset IFS
    local -a ord_argv=($@)
    local -i ord_argc=${!ord_argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -a numbers=()
    local -- ord=""

    if [ ${ord_argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]}:${LINENO[0]}]" "missing arguments"
        exit 1
    fi

    for index in ${!ord_argv[@]}; do
        current=$(($index + 1))
        arg="${ord_argv[$index]}"
        #arg="$(sed -E 's/(^\s*|\s*$)' <<< "${ord_argv[$index]}")"
        if 1>/dev/random 2>/dev/random grep -E '^\s*[0-9]+\s*$' <<<"${arg}"; then
            numbers+=("${arg}")
        fi
    done

    for no in ${numbers[@]}; do
        ord=$(ord_num $no)
        printf '%d%s\n' "${no}" "${ord}"
    done
}

ord_num() {
    local -i number=$(($1))
    local -i abs=${number#-}
    local -i last_two=$((${abs} % 100))
    local -i last_digit=$((${abs} % 10))
    case "${last_two}" in
        11 | 12 | 13)
            echo "th"
            return
            ;;
    esac
    case "${last_digit}" in
        1)
            echo "st"
            return
            ;;
        2)
            echo "nd"
            return
            ;;
        3)
            echo "rd"
            return
            ;;
        *)
            echo "th"
            return
            ;;
    esac
}
mute_shell_command() {
    local -a msc_argv=($@)
    local -i msc_argc=${!msc_argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""

    if [ ${msc_argc} -eq 0 ]; then
        1>&2 echo -e "[${BASH_SOURCE[0]}:${BASH_LINENO[0]}]" "missing arguments"
        exit 1
    fi

    for index in ${!msc_argv[@]}; do
        current=$(($index + 1))
        arg="${msc_argv[$index]}"
        case "${arg}" in
            -h | --help)
                1>&2 echo -e "HELP"
                ;;
            *) ;;
        esac
    done

    grep -E '^\s*[0-9]+\s*$' <<<"${arg}"
}
crates_io_get_git_repo_url() {
    local -a argv=($@)
    local -- argc=${#argv[@]}
    case ${argc} in
        1)
            crate_name="$1"
            ;;
        0)
            1>&2 echo "crates_io_get_git_repo_url missing argument: <CRATE-NAME>"
            ;;
        *)
            local -- args_list="$(sed "s/\s\+/'/g" <<<"${argv[@]}")"
            1>&2 echo "crates_io_get_git_repo_url too many arguments: ${args_list@Q}"
            return 1
            ;;
    esac
    json_path=$(pwd)/.${crate_name}
    crates_api_url="https://crates.io/api/v1/crates/${crate_name}"
    if repo=$(2>/dev/random /usr/bin/curl -s ${crates_api_url} | jq .crate.repository | tr -d '"'); then
        echo "${repo}"
    else
        bar_text_left 231 196 "ERROR: failed to fetch json from ${crates_api_url}"
        return 1
    fi
}

notes() {
    cd $NOTES_ROOT
}
reverse_indexed_array_by_reference() {
    local -- array_name="$1"
    if [ -z "${array_name}" ]; then
        return
    fi
    local -I -n array="${array_name}"
    local -i length=${#array[@]}
    if [ ${length} -eq 0 ]; then
        return
    fi
    local -i rev_index=0
    local -i index=0
    local -- item=""
    for rev_index in ${!array[@]}; do
        local -i index=$((${length} - ${rev_index}))
        local -- item=${array[$index]}
        echo "${item}"
    done
}
reverse_indexed_array_by_ifs_fields() {
    local -a array=($@)
    local -i length=${#array[@]}
    if [ ${length} -eq 0 ]; then
        return
    fi
    local -i rev_index=0
    local -i index=0
    local -- item=""
    for rev_index in ${!array[@]}; do
        local -i index=$((${length} - ${rev_index}))
        local -- item=${array[$index]}
        echo "${item}"
    done
}

state() {
    date_dirname=$(date +"%Y-%m-%d")
    time_dirname=$(date +"%H-%M-%S-%Z")
    state_dir_location=${HOME}/state/${date_dirname}/${time_dirname}
    readme_location=${state_dir_location}/README.rst
    title="STATE $(date +"%Y/%m/%d %H:%M:%S %Z")"
    undertitle=$(sed 's/./~/g' <<<"${title}")
    h1="${title}\n${undertitle}"
    mkdir -p "${state_dir_location}"
    echo -e "${h1}\n\n::\n   ${state_dir_location}\n\n" >${readme_location}
    cd "${state_dir_location}"
    git init
    git add README.rst
    git commit -am "${title}"
}

st() {
    status
}
# stty sane

describe_set() {
    local -- flag=""
    local -- desc=""
    local -A descriptions=()
    for help_line in $(help set | grep '^[[:space:]]\+[-][[:alpha:]][[:space:]]'); do
        flag=$(sed 's/^[[:space:]]\+[-]\([[:alpha:]]\)[[:space:]]\+\(.\+\)$/\1/g' <<<"${help_line}")
        desc=$(sed 's/^[[:space:]]\+[-]\([[:alpha:]]\)[[:space:]]\+\(.\+\)$/\2/g' <<<"${help_line}")
        if [ -n "${flag}" ] && [ -n "${desc}" ]; then
            descriptions+=(["${flag}"]="${desc}")
        else
            1>&2 echo -e "failed to parse flag from ${help_line@Q}"
            break
        fi
    done
    local -- flags="${-}"
    local -- count=${#flags}
    local -a unknown_flags=()
    local -a explained_flags=()

    for index in $(seq $(($count - 1))); do
        curr=$(($index + 1))
        flag="${flags:${index}:1}"
        desc="${descriptions[${flag}]}"
        if [ -n "${desc}" ]; then
            explained_flags+=("flag ${flag@Q} - ${desc}")
            # echo "[${curr}/${count}] flag ${flag@Q} - ${desc}"
        else
            unknown_flags+=("${flag}")
            # 1>&2 echo -e "[${curr}/${count}] failed to get description of flag ${flag@Q}"
        fi
    done
    local -- explained_count=${#explained_flags[@]}
    local -- unknown_count=${#unknown_flags[@]}
    if [ ${explained_count} -gt 0 ] && [ ${unknown_count} -gt 0 ]; then
        echo -e "bash variable \${-} has ${explained_count} flags explained in \`help set\` but ${unknown_count} flags are unknown\n"
        echo -e "explained in \`help set\`:"
        for expl in ${explained_flags[@]}; do
            echo "    ${expl}"
        done
        echo -e "\nunknown flags:"
        for unknown in ${unknown_flags[@]}; do
            echo "    ${unknown}"
        done
    elif [ ${explained_count} -gt 0 ] && [ ${unknown_count} -eq 0 ]; then
        echo -e "bash variable \${-} has ${explained_count} flags explained in \`help set\`:"
        for expl in ${explained_flags[@]}; do
            echo "    ${expl}"
        done
    else
        echo -e "all flags in bash variable \${-} are unknown\n"
        for unknown in ${unknown_flags[@]}; do
            echo "    ${unknown}"
        done
    fi
}

web_browser_processes() {
    local -A web_browser_processes_by_pid=($(ps aux | ack -i '(Google\s*Chrome|Firefox|Ladybug|Helium)[.]app' | ack -v ack | ack "^${USER}\s+(\d+)" | sed -n "s/^${USER}\s\+\([0-9]\+\)\s\+.*[0-9]\s\+\(\/[A-Za-z0-9].\+\)/[\1]=\"\2\"/gp"))
    for pid in ${!web_browser_processes_by_pid[@]}; do
        command_string=${web_browser_processes_by_pid[${pid}]}
        echo -e "${pid}\t${command_string}"
    done
}

web_browser_is_open() {
    if [ -n "$(web_browser_processes | tr -d '[:space:]')" ]; then
        return 0
    else
        return 1
    fi
}

get_prog_type() {
    unset IFS
    local -- progname="$1"
    if [ -z "${progname}" ]; then
        1>&2 echo -e "[progtype] missing argument <PROGNAME>"
        return 1
    fi
    local -- regex_not='[^]a-z0-9!*%^@[-]'
    local -- regex_yes='[]a-z0-9!*%^@[-]'
    local -- sed_regex="(${regex_yes}*)(${regex_not}+)(${regex_yes}*)"
    local -- sed_repl='\1\x1b[1;38;5;196m\2\x1b[0m\3'
    local -a invalid_chars=(
        $(sed -n -E "s/${sed_regex}/\2/gp" <<<"${progname}")
    )
    local -- printout="$(sed -n -E "s/${sed_regex}/${sed_repl}/gp" <<<"${progname}")"

    if [ ${#invalid_chars[@]} -gt 0 ]; then
        1>&2 echo -e "[progtype] invalid chars in progname ${printout}"
        return 1
    fi
    if [ -n "$(alias | cut -d= -f1 | grep -E "^${progname}\$")" ]; then
        echo "alias"
        return
    fi
    local -- functionname=""
    if functionname=$(sed -n -E 's/^(declare\s+[-]f\s+)(.+)$/\x1b[1;38;5;237m\1\x1b[0m\2/gp' <<<"${progname}"); then
        echo "function"
        return
    fi

    if progpath=$(which "${progname}"); then
        echo "executable"
        return
    fi
    1>&2 echo -e "[progtype] cannot determine type of ${progname}"
    return 1
}

hist_regexp_for_entry_ids() {
    unset IFS
    local -a argv=( ${@} );
    local -A entry_ids_unique=( );
    local -A argv_errors_by_index=( );
    local -a entry_ids=( );
    local -i id=-1;
    local -i entry=-1;
    local -i index=0;
    local -- arg="";
    local -- raw="";
    local -- value="";
    local -- pos="";
    local -i current=0;
    local -i argc=${#argv[@]};
    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "missing entry id argument(s)"
        return 1
    fi
    for index in ${!argv[@]}; do
        raw="${argv[${index}]}"
        arg="${raw#+}"
        pos="$(printf '%-*s of %s' ${#argc} $((index + 1)) ${argc})"
        if [[ "${arg}" =~ ^([+])([1-9][0-9]*)$ ]]; then
            continue
        elif [[ "${arg}" =~ ^([-])([1-9][0-9]*)$ ]]; then
            argv_errors_by_index["${index}"]="negative number: ${arg@Q}"
            continue
        elif [[ "${arg}" =~ ^([0-9]+)$ ]]; then
            argv_errors_by_index["${index}"]="negative number: ${arg@Q}"
            continue
        elif [[ "${arg}" =~ ^([^0-9+-][^0-9]+|[^0-9]+)$ ]]; then
            argv_errors_by_index["${index}"]="not a number: ${arg@Q}"
            return 1
    fi

        if [[ -v entry_ids_unique["${arg}"] ]]; then
            # skipping duplicate entry_id
            entry_ids_unique["${arg}"]="${arg}"
            continue
        fi

    done
    # entry ids are unsigned numbers but argument ${pos} is:
    # 1>&2 echo -e "[${FUNCNAME[0]} error]"

    export IFS=$'|'
    local -r entry_ids_regexp_group="($(echo -e "${entry_ids[*]}"))"
    export IFS='\n'
    local -r hist_time_entry_regexp="^\s*${entry_ids_regexp_group}\s*${hist_time_regexp_timestamp_tz_no_entry_id}"

}

history_entry_ids() {
    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    local -A unique_keys=()
    local -a entry_ids=()
    export IFS=$'\n'
    unique_keys=($(history | sed -n -E "s/${hist_time_regexp_timestamp_tz}/\n\1\n/gp" | grep -E '^\s*[0-9]+\s*$' | sed -E 's/(^\s+|\s+$)//g'))
    entry_ids=($(echo "${!unique_keys[*]}" | sort -un))
    echo "${entry_ids[*]}"
}
history_length() {
    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    local -- length=0
    length=$(history | sed -n -E "s/${hist_time_regexp_timestamp_tz}/\1/gp" | wc -l)
    echo $((length + 1))
}
history_entries() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -- arg=""
    local -ar history_entry_ids=($(history_entry_ids))
    local -ir history_len=${#history_entry_ids[@]}
    local -ir history_last_entry_index=$((history_len - 1))
    local -ir first_entry_id=${history_entry_ids[0]}
    local -ir last_entry_id=${history_entry_ids[${history_last_entry_index}]}
    local -a entry_ids=()
    local -i entry_id=-1

    if [ ${argc} -eq 0 ]; then
        entry_id=${last_entry_id}
    else
        for index in ${!argv[@]}; do
            arg="${argv[${index}]}"
            pos="$(printf '%*s of %s' ${#argc} $((index + 1)) ${argc})"
            if [[ ! "${arg}" =~ ^[0-9]+$ ]]; then
                1>&2 echo -e "[${FUNCNAME[0]} error]" "argument ${pos} is invalid (not a positive number): ${arg@Q}"
                continue
            else
                entry_ids+=("${arg}")
            fi
        done
    fi
    export IFS=$'|'
    local -r entry_ids_regexp_group="($(echo -e "${entry_ids[*]}"))"
    export IFS='\n'
    local -r hist_time_entry_regexp="^\s*${entry_ids_regexp_group}\s*${hist_time_regexp_timestamp_tz_no_entry_id}"

    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    local -- length=0
    local -a entry_lines=()
    local -- history_output='';
    local -- filtered_hist_output='';
    local -- stripped_hist_output='';
    history_output="$(history)"
    filtered_hist_output=$(sed -n -E "s/${hist_time_entry_regexp}/\n\5\n/gp" <<< "${history_output}")
    stripped_hist_output=$(sed -E 's/(^\s+|\s+$)//g' <<< "${filtered_hist_output}" )
    for entry_id in ${entry_ids[@]}; do
        entry_lines=($(history | sed -n -E "s/${hist_time_entry_regexp}/\n\5\n/gp" | sed -E 's/(^\s+|\s+$)//g'))
        export IFS='\n'
        hist_commands_by_entry_id["${entry_id}"]=$(echo "${entry_lines[*]}")
    done
}

history_clear_and_disable() {
    history -n
    history -a
    mkdir -p ~/.bash_history.d/
    set +o history
    if [ -e ~/.bash_history ]; then
        mv -f ~/.bash_history ~/.bash_history.d/.bash_history.$(t16g)
    fi

    if [ -e ~/.history ]; then
        mv -f ~/.history ~/.bash_history.d/.history.$(t16g)
    fi

    if [ -n "$*" ]; then
        1>&2 echo "unexpected arguments: \"$*\""
        return 1
    fi
    set -o history
    history -a
}
history_enable_and_read() {
    if [ -n "$*" ]; then
        1>&2 echo "unexpected arguments: \"$*\""
        return 1
    fi
    set -o history
    history -n
    history -r
    history -a
}
history_show() {
    # TODO: WIP: write a func to print history neatly and accept argv to flag whether to print history commands, narrow by date range and/or entry number
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    local -A history_entries_by_entry_number=()
    local -A history_timestamps_by_entry_number=()
    local -a history_lines=()
    local -i ifs_set=0
    local -- old_ifs="${IFS:-}"
    local -a entry_numbers=()
    if [[ -v IFS ]]; then
        ifs_set=1
    fi
    export IFS=$'\n'
    local -- line=""
    history_lines=($(history))

    for index in ${!argv[@]}; do
        current=$(($index + 1))
        arg="${argv[$index]}"
        if [[ ! "${arg}" =~ ^[0-9]+$ ]]; then
            1>&2 echo -e "[${FUNCNAME[0]} warning]" "argument ${current} of ${argc} invalid (not a number): ${arg@Q}"
            continue
        fi
        entry_numbers+=("${arg}")
        # if [[ -v history_entries_by_entry_number["${arg}"] ]]; then
        #     entry="${history_entries_by_entry_number["${arg}"]}";
        #     echo -e "${entry}"
        # fi
    done
    export IFS=$'|'
    if [ ${#entry_numbers[@]} -eq 0 ]; then
        entry_numbers=('[0-9]+')
    fi
    local -- regexp="^\s*($(echo "${entry_numbers[*]}"))\s+(@([1-9][0-9]{9,}):([+-]?[0-9]+|[A-Z]+))\s+(.*)\$"

    export IFS=$'\n'
    local -- result_string=""
    result_string=$(echo "${history_lines[*]}" | sed -n -E "/${regexp}/{s/${regexp}/date +'#\1 %Y/%m/%d %H:%M:%S %Z \n' --date=@\3\n\5/g;G;z;h;e;p}")

    if (($ifs_set)); then
        export IFS="${old_ifs}"
    else
        unset IFS
    fi
    echo "${result_string}"
}
env_keys() {
    env | sed -n -E 's/^([A-Z_]+[A-Z0-9_]+)=(.*)$/\n\1\n/gp' | sort -u | sed -E '/^\s*$/d'
}
env_var_names() {
    env_keys
}
alias env-keys=env_keys
alias env-var-names=env_var_names

raw_bin_bash() { #WIP/broken
    # # old code: cmF3X2Jpbl9iYXNoKCkgewogICAgIyBleHBvcnQgUFM0PSckKHByaW50ZiAiJXMgbGluZSAlLSpzXHQiICJbJHtGVU5DTkFNRVswXX0iIDQgIiR7TElORU5PWzBdfV0iKScKICAgICMgc2V0IC14CiAgICBleHBvcnQgSUZTPSQnXG4nCiAgICBsb2NhbCAtYSBlbnZfdmFyX25hbWVzPSgpCiAgICBsb2NhbCAtLSBiYXNoX2Jpbl9wYXRoPSIiCiAgICBsb2NhbCAtYSBiYXNoX3BhcmFtcz0oCiAgICAgICAgJy0tbm9yYycKICAgICAgICAnLS1yZXN0cmljdGVkJwoKICAgICAgICAnLS1kZWJ1ZycKICAgICAgICAnLS1kZWJ1Z2dlcicKICAgICkKICAgIGVudl92YXJfbmFtZXM9KAogICAgICAgICQoZW52IHwgc2VkIC1uIC1FICdzL14oW0EtWl9dK1tBLVowLTlfXSspPSguKikkL1xuXDFcbi9ncCcgfCBzb3J0IC11IHwgc2VkIC1FICcvXlxzKiQvZCcpCiAgICApCiAgICBiYXNoX2Jpbl9wYXRoPSIkKHR5cGUgLVAgYmFzaCkiCiAgICBiYXNoX2Jpbl9wYXRoPSIvb3B0L2hvbWVicmV3L2Jpbi9iYXNoIgoKICAgIGxvY2FsIC1hIHVuc2V0X3ZhcnNfc3RtdHM9KCQocHJpbnRmICd1bnNldCAlcztcbicgIiR7ZW52X3Zhcl9uYW1lc1tAXX0iKSkKICAgIGxvY2FsIC1hIGluaXRfc3RtdHM9KAogICAgICAgICR7dW5zZXRfdmFyc19zdG10c1tAXX0KICAgICAgICAnc2V0IC11bWVURScKICAgICAgICAnc2V0ICtmJwogICAgICAgICdzZXQgLW8gcGlwZWZhaWwnCiAgICAgICAgJ2V4cG9ydCBQUzE9Ilx1QFxoOlx3XFxcJCAiJwogICAgKQogICAgbG9jYWwgLS0gdG1wX2luaXRfZmlsZT0kKG1rdGVtcCkKICAgIHByaW50ZiAnJXM7XG4nICR7aW5pdF9zdG10c1tAXX0gPiR7dG1wX2luaXRfZmlsZX0KCiAgICBsb2NhbCAtYSB2YXJfbmFtZXM9KCQoZW52X3Zhcl9uYW1lcykpCgogICAgZGVjbGFyZSAtYSBiYXNoX2NvbW1hbmRfbGluZXM9KCkKICAgIGRlY2xhcmUgLWkgYmFzaF9pbnRlcmFjdGl2ZV9jYWxsX2xpbmVzPSgKICAgICAgICAiJHtiYXNoX2Jpbl9wYXRofSIKICAgICAgICAkKHByaW50ZiAnJXNcbicgJHtiYXNoX3BhcmFtc1tAXX0pCiAgICAgICAgJy0taW5pdC1maWxlJwogICAgICAgICIke3RtcF9pbml0X2ZpbGV9IgogICAgICAgICItaSIKICAgICkKICAgIGRlY2xhcmUgLS0gYmFzaF9pbnRlcmFjdGl2ZV9jYWxsPSIke2Jhc2hfaW50ZXJhY3RpdmVfY2FsbF9saW5lc1tAXX0iCiAgICBiYXNoX2NvbW1hbmRfbGluZXM9KAogICAgICAgICQocHJpbnRmICclcztcbicgJHt1bnNldF92YXJzX3N0bXRzW0BdfSkKICAgICAgICAiJHtiYXNoX2ludGVyYWN0aXZlX2NhbGx9IgogICAgKQoKICAgIGVjaG8gLWUgIlx4MWJbMTszODs1OzIyMG0ke2Jhc2hfYmluX3BhdGh9IC1jICR7YmFzaF9jb21tYW5kX2xpbmVzW0BdfVx4MWJbMG0iCiAgICBzZXQgK3gKfQo=
    # export IFS=$'\n'
    # local -a env_var_names=()
    # local -- bash_bin_path=""
    # local -a bash_params=(
    #     '--norc'
    #     '--restricted'

    #     '--debug'
    #     '--debugger'
    # )
    # local -- bin_bash_fallback_path="";
    # local -i code=0;
    # if ! bin_bash_fallback_path=$(type -P bash); then
    #     code=$?;
    #     1>&2 echo -e "[${FUNCNAME[0]} critical error]" "cannot find executable: bash"
    #     return $(( code | 1 ))
    # fi

    # env_var_names=(
    #     $(env | sed -n -E 's/^([A-Z_]+[A-Z0-9_]+)=(.*)$/\n\1\n/gp' | sort -u | sed -E '/^\s*$/d')
    # )
    # # bash_bin_path="$(type -P bash)"
    # bash_bin_path="/opt/homebrew/bin/bash"

    # local -- tmp_init_file=$(mktemp);
    # local -- indent="$(printf '%*s' 4 ' ')";
    # local -a debug_vars_keys=();
    # local -A debug_vars=();
    # debug_vars["\${0}"]="${0}";
    # debug_vars["\${0@Q}"]="${0@Q}";
    # local -i idx=-0;
    # local -i idxval=-0;
    # local -- key=''
    # local -a key_parts=()
    # local -- s_value=''
    # local -i i_value=-1;
    # for idx in ${!BASH_ARGS[@]}; do
    #     idxval=${BASH_ARGS[$idx]};
    #     key_parts=(
    #         '\\\$'
    #         '{'
    #         "${idx}"
    #         '}'
    #     )
    #     key="$(printf '%s' "${key_parts[@]}")"
    #     debug_vars["${key}"]="${idxval}";
    #     key="\\\$${idx}";
    #     debug_vars["${key}"]="${idxval}";
    # done
    # local -a init_comments=(
    #     "shell-script auto-generated by ${script_name}"
    #     ""
    #     $(printf '%s%s\n' "${0}" (.i.e.: ${0@Q}) @ $(date --iso-8601=seconds --utc) ${TZ@A})
    #     ""
    # )
    # local -a unset_vars_stmts=($(printf 'unset %s;\n' "${env_var_names[@]}"))
    # local -a post_unset_init_stmts_no_semicolon=(
    #     'set -umeTE'
    #     'set +f'
    #     'set -o pipefail'
    #     'export PS1="\u@\h:\w\\\$ "'
    # )
    # local -a init_stmts=(
    #     ${unset_vars_stmts[@]}
    #     $(printf '%s;\n' "${init_stmts[@]}")
    # );
    # (echo -e '#!/usr/bin/env bash\n\n';
    #  echo -e
    # printf '%s;\n' ${init_stmts[@]} >${tmp_init_file}
    # local -a var_names=($(env_var_names))

    # if [ -z "${bash_bin_path}" ]; then
    #     1>&2 echo -e "[!!! ${FUNCNAME[0]} warning !!!]" "${bash_bin_path} is empty ${bin_bash_fallback_path@Q}"
    #     bash_bin_path="${bin_bash_fallback_path}"
    # elif [ ! -x "${bash_bin_path}" ]; then
    #     1>&2 echo -e "[!!! ${FUNCNAME[0]} warning !!!]" "${bash_bin_path} is not executable, falling back to ${bin_bash_fallback_path@Q}"
    #     bash_bin_path="${bin_bash_fallback_path}"
    # fi

    # declare -a bash_command_lines=()
    # declare -i bash_interactive_call_lines=(
    #     "${bash_bin_path}"
    #     $(printf '%s\n' ${bash_params[@]})
    #     '--init-file'
    #     "${tmp_init_file}"
    #     "-i"
    # )
    # declare -- bash_interactive_call="${bash_interactive_call_lines[@]}"
    # bash_command_lines=(
    #     $(printf '%s;\n' ${unset_vars_stmts[@]})
    #     "${bash_interactive_call}"
    # )

    # echo -e "\x1b[1;38;5;220m${bash_bin_path} -c ${bash_command_lines[@]}\x1b[0m"
    # set +x
    bash -c "$(printf '%s;\n' ${argv[@]} | sed -E 's/(^\s*(\s*[;]+\s*)+\s*$)//g' | sed -E 's/(^\s+|\s+$)//g')"
}

function gitdebugrevparse() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -- prefix_result_string=''
    local -- top_level_result_string=''
    local -- final_result_string=""
    local -- here=$(pwd)
    local -a top_level_command=(git rev-parse '--show-toplevel')
    local -a prefix_command=(git rev-parse '--show-prefix')
    local -A final=()

    if ! top_level_result_string="$(${top_level_command[@]})"; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "not under a git repo: ${here@Q}"
        return 404
    else
        final["${top_level_command[@]}"]="${top_level_result_string}"
    fi
    prefix_result_string="$(${prefix_command[@]})"
    final["${prefix_command[@]}"]="${prefix_result_string}"
    final["${final_command[@]}"]="${final_result_string}"

    local -a base_final_command=(git rev-parse '--prefix' "${prefix_result_string}")
    local -a final_command=(${base_final_command[@]})

    if (($argc)); then
        final_command+=('--' ${argv[@]})
    fi
    final_result_string="$(${final_command[@]})"
    (cd "${git_root}" && echo "${final_result_string}")
}

set_key_value_in_history_context() {
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -A arg_index_regexes=()
    local -A arg_index_name=()

    local -A arg_index_values=()
    local -A arg_name_values=()

    local -- varname_regexp='^([a-zA-Z_]+[a-zA-Z0-9_]+)$'
    local -- value_regexp='^(.*)$'
    local -- regexp=''
    local -- arg_name=""
    local -- varname=""
    local -- key=""
    local -- value=""
    arg_index_name[0]="varname"
    arg_index_name[1]="key"
    arg_index_name[2]="value"
    arg_index_regexes["varname"]="${varname_regexp}"
    arg_index_regexes["key"]="${varname_regexp}"
    arg_index_regexes["value"]="${value_regexp}"

    if [ ${argc} -lt 3 ]; then
        1>&2 echo -e "[${FUNCNAME[0]}]" "missing arguments: <VARNAME> <KEY> <VALUE>"
        return 1
    fi

    for index in ${!argv[@]}; do
        current=$(($index + 1))
        arg="${argv[$index]}"
        prefix=$(printf '%*s of %s' ${argc} ${current} ${argc})
        if [ ${index} -le 3 ]; then
            arg_name=${arg_index_name[$index]}
            regexp=${arg_index_regexes[$index]}

            if [[ "${arg}" =~ ${regexp} ]]; then
                arg_index_values["${index}"]="${arg}"
                arg_name_values["${arg_name}"]="${arg}"
            else
                1>&2 echo -e "[${FUNCNAME[0]} error in argument ${prefix}]" "${arg_name} argument does not match regexp ${regexp@Q}"
                return 1
            fi
        else
            1>&2 echo -e "[${FUNCNAME[0]} error in argument ${prefix}]" "unexpected argument ${arg@Q}"
            return 1
        fi
    done

    varname=${arg_name_values['varname']}
    key=${arg_name_values['key']}
    value=${arg_name_values['value']}

    local -- surrogate_map_name="${varname}_map"
    local -- surrogate_list_name="${varname}_list"
    local -- surrogate_list_type="${surrogate_list_name@a}"
    local -- surrogate_map_type="${surrogate_map_name@a}"

    if [[ ! -v "${surrogate_list_name[@]}" ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "varname ${surrogate_list_name@Q} does not exist"
        return 1
    elif [ "${surrogate_list_name@a}" != "a" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "type variable ${surrogate_list_name@Q} should be indexed array (.i.e.: 'a') but is ${surrogate_list_type@Q} (${surrogate_list_name[@]@A})$"
        return 1
    fi
    if [[ ! -v "${surrogate_map_name[@]}" ]]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "varname ${surrogate_map_name@Q} does not exist"
        return 1
    elif [ "${surrogate_map_name@a}" != "A" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "type variable ${surrogate_map_name@Q} should be indexed array (.i.e.: 'A') but is ${surrogate_map_type@Q} (${surrogate_map_name[@]@A})$"
        return 1
    fi

    local -I -n history_context="${varname}"
    history_context["${key}"]="${value}"

}

history_with_context() {
    declare -- varname="var_pid${$}_hist_$(history_length)"
    declare -g -A "${varname}"
    local -I -n history_context="${varname}"
    local -- git_repo_path=""
    local -i in_git_repo=0

    if git_repo_path=$(git rev-parse --show-toplevel); then
        in_git_repo=1
    fi

    history_context["argv"]="${argv[@]}"
    history_context["argc"]="${argc}"
    if (($in_git_repo)); then
        history_context["git_repo_path"]="${git_repo_path}"
        history_context["git_head_commit"]="${git_repo_path}"
        history_context["git_status_porcelain"]="${git_repo_path}"
    fi
    env | sed -n -E 's/^([A-Z_]+[A-Z0-9_]+)=(.*)$/\n\1\n/gp' | sort -u | sed -E '/^\s*$/d'

    local -a history_related_varnames=(
        'HISTFILE'
        'HISTFILESIZE'
        'HISTSIZE'
        'HISTTIMEFORMAT'
        'HISTCONTROL'
    )
    local -- hist_varname=""
    local -- hist_varval=""
    for hist_varname in ${history_related_varnames[@]}; do
        if [[ -v "${hist_varname}" ]]; then
            local -I -n hist_varval="${hist_varname}"
            history_context["${hist_varname}"]="${hist_varval}"
        fi
        local -- hist_varval=""
    done
    local -- history_pid=${$}

    # export IFS=$'\n'
    # declare -a lsof_entries=()
    # lsof_entries=(
    #     # $(lsof | grep -E -i "(bash|ghostty|wezterm|terminal)" | grep -E 'cwd' | awk '{print $NF}' | grep -E -v "^${HOME}\$" | sort -u | sed "s/^/$(date +"%s") /g")
    #     $(lsof -p "${history_pid}")
    # )
    local -- lsof_pid=""
    lsof_pid="$(lsof -p "${history_pid}")"

    history_context["pwd"]="$(pwd)"
    history_context["pid"]="${history_pid}"
    history_context["lsof"]="${lsof_pid}"
    history_context["env"]="$(env)"

    if [[ -v FUNCNAME[1] ]]; then
        history_context["caller_function_name"]="${FUNCNAME[1]}"
        if [[ -v LINENO[1] ]]; then
            history_context["caller_function_line_number"]="${LINENO[1]}"
        fi
    fi
    if [[ -v BASH_LINENO[@] ]] && [ ${#BASH_LINENO[@]} -gt 0 ]; then
        history_context["caller_bash_line_numbers"]="$(printf '%d\t%s\n' "${BASH_LINENO[@]@K}")"
    fi
    if [[ -v BASH_SOURCE[@] ]] && [ ${#BASH_SOURCE[@]} -gt 0 ]; then
        history_context["caller_bash_sources"]="$(printf '%d\t%s\n' "${BASH_SOURCE[@]@K}")"
    fi
    # export IFS=$'\n'

    history_context["BASH_LINENO"]=$(printf '%s\n' ${BASH_LINENO[@]})
    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    history_context["history"]="$(echo "$(history)")"

}
dump_history_to_workbench() {
    # set -x
    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""

    export PS4='\r\n${FUNCNAME[0]}:${LINENO[0]} '
    local -i workbench_last_epoch=$(gdate --utc +%s)
    local -- workbench_day=$(gdate +"${workbench_strftime_fs_day}" --date=@${workbench_last_epoch})
    local -- workbench_fs_timestamp=$(gdate +"${workbench_strftime_fs_timestamp}" --date=@${workbench_last_epoch})
    local -- workbench_root="$HOME/workbench"
    local -- workbench_path="${workbench_root}/${workbench_day}"
    local -- workbench_logs_safe_path="${workbench_root}/logs/${workbench_day}"
    local -- workbench_logs="${workbench_path}/logs"
    local -- workbench_stderr="${workbench_logs}/stderr.log"
    local -- workbench_stdout="${workbench_logs}/stdout.log"

    local -a hash_material=("${BASH_LINENO[@]}" "${#BASH_LINENO[@]}" "\${$}=${$}" "\${!}=${!}" "\${PWD}=${PWD@Q}")

    export IFS=$'\n'
    local -- hl_reset='\x1b[0m'

    local -- hl_outer_at='\x1b[1;38;2;52;101;164m'
    local -- hl_inner_at='\x1b[1;38;2;114;159;207m'

    local -- hl_outer_star='\x1b[1;38;2;78;154;6m'
    local -- hl_inner_star='\x1b[1;38;2;138;226;52m'

    local -- hl_tag_star_open="${hl_outer_star}<\${hash_material[*]}>${hl_reset}"
    local -- hl_content_star="${hl_inner_star}${hash_material[*]}${hl_reset}"
    local -- hl_tag_star_close="${hl_outer_star}</\${hash_material[*]}>${hl_reset}"

    local -a hl_star_lines=(
        "$(echo -en "${hl_tag_star_open}")"
        "$(echo -en "${hl_content_star}")"
        "$(echo -en "${hl_tag_star_close}")"
    )
    echo -e "${hl_star_lines[*]}"

    local -- history_with_context="$(history_with_context)"
    local -- commit_subject="save state $(nowdz)\n" # &&
    local -- commit_body="$(echo -e \"$(git status | grep -E -v '(^On\s+branch\s+|.*[(]\s*use.*git(\s*(add|push)).*)' | sed -E 's/^([[:space:]]{1,})([^[:space:]]+.*)$/    \2/g')\n\")"
    local -- commit_message="$(echo -e \"${commit_subject}\n${commit_body}\n\n\")"

    echo -e "\${commit_subject}=${commit_subject}"
    # echo -e "\${commit_subject@A}=${commit_subject@A}"
    # echo -e "\${commit_subject@Q}=${commit_subject@Q}"

    echo -e "\${commit_body}=${commit_body}"
    # echo -e "\${commit_body@A}=${commit_body@A}"
    # echo -e "\${commit_body@Q}=${commit_body@Q}"

    echo -e "\${commit_message}=${commit_message}"
    # echo -e "\${commit_message@A}=${commit_message@A}"
    # echo -e "\${commit_message@Q}=${commit_message@Q}"

    # git add *.*;

    # git commit -am "$(echo -e "${commit_message}\n")"
    #set +x
    unset PS4

}

wip() {
    . ~/opt/lib/ansi.sh
    local -- verbose="false"
    if [ -n "$1" ]; then
        case "$1" in
            "-v")
                verbose="true"
                shift
                ;;
            *) ;;
        esac
    fi
    local -a what=($@)
    if [ ${#what[@]} -eq 0 ]; then
        bar_text_left 233 231 "missing description"
        return 1
    fi
    local -- bashpid="$$"
    local -- title="WIP ON $(date +"%Y/%m/%d %H:%M:%S") (bash pid: ${bashpid})"
    local -- under=$(echo "$(seq ${#title})" | tr -d '[:digit:]' | tr '\n' '~')
    entries=$(lsof | ack -i "(bash | ghostty | wezterm | terminal)" | grep cwd | lastcol | ack -v "^${HOME}\$" | sort -u | sed "s/^/$(date +"%s") /g")
    export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}"
    local -- note=$(echo -e "${title}\n${under}\n\n${what[@]} in directory $(pwd)\n\n${entries}\n\n$(history)\n\n")
    base_log_path=$HOME/projects/notes/wip/mit-context
    ts=$(nowts | xargs slugify-string)
    log_path=${base_log_path}.${ts}.txt
    mkdir -p $(dirname "${log_path}")
    echo -e "${note}" >${log_path}

    if [ "${verbose}" == "true" ]; then
        1>&2 echo "wrote: ${log_path}"
    fi
}

defer() {
    local -a defer_argv=($@)
    local -i defer_argc=${#defer_argv[@]}
    local -- defer_command="$@"
    local -- log_name=$(slugify-string "$@")
    local -- defer_log_path="$(workbench --log-path)/logs"
    local -- stdout="${defer_log_path}/${log_name}.stdout.log"
    local -- stderr="${defer_log_path}/${log_name}.stderr.log"

    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "[defer] no command provided"
        return 1
    fi
    local -- progname="${defer_argv[0]}"
    local -- progtype=""
    if ! progtype=$(get_prog_type "${progname}"); then
        return $?
    fi
    deferred_prog_commands+=("${defer_command}")
    deferred_prog_stderr+=(["${defer_command}"]="${stderr}")
    deferred_prog_stdout+=(["${defer_command}"]="${stdout}")
    deferred_prog_started_at_utc+=(["${defer_command}"]="$(date +%s)")
    (2>${stderr} 1>${stdout} ${defer_argv[@]} && deferred_prog_finished_at_utc+=(["${defer_command}"]=$(date +%s))) &
    local -- prog_pid=$!
    disown -a
    deferred_prog_pids+=(["${defer_command}"]="${prog_pid}")
}
defer_maintenance() {
    local -- cmd=""
    local -- deferred_pid=""
    local -- deferred_psaux=""
    local -- stdout=""
    local -- stderr=""
    local -i stderr_size=0
    local -i stdout_size=0
    local -i is_running=0
    local -- psaux_regex="^[^[:space:]]+\s+(${deferred_pid})\s+.*"
    set +u
    for cmd in ${deferred_prog_commands[@]}; do
        if ! deferred_pid=${deferred_prog_pids["${cmd}"]} || [ -z "${deferred_pid}" ]; then
            continue
        fi
        if deferred_psaux=$(ps aux | grep -E "${psaux_regex}"); then
            is_running=1
            deferred_prog_psaux_lines+=(["${cmd}"]="${deferred_psaux}")
        fi
        if stderr=${deferred_prog_stderr["${cmd}"]} && [ -n "${deferred_pid}" ]; then
            if [ -f "${stderr}" ]; then
                stderr_size=$(gstat -c %s "${stderr}")
            fi
            if (($is_running)) && [ ${stderr_size} -eq 0 ]; then
                rm -f "${stderr}"
            fi
        fi
        if stdout=${deferred_prog_stdout["${cmd}"]} && [ -n "${deferred_pid}" ]; then
            if [ -f "${stdout}" ]; then
                stdout_size=$(gstat -c %s "${stdout}")
            fi
            if (($is_running)) && [ ${stdout_size} -eq 0 ]; then
                rm -f "${stdout}"
            fi
        fi
    done
}

blame_command_exit_code() {
    local -- color=""
    local -i code=0

    local -a argv=($@)
    local -i argc=${#argv[@]}
    local -i index=0
    local -i current=0
    local -- arg=""
    local -i exit_code=-1
    local -- prog=""
    local -a prog_args=()
    local -- ty=""
    local -- actual_ty_path=''
    local -- actual_ty=''
    local -- actual_arg=''
    local -a alias_parts=()
    if [ ${argc} -eq 0 ]; then
        1>&2 echo -e "${FUNCNAME[0]}" "missing arguments <EXIT CODE> <COMMAND> [ARGS...]"
        return 1
    fi

    for index in ${!argv[@]}; do
        current=$(($index + 1))
        arg="${argv[$index]}"
        case "${index}" in
            0)
                if [[ ! ${arg} =~ ^[0-9]+$ ]]; then
                    1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <EXIT CODE> (not a number): ${arg@Q}"
                    return 1
                fi
                exit_code="${arg}"
                if [ "${exit_code}" != "${arg}" ]; then
                    1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <EXIT CODE> (not a number): ${arg@Q}"
                    return 1
                fi
                ;;
            1)
                ty=$(builtin type -t "${arg}")
                if [ -z "${ty}" ]; then
                    1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (not found): ${arg@Q}"
                    return 1
                fi
                case "${ty}" in
                    'keyword')
                        1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (reserved shell keyword): ${arg@Q}"
                        return 1
                        ;;
                    'builtin')
                        true
                        # 1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (shell builtin): ${arg@Q}"
                        # return 1
                        ;;
                    'file')
                        true
                        # 1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (not found): ${arg@Q}"
                        # return 1
                        ;;
                    'alias')
                        export IFS=$'\n'
                        if ! alias_parts=($(sed -n -E 's/^[^=]+=(.)([^[:space:]]+)\s*(.*)(.)$/\2\n\3/g;h;z;{g;s/\s+/\n/gp}' <<<"${arg}")); then
                            unset IFS
                            1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (unresolved alias): ${arg@Q}"
                            return 1
                        fi
                        unset IFS
                        actual_arg=${alias_parts[@]:0:1}
                        actual_ty=$(builtin type -t "${actual_arg}")
                        if [ -n "${actual_ty}" ]; then
                            if actual_ty_path=$(builtin type -t -P "${actual_arg}"); then
                                actual_ty=$(builtin type -t "${actual_ty_path}")
                            fi
                        else
                            1>&2 echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (unresolved alias): ${arg@Q}"
                            return 1
                        fi
                        ;;
                esac
                prog="${arg}"
                ;;
            *)
                prog_args+=("${arg}")
                ;;
        esac
    done

    if [ ${exit_code} -eq 0 ]; then
        color='112'
    else
        color=1
    fi
    echo -e "\n\n\x1b[1;38;5;248mcommand \x1b[1;38;5;220m${prog} $(printf '\x1b[1;38;5;222m%s\x1b[0m ' ${prog_args[@]})\x1b[1;38;5;248mexited with code=\x1b[1;38;5;${color}m${exit_code}\x1b[0m"
}

gawk_prettify_stdin() {
    if [ -t 0 ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "stdin is a tty"
        return 1
    fi

    #set -x
    local -- pretty_printed_output=""
    local -i code=0

    local -- original_input="$(cat </dev/stdin)"
    if ! pretty_printed_output="$(gawk -f - -o- <<<"${original_input}")"; then
        code=$?
    fi

    # It seems that when feeding ``gawk --pretty-print`` with invalid
    # syntax, rather than to exit with error gawk uses some optimistic
    # algorithm to generate valid output.

    # To mitigate that, the code below provides an extra layer of
    # validation so that the user can at least take an educated
    # decision in judging whether gawk's result is sound.

    # The algorithm is simple: it is simply a pipeline of `sed'
    # commands which strips as much whitespace as possible from
    # whatever is fed into it, then further trims any remaining
    # whitespaces from the beginning and end of each line and finally
    # strips all blank lines.

    # Simply put: the present bash function passes both versions (the
    # output of gawk's pretty-printer and a copy of the input code fed
    # into it) to this "minifier of sorts", naively compares the
    # minified versions via unified diff (.i.e.: ``diff -u``) and
    # presents the differences to the user (if any)

    # it is pretty naive but is better than nothing.
    local -r pipeline='s/[\n[:space:]]+/ /g;s/(\n\s+|\s+\n)//g;s/[{]\s+[}]/{}/g;h;p'

    local -- minified_input=$(sed -E "${pipeline}" <<<"${original_input}")
    local -- minified_output=$(sed -E "${pipeline}" <<<"${pretty_printed_output}")

    local -i unix_ts=$(date --utc +'%s')
    local -- batch_id=$(date +'%Y-%m-%d.%H-%M-%S.%s' --date=@${unix_ts})
    local -- tmp_workdir="$(mktemp -d)"
    local -- tmp_original_input_file="${tmp_workdir}/original_input.${batch_id}.awk"
    local -- tmp_original_output_file="${tmp_workdir}/original_output.${batch_id}.awk"
    local -- tmp_minified_input_file="${tmp_workdir}/minified_input.${batch_id}.awk"
    local -- tmp_minified_output_file="${tmp_workdir}/minified_output.${batch_id}.awk"

    echo "${original_input}" >${tmp_original_input_file}
    echo "${pretty_printed_output}" >${tmp_original_output_file}

    echo "${minified_input}" >${tmp_minified_input_file}
    echo "${minified_output}" >${tmp_minified_output_file}

    local -i diff_exit_code=0
    local -- diff_output=""

    if ! diff_output=$(diff -u "${minified_input}" "${minified_output}"); then
        diff_exit_code=$?
    fi

    echo "${pretty_printed_output}"

    if [ ${diff_exit_code} -ne 0 ] || [ "${diff_output}" -gt 0 ]; then
        1>&2 echo -e "[important]" "naive check of the resulting prettified code has found a differences that you might like to be aware of. could be nothing important but that's up for you to decide."
        diff -u --colorv "${minified_input}" "${minified_output}"
    fi
    return ${code}

}

alias gawk-prettify-stdin="gawk_prettify_stdin"

stty_outputs() {
    unset PS4
    # set +x;
    # local -- oldps1="${PS1}";
    # local -- oldprompt_command="${PROMPT_COMMAND}";
    # export PS1='';
    # export PROMPT_COMMAND='';
    # echo -en "\x1b[2J\x1b[3J\x1b[H";
    # set -x;
    local -i code=0
    local -a stty_cmd=()
    declare -g -A stty_outputs=()
    local -- stty=''
    local -- tmp=''
    local -- stderr="$(mktemp)"
    local -- stderr_prefix=""
    local -- sed_command=""
    for stty in $(which -a stty); do
        code=0
        stty_cmd=("${stty}" '-a')
        if ! tmp="$(2>${stderr} ${stty_cmd[@]})"; then
            code=$?
        fi
        if [ "${code}" -ne 0 ]; then
            stderr_prefix="${stty_cmd[@]} failed with exit code ${code}"
            sed_command="s%^%${stderr_prefix}%g"
            stty_outputs["${stty}"]="$(sed -E "${sed_command}" "${stderr}")"
        else
            stty_outputs["${stty}"]="${tmp}"
        fi
    done
    # set +x;
    # export PS1="${oldps1}";
    # export PROMPT_COMMAND="${oldprompt_command}";
}

# include_wip!("funcdef.unique.sh");
# include_wip!("funcdef.unicode_file_widest_line.sh");
# include_wip!("misc.commented.sh");
