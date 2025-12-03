export PATH="$HOME/opt/libexec:$PATH"
export IFS=$'\n'

entrypoint() {
    eval "$(~/.cargo/bin/ps1 --env)"
    local SHELL_D_PATH="${HOME}/.shell.d"
    local sh

    xD \
        "locale.sh" \
        "homebrew.sh" \
        "paths.sh" \
        "cdpaths.sh"

    xD 0000000.sh
    xD 0000010-editors.sh
    xD 0000101-functions.sh
    if 1>/dev/random 2>/dev/random declare -F bash_wip; then
        2>/dev/random bash_wip &
        disown -h
        disown -a
    else
        1>&2 echo "bash_wip does not seem to be declared"
    fi
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
        "workbench.sh"

    unset s brew_path path gq
    . "/opt/homebrew/etc/bash_completion"
    . "$HOME/opt/lib/completions.sh"
}


xD() {
    local SHELL_D_PATH="${HOME}/.shell.d"
    local X_D_PATH="$SHELL_D_PATH/x.d"
    . $SHELL_D_PATH/*fun*
    for sh in $*; do
        if [ -e "$SHELL_D_PATH/$sh" ]; then
            . "$SHELL_D_PATH/$sh"
        elif [ -e "$X_D_PATH/$sh" ]; then
            . "$X_D_PATH/$sh"
        else
            1>&2 echo -e "$0 usage is wrong: $sh"
            return 5
        fi
    done
    unset sh
}


entrypoint

for fn in $(grep '^[a-z_]\+[(][^)]*[)]\([[:space:]]*\|\n\)[{]' "${BASH_SOURCE[0]}" | sed 's/^[[:space:]]*\([[:space:]]*function[[:space:]]*\)\?\([a-zA-Z_-][a-zA-Z0-9_-]\+\).*[(][^)]*[)]\([[:space:]]*\|\n\)*[{]/\2/g'); do
    2>/dev/random 1>/dev/random unset "$function_name"
done

set +o noglob
set +u

# # # # ${parameter/pattern/string}   # erstes
# # # # ${parameter//pattern/string}  # alles
# # # # ${parameter/#pattern/string}  # start
# # # # ${parameter/%pattern/string}  # end
# export PROMPT_COMMAND="history -a;"
# export PROMPT_COMMAND="history -n; history -r; history -a"

# if 1>/dev/random 2>/dev/random which bash-wip-print-state; then
#     2>/dev/null 1>/dev/null bash-wip < /dev/null  &
#     disown -h
#     disown -a
# fi
# cls
