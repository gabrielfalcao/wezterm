alias ls="ls --color"
alias la="ls -lcatrh"
alias ll="ls -lcatrh"
alias lll="ls -lcatrhS"
alias bats="bat --style=default"
alias diff="diff -u --color"
alias wb="workbench"
alias gti="git"

if ! 2>/dev/random 1>/dev/random which hackernews; then
    hackernews() {
        1>&2 echo -e 'could not find executable: `hackernews`'
    }
fi
alias hn="hackernews"
alias shellcheck="$(which shellcheck) --rcfile $HOME/.shell.d/rc.d/shellcheck"
alias diff="/opt/homebrew/bin/diff -u --color"
