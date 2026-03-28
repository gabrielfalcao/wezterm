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
    1>/dev/null 2>/dev/null stty sane
}
on_ctrlc() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\rAborted with Ctrl-C\x1b[0m"
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
declare -- reason=""

if [ ${argc} -eq 0 ]; then
    reason="git-stash-push--tests"
    # 1>&2 echo -e "[${script_name} error]" "missing argument: <REASON>"
    # exit 1
else
    reason="${argv[@]}"
fi

declare -i ref_timestamp=1773103039 #$(date --utc +%s)
declare -- filename_day=$(date --date=@${ref_timestamp} +'%Y-%m-%d')
declare -- filename_datetime_string=$(date --date=@${ref_timestamp} +'%Y-%m-%d.%H-%M-%S.%s')
declare -- filename_git_ref=$(git log -1 --format=%h)
declare -- folded_pwd="$(path canon -f . | sed -E 's,[/]+,__,g')"
declare -- filename_reason=$(heck-string --to=snake "${reason}")
declare -- filename_base="backup__${folded_pwd}____${filename_datetime_string}__${filename_git_ref}____reason____${filename_reason}"
# # time zip -r ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__${filename_datetime_string}"

declare -- target_path_parent="${HOME}/workbench/${filename_day}"
mkdir -p "${target_path_parent}"

declare -- target_path_base="${target_path_parent}/${filename_base}"

declare -- target_path_tarball="${target_path_base}.tar.gz"
declare -- target_path_zipfile="${target_path_base}.zip"
declare -- target_path_rsync="${target_path_base}/"

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"

export ZIPOPT='--paths -9 --filesync --log-append --latest-time --quiet'

if [ -e "${target_path_rsync}" ]; then
    rm -rf "${target_path_rsync}"
fi

declare -- source_path="$(pwd)/"
1>&2 echo time rsync -potua "${source_path}" "${target_path_rsync}"
time rsync -potua "${source_path}" "${target_path_rsync}"

1>&2 echo time tar czf "${target_path_tarball}" "${source_path}"
time tar czf "${target_path_tarball}" "${source_path}"

1>&2 echo time zip -r "${target_path_zipfile}" "${source_path}"
time zip -r "${target_path_zipfile}" "${source_path}"
