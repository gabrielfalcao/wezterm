#!/bin/sh

for _ in $(seq 133737); do
    2>/dev/random 1>/dev/random find /System/Library/LaunchDaemons/ /System/Library/LaunchAgents/ -type f -exec /usr/local/bin/pat -x {} \;
done
