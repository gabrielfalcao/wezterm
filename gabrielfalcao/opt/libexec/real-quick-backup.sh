#!/usr/bin/env bash

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

declare -g log_folder="${userland_home}/workbench/$(today)/quick-backup-logs"
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

on_exit() {
    set +x
    1>/dev/null 2>/dev/null bash -c "#!/usr/bin/env bash

exec 1>/dev/null 2>/dev/null </dev/null

set -umeTE;set +f; set -o pipefail;
rm -f ${stderr@Q} &
disown -a

1>/dev/null 2>/dev/null stty sane
"
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

sync_from_to() {
    local -- from="${1}"
    shift
    local -- to="${1}"
    shift

    if [ ! -e "${from}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "argument <FROM> does not exist: ${from@Q}"
        return 9
    elif [ ! -d "${from}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "argument <FROM> is not a directory ${from@Q}"
        return 9
    fi

    if [ ! -e "${to}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "argument <TO> does not exist: ${to@Q}"
        return 9
    elif [ ! -d "${to}" ]; then
        1>&2 echo -e "[${FUNCNAME[0]} error]" "argument <TO> is not a directory ${to@Q}"
        return 9
    fi

    local -- log_name=$(heck-string --to=kebab "${from}")
    local -- stderr="${log_folder}/${log_name}.stderr.$$.${PPID}.log"
    local -- stdout="${log_folder}/${log_name}.stdout.$$.${PPID}.log"
    local -i code=0
    local -a rsync_call_argv=(
        rsync
        # --info=name
        --modify-window=1
        -pvaulogUNW
        --size-only
        # --fsync
        --mkpath
        --ignore-errors
        --progress
        --stats
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

rsync --modify-window=1 --remove-source-files -pvaulogUNW --size-only --mkpath --ignore-errors "/Users/gabrielfalcao/*scratch*/.x/" "/Volumes/nothing/APFEL/*scratch*/.x/"

sync_from_to "/Users/gabrielfalcao/Downloads/" \
    "/Volumes/nothing/APFEL/Downloads/"

sync_from_to "/Users/gabrielfalcao/Kino/" \
    "/Volumes/nothing/APFEL/Kino/"

sync_from_to "/Users/gabrielfalcao/*scratch*/" \
    "/Volumes/nothing/APFEL/*scratch*/"

sync_from_to "/Users/gabrielfalcao/opt/" \
    "/Volumes/nothing/APFEL/opt/"

sync_from_to "/Users/gabrielfalcao/.emacs.d/" \
    "/Volumes/nothing/APFEL/.emacs.d/"

sync_from_to "/Users/gabrielfalcao/.shell.d/" \
    "/Volumes/nothing/APFEL/.shell.d/"

sync_from_to "/Users/gabrielfalcao/projects/" \
    "/Volumes/nothing/APFEL/projects/"

sync_from_to "/Users/gabrielfalcao/godot/" \
    "/Volumes/nothing/APFEL/godot/"

sync_from_to "/Users/gabrielfalcao/workbench/" \
    "/Volumes/nothing/APFEL/workbench/"

sync_from_to "/Users/gabrielfalcao/Documents/" \
    "/Volumes/nothing/APFEL/Documents/"

sync_from_to "/Users/gabrielfalcao/Desktop/" \
    "/Volumes/nothing/APFEL/Desktop/"

sync_from_to "/Users/gabrielfalcao/.bun/" \
    "/Volumes/nothing/APFEL/.bun/"

sync_from_to "/Users/gabrielfalcao/.deno/" \
    "/Volumes/nothing/APFEL/.deno/"

sync_from_to "/Users/gabrielfalcao/.nvm/" \
    "/Volumes/nothing/APFEL/.nvm/"

sync_from_to "/Users/gabrielfalcao/.yarn/" \
    "/Volumes/nothing/APFEL/.yarn/"

sync_from_to "/Users/gabrielfalcao/.local/" \
    "/Volumes/nothing/APFEL/.local/"

sync_from_to "/Users/gabrielfalcao/Blender/" \
    "/Volumes/nothing/APFEL/Blender/"

rsync --modify-window=1 -pvaulogUNW --size-only --mkpath --ignore-errors "/Users/gabrielfalcao/" "/Volumes/nothing/APFEL/"

diskutil unmount /Volumes/nothing/
## sync_from_to "/Users/gabrielfalcao/go/" \
##     "/Volumes/nothing/APFEL/go/"
## sync_from_to "/Users/gabrielfalcao/.gnupg/" \
##     "/Volumes/nothing/APFEL/.gnupg/"
## sync_from_to "/Users/gabrielfalcao/.ssh/" \
##     "/Volumes/nothing/APFEL/.ssh/"
## sync_from_to "/Users/gabrielfalcao/.config/" \
##     "/Volumes/nothing/APFEL/.config/"
## sync_from_to "/Users/gabrielfalcao/*scratch*/" \
##     "/Volumes/nothing/APFEL/*scratch*/" # && rm -rf "$USERLAND_HOME/*scratch*/NSA/$(date +"%Y")*"; g p tcpdump -k
## sync_from_to "/Users/gabrielfalcao/*scratch*/Data/" \
##     "/Volumes/nothing/APFEL/*scratch*/Data/"
## sync_from_to "/Users/gabrielfalcao/__sandbox__/" \
##     "/Volumes/nothing/APFEL/__sandbox__/"
## sync_from_to "/Users/gabrielfalcao/*sandbox*/" \
##     "/Volumes/nothing/APFEL/*sandbox*/"
## sync_from_to "/Users/gabrielfalcao/*nons*/" \
##     "/Volumes/nothing/APFEL/*nons*/"
## sync_from_to "/Users/gabrielfalcao/.wezterm.lua/" \
##     "/Volumes/nothing/APFEL/.wezterm.lua/"
## sync_from_to "/Users/gabrielfalcao/SDKs/" \
##     "/Volumes/nothing/APFEL/SDKs/"
## sync_from_to "/Users/gabrielfalcao/.logs/" \
##     "/Volumes/nothing/APFEL/.logs/"
## sync_from_to "/Users/gabrielfalcao/Music/" \
##     "/Volumes/nothing/APFEL/Music/"
## sync_from_to "/Users/gabrielfalcao/JUCE/" \
##     "/Volumes/nothing/APFEL/JUCE/"
## sync_from_to "/Users/gabrielfalcao/Unity/" \
##     "/Volumes/nothing/APFEL/Unity/"
## sync_from_to "/Users/gabrielfalcao/Splice/" \
##     "/Volumes/nothing/APFEL/Splice/"
## sync_from_to "/Users/gabrielfalcao/Bildern/" \
##     "/Volumes/nothing/APFEL/Bildern/"
## sync_from_to "/Users/gabrielfalcao/Büchen/" \
##     "/Volumes/nothing/APFEL/Büchen/"
## sync_from_to "/Users/gabrielfalcao/Kino/" \
##     "/Volumes/nothing/APFEL/Kino/"
## sync_from_to "/Users/gabrielfalcao/LOL/" \
##     "/Volumes/nothing/APFEL/LOL/"
## sync_from_to "/Users/gabrielfalcao/Publications/" \
##     "/Volumes/nothing/APFEL/Publications/"
## sync_from_to "/Users/gabrielfalcao/tmp/" \
##     "/Volumes/nothing/APFEL/tmp/"
## sync_from_to "/Users/gabrielfalcao/Movies/" \
##     "/Volumes/nothing/APFEL/Movies/"
## sync_from_to "/Users/gabrielfalcao/Pictures/" \
##     "/Volumes/nothing/APFEL/Pictures/"
## sync_from_to "/Users/gabrielfalcao/Library/" \
##     "/Volumes/nothing/APFEL/Library/"
## sync_from_to "/Users/gabrielfalcao/Applications/" \
##     "/Volumes/nothing/APFEL/Applications/"
## sync_from_to "/Users/gabrielfalcao/Library/Application%20Support/" \
##     "/Volumes/nothing/APFEL/Library/Application%20Support/"
## sync_from_to "/Users/gabrielfalcao/Library/HTTPStorages/" \
##     "/Volumes/nothing/APFEL/Library/HTTPStorages/"
## sync_from_to "/Users/gabrielfalcao/Library/Caches/" \
##     "/Volumes/nothing/APFEL/Library/Caches/"
## sync_from_to "/Users/gabrielfalcao/Library/LaunchAgents/" \
##     "/Volumes/nothing/APFEL/Library/LaunchAgents/"
## sync_from_to "/Users/gabrielfalcao/Library/LaunchDaemons/" \
##     "/Volumes/nothing/APFEL/Library/LaunchDaemons/"
## sync_from_to "/Users/gabrielfalcao/Library/Logs/" \
##     "/Volumes/nothing/APFEL/Library/Logs/"
## sync_from_to "/Users/gabrielfalcao/Library/Audio/Plug-Ins/" \
##     "/Volumes/nothing/APFEL/Library/Audio/Plug-Ins/"
##
## sync_from_to "/Users/gabrielfalcao/usr/local/" \
##     "/Volumes/nothing/APFEL_Root/usr/local/"
## sync_from_to "/Users/gabrielfalcao/opt/" \
##     "/Volumes/nothing/APFEL_Root/opt/"
## sync_from_to "/Users/gabrielfalcao/var/log/" \
##     "/Volumes/nothing/APFEL_Root/var/log/"
## sync_from_to "/Users/gabrielfalcao/Applications/" \
##     "/Volumes/nothing/APFEL_Root/Applications/"
##
## # # sync_from_to "/Users/gabrielfalcao/*scratch*/" \
## #     "/Volumes/nothing/APFEL/*scratch*/" && rm -rf "$USERLAND_HOME/*scratch*/NSA/$(date +"%Y")*"; g p tcpdump -k
##
