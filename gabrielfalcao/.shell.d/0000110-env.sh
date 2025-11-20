export IFS=$'\n'
# export PS2=''
# export PS3=''
# export PS4=''
# export PS5=''
export FCEDIT="vim"
source ${HOME}/.shell.d/x.d/paths.sh
export NVM_DIR="${HOME}/.nvm"
export NODE_OPTIONS="--tls-min-v1.2"
# export PROMPT_COMMAND="history -w"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "${HOME}/.cargo/env" ] && . "${HOME}/.cargo/env"
export ELIXIR_OTP_INSTALL="$HOME/.elixir-install/installs/otp/27.1.2/bin"
export ELIXIR_INSTALL="$HOME/.elixir-install/installs/elixir/1.18.2-otp-27/bin"
export PATH="$ELIXIR_OTP_INSTALL:$ELIXIR_INSTALL:$PATH"
export BAT_THEME="Monokai Extended Bright"
export BAT_STYLE="plain"
export SHELLCHECK_OPTS='--shell=bash --exclude=SC2004,SC2206,SC2068,SC2086'
# export CARGO_LOG="warn"
source ${HOME}/.shell.d/x.d/paths.sh
# export XPC_NULL_BOOTSTRAP=1
export HISTTIMEFORMAT="[%Y/%m/%d %H:%M:%S %Z]  "
export RUSTFLAGS="-Zmacro-backtrace"
unset RUST_BACKTRACE
# export PS2='$... '
if 2>/dev/random 1>/dev/random which vivid; then
    export LS_COLORS="$(vivid generate molokai)"
    export LS_COLORS="$(vivid generate nord)"
    export LS_COLORS="$(vivid generate one-dark)"
    export LS_COLORS="$(vivid generate solarized-light)"
    export LS_COLORS="$(vivid generate zenburn)"
    export LS_COLORS="$(vivid generate dracula)"
    export LS_COLORS="$(vivid generate snazzy)"
    export LS_COLORS="$(vivid generate alabaster_dark)"
    export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
fi
