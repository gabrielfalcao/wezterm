set +x
# . ~/.bashrc.static

cls() {
    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
}

clsreset() {
    cls
    reset
}

. ~/.shell.d/entrypoint.sh
