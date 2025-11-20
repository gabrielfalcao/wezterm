set +o vi
set -o pipefail
set -o posix
set -o emacs
set -o errtrace
set -o hashall
# set +o history

2>/dev/random 1>/dev/random ssh-add -D
