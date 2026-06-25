#!/usr/bin/env bash

declare -a argv=(${@})
declare -i argc=${#argv[@]}

declare -- input_video="${argv[0]}"

declare -- input_path="$(path canon "${input_video}")"
declare -- input_filename="$(path name "${input_path}")"
declare -- input_base="$(path base "${input_filename}")"

declare -- output_filename="$(slugify-string "${input_base}")_stream.m3u8"

ffmpeg -re -i "${input_path}" -c:v libx264 -c:a aac -f hls -hls_time 4 -hls_playlist_size 10 -hls_flags delete_segments "${output_filename}"
