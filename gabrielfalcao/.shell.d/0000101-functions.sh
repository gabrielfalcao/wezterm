declare -a deferred_prog_commands=()
declare -A deferred_prog_pids=()
declare -A deferred_prog_stdout=()
declare -A deferred_prog_psaux_lines=()
declare -A deferred_prog_stderr=()
declare -A deferred_prog_started_at_utc=()
declare -A deferred_prog_finished_at_utc=()

third_party() {
    target="${@}"
    cdmkd "${HOME}/projects/third_party/${target}"
}
alias 3=third_party

# work() {
#     target="${@}"
#     cdmkd "${HOME}/projects/work/${target}"
# }
# alias w=work

cdmkd() {
    local -- target="${@}"
    local -- backup_cdpath="";
    local -i cdpath_was_defined=0
    if [[ -v CDPATH ]]; then
        backup_cdpath="${CDPATH}";
        cdpath_was_defined=1
        unset CDPATH
    fi
    mkdir -p "${target}" && cd "${target}"
    export CDPATH="${backup_cdpath}"
}
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
    set +x
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
    echo -en "\x1b[2J\x1b[3J\x1b[H"
}
clsreset() {
    cls
    reset
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
cbt() {
    if [ -n "${IFS@A}" ]; then
        local -- declare_IFS="${IFS@A}"
    else
        local -- declare_IFS=""
    fi

    # export IFS=$'\n'
    unset IFS
    local -a cargo_subcommands=(
        "check"
        "build"
        "test"
    )
    local -A subcommand_fg_colors=(
        ["check"]=231
        ["build"]=220
        ["test"]=154
    )
    if [ ! -f Cargo.toml ]; then
        if [ -n "${declare_IFS}" ] && 1>/dev/random 2>/dev/random ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' <<<"${declare_IFS}"; then
            eval "${declare_IFS}"
        fi
        return 1
    fi
    for cargo_subc in ${cargo_subcommands[@]}; do
        local -a cargo_call=(cargo "${cargo_subc}" "--offline")
        if ! ${cargo_call[@]}; then
            exit_code=$?
            fg_color="${subcommand_fg_colors[$cargo_subc]}"
            1>&2 echo -e "command \x1b[1;38;5;${fg_color}m${cargo_subc}\x1b[0m failed with status ${exit_code}: \x1b[1;38;5;202m${cargo_call[@]}\x1b[0m"
            if [ -n "${declare_IFS}" ] && 1>/dev/random 2>/dev/random ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' <<<"${declare_IFS}"; then
                eval "${declare_IFS}"
            fi
            return $exit_code
        fi
    done

    if [ -n "${declare_IFS}" ] && 1>/dev/random 2>/dev/random ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' <<<"${declare_IFS}"; then
        eval "${declare_IFS}"
    fi
    return $?
}
q() {
    if [ ! -f Cargo.toml ]; then
        return 1
    fi
    k
    cargo q $*
}
x() {
    clsreset
    export PS1_VARIANT=x
    cdmkd ~/*scratch*/.x/
}
l() {
    if [ -z "$1" ]; then
        l ~/.shell.d/0000101-functions.sh
    elif [ -f "$1" ]; then
        path="$1"
        echo -e "\x1b[1;48;5;234m\x1b[1;38;5;231mloading \x1b[1;38;5;220m~/${path#${HOME}/}\x1b[0m"
        . "${path}"
    else
        case "$1" in
            "f" | "-f")
                l ~/.shell.d/0000101-functions.sh
                ;;
            "e" | "-e")
                l ~/.shell.d/0000110-env.sh
                ;;
            "ansi")
                l ~/opt/lib/ansi.sh
                ;;
            "a" | "-a")
                l ~/.shell.d/entrypoint.sh
                ;;
            "c" | "-c" | "--completions" | "--autocomplete" | "--auto-complete" | "--complete")
                l ~/opt/lib/completions.sh
                ;;
            "t" | "-t" | "--tools" | "tools")
                l ~/opt/lib/tools.sh
                ;;
            *)
                cat <<EOF
USAGE: l <f|e|a>
EOF
                ;;
        esac
    fi
}

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
    # . ~/opt/lib/ansi.sh
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
    set -x
    export RUSTFLAGS="-C opt-level=0 -g -Zmacro-backtrace"
    export RUST_BACKTRACE=1
    set +x
}
ro() {
    set -x
    unset RUSTFLAGS
    unset RUST_BACKTRACE
    set +x
}
ssh_ag() {
    2>/dev/random 1>/dev/random g p -r ssh -k
    eval "$(ssh-agent)"
    ssh-add -k
    ssh-add ~/.ssh/id_gafagomo
    ssh-add ~/.ssh/gabrielteratos@gmail.com
}
alias ssh-ag=ssh_ag

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
        declare -i index=$((${length} - ${rev_index}))
        declare -- item=${array[$index]}
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
        declare -i index=$((${length} - ${rev_index}))
        declare -- item=${array[$index]}
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
stty sane

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

history_show() {
    # TODO: WIP: write a func to print history neatly and accept argv to flag whether to print history commands, narrow by date range and/or entry number
    local -Ar regex_grouped_parts_by_label=(
        ["sav_start_lin"]='^(\s+)'
        ["val_entry_num"]='([0-9]+)'
        ["sav_entry_num"]='(\s+)'
        ["entry_unix_ts"]='@([0-9]{9,}):'
        ["entry_tz_abrv"]='([A-Za-z]+)'
        ["sav_entry_tzo"]='([[:space:]]{5})'
        ["sbv_comm_args"]='(\s*)'
        ["val_comm_args"]='([^[:space:]]+.*)$'
    )
    local -ar regex_group_labels=(
        'sav_start_lin' #'^(\s+)'
        'val_entry_num' #'([0-9]+)'
        'sav_entry_num' #'(\s+)'
        'entry_unix_ts' #'@([0-9]{9,}):'
        'entry_tz_abrv' #'([A-Za-z]+)'
        'sav_entry_tzo' #'([[:space:]]{5})'
        'sbv_comm_args' #'(\s*)'
        'val_comm_args' #'([^[:space:]]+.*)$'
    )

    local -ar regex_string_chunks=($(for label in ${regex_group_labels[@]}; do
        echo "${regex_grouped_parts_by_label[${label}]}"
    done))
    local -r parse_history_regex="$(printf '%s' "${regex_string_chunks[@]}")"

    local -- oldfmt="${HISTTIMEFORMAT:-}"
    unset HISTTIMEFORMAT
    export HISTTIMEFORMAT='@%s:%Z     '
    # .e.g: 547  @1766163293:UTC     history
    builtin history | sed -E "/${parse_history_regex}/"
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
