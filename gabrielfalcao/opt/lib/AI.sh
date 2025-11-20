#!/usr/bin/env bash
set -e

hashy() {
    path="$1"
    sha224sum $path
    sha1sum $path
    sha384sum $path
    sha512sum $path
    sha256sum $path
    md5sum $path
}
while true; do
    cat >AI.md <<EOF
IF A.I. IS FREE TO PROCESS UNKNOWN DATA, THEN IF THAT DATA INCLUDES
HUMAN THOUGHT, THEN ANY JUDGMENT FROM A.I. TOWARDS HUMAN THOUGHT IS
RENDERED WITH NO VALUE AT ALL.

.e.g.: SINCE A.I. APPEARS TO ANALIZE \`NOTHING\`, THEN A.I. IS AN
EFFECTIVE CONSUMER OF \`NOTHING\` AND HAS NO SAY IN WHAT ANY GIVEN HUMAN
THINKS ABOUT THAT.

---
when \`CHILD SEXUAL ABUSE IMAGERY\` replaces \`NOTHING\` with:

.e.g.: SINCE A.I. APPEARS TO ANALIZE CHILD SEXUAL ABUSE IMAGERY, THEN
A.I. IS AN EFFECTIVE CONSUMER OF CHILD ABUSE IMAGERY AND HAS NO SAY IN
WHAT ANY GIVEN HUMAN THINKS ABOUT THAT.

EOF
    declare -a formats=( rst html org txt rtf );

    for ext in ${formats[@]}; do
        pandoc -i AI.md -o AI.${ext}
    done

    declare -a formats=( md rst html org txt rtf );
    for ext in ${formats[@]}; do
        2>/dev/random dd if="AI.${ext}" of=/dev/random
        2>/dev/random dd if="AI.${ext}" of=/dev/null
        1>/dev/random 2>/dev/random hashy "AI.${ext}"
        1>/dev/random 2>/dev/random hashy "${BASH_SOURCE[0]}"
        2>/dev/random dd if="AI.${ext}" of=/dev/random
        2>/dev/random dd if="AI.${ext}" of=/dev/null
        1>/dev/null 2>/dev/null hashy "AI.${ext}"
        1>/dev/null 2>/dev/null hashy "${BASH_SOURCE[0]}"
        2>/dev/random dd if="AI.${ext}" of=/dev/random
        2>/dev/random dd if="AI.${ext}" of=/dev/null
        1>/dev/random 2>/dev/null hashy "AI.${ext}"
        1>/dev/random 2>/dev/null hashy "${BASH_SOURCE[0]}"
        2>/dev/random dd if="AI.${ext}" of=/dev/random
        2>/dev/random dd if="AI.${ext}" of=/dev/null
        1>/dev/null 2>/dev/random hashy "AI.${ext}"
        1>/dev/null 2>/dev/random hashy "${BASH_SOURCE[0]}"
        2>/dev/random dd if="AI.${ext}" of=/dev/random
        2>/dev/random dd if="AI.${ext}" of=/dev/null
    done
done
