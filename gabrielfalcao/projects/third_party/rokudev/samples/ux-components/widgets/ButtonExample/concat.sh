,#!/usr/bin/env bash

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

declare -a argv=($@)
declare -i argc=${#argv[@]}

for url in $(grep https.*mp4 ${script_path}/urls.txt); do
    aria2c -c "${url}"
done

stderr=${script_path}/stderr.log
# if 2>${stderr} ffmpeg -f concat -safe 0 -i files.txt -c copy ${script_path}/concat.mp4; then
    if 2>${stderr} ffmpeg -i files.txt -map 0:v:0 -map 0:a:0 -c:v libx264 -preset veryfast -crf 23 -g 48 -keyint_min 48 -c:a aac -b:a 128k -f hls -hls_time 10 -hls_playlist_type vod -hls_list_size 0 -hls_segment_filename "barravip_%03d.ts" barravip.m3u8; then
        1>&2 echo -e "hls generation failed"
    else
        1>&2 echo -e "hls generation failed"
    fi
# else
#     1>&2 echo -e "concat generation failed"
# fi
