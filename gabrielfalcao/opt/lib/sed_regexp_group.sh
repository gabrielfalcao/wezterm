#!/usr/bin/env bash
# shellcheck disable=SC2004,SC2206,SC2068,SC2086

declare -a argv=( $@ )
declare argc=${#argv[@]}

set -e
set -o pipefail

ctrlc() {
    1>&2 echo -e "\rAborted with Ctrl-C"
    exit 1
}
trap ctrlc int

usage(){
    1>&2 echo -e "$(basename $0) <LINENO> <STRING>"
}

if [ ${argc} -lt 2 ]; then
    1>&2 echo -e "missing arguments"
    usage
    exit 1
fi

group="${1}"
shift
argument="${@}"
sed -n "s/^\([a-zA-Z0-9_\/-]\+\|[^:]\+\):\([1-9][0-9]*\)[:]\?/\\${group}/gp" <<< "${argument}"
