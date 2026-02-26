set -o pipefail
export IFS=$'\n'

declare -ga shfmt_args=( "-bn" "-ci" "-i" "4" "-ln=bash" );
# # declare -gar shfmt_args=( "-bn" "-ci" "-i" "4" "-ln=bash" );
# declare -r shfmt_args=( "-bn" "-ci" "-i" "4" "-ln=bash" );

if [[ ! -v shell_d_path ]]; then
    declare -r shell_d_path="${HOME}/.shell.d" # revised
fi
if [[ ! -v shell_d_venv_root ]]; then
    declare -r shell_d_venv_root="${shell_d_path}/.venv" # revised
fi
if [[ ! -v shell_d_venv_bin_path ]]; then
    declare -r shell_d_venv_bin_path="${shell_d_venv_root}/bin" # revised
fi
if [[ ! -v shell_d_venv_python_bin ]]; then
    declare -r shell_d_venv_python_bin="${shell_d_venv_root}/bin/python" # revised
fi
if [[ ! -v shell_d_venv_python_version ]]; then
    declare -r shell_d_venv_python_version="3.12" # revised
fi
if [[ ! -v shell_d_venv_python_execname ]]; then
    declare -r shell_d_venv_python_execname="python${shell_d_venv_python_version}" # revised
fi
if [[ ! -v shell_d_venv_python_lib ]]; then
    declare -r shell_d_venv_python_lib="${shell_d_venv_root}/lib/${shell_d_venv_python_execname}" # revised
fi
if [[ ! -v shell_d_venv_site_packages ]]; then
    declare -r shell_d_venv_site_packages="${shell_d_venv_python_lib}site-packages" # revised
fi
if [[ ! -v shell_d_python_bin_path ]]; then
    declare -r shell_d_python_bin_path="${shell_d_venv_bin_path}" # revised
fi

if [[ ! -v UV_PYTHON ]]; then
    declare -xr UV_PYTHON="${shell_d_venv_python_version}" # revised
fi
if [[ ! -v UV_PYTHON_PREFERENCE ]]; then
    declare -xr UV_PYTHON_PREFERENCE="managed" # revised
fi

export CHILD_MAX=8192
export PYTHONDONTWRITEBYTECODE='x'
export FCEDIT="vim"
export NVM_DIR="${HOME}/.nvm"
export NODE_OPTIONS="--tls-min-v1.2"

export SHELLCHECK_OPTS="-a -C=always -f=diff -e SC2059 -e SC2034 -e SC1090 -e SC2124"
export SHELLCHECK_OPTS="-a --color=always"

# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "${HOME}/.cargo/env" ] && . "${HOME}/.cargo/env"
#export ELIXIR_OTP_INSTALL="$HOME/.elixir-install/installs/otp/27.1.2/bin"
#export ELIXIR_INSTALL="$HOME/.elixir-install/installs/elixir/1.18.2-otp-27/bin"
#export PATH="$ELIXIR_OTP_INSTALL:$ELIXIR_INSTALL:$PATH"
#export BAT_THEME="Monokai Extended Bright"
#export BAT_STYLE="plain"
#export SHELLCHECK_OPTS='--shell=bash --exclude=SC2004,SC2206,SC2068,SC2086'
## export CARGO_LOG="warn"
#
## export XPC_NULL_BOOTSTRAP=1
#export HISTTIMEFORMAT="[%Y/%m/%d %H:%M:%S %Z]  "
#export RUSTFLAGS="-Zmacro-backtrace"
#
#python_sys_path() {
#    local -a args=( $@ )
#    local -i argc=${#args[@]}
#    local -i index=0
#    local -- arg=""
#    local -- separator=""
#    if [ ${argc} -eq 0 ]; then
#        separator=':'
#    else
#        for index in ${!args[@]}; do
#            arg="${args[$index]}"
#            current=$(( $index + 1 ))
#            nth=$(ordinal "${current}")
#            if [ -n "${arg}" ]; then
#                if [ -z "${separator}" ]; then
#                    separator="${arg}"
#                else
#                    1>&2 echo -e "[${FUNCNAME[0]}]" "ignoring ${nth} arg ${arg@Q} because separator already defined to ${separator@Q}"
#                fi
#            fi
#        done
#
#
#    fi
#    python -c "import sys;from pathlib import Path;home=str(Path('~').expanduser());print(':'.join([p for p in sys.path if home in p or not '/opt/homebrew/' in p]));"
#}
##if [ -x "$HOME/.cargo/bin/path" ]; then
##    sorter=$HOME/.cargo/bin/path
##    export PYTHONPATH="$(
##        $sorter env PYTHONPATH -q \
##            -a "${shell_d_venv_site_packages}" \
##            -s "${shell_d_venv_site_packages}"
##    )"
##elif [[ -v PYTHONPATH ]] && [ -n "${PYTHONPATH}" ]; then
##    export PYTHONPATH=":${PYTHONPATH#:}"
##else
##    export PYTHONPATH="${shell_d_venv_site_packages}"
##fi
##
##unset RUST_BACKTRACE
##
### export PS2='$... '
##if 2>/dev/random 1>/dev/random which vivid; then
##    export LS_COLORS="$(vivid generate molokai)"
##    export LS_COLORS="$(vivid generate nord)"
##    export LS_COLORS="$(vivid generate one-dark)"
##    export LS_COLORS="$(vivid generate solarized-light)"
##    export LS_COLORS="$(vivid generate zenburn)"
##    export LS_COLORS="$(vivid generate dracula)"
##    export LS_COLORS="$(vivid generate snazzy)"
##    export LS_COLORS="$(vivid generate alabaster_dark)"
##    export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
##fi
##export DOCKER_HOST="tcp://0.0.0.0:6879"
##
##
### python -c 'import os,sys;from pathlib import Path;home=str(Path("~/").expanduser());print("\n".join([p for p in sys.path if home in p]))'
