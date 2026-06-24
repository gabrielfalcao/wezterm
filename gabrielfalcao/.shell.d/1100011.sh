#
# set:              list all shell variables
#
# grep -E -v:       exclude all lines which start with capital ascii
#                   letters, underscore or non-alphanumeric chars
#
# cut -d= -f1:      split line into fields separated by equals sign, then
#                   print first field only
#
# awk {print $1}:   make sure to only print the first "column"
#
# set -x
# unset $(set \
#             | grep -E -v '^(_|[A-Z]+|\W+)+' \
#             | cut -d= -f1 \
#             | awk '{ print $1 }' \
#             | xargs)
# set +x
set +m
# g p -qr '\bct\b'
# if [ "$?" != "0" ]; then
#     1>/dev/random 2>/dev/random bash -c '1>/dev/random 2>/dev/random ct &
#     disown -h' &
# fi

# sudo bash -c '1>/dev/random 2>/dev/random $HOME/opt/lib/bash-ps-root.sh &
# disown -h'

# bash -c '1>/dev/random 2>/dev/random $HOME/opt/lib/bash-ps.sh &
# disown -a'

if [ -d /Applications/Phoenix.app ]; then
    if [ -z "$(g p -r Phoenix)" ]; then
        open /Applications/Phoenix.app &
        disown -h
    fi
fi
