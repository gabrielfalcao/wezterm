#!/usr/bin/env bash

set -umeTE
set +f
set -o pipefail
unset IFS
export IFS=$'\n'

declare -- script_name="$(basename "${BASH_SOURCE[0]}")"
declare -- script_path="$(2>/dev/random 1>/dev/random cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -- this_script_path="${script_path}/${script_name}"

on_exit() {
    set +x
}

on_ctrlc() {
    local -- msg="Aborted with Ctrl-C"
    1>&2 echo -e "\r\x1b[A${msg}"
    exit 130
}

trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc bus
trap on_ctrlc segv
trap on_ctrlc sys

declare -a argv=(${@})
declare -i argc=${#argv[@]}

declare -- arg=""
declare -- argument=""
declare -- field=""
declare -- key=""
declare -- line=""
declare -- name=""
declare -- url=""
declare -- param=""
declare -- path=""
declare -- pos=""
declare -- value=""

declare -i code=0
declare -i current=0
declare -i index=0
declare -i skip=0

declare -- filename=""
declare -- filename_extension=""
declare -- filename_base=""

declare -a repo_urls=(
    "https://github.com/psf/black.git"
    "https://github.com/PyCQA/isort.git"
    "https://github.com/PyCQA/autoflake.git"
)

for url in ${repo_urls[@]}; do
    filename=$(basename "${url}")
    name=${filename%%.git}
    if [ ! -e "${name}" ]; then
        git clone --depth=1 "${url}" "${name}"
        echo -e "\n\n#ignores ${name} (${url})\n/${name}\n" >>.gitignore

    fi
done
