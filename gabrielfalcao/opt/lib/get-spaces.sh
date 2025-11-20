#!/usr/bin/env bash

set -e
set -o pipefail
export IFS=$'\n'

this_script_path="${BASH_SOURCE[0]}"
script_name="$(basename "${this_script_path}")"
script_path="$(dirname "${this_script_path}")"

declare -a argv=($@)
declare -i argc=${#argv[@]}

ord "$(cat ${script_path}/spaces.adoc)" | ack 0x | sed -n 's/^.*\s\+\(0x[a-fA-F0-9]\+\)\s\+.*$/\1/gp' | sort -u
