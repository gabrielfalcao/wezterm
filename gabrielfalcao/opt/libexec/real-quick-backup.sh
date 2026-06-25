#!/usr/bin/env bash

cls() {
    1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"
}

set -umTE
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

declare -a rsync_ignores=(
    '--exclude' '**/.venv/*'
    '--exclude' '**/.venv'
    '--exclude' '**/node_modules/*'
    '--exclude' '**/node_modules'
    '--exclude' '**/target/*'
    '--exclude' '**/target'
)

declare -g log_folder="${userland_home}/workbench/$(today)/real-quick-backup-logs"
mkdir -p "${log_folder}"
declare -gA backup_paths_from_to_map=()
declare -ga backup_paths_from_order=()
declare -ga backup_paths_to_order=()

if [ "$(whoami)" != "root" ]; then
    sudo -E ${this_script_path}
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
declare -A map_of_source_paths_by_rsync_command=()
declare -A map_of_target_paths_by_rsync_command=()
declare -A map_of_scheduled_sync_commands=()
declare -a actual_volume_paths=()
declare -A volume_path_map=()

actual_volume_paths=(
    $(df -h | gawk '@load "filefuncs";BEGIN {volume_name="";init_field=6;field_position=6;}{volume_name="";field_position=init_field;while (field_position < (NF+1)) {if (field_position == init_field)  {volume_name = sprintf("%s", $field_position);} else if (field_position> init_field) {volume_name = sprintf("%s %s", volume_name, $field_position);} else {printf("invalid \x24field_position: %s in row %s\n", field_position, NR) >> "/dev/stderr";exit 1}field_position++;}if (stat(volume_name, fdata) >= 0) { printf("%s\n", volume_name);}}')
)
for path in ${actual_volume_paths[@]}; do
    volume_path_map["${path}"]="${path}"
done

validate_volumes() {
    if [ "${userland_home}" != "/Users/gabrielfalcao" ]; then
        1>&2 echo -e "invalid value for variable \${userland_home} expected '/Users/gabrielfalcao' but got ${userland_home@Q}"
        exit 1
    fi

    if [[ ! -v volume_path_map["${target_volume}"] ]]; then
        1>&2 echo -e "target volume is not mounted ${target_volume@Q}\n"
        1>&2 echo -e "list of mounted volumes:"
        1>&2 printf '    - %s\n' ${actual_volume_paths[@]}
        exit 1
    fi
}
safe_rsync() {
    validate_volumes
    rsync ${rsync_ignores[@]} ${@}
}

schedule_sync() {
    validate_volumes
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
        -HUNXLAuprogtv
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

    declare -- key="${rsync_call_argv[@]}"
    array_of_scheduled_sync_paths+=("${key}")
    map_of_target_paths_by_rsync_command["${key}"]="${to}"
    map_of_source_paths_by_rsync_command["${key}"]="${from}"
}

sync_scheduled() {
    local -i index=0
    local -i current=0
    local -- from=""
    local -- sync_command=""
    local -i total=${#array_of_scheduled_sync_paths[@]}
    export IFS=$'\n'

    validate_volumes
    for index in ${!array_of_scheduled_sync_paths[@]}; do
        validate_volumes
        export IFS=$'\n'
        current=$((index + 1))
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

safe_rsync --modify-window=1 --remove-source-files --no-links -HUNXLAuprogtv --size-only --mkpath --ignore-errors "${userland_home}/*scratch*/.x/" "${target_volume}/APFEL/*scratch*/.x/"
safe_rsync --modify-window=1 --remove-source-files --no-links -HUNXLAuprogtv --size-only --mkpath --ignore-errors "${userland_home}/Kino/" "${target_volume}/APFEL/Kino/"
safe_rsync --modify-window=1 --remove-source-files --no-links -HUNXLAuprogtv --size-only --mkpath --ignore-errors "${userland_home}/workbench/" "${target_volume}/APFEL/workbench/"
safe_rsync --modify-window=1 --remove-source-files --no-links -HUNXLAuprogtv --size-only --mkpath --ignore-errors "${userland_home}/projects/" "${target_volume}/APFEL/projects/"

# schedule_sync "${userland_home}/Downloads/" "${target_volume}/APFEL/Downloads/"
# schedule_sync "${userland_home}/Blender/" "${target_volume}/APFEL/Blender/"
# schedule_sync "${userland_home}/Splice/" "${target_volume}/APFEL/Splice/"
# schedule_sync "${userland_home}/go/" "${target_volume}/APFEL/go/"
# schedule_sync "${userland_home}/.gnupg/" "${target_volume}/APFEL/.gnupg/"
# schedule_sync "${userland_home}/.ssh/" "${target_volume}/APFEL/.ssh/"
# schedule_sync "${userland_home}/.config/" "${target_volume}/APFEL/.config/"
# schedule_sync "${userland_home}/.cargo/" "${target_volume}/APFEL/.cargo/"
# schedule_sync "${userland_home}/.rustup/" "${target_volume}/APFEL/.rustup/"

# schedule_sync "${userland_home}/SEC/" "${target_volume}/APFEL/SEC/"
# schedule_sync "${userland_home}/workbench/" "${target_volume}/APFEL/workbench/"
# schedule_sync "${userland_home}/godot/" "${target_volume}/APFEL/godot/"
# schedule_sync "${userland_home}/Documents/" "${target_volume}/APFEL/Documents/"
# schedule_sync "${userland_home}/Kino/" "${target_volume}/APFEL/Kino/"
# schedule_sync "${userland_home}/Desktop/" "${target_volume}/APFEL/Desktop/"
# schedule_sync "${userland_home}/.bun/" "${target_volume}/APFEL/.bun/"
# schedule_sync "${userland_home}/.deno/" "${target_volume}/APFEL/.deno/"
# schedule_sync "${userland_home}/.nvm/" "${target_volume}/APFEL/.nvm/"
# schedule_sync "${userland_home}/.yarn/" "${target_volume}/APFEL/.yarn/"
# schedule_sync "${userland_home}/.local/" "${target_volume}/APFEL/.local/"
# schedule_sync "${userland_home}/projects/" "${target_volume}/APFEL/projects/"
# schedule_sync "${userland_home}/Library/" "${target_volume}/APFEL/Library/"
# schedule_sync "${userland_home}/opt/" "${target_volume}/APFEL/opt/"
# schedule_sync "${userland_home}/.emacs.d/" "${target_volume}/APFEL/.emacs.d/"
# schedule_sync "${userland_home}/.shell.d/" "${target_volume}/APFEL/.shell.d/"
# schedule_sync "${userland_home}/*scratch*/Data/" "${target_volume}/APFEL/*scratch*/Data/"
# schedule_sync "${userland_home}/*scratch*/" "${target_volume}/APFEL/*scratch*/"
#
# safe_rsync --modify-window=1 -HUNXLAuprogtv --fsync --progress --mkpath --ignore-errors "${userland_home}/" "${target_volume}/APFEL/"
#
# schedule_sync "${userland_home}/__sandbox__/" "${target_volume}/APFEL/__sandbox__/"
# schedule_sync "${userland_home}/*sandbox*/" "${target_volume}/APFEL/*sandbox*/"
# schedule_sync "${userland_home}/*nons*/" "${target_volume}/APFEL/*nons*/"
# schedule_sync "${userland_home}/.wezterm.lua/" "${target_volume}/APFEL/.wezterm.lua/"
# schedule_sync "${userland_home}/SDKs/" "${target_volume}/APFEL/SDKs/"
# schedule_sync "${userland_home}/.logs/" "${target_volume}/APFEL/.logs/"
# schedule_sync "${userland_home}/Music/" "${target_volume}/APFEL/Music/"
# schedule_sync "${userland_home}/JUCE/" "${target_volume}/APFEL/JUCE/"
# schedule_sync "${userland_home}/Unity/" "${target_volume}/APFEL/Unity/"
# schedule_sync "${userland_home}/Bildern/" "${target_volume}/APFEL/Bildern/"
# schedule_sync "${userland_home}/Büchen/" "${target_volume}/APFEL/Büchen/"
# schedule_sync "${userland_home}/LOL/" "${target_volume}/APFEL/LOL/"
# schedule_sync "${userland_home}/Publications/" "${target_volume}/APFEL/Publications/"
# schedule_sync "${userland_home}/tmp/" "${target_volume}/APFEL/tmp/"
# schedule_sync "${userland_home}/Movies/" "${target_volume}/APFEL/Movies/"
# schedule_sync "${userland_home}/Pictures/" "${target_volume}/APFEL/Pictures/"
# schedule_sync "${userland_home}/Applications/" "${target_volume}/APFEL/Applications/"
# schedule_sync "${userland_home}/Library/Application%20Support/" "${target_volume}/APFEL/Library/Application%20Support/"
# schedule_sync "${userland_home}/Library/HTTPStorages/" "${target_volume}/APFEL/Library/HTTPStorages/"
# schedule_sync "${userland_home}/Library/Caches/" "${target_volume}/APFEL/Library/Caches/"
# schedule_sync "${userland_home}/Library/LaunchAgents/" "${target_volume}/APFEL/Library/LaunchAgents/"
# schedule_sync "${userland_home}/Library/LaunchDaemons/" "${target_volume}/APFEL/Library/LaunchDaemons/"
# schedule_sync "${userland_home}/Library/Logs/" "${target_volume}/APFEL/Library/Logs/"
# schedule_sync "${userland_home}/Library/Audio/Plug-Ins/" "${target_volume}/APFEL/Library/Audio/Plug-Ins/"
# schedule_sync "${userland_home}/usr/local/" "${target_volume}/APFEL_Root/usr/local/"
# schedule_sync "${userland_home}/opt/" "${target_volume}/APFEL_Root/opt/"
# schedule_sync "${userland_home}/var/log/" "${target_volume}/APFEL_Root/var/log/"
# schedule_sync "${userland_home}/Applications/" "${target_volume}/APFEL_Root/Applications/"
# schedule_sync "${userland_home}/*scratch*/" "${target_volume}/APFEL/*scratch*/" && rm -rf "$userland_home/*scratch*/NSA/$(date +"%Y")*"

sync_scheduled
g p tcpdump -k

diskutil unmount "${target_volume}/"
