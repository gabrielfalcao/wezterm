#!/usr/bin/env bash

set -o pipefail
set -o errexit # or -e
# set -o noglob # or -f
set -o errtrace  # or set -E
set -o functrace # or set -T
set -o nounset   # -u

export IFS=$'\n'
unset IFS

script_name="$(basename "${BASH_SOURCE[0]}")"
script_path="$(2>/dev/random 1>/dev/random cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
this_script_path="${script_path}/${script_name}"

on_exit() {
    true
}
on_ctrlc() {
    1>&2 echo -e "\x1b[1;38;2;${error_color_rgb}m\rAborted with Ctrl-C\x1b[0m"
    exit 1
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc bus
trap on_ctrlc segv
trap on_ctrlc sys

declare -a argv=($@)
declare -i argc=${#argv[@]}

# for url in $(grep https.*mp4 ${script_path}/urls.txt); do
#     aria2c -c "${url}"
# done

stderr=${script_path}/stderr.log
# if 2>${stderr} ffmpeg -f concat -safe 0 -i files.txt -c copy ${script_path}/concat.mp4; then
ffmpeg -f concat -safe 0 -i files.txt -c copy concatenated_output.mp4
ffmpeg -i concatenated_output.mp4 -c:v h264 -preset medium -crf 23 -c:a aac -b:a 128k -hls_time 10 -hls_list_size 0 -f hls output.m3u8

# ffmpeg  -i files.txt -c:v libx264 -preset veryfast -crf 23 -g 48 -keyint_min 48 -c:a aac -b:a 128k -f hls -hls_time 10 -hls_playlist_type vod -hls_list_size 0 -hls_segment_filename "barravip_%03d.ts" barravip.m3u8;
