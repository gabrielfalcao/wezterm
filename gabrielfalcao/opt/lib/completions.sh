# export IFS=$"\n"
# declare completions_script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# declare completions_path="${completions_script_path}/completions"
# # https://www.gnu.org/software/bash/manual/html_node/Commands-For-Completion.html
# for path in $(find "${completions_path}" -maxdepth 1 -type f); do
#     # echo -e "\x1b[1;48;5;233m\x1b[1;38;5;231mloading completion \x1b[1;48;5;235m\x1b[1;38;5;202m~/${path#${HOME}/}\x1b[0m"
#     . "${path}"
# done
