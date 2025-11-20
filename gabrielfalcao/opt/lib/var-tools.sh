#!/usr/bin/env bash

declare -A all_vars=()

is_var_declared() {
    varname="$1"
    shift
    if [ -z "${varname}" ]; then
        1>&2 echo -e "[is_declared error]: missing argument <VARNAME>"
        exit 1
    fi
    all_vars=( $(declare | sed -n 's/^\(declare[[:space:]-]\{4\}\)\?\([^=]\+\)=\(.*\)/["\2"]="\2"/gp' ) ) # \3 for full value declaration
    local value="${all_vars[${varname}]}"
    if [ ${#value} -eq 0 ]; then
        # echo -n "${value}"
        return 0
    else
        return 1
    fi
}
is_true() {
    varname="$1"
    shift
    if [ -z "${varname}" ]; then
        1>&2 echo -e "[is_true error]: missing argument <VARNAME>"
        exit 1
    fi
    if ! is_declared "${varname}"; then
        return 1
    fi
    value="${!varname}"
    case "${value@L}" in
        yes|true)
            return 0
            ;;
        no|false)
            return 1
            ;;
        *)
            return 1
            ;;
    esac
}
is_false() {
    varname="$1"
    shift
    if [ -z "${varname}" ]; then
        1>&2 echo -e "[is_true error]: missing argument <VARNAME>"
        exit 1
    fi
    if ! is_declared "${varname}"; then
        return 1
    fi
    value="${!varname}"
    case "${value@L}" in
        no|false)
            return 0
            ;;
        yes|true)
            return 1
            ;;
        *)
            return 1
            ;;
    esac
}
