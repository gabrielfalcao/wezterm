#!/usr/bin/env bash

cls() {
    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
}

set -umeTE
set +f
set -o pipefail
unset IFS
export IFS=$'\n'

declare -g script_name="$(basename "${BASH_SOURCE[0]}")"
declare -g script_path="$(2>/dev/random 1>/dev/random cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -g this_script_path="${script_path}/${script_name}"

declare -g userland_username="gabrielfalcao"
declare -g userland_home="/Users/gabrielfalcao"

declare -g target_volume="/Volumes/nothing"

declare -g target_system_base="${target_volume}/APFEL_System"
declare -g target_root_base="${target_volume}/APFEL_Root"
declare -g target_home_base="${target_volume}/APFEL"

declare -g log_folder="${userland_home}/workbench/$(today)/real-quick-backup-logs"
mkdir -p "${log_folder}"
declare -gA backup_paths_from_to_map=()
declare -ga backup_paths_from_order=()
declare -ga backup_paths_to_order=()

if [ "$(whoami)" != "root" ]; then
    time sudo -E ${this_script_path}
    exit 0
fi

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
declare -- stderr="${log_folder}/stderr.log"
declare -- stdout="${log_folder}/stdout.log"
declare -a pids=()
on_exit() {
    set +x
    exit 11
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

declare -gi ode=0

declare -gi urrent=0

declare -gi index=0
declare -g rg=''
declare -g param=''

declare -- source_path=""
declare -- target_path=""

declare -g field=''
declare -g key=''
declare -g name=''
declare -g path=''
declare -g value=''
declare -a array_of_scheduled_sync_paths=()
declare -A map_of_scheduled_sync_commands=()

sync_from_to() {
    local -- from="${1}"
    shift
    local -- to="${1}"
    shift

    if [ ! -e "${from}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} warning]" "skipping ${from@Q} because does not exist: ${from@Q}"
        return 0
    elif [ ! -d "${from}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} warning]" "skipping ${from@Q} because is not a directory: ${from@Q}"
        return 0
    fi

    local -- log_name=$(heck-string --to=kebab "${from}")
    local -- stderr="${log_folder}/${log_name}.stderr.$$.${PPID}.log"
    local -- stdout="${log_folder}/${log_name}.stdout.$$.${PPID}.log"
    local -i code=0
    local -a rsync_call_argv=(
        rsync
        # --info=name
        --modify-window=1
        --no-links
        -pvauogUNW
        --size-only
        # --fsync
        --mkpath
        --ignore-errors
        --progress
        --stats
        --exclude='**/node_modules/'
        --exclude='**/target'
        --info=progress2,stats2,misc1,flist0
        --log-file="${log_folder}/${log_name}.log"
        --log-file-format='%i %n%L'
        "${from}"
        "${to}"
    )
    1>&2 echo -e "scheduling backup of ${from@Q}"

    array_of_scheduled_sync_paths+=("${from}")
    map_of_scheduled_sync_commands["${from}"]="${rsync_call_argv[@]}"
}

schedule_sync() {
    local -- from="${1}"
    shift
    local -- to="${1}"
    shift

    if [ ! -e "${from}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} warning]" "argument <FROM> does not exist: ${from@Q}"
        return 0
    elif [ ! -d "${from}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} warning]" "argument <FROM> is not a directory ${from@Q}"
        return 0
    fi

    local -- log_name=$(heck-string --to=kebab "${from}")
    local -- stderr="${log_folder}/${log_name}.stderr.$$.${PPID}.log"
    local -- stdout="${log_folder}/${log_name}.stdout.$$.${PPID}.log"
    local -i code=0
    local -a rsync_call_argv=(
        rsync
        # --info=name
        --modify-window=1
        --no-links
        -pvauogUNW
        --size-only
        # --fsync
        --mkpath
        --ignore-errors
        --progress
        --stats
        --exclude='**/node_modules/'
        --exclude='**/target'
        --info=progress2,stats2,misc1,flist0
        --log-file="${log_folder}/${log_name}.log"
        --log-file-format='%i %n%L'
        "${from}"
        "${to}"
    )
    1>&2 echo -e "running: ${rsync_call_argv[@]:0:1} ${rsync_call_argv[@]:1}"

    if 2>${stderr} ${rsync_call_argv[@]} | tee ${stdout}; then
        code=0
        1>&2 echo -e "succcess: ${rsync_call_argv[@]:0:1} ${rsync_call_argv[@]:1}"
    else
        1>&2 echo -e "failed to sync: ${rsync_call_argv[@]:0:1} ${rsync_call_argv[@]:1}"
        1>&2 cat "${stderr}"
        code=$?
    fi
    if [ ${code} -ne 0 ]; then
        1>&2 echo -en "command ${rsync_call_argv[@]:0:1} ${rsync_call_argv[@]:1} failed with ${code}"
        if [ -s "${stderr}" ]; then
            1>&2 cat "${stderr}"
        else
            1>&2 echo -e
        fi
    fi
    return ${code}
}

sync_scheduled() {
    local -i index=0
    local -i current=0
    local -- from=""
    local -- sync_command=""
    local -i total=${#array_of_scheduled_sync_paths[@]}
    export IFS=$'\n'
    for index in ${!array_of_scheduled_sync_paths[@]}; do
        export IFS=$'\n'
        current=$(( index + 1 ))
        from="${array_of_scheduled_sync_paths[${index}]}"
        sync_command=${map_of_scheduled_sync_commands["${from}"]}

        1>&2 echo -e "running: ${sync_command}"
        unset IFS
        if 2>${stderr} ${sync_command} | tee ${stdout}; then
            code=0
            1>&2 echo -e "succcess: ${rsync_call_argv[@]:0:1} ${rsync_call_argv[@]:1}"
            export IFS=$'\n'
        else
            1>&2 echo -e "failed to sync: ${rsync_call_argv[@]:0:1} ${rsync_call_argv[@]:1}"
            1>&2 cat "${stderr}"
            code=$?
            export IFS=$'\n'
        fi
    done
}


## schedule_sync "/Users/gabrielfalcao/Downloads/" \
##    "${target_volume}/APFEL/Downloads/"
## schedule_sync "/Users/gabrielfalcao/Blender/" \
##     "${target_volume}/APFEL/Blender/"
## schedule_sync "/Users/gabrielfalcao/Splice/" \
##     "${target_volume}/APFEL/Splice/"
## schedule_sync "/Users/gabrielfalcao/go/" \
##     "${target_volume}/APFEL/go/"
## schedule_sync "/Users/gabrielfalcao/.gnupg/" \
##     "${target_volume}/APFEL/.gnupg/"
## schedule_sync "/Users/gabrielfalcao/.ssh/" \
##     "${target_volume}/APFEL/.ssh/"
## schedule_sync "/Users/gabrielfalcao/.config/" \
##     "${target_volume}/APFEL/.config/"
## schedule_sync "/Users/gabrielfalcao/.cargo/" \
##     "${target_volume}/APFEL/.cargo/"
## schedule_sync "/Users/gabrielfalcao/.rustup/" \
##     "${target_volume}/APFEL/.rustup/"
#
#
## schedule_sync "/Users/gabrielfalcao/SEC/" \
##    "${target_volume}/APFEL/SEC/"
#
## schedule_sync "/Users/gabrielfalcao/workbench/" \
##    "${target_volume}/APFEL/workbench/"
#
#
## schedule_sync "/Users/gabrielfalcao/godot/" \
##    "${target_volume}/APFEL/godot/"
#
## schedule_sync "/Users/gabrielfalcao/Documents/" \
##    "${target_volume}/APFEL/Documents/"
#
## schedule_sync "/Users/gabrielfalcao/Kino/" \
##    "${target_volume}/APFEL/Kino/"
#
## schedule_sync "/Users/gabrielfalcao/Desktop/" \
##    "${target_volume}/APFEL/Desktop/"
#
## schedule_sync "/Users/gabrielfalcao/.bun/" \
##    "${target_volume}/APFEL/.bun/"
#
## schedule_sync "/Users/gabrielfalcao/.deno/" \
##    "${target_volume}/APFEL/.deno/"
#
## schedule_sync "/Users/gabrielfalcao/.nvm/" \
##    "${target_volume}/APFEL/.nvm/"
#
## schedule_sync "/Users/gabrielfalcao/.yarn/" \
##    "${target_volume}/APFEL/.yarn/"
#
#schedule_sync "/Users/gabrielfalcao/.local/" \
#   "${target_volume}/APFEL/.local/"
#schedule_sync "/Users/gabrielfalcao/projects/" \
#   "${target_volume}/APFEL/projects/"
#
#schedule_sync "/Users/gabrielfalcao/Library/" \
#    "${target_volume}/APFEL/Library/"
#
#schedule_sync "/Users/gabrielfalcao/opt/" \
#   "${target_volume}/APFEL/opt/"
#
#schedule_sync "/Users/gabrielfalcao/.emacs.d/" \
#   "${target_volume}/APFEL/.emacs.d/"
#
#schedule_sync "/Users/gabrielfalcao/.shell.d/" \
#              "${target_volume}/APFEL/.shell.d/"
#
#schedule_sync "/Users/gabrielfalcao/*scratch*/" \
#   "${target_volume}/APFEL/*scratch*/"
#
#
#sync_scheduled
#rsync --modify-window=1 --remove-source-files --no-links -pvauogUNW --size-only --mkpath --ignore-errors "/Users/gabrielfalcao/*scratch*/.x/" "${target_volume}/APFEL/*scratch*/.x/"
rsync --modify-window=1 -pvaulogUNW --mkpath --ignore-errors "/Users/gabrielfalcao/" "${target_volume}/APFEL/"


## sync_from_to "/Users/gabrielfalcao/*scratch*/" \
##     "${target_volume}/APFEL/*scratch*/" # && rm -rf "$USERLAND_HOME/*scratch*/NSA/$(date +"%Y")*"; g p tcpdump -k
## sync_from_to "/Users/gabrielfalcao/*scratch*/Data/" \
##     "${target_volume}/APFEL/*scratch*/Data/"
## sync_from_to "/Users/gabrielfalcao/__sandbox__/" \
##     "${target_volume}/APFEL/__sandbox__/"
## sync_from_to "/Users/gabrielfalcao/*sandbox*/" \
##     "${target_volume}/APFEL/*sandbox*/"
## sync_from_to "/Users/gabrielfalcao/*nons*/" \
##     "${target_volume}/APFEL/*nons*/"
## sync_from_to "/Users/gabrielfalcao/.wezterm.lua/" \
##     "${target_volume}/APFEL/.wezterm.lua/"
## sync_from_to "/Users/gabrielfalcao/SDKs/" \
##     "${target_volume}/APFEL/SDKs/"
## sync_from_to "/Users/gabrielfalcao/.logs/" \
##     "${target_volume}/APFEL/.logs/"
## sync_from_to "/Users/gabrielfalcao/Music/" \
##     "${target_volume}/APFEL/Music/"
## sync_from_to "/Users/gabrielfalcao/JUCE/" \
##     "${target_volume}/APFEL/JUCE/"
## sync_from_to "/Users/gabrielfalcao/Unity/" \
##     "${target_volume}/APFEL/Unity/"
## sync_from_to "/Users/gabrielfalcao/Splice/" \
##     "${target_volume}/APFEL/Splice/"
## sync_from_to "/Users/gabrielfalcao/Bildern/" \
##     "${target_volume}/APFEL/Bildern/"
## sync_from_to "/Users/gabrielfalcao/Büchen/" \
##     "${target_volume}/APFEL/Büchen/"
## sync_from_to "/Users/gabrielfalcao/Kino/" \
##     "${target_volume}/APFEL/Kino/"
## sync_from_to "/Users/gabrielfalcao/LOL/" \
##     "${target_volume}/APFEL/LOL/"
## sync_from_to "/Users/gabrielfalcao/Publications/" \
##     "${target_volume}/APFEL/Publications/"
## sync_from_to "/Users/gabrielfalcao/tmp/" \
##     "${target_volume}/APFEL/tmp/"
## sync_from_to "/Users/gabrielfalcao/Movies/" \
##     "${target_volume}/APFEL/Movies/"
## sync_from_to "/Users/gabrielfalcao/Pictures/" \
##     "${target_volume}/APFEL/Pictures/"
## sync_from_to "/Users/gabrielfalcao/Library/" \
##     "${target_volume}/APFEL/Library/"
## sync_from_to "/Users/gabrielfalcao/Applications/" \
##     "${target_volume}/APFEL/Applications/"
## sync_from_to "/Users/gabrielfalcao/Library/Application%20Support/" \
##     "${target_volume}/APFEL/Library/Application%20Support/"
## sync_from_to "/Users/gabrielfalcao/Library/HTTPStorages/" \
##     "${target_volume}/APFEL/Library/HTTPStorages/"
## sync_from_to "/Users/gabrielfalcao/Library/Caches/" \
##     "${target_volume}/APFEL/Library/Caches/"
## sync_from_to "/Users/gabrielfalcao/Library/LaunchAgents/" \
##     "${target_volume}/APFEL/Library/LaunchAgents/"
## sync_from_to "/Users/gabrielfalcao/Library/LaunchDaemons/" \
##     "${target_volume}/APFEL/Library/LaunchDaemons/"
## sync_from_to "/Users/gabrielfalcao/Library/Logs/" \
##     "${target_volume}/APFEL/Library/Logs/"
## sync_from_to "/Users/gabrielfalcao/Library/Audio/Plug-Ins/" \
##     "${target_volume}/APFEL/Library/Audio/Plug-Ins/"
##
## sync_from_to "/Users/gabrielfalcao/usr/local/" \
##     "${target_volume}/APFEL_Root/usr/local/"
## sync_from_to "/Users/gabrielfalcao/opt/" \
##     "${target_volume}/APFEL_Root/opt/"
## sync_from_to "/Users/gabrielfalcao/var/log/" \
##     "${target_volume}/APFEL_Root/var/log/"
## sync_from_to "/Users/gabrielfalcao/Applications/" \
##     "${target_volume}/APFEL_Root/Applications/"
##
## # # sync_from_to "/Users/gabrielfalcao/*scratch*/" \
## #     "${target_volume}/APFEL/*scratch*/" && rm -rf "$USERLAND_HOME/*scratch*/NSA/$(date +"%Y")*"; g p tcpdump -k
##


diskutil unmount "${target_volume}/"
