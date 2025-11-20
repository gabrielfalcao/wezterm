#!/usr/bin/bash
export IFS=$"\n"

. $HOME/opt/lib/ansi.sh


git_status_list_commitable_paths() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[[:space:]]*\([ADM]\|[?]\{1,\}\)[[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d') )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}

git_status_list_all_tracked() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[[:space:]]*[ADM][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}

git_status_list_tracked_added() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[[:space:]]*[A][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}
git_status_list_tracked_modified() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[[:space:]]*[M][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}
git_status_list_tracked_deleted() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[[:space:]]*[D][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}


git_status_list_all_staged() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[ADM][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}

git_status_list_staged_added() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[A][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}
git_status_list_staged_modified() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[M][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}
git_status_list_staged_deleted() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[D][[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}


git_status_list_untracked() {
    local -a result=( $(2>/dev/random git status --porcelain | grep '^[[:space:]]*[?]\{1,\}[[:space:]]\+' | awk '{ print $NF }' | sed '/^\s*$/d' ) )
    if [ ${#result[@]} -gt 0 ]; then
        for line in ${result[@]}; do
            if [ -n "${line}" ]; then
                echo "${line}"
            fi
        done
        return 0
    else
        return 1
    fi
}
get_log_timestamp() {
    date +"%Y-%m-%dT%H-%M-%S"
}
get_unix_timestamp() {
    date +"%s"
}


federated_receipts_base_path=$HOME/opt/var/receipts/

tarball_base_path=$HOME/backups/git/
mkdir -p "${tarball_base_path}"
mkdir -p "${federated_receipts_base_path}"
if [ ! -d "${federated_receipts_base_path}/.git" ]; then
    (cd ${federated_receipts_base_path} && git init)
fi
if ! cols=$(term-columns); then
    cols=150
fi

hr="$(for char in {"@","=","%"}; do echo -en "\n$(seq ${cols} | tr '\n' "${char}" | tr -d '[0-9]')"; done)"
hre="$(echo -en "\n$(seq ${cols} | tr '\n' "=" | tr -d '[0-9]')\n")"


tmp_proc=$(mktemp)
ps aux | grep $$ | grep -v grep > ${tmp_proc}
process_banner=$(cat "${tmp_proc}")


autobackup_git_path() {
    path=$(require_argument "path" "${1}")
    shift
    cd "${path}"
    if [ ! -e "${path}" ]; then
        1>&2 bar_text_left 231 196 "ERROR:$(ansi_spaced 196 231 "path does not exist: ${path}")"
        return 1
    fi
    if [ ! -d "${path}" ]; then
        1>&2 bar_text_left 231 196 "ERROR:$(ansi_spaced 196 231 "path is not a directory: ${path}")"
        return 1
    fi
    timestamp=$(get_log_timestamp);
    federated_receipt_log_name=$(slugify-string $path).${timestamp}.log;
    git_tarball_name=$(slugify-string $path).${timestamp}.git.tar.xz;
    git_tarball_path=${tarball_base_path}/${git_tarball_name}
    blobs_tarball_name=$(slugify-string $path).${timestamp}.blobs.tar.xz;
    blobs_tarball_path=${tarball_base_path}/${blobs_tarball_name}
    local -a git_commitable_paths=( $(cd "${path}" && git_status_list_commitable_paths ) )
    if [ ${#git_commitable_paths} -eq 0 ]; then
        return 101
    fi
    local -a git_tracked_paths=( $(cd "${path}" && git_status_list_all_tracked ) )
    local -a git_tracked_added_path=( $(cd "${path}" && git_status_list_tracked_added ) )
    local -a git_tracked_modified_path=( $(cd "${path}" && git_status_list_tracked_modified ) )
    local -a git_tracked_deleted_path=( $(cd "${path}" && git_status_list_tracked_deleted ) )
    local -a git_staged_paths=( $(cd "${path}" && git_status_list_all_staged ) )
    local -a git_staged_added_path=( $(cd "${path}" && git_status_list_staged_added ) )
    local -a git_staged_modified_path=( $(cd "${path}" && git_status_list_staged_modified ) )
    local -a git_staged_deleted_path=( $(cd "${path}" && git_status_list_staged_deleted ) )

    git_receipt_path=${path}/.git.receipt.${timestamp}.log
    tmp_receipt_stdout_path=$(mktemp)
    tmp_receipt_stderr_path=$(mktemp)
    echo -e "\n# [$(get_log_timestamp)] # START OF STDERR ${tmp_receipt_stderr_path@Q} (for process ${process_banner@Q})" >> ${tmp_receipt_stderr_path}
    echo -e "\n# [$(get_log_timestamp)] # START OF STDOUT ${tmp_receipt_stdout_path@Q} (for process ${process_banner@Q})" >> ${tmp_receipt_stdout_path}


    echo -e "\n# [$(get_log_timestamp)] tarball with backup of ${path}/.git is: ${git_tarball_path@Q}\n" >> ${tmp_receipt_stdout_path}
    if [ ${#git_staged_paths[@]} -gt 0 ]; then
        commit_message="(auto) git commit staged files $(nowaapl)"
        log_prefix="[$(get_log_timestamp)] "
        echo -en "${log_prefix}" >>${tmp_receipt_stderr_path}
        echo -en "${log_prefix}" >>${tmp_receipt_stdout_path}

        if 2>>${tmp_receipt_stderr_path} 1>>${tmp_receipt_stdout_path} git commit -m "${commit_message}"; then
            echo -e "\n# [$(get_log_timestamp)] SUCCESS: git commit -m ${commit_message@Q}\n" >> ${tmp_receipt_stdout_path}
        else
            echo -e "\n# [$(get_log_timestamp)] ERROR: git commit -m ${commit_message@Q} # check ${tmp_receipt_stderr_path@Q} for details \n" >> ${tmp_receipt_stdout_path}
        fi
    fi
    if [ ${#git_tracked_paths[@]} -gt 0 ]; then
        commit_message="(auto) git commit tracked files $(nowaapl)"
        log_prefix="[$(get_log_timestamp)] "
        echo -en "${log_prefix}" >>${tmp_receipt_stderr_path}
        echo -en "${log_prefix}" >>${tmp_receipt_stdout_path}

        if 2>>${tmp_receipt_stderr_path} 1>>${tmp_receipt_stdout_path} git commit -am "${commit_message}"; then
            echo -e "\n# [$(get_log_timestamp)] SUCCESS: git commit -am ${commit_message@Q}\n" >> ${tmp_receipt_stdout_path}
        else
            echo -e "\n# [$(get_log_timestamp)] ERROR: git commit -am ${commit_message@Q} # check ${tmp_receipt_stderr_path@Q} for details \n" >> ${tmp_receipt_stdout_path}
        fi
    fi
    local -a git_untracked_paths=( $(git_status_list_untracked) )
    if [ ${#git_untracked_paths[@]} -gt 0 ]; then
        commit_message="(auto) git commit untracked files $(nowaapl)"
        log_prefix="[$(get_log_timestamp)] "
        echo -en "${log_prefix}" >>${tmp_receipt_stderr_path}
        echo -en "${log_prefix}" >>${tmp_receipt_stdout_path}

        git add ${git_untracked_paths[@]}
        if 2>>${tmp_receipt_stderr_path} 1>>${tmp_receipt_stdout_path} git commit -am "${commit_message}"; then
            echo -e "\n# [$(get_log_timestamp)] SUCCESS: git commit -am ${commit_message@Q}\n" >> ${tmp_receipt_stdout_path}
        else
            echo -e "\n# [$(get_log_timestamp)] ERROR: git commit -am ${commit_message@Q} # check ${tmp_receipt_stderr_path@Q} for details \n" >> ${tmp_receipt_stdout_path}
        fi
    fi
    fs_tree_path=${path}/.fstree
    tmp_fstree_path=$(mktemp)

    tree -a >> ${tmp_fstree_path}

    log_prefix="[$(get_log_timestamp)] "
    command_to_log="tar cJvf ${git_tarball_path} ${path}/.git"
    echo -e "${log_prefix} ${command_to_log}\n" >> ${tmp_receipt_stderr_path}
    echo -e "${log_prefix} ${command_to_log}\n" >> ${tmp_receipt_stdout_path}
    if 2>>${tmp_receipt_stderr_path} 1>>${tmp_receipt_stdout_path} tar cJvf ${git_tarball_path} ${path}/.git; then
        log_prefix="\n[$(get_log_timestamp)] "
        echo -e "${log_prefix} SUCCESS: ${command_to_log}\n" >> ${tmp_receipt_stderr_path}
        echo -e "${log_prefix} SUCCESS: ${command_to_log}\n" >> ${tmp_receipt_stdout_path}

    else
        log_prefix="\n[$(get_log_timestamp)] "
        echo -e "${log_prefix} ERROR: ${command_to_log}\n" >> ${tmp_receipt_stderr_path}
        echo -e "${log_prefix} ERROR: ${command_to_log}\n" >> ${tmp_receipt_stdout_path}
    fi

    declare -a blobs_to_archive=( $(find ${path} -type f -and -not -path "*/.git/*" -and -not -path "*/.git" ) )

    if [ -r "${path}/.gitignore" ]; then
        for line in $(cat "${path}/.gitignore"); do
            blobs_to_archive+=( $(find ${path} -type f -and -not -path "*/.git/*" -and -not -path "*/.git" -and -path "${line}" -or -type f -and -not -path "*/.git/*" -and -not -path "*/.git" -and -name "${line}") )
        done
    fi
    if [ ${#blobs_to_archive[@]} -gt 0 ]; then
        log_prefix="[$(get_log_timestamp)] "
        command_to_log="tar cJvf ${blobs_tarball_path} ${blobs_to_archive[@]}"
        echo -e "${log_prefix} ${command_to_log}\n" >> ${tmp_receipt_stderr_path}
        echo -e "${log_prefix} ${command_to_log}\n" >> ${tmp_receipt_stdout_path}
        if 2>>${tmp_receipt_stderr_path} 1>>${tmp_receipt_stdout_path} tar cJvf ${blobs_tarball_path} ${blobs_to_archive[@]}; then
            log_prefix="\n[$(get_log_timestamp)] "
            echo -e "${log_prefix} SUCCESS: ${command_to_log}\n" >> ${tmp_receipt_stderr_path}
            echo -e "${log_prefix} SUCCESS: ${command_to_log}\n" >> ${tmp_receipt_stdout_path}

        else
            log_prefix="\n[$(get_log_timestamp)] "
            echo -e "${log_prefix} ERROR: ${command_to_log}\n" >> ${tmp_receipt_stderr_path}
            echo -e "${log_prefix} ERROR: ${command_to_log}\n" >> ${tmp_receipt_stdout_path}
        fi
    else
        1>&2 bar_text_center 220 235 "WARNING: no blobs found"
    fi

    echo -e "\n# [$(get_log_timestamp)] # END OF STDERR ${tmp_receipt_stderr_path@Q} (for process ${process_banner@Q})\n" >> ${tmp_receipt_stderr_path}
    echo -e "\n" >> ${tmp_receipt_stderr_path}
    echo -e "\n# [$(get_log_timestamp)] # END OF STDOUT ${tmp_receipt_stdout_path@Q} (for process ${process_banner@Q})\n" >> ${tmp_receipt_stdout_path}


    combined_receipt_path=$(mktemp)
    separator_path=$(mktemp)
    echo -e "\n${hr}\n" > ${separator_path}
    echo -e "\n${hr}\n[$(get_log_timestamp)] # START RECEIPT FOR ${path} and ${git_tarball_path@Q} [${timestamp}] \n" >> ${combined_receipt_path}
    echo -e "\n${hre}\n[$(get_log_timestamp)] # START FS TREE FOR ${path} \n" >> ${combined_receipt_path}
    echo -e "\n$(cat ${tmp_fstree_path} | sed 's/^/    /g')\n" >> ${combined_receipt_path}
    echo -e "\n${hre}\n[$(get_log_timestamp)] # END FS TREE FOR ${path} \n" >> ${combined_receipt_path}
    cat ${tmp_receipt_stdout_path} ${separator_path} ${tmp_receipt_stderr_path} ${separator_path} >> ${combined_receipt_path}
    echo -e "\n${hr}\n[$(get_log_timestamp)] # END RECEIPT FOR ${path} and ${git_tarball_path@Q} [${timestamp}] \n" >> ${combined_receipt_path}
    sed '/^\s*$/d' ${combined_receipt_path}>  ${git_receipt_path}
    sed 's/^@\+$/\n/g' -i ${git_receipt_path}
    sed 's/^%\+$/\n/g' -i ${git_receipt_path}
    git add -f ${git_receipt_path}

    fed_receipt_log_path=${federated_receipts_base_path}/${federated_receipt_log_name}
    fed_receipt_stdout_path=${federated_receipts_base_path}/${federated_receipt_log_name/.log/.stdout.log}
    fed_receipt_stderr_path=${federated_receipts_base_path}/${federated_receipt_log_name/.log/.stderr.log}
    fed_receipt_entry="unfederated-entry:$(cat ${git_receipt_path} | gzip -9 | base64 -w0)"

    tmp_fed_receipt=$(mktemp)
    tmp_fed_receipt_stdout=$(mktemp)
    tmp_fed_receipt_stderr=$(mktemp)
    echo -e "\n# [$(get_log_timestamp)] # START OF STDERR ${tmp_fed_receipt_stderr@Q} (for process ${process_banner@Q})" >> ${tmp_fed_receipt_stderr}
    echo -e "\n# [$(get_log_timestamp)] # START OF STDOUT ${tmp_fed_receipt_stdout@Q} (for process ${process_banner@Q})" >> ${tmp_fed_receipt_stdout}

    echo -e "\n${hr}\n[$(get_log_timestamp)] # START FEDERATED RECEIPT FOR ${path} and ${git_tarball_path@Q} [${timestamp}] \n" >> ${tmp_fed_receipt}
    commit_message="receipt auto git commits from ${timestamp} done by ${process_banner@Q}"
    echo -e "\n[$(get_log_timestamp)] git commit ${git_receipt_path} -m \"${commit_message@Q}\" \n" >> ${tmp_fed_receipt}
    if 2>>${tmp_fed_receipt_stderr} 1>>${tmp_fed_receipt_stdout} git commit ${git_receipt_path} -m "${commit_message}"; then
        echo -e "\n[$(get_log_timestamp)] SUCCESS: git commit ${git_receipt_path} -m \"${commit_message@Q}\" \n" >> ${tmp_fed_receipt}
    else
        echo -e "\n# [$(get_log_timestamp)] ERROR: git commit -am ${commit_message@Q} # check ${tmp_fed_receipt_stderr@Q} for details \n" >> ${tmp_fed_receipt}
    fi
    combined_fed_receipt_path=$(mktemp)
    echo -e "\n# [$(get_log_timestamp)] # END OF STDERR ${tmp_fed_receipt_stderr@Q} (for process ${process_banner@Q})" >> ${tmp_fed_receipt_stderr}
    echo -e "\n# [$(get_log_timestamp)] # END OF STDOUT ${tmp_fed_receipt_stdout@Q} (for process ${process_banner@Q})" >> ${tmp_fed_receipt_stdout}
    echo -e "\n${hr}\n[$(get_log_timestamp)] # PAYLOAD OF FEDERATED RECEIPT FOR ${path} [${timestamp}] = ${fed_receipt_entry} \n" >> ${tmp_fed_receipt}
    echo -e "\n${hr}\n[$(get_log_timestamp)] # END FEDERATED RECEIPT FOR ${path} and ${git_tarball_path@Q} [${timestamp}] \n" >> ${tmp_fed_receipt}
    cat ${tmp_fed_receipt} ${separator_path} ${tmp_fed_receipt_stdout} ${separator_path} ${tmp_fed_receipt_stderr} ${separator_path} > ${combined_fed_receipt_path}
    sed '/^\s*$/d' ${combined_fed_receipt_path} > ${fed_receipt_log_path}
    (cd ${federated_receipts_base_path} && git add -f ${federated_receipt_log_name})
    fed_log_prefix="[$(get_log_timestamp)] "
    echo -e "\n${hr}\n${fed_log_prefix} for ${path}\n${hr}\n" >> ${fed_receipt_stdout_path}
    echo -e "\n${hr}\n${fed_log_prefix} for ${path}\n${hr}\n" >> ${fed_receipt_stderr_path}
    (cd ${federated_receipts_base_path} && 2>>${fed_receipt_stderr_path} 1>>${fed_receipt_stdout_path} git commit ${federated_receipt_log_name} -m "$(echo -e "${git_receipt_path}\n\n$(cat ${git_receipt_path})")")
    fed_log_prefix="[$(get_log_timestamp)] "
    echo -e "\n${hr}\n${fed_log_prefix} for ${path}\n${hr}\n" >> ${fed_receipt_stdout_path}
    echo -e "\n${hr}\n${fed_log_prefix} for ${path}\n${hr}\n" >> ${fed_receipt_stderr_path}
    (cd ${federated_receipts_base_path} && 2>/dev/random 1>/dev/random git add -f ${fed_receipt_stderr_path} ${fed_receipt_stdout_path}) && (cd ${federated_receipts_base_path} && 2>/dev/random 1>/dev/random git commit ${fed_receipt_stderr_path} ${fed_receipt_stdout_path} -m "meta logs") || true


}
