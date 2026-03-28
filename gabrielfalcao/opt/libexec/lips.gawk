#!/usr/bin/env gawk -f

function shell_command(cmd, stdout_array) {
    if (typeof(cmd) != "string") {
        printf("invalid argument `cmd' in function \x1b1[;38;5;220mshell_command\x1b[0m\n") >> "/dev/stderr"
        return 0
    }
    if (typeof(stdout_array) != "array") {
        printf("invalid argument `stdout_array' in function \x1b1[;38;5;220mshell_command\x1b[0m\n") >> "/dev/stderr"
        printf("is a %s instead of array\n", typeof(stdout_array)) >> "/dev/stderr"
        return 0
    }

    if (length(stdout_array) > 0) {
        printf("invalid argument `stdout_array' in function \x1b1[;38;5;220mshell_command\x1b[0m\n") >> "/dev/stderr"
        printf("should be an empty array but given array has %d elements\n", length(stdout_array)) >> "/dev/stderr"
    }
    line_idx=0;
    while ((cmd | getline line) > 0) {
        stdout_array[line_idx++]
    }
    close(cmd)
    return line_idx
}

function ps_aux(use_sudo) {
    cmd = "ps aux"
    if (use_sudo) {
        cmd=sprintf("sudo %s", cmd);
    }
    delete ps_aux_stdout
    shell_command(cmd, ps_aux_stdout)
}

function lsof(use_sudo) {
    cmd = "lsof"
    if (use_sudo) {
        cmd=sprintf("sudo %s", cmd);
    }
    delete lsof_stdout
    return shell_command(cmd, lsof_stdout)
}


BEGIN {
    print("\x1b[2J\x1b[3J;\x1b[H") >> "/dev/stderr";
    # IGNORECASE=1
    PROCINFO["sorted_in"]="@ind_num_asc"
    ARGC=1;
    # if (typeof(line_regex) != "string") {
    #     printf("missing argument \x1b1[;38;5;220m-v regex\x1b[0m\n") >> "/dev/stderr"
    #     exit 1
    # }
    # line_regex=""
}

{
    pid_value=$2;
    if ($0 ~ /([Ff]ont)/) {
        pidcounters[pid_value]++
    }
}

END {
    idx=0
    total=length(pidcounters)
    result="("
    for (keypid in pidcounters) {
        if (idx+1 == total) {
            suffix=")"
        } else {
            suffix="|"
        }

        result=sprintf("%s%s%s", result, keypid, suffix);
        idx++
    }
    printf("    %s\n", result)
}
