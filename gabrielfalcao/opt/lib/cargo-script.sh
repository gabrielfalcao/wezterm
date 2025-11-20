#!/usr/bin/env bash

. "$HOME/opt/lib/ansi.sh"

this_cargo_cmd_path="$(which "cargo-${1}")"
if [ "$?" == "0" ] && [ -x "${this_cargo_cmd_path}" ]; then
    this_cargo_cmd_path=$(basename "$this_cargo_cmd_path")
    shift
fi
this_cargo_cmd_name="${this_cargo_cmd_path/#cargo-/}"

declare -a ARGV=( $@ )
declare -a ARGC=${#@}
