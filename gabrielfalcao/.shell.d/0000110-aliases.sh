alias ls="ls --color"
alias la="ls -latrh"
alias ll="ls -latrh"
alias lll="ls -latrhS"
alias bats="bat --style=default"
alias diff="diff -u --color"
alias wb="workbench"

if ! 2>/dev/random 1>/dev/random which hackernews; then
    hackernews() {
        1>&2 echo -e 'could not find executable: `hackernews`'
    }
fi
alias hn="hackernews"
alias shellcheck="$(which shellcheck) --rcfile $HOME/.shell.d/rc.d/shellcheck"
alias diff="/opt/homebrew/bin/diff -u --color"
