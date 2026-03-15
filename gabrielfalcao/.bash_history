wz-wip 
#1771840682
wz-wip 
#1771841063
ipython
#1771841125
wz-wip 
#1771841154
wz-wip 
#1771841190
wz-wip 
#1771841235
wz-wip 
#1771841366
wz-wip 
#1771841436
wz-wip 
#1771841454
wz-wip 
#1771841527
wz-wip 
#1771841708
wz-wip 
#1771841767
wz-wip 
#1771841797
wz-wip 
#1771841805
ll
#1771841810
git st
#1771841812
git clean -df
#1771841848
git st
#1771841852
bat wz_cli.py 
#1771841857
git commit -am wz_cli.py 
#1771841876
wz-wip 
#1771841885
ll
#1771841889
bat wezterm-panes_1771841884.json 
#1771841925
jq '.' wezterm-panes_1771841884.json
#1771841933
jq '.[].tty_name' wezterm-panes_1771841884.json
#1771841936
jq -r '.[].tty_name' wezterm-panes_1771841884.json
#1771841959
jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g'
#1771841964
jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur
#1771841978
jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs 'printf %s|'
#1771841984
jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|'
#1771842004
jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed - 's/[|]$//g';echo
#1771842008
jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g';echo
#1771842028
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); echo "(${inner})"
#1771842073
lsof | head
#1771842133
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); lsof | grep -E "^\s*[^[:space:]]+\s*(${inner})"
#1771842178
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); lsof | grep -E "/dev/ttys${inner}"
#1771842185
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); lsof | grep -E "/dev/ttys${inner}\$"
#1771842240
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); lsof | grep -E "/dev/ttys${inner}\$"
#1771842270
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys${inner}"
#1771842274
echo ${tty_regex@Q} 
#1771842284
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"
#1771842286
echo ${tty_regex@Q} 
#1771842306
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})";
#1771842309
ps aux
#1771842339
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; lsof | grep -E "${tty_regex}\$"
#1771842343
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; lsof | grep -E "${tty_regex}\$" | wc -l
#1771842401
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; lsof | grep -E "${tty_regex}\$" | awk '{ print $2 }'  | sort -urn
#1771842430
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; declare -a pids=( $(lsof | grep -E "${tty_regex}\$" | awk '{ print $2 }'  | sort -urn) ); echo ${pids@Q}
#1771842433
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; declare -a pids=( $(lsof | grep -E "${tty_regex}\$" | awk '{ print $2 }'  | sort -urn) ); echo ${pids[@]@Q}
#1771842563
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; declare -- pids_regex="^\s*[[:space:]]+\s*($(lsof | grep -E "${tty_regex}\$" | awk '{ print $2 }'  | sort -run | xargs printf '%s|' | sed -E 's/[|]$//g'))"
#1771842569
echo "${pids_regex}"
#1771842577
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; declare -- pids_regex="^\s*[^[:space:]]+\s*($(lsof | grep -E "${tty_regex}\$" | awk '{ print $2 }'  | sort -run | xargs printf '%s|' | sed -E 's/[|]$//g'))"
#1771842591
ps aux | grep -E "${pids_regex}"
#1771842618
vmmap 53983
#1771842674
declare -- inner=$(jq -r '.[].tty_name' wezterm-panes_1771841884.json | sed -E 's,/dev/ttys,,g' | sort -nur | xargs printf '%s|' | sed -E 's/[|]$//g'); declare -- tty_regex="/dev/ttys(${inner})"; declare -- pids_regex="^\s*[^[:space:]]+\s*($(lsof | grep -E "${tty_regex}\$" | awk '{ print $2 }'  | sort -run | xargs printf '%s|' | sed -E 's/[|]$//g'))"; ps aux | grep -E "${pids_regex}"
#1771842809
ipython
#1771842817
ipyq
#1771842818
ipython
#1771843200
wz-wip 
#1771843232
black ~/opt/libexec/wz-wip 
#1771843261
black ~/opt/libexec/wz-wip 
#1771843265
wz-wip 
#1771843274
git st
#1771843276
ll
#1771843285
git st
#1771843286
git q
#1771843288
git st
#1771844850
git st
#1771844864
cls;tail -100 /var/log/system.log
#1771844939
ack 'com[.]apple' /var/log/system.log /var/log/wifi.log /var/log/com.apple.xpc.launchd/launchd.log
#1771845068
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/\1\n\2\n/g' 
#1771845072
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/\1\n\2\n/g' /var/log/com.apple.xpc.launchd/launchd.log
#1771845077
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/\1\n\2\n/gp' /var/log/com.apple.xpc.launchd/launchd.log
#1771845102
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/name=\1\nprog=\2\n/gp' /var/log/com.apple.xpc.launchd/launchd.log
#1771845115
ack 'com[.]apple' /var/log/system.log /var/log/wifi.log /var/log/com.apple.xpc.launchd/launchd.log
#1771845121
bat /var/log/com.apple.xpc.launchd/launchd.log
#1771845126
bat /var/log/wifi.log
#1771845130
bat /var/log/system.log
#1771845318
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/name=\1\nprog=\2\n/gp' /var/log/com.apple.xpc.launchd/launchd.log
#1771845401
bat /Applications/Ghostty.app/Contents/Info.plist 
#1771845514
file /Applications/Ghostty.app/Contents/MacOS/ghostty 
#1771845595
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/name=\1\nprog=\2\n/gp' /var/log/com.apple.xpc.launchd/launchd.log
#1771845611
sed -n -E 's/^.*?(com[.]apple[.]([a-zA-Z0-9.]+)).*?(requestor\s*=\s*([a-zA-z]+[a-zA-Z0-9]*([[]([0-9]+)[]])?))?$/name=\1\nprog=\2\n/gp' /var/log/system.log
#1771845672
ack gawk ~/opt/libexec/
#1771845682
ack -l '#!.*gawk' ~/opt/libexec/
#1771846114
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771846179
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771846405
roku-remote control
#1771846952
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771846993
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847015
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847020
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847052
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847076
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847130
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847146
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847211
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847238
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847309
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847328
var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847344
var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847347
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847377
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771847380
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847526
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847615
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847628
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847665
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847675
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847708
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847856
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771847915
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848075
bat /var/log/com.apple.xpc.launchd/launchd.log
#1771848223
bat /var/log/system.log
#1771848240
bat /var/log/com.apple.xpc.launchd/launchd.log
#1771848243
bat /var/log/system.log
#1771848329
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848342
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848355
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848441
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848484
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848558
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/com.apple.xpc.launchd/launchd.log
#1771848571
bat /var/log/system.log
#1771848580
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771848604
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771848606
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771848700
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771848753
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771848776
bat /var/log/system.log
#1771848929
bat /var/log/system.log
#1771848965
bat /var/log/system.log
#1771848991
cls;bat /var/log/system.log
#1771849647
cd ~/opt/libexec/
#1771849648
git st
#1771849650
git add var-log-parse-bundle-id-requestor-prog-pid 
#1771849653
git add .
#1771849657
git commit -am 'alles'
#1771849668
gawk -f - -o- var-log-parse-bundle-id-requestor-prog-pid 
#1771849676
gawk -f - -o- < var-log-parse-bundle-id-requestor-prog-pid 
#1771849681
gawk -f - -o- < var-log-parse-bundle-id-requestor-prog-pid  > var-log-parse-bundle-id-requestor-prog-pid.gawk
#1771849682
git st
#1771849690
mv var-log-parse-bundle-id-requestor-prog-pid.gawk var-log-parse-bundle-id-requestor-prog-pid
#1771849691
git st
#1771849693
git diff
#1771849699
git q
#1771849726
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849737
chmod a+x var-log-parse-bundle-id-requestor-prog-pid 
#1771849738
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849786
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849814
cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849851
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849895
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849904
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849937
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849971
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771849986
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850052
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850100
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850128
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850158
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850176
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850184
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850216
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850226
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850294
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850319
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850543
man gdate
#1771850793
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850810
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850829
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771850858
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771852132
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771852190
cls;cls;var-log-parse-bundle-id-requestor-prog-pid /var/log/system.log
#1771853892
ord ' 	'
#1771854422
Emacs-arm64-11 --version
#1771856255
cls;Emacs-arm64-11 -Q -x --script ~/.emacs.d/c/list-atoms.el 
#1771856291
cls;Emacs-arm64-11 --help
#1771856296
cls;Emacs-arm64-11 --help | bat -l man
#1771856313
cls;Emacs-arm64-11 --batch -Q  -x --script ~/.emacs.d/c/list-atoms.el 
#1771856341
cls;Emacs-arm64-11 --batch -Q  -x ~/.emacs.d/c/list-atoms.el 
#1771856403
cls;Emacs-arm64-11 --batch -Q  -x ~/.emacs.d/c/list-atoms.el 
#1771856499
cls;Emacs-arm64-11 --batch -Q  -x ~/.emacs.d/c/list-atoms.el 
#1771857822
pwd
#1771853908
ipython
#1771857831
cd ~/.emacs.d/c/
#1771857832
git st
#1771857836
git add .
#1771857837
git st
#1771858367
path env
#1771858370
path env CDPATH
#1771858379
cd path-finder
#1771858385
emc src/main.rs 
#1771858646
cargo run
#1771858695
which -a sudo
#1771858726
which -a sudo;which -a ps;;which -a ps;which -a lsof
#1771858730
which -a sudo;which -a ps;which -a ps;which -a lsof
#1771858742
which -a sudo ps  lsof
#1771858746
which -a sudo;which -a ps;which -a ps;which -a lsof
#1771858759
(which -a sudo;which -a ps;which -a ps;which -a lsof) | unique-lines 
#1771858773
(which -a sudo;which -a ps;which -a ps;which -a lsof) 
#1771858828
cd tools/
#1771858829
ll
#1771858837
cd bufpager/
#1771858839
git st
#1771858842
git add .
#1771858845
git q
#1771858860
cd bash
#1771859114
roku-remote control
#1771863034
cd ~/.emacs.d/
#1771863034
git st
#1771863037
git add .
#1771863038
cd ./c/
#1771863039
git st
#1771863064
pbpaste | sed -E 's/[\\]+//g'
#1771863079
declare -- regexp=$(pbpaste | sed -E 's/[\\]+//g' )
#1771863086
pbpaste | sed -E 's/[\\]+//g' |pbcopy 
#1771863094
echo ${regexp@Q}
#1771863150
declare -- regexp='[(][[:space:]\n]*(([a-z-]*)(shell-command|call-process)([a-z-]*))'
#1771863220
sed -z -n -E "s/.*?(.*?(${regexp}).*?)+.*?/\n\2\n\g"
#1771863224
sed -z -n -E "s/.*?(.*?(${regexp}).*?)+.*?/\n\2\n/g"
#1771863228
sed -z -n -E "s/.*?(.*?(${regexp}).*?)+.*?/\n\2\n/gp"
#1771863241
sed -z -n -E "s/.*?(.*?(${regexp}).*?)+.*?/\n\2\n/gp" functions.el 
#1771863278
echo "${regexp@Q}"
#1771863326
cls;sed -z -n -E         's/[(][[:space:]\n]*(([a-z-]*)(shell-command|call-process)([a-z-]*))'
#1771863502
cls;sed -z -n -E         's/[(]([[:space:]\n]*)(([a-zA-Z-]+[a-zA-Z0-9-]*)(shell-command|call-process)([a-zA-Z0-9-]*))([[:space:]\n]*)/\n\2\n/gp' functions.el 
#1771863570
declare  --       sed_regexp='[(]([[:space:]\n]*)(([a-zA-Z-]+[a-zA-Z0-9-]*)(shell-command|call-process)([a-zA-Z0-9-]*))([[:space:]\n]*)'
#1771863640
cls;sed -z -n -E         "s/${sed_regexp}/$(sed-subst-debug "${sed_regexp}")/gp" functions.el 
#1771863677
sed-subst-debug 10
#1771864280
sed-subst-debug 10
#1771865664
sed-subst-debug 10
#1771865688
sed-subst-debug 1 a
#1771865743
sed-subst-debug 1 a
#1771865755
sed-subst-debug 1 a
#1771865800
sed-subst-debug 1 a
#1771866049
echo ${!BASH*}
#1771866054
echo "${!BASH*}"
#1771866063
for var in $(echo "${!BASH*}"); do echo "${var@n}"; cone; done
#1771866110
for var in $(echo "${!BASH*}"); do echo "${var@Q}: ${var@N}"; done
#1771866169
cd ~/workbench/2026-02-22/
#1771866169
ll
#1771866175
cd ..
#1771866181
find . -name 'bash.1.*'
#1771866192
cd ~/workbench/2026-02-19/manpages/
#1771866192
ll
#1771866194
cd ./bash/
#1771866195
ll
#1771866203
ack '@Q'
#1771866208
ack '@'
#1771866213
ack '@' bash.1.html 
#1771866224
ls;
#1771866225
cls;
#1771866232
cls; ack '@.*Q' bash.1.html 
#1771866247
open bash.1.html 
#1771866298
cp bash.1.html bash.1.parameter-transformation.html 
#1771866972
declare -p --
#1771866980
echo "${shell_d_rust_env_path@a}"
#1771866985
declare -p -i
#1771866992
echo "${shell_d_pid@a}"
#1771866996
declare -p -a
#1771867012
echo "${bash_interactive_lsof_output_lines
@a}"
#1771867016
echo "${bash_interactive_lsof_output_lines@a}"
#1771867047
declare -p -A
#1771867059
echo "${shell_d_pandoc_output_format_to_extension_map@a}"
#1771867069
echo "${map_pair_xcodepoint_value_by_hex_escaped@a}"
#1771867092
echo "${map_pair_xcodepoint_value_by_hex_escaped@a}"
#1771867289
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ^((([a-q]*)([r])([s-t]*)|([A-Z]+)|([a-z]+)|([^A-Za-z0-9]+))+)$ ]]; then declare -p BASH_REMATCH; fi
#1771867333
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ^((([a-q]*)([r])([s-t]*)|([A-Z]+)|([a-z])|([^A-Za-z0-9]+))+)$ ]]; then declare -p BASH_REMATCH; fi
#1771867351
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ^((([a-q]*)([r])([s-t]*)|([A-Z])|([a-z])|([^A-Za-z0-9]+))+)$ ]]; then declare -p BASH_REMATCH; fi
#1771867377
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ^((([a-q]?)([r])([s-t]?)|([A-Z])|([a-z])|([^A-Za-z0-9]+))+)$ ]]; then declare -p BASH_REMATCH; fi
#1771867397
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ^((([a-q]?)([r])([s-t]?)|([A-Za-z])|([^A-Za-z0-9]+)))$ ]]; then declare -p BASH_REMATCH; fi
#1771867409
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ^((([a-q]*)([r])([s-t]*)|([A-Z]+)|([a-z]+)|([^A-Za-z0-9]+))+)$ ]]; then declare -p BASH_REMATCH; fi
#1771867542
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ([a-q]+)?([r])?([s-t]+)?([A-Z]+)?([a-z]+)?([^A-Za-z0-9]*)? ]]; then declare -p BASH_REMATCH; fi
#1771867554
if [[ "${map_pair_xcodepoint_value_by_hex_escaped@a}" =~ ([a-q]+)?([r])?([s-t]+)?([A-Z]+)?([a-z]+)?([^A-Za-z0-9]*)? ]]; then declare -p BASH_REMATCH; fi
#1771867577
if [[ "%Ar7n_?" =~ ([a-q]+)?([r])?([s-t]+)?([A-Z]+)?([a-z]+)?([^A-Za-z0-9]*)? ]]; then declare -p BASH_REMATCH; fi
#1771867595
if [[ "%Ar7n_?" =~ (([a-q]+)?([r])?([s-t]+)?([A-Z]+)?([a-z]+)?([^A-Za-z0-9]*)?)+ ]]; then declare -p BASH_REMATCH; fi
#1771867748
if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]+)?([r])?([s-t]+)?([A-Z]+)?([a-z]+)?([^A-Za-z0-9]*)?)+ ]]; then declare -p BASH_REMATCH; fi
#1771867809
if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]+)?([r]+)?([s-t]+)?|([A-Z]+)?|([^A-Za-z0-9]*)?)+ ]]; then declare -p BASH_REMATCH; fi
#1771867812
cls;if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]+)?([r]+)?([s-t]+)?|([A-Z]+)?|([^A-Za-z0-9]*)?)+ ]]; then declare -p BASH_REMATCH; fi
#1771867887
cls;if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]*)([r])([s-t]*)+|([A-Z]+)|([^A-Za-z0-9]*))+ ]]; then declare -p BASH_REMATCH; fi
#1771867899
cls;if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]*)([r])([s-t]*)+|([A-Z]*)|([^A-Za-z0-9]*))+ ]]; then declare -p BASH_REMATCH; fi
#1771867902
cls;if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]*)([r])([s-t]*)+|([A-Z]+)|([^A-Za-z0-9]*))+ ]]; then declare -p BASH_REMATCH; fi
#1771867951
cls;if [[ "boxk%Arzi007nN_?qtR" =~ (([a-q]+)?([r]+)([s-t]+)?|([A-Z]+)?|([^A-Za-z0-9]*))+ ]]; then declare -p BASH_REMATCH; fi
#1771867968
cd regex-parser-nom/
#1771868070
now
#1771868075
now-dots
#1771868079
nowaapl 
#1771868087
nowfs 
#1771868090
nowt
#1771868094
nowh
#1771868099
nows
#1771868102
nowts
#1771868105
nowz
#1771868110
nowds
#1771868164
echo "$(printf '# %s\n\n' "$(nowds)"; history)" |  tee bash_history_to_extract_test_cases_from.sed.BASH_REMATCH.awk.$$.${WEZTERM_PANE}.txt
#1771868918
cd ~/opt/libexec/
#1771868920
git st
#1771868925
git add sed-subst-debug 
#1771868928
git commit sed-subst-debug -m sed-subst-debug
#1771868935
git commit wz-wip -m wz-wip 
#1771868942
black wz-wip 
#1771868959
black wz-wip 
#1771868970
cd
#1771868973
cd ~/.emacs.d/c/
#1771868989
cdmkd ./tdd/blackpy.el
#1771869004
cd ..
#1771869006
rm -rf ./blackpy.el/
#1771869014
cdmkd ./blackpy
#1771869026
> blackpy_lib.el
#1771869030
> blackpy_test.el
#1771869056
which Emacs-arm64-11 
#1771869070
Emacs-arm64-11 --help | bat -l man
#1771869151
Emacs-arm64-11 --help | bat -l man --plain
#1771869230
Emacs-arm64-11 --help | cat 
#1771869617
Emacs-arm64-11 --help | sed -z -n -E 's/[\n]((([-][-][a-z]{3,}[a-z-]*|[-][a-z]+)((\s+|[=])([A-Z]+))?)+([[:space:]\n]*)([a-zA-Z].*)[\n]/\1/gp'
#1771869625
Emacs-arm64-11 --help | sed -z -n -E 's/[\n]((([-][-][a-z]{3,}[a-z-]*|[-][a-z]+)((\s+|[=])([A-Z]+))?)+([[:space:]\n]*)([a-zA-Z].*))[\n]/\1/gp'
#1771869643
Emacs-arm64-11 --help | sed -z -n -E 's/[\n]((([-][-][a-z]{3,}[a-z-]*|[-][a-z]+)((\s+|[=])([A-Z]+))?)+([[:space:]\n]*)([a-zA-Z].*))[\n]/\2/gp'
#1771869645
c;s;Emacs-arm64-11 --help | sed -z -n -E 's/[\n]((([-][-][a-z]{3,}[a-z-]*|[-][a-z]+)((\s+|[=])([A-Z]+))?)+([[:space:]\n]*)([a-zA-Z].*))[\n]/\2/gp'
#1771869648
cls;Emacs-arm64-11 --help | sed -z -n -E 's/[\n]((([-][-][a-z]{3,}[a-z-]*|[-][a-z]+)((\s+|[=])([A-Z]+))?)+([[:space:]\n]*)([a-zA-Z].*))[\n]/\2/gp'
#1771869653
cls;Emacs-arm64-11 --help | sed -z -n -E 's/[\n]((([-][-][a-z]{3,}[a-z-]*|[-][a-z]+)((\s+|[=])([A-Z]+))?)+([[:space:]\n]*)([a-zA-Z].*))[\n]/\2\n/gp';echo
#1771869671
Emacs-arm64-11 --help | cat 
#1771869674
Emacs-arm64-11 --help | head
#1771869678
cls; Emacs-arm64-11 --help | head -20
#1771869684
cls; Emacs-arm64-11 --help | bat
#1771869895
cls;Emacs-arm64-11 --help
#1771869919
ipython
#1771870580
cls; Emacs-arm64-11 --help | sed -z -n 's/.*[\n][[:space:]]*([A-Z][A-Za-z0-9]*[^:]+)options[:][[:space:]]*[\n][[:space:]\n]*[\n]([-][^\n]+[\n]([[:space:]])*'
#1771870598
cd regex-parser-nom/
#1771870612
nowh
#1771870616
nowd
#1771870617
nowt
#1771870731
declare  -p ${!HIST*}
#1771870784
unset HISTIGNORE; unset HISTCONTROL;                                                                                                                                            echo "$(printf '# %s\n\n' "$(nowds)"; history)" |                                                                                 tee bash_history_to_extract_test_cases_from.sed.BASH_REMATCH.awk.$$.${WEZTERM_PANE}.txt
#1771870807
unset HISTIGNORE; unset HISTCONTROL;                                                                                                                                            echo "$(printf '# %s\n\n' "$(nowds)"; history)" >                                                                                 tee bash_history_to_extract_test_cases_from.sed.BASH_REMATCH.awk.$$.${WEZTERM_PANE}.txt
#1771870902
unset HISTIGNORE; unset HISTCONTROL;                                                                                                                                                echo "$(printf '# %s\n\n' "$(nowds)"; history)" >                                                                                 tee bash_history_to_extract_test_cases_from.sed.BASH_REMATCH.awk.$$.${WEZTERM_PANE}.$(nowt).$(nowh).txt
#1771870905
unset HISTIGNORE; unset HISTCONTROL;                                                                                                                                                echo "$(printf '# %s\n\n' "$(nowds)"; history)" >                                                                                 tee bash_history_to_extract_test_cases_from.sed.BASH_REMATCH.awk.$$.${WEZTERM_PANE}.$(nowt).$(nowh).txt
#1771871124
date --iso-8601=seconds
#1771871129
date --iso-8601=
#1771871133
date --iso-8601=date
#1771871136
date --iso-8601=minutes
#1771871139
date --iso-8601=hours
#1771871148
date --iso-8601=ns
#1771871159
date --rfc-3339 
#1771871163
date --rfc-3339 --help
#1771871170
date --rfc-3339=seconds
#1771871174
date --rfc-3339=ns
#1771871228
date +'%Y-%m-%d %H:%M:%S %z'
#1771871231
date +'%Y-%m-%d %H:%M:%S %Z'
#1771871240
unset TZ
#1771871242
date +'%Y-%m-%d %H:%M:%S %Z'
#1771871259
man gdate
#1771871425
cd ~/workbench/2026-02-23/
#1771871426
ll
#1771871430
bash regex-parser-nom.gethist.sh 
#1771871669
git add regex-parser-nom.gethist.sh 
#1771871674
git commit regex-parser-nom.gethist.sh  -am
#1771871679
git commit regex-parser-nom.gethist.sh  -m regex-parser-nom.gethist.sh 
#1771871682
bash regex-parser-nom.gethist.sh 
#1771871804
. regex-parser-nom.gethist.sh 
#1771872216
. regex-parser-nom.gethist.sh 
#1771872239
cd ~/workbench/2026-02-23/
#1771872243
. regex-parser-nom.gethist.sh 
#1771872275
. regex-parser-nom.gethist.sh 
#1771872305
. regex-parser-nom.gethist.sh 
#1771872380
. regex-parser-nom.gethist.sh 
#1771872385
. regex-parser-nom.gethist.sh 
#1771872453
. regex-parser-nom.gethist.sh 
#1771872477
. regex-parser-nom.gethist.sh 
#1771872478
git st
#1771872485
git commit -am regex-parser-nom.gethist.sh 
#1771872651
cd ~/.shell.d/
#1771872652
ll
#1771872667
uv add coloredlogs
#1771872691
uv add --upgrade yt-dlp
#1771872707
uv add --upgrade yt-dlp coloredlogs
#1771872710
uv list
#1771872714
uv pip list
#1771872917
uv add --upgrade yt-dlp requests flask pyotp click asciinema blinker colorama pygments sphinx black isort pytz pendulum humanfriendly chemist
#1771878376
3
#1771878384
git clone --depth=1 git@github.com:python/cpython.git
#1771878398
man git-clone
#1771878457
git clone --branch=3.12 --depth=1 git@github.com:python/cpython.git
#1771878471
cd cpython/
#1771878473
cd python
#1771878475
pwd
#1771878476
cd
#1771878479
cd python
#1771878484
cd cpython/
#1771878486
cd ..
#1771878500
ln -s $(pwd)/cpython $(pwd)/pytjon
#1771878503
ln -s $(pwd)/cpython $(pwd)/python
#1771878509
rm ./pytjon
#1771878512
cd cpython/
#1771878521
ll
#1771878716
find . -type f                                             -regextype egrep -regex '.*[.]([ch])(([+p])\3)$'
#1771878721
find . -type f                                             -regextype egrep -regex '.*[.]([ch])(([+p])\3)?$'
#1771878761
find . -type f                                             -regextype egrep -iregex '.*(\bint\b).*[.]([ch])(([+p])\3)?$' -not -regex '.*test.*'
#1771878770
find . -type f                                             -regextype egrep -iregex '.*(int).*[.]([ch])(([+p])\3)?$' -not -regex '.*test.*'
#1771878779
find . -type f                                             -regextype egrep -iregex '.*(int).*[.]([ch])(([+p])\4)?$' -not -regex '.*test.*'
#1771878804
find . -type f                                             -regextype egrep -regex '.*[.]([ch])(([+p])\3)?$' -not -regex '.*test.*'  -regex '.*int.*'
#1771878808
find . -type f                                             -regextype egrep -regex '.*[.]([ch])(([+p])\3)?$' -not -regex '.*test.*'  -regex '.*int.*'
#1771878841
find . -type f                                             -regextype egrep -regex '.*[.]([ch])(([+p])\3)?$' -not -regex '.*test.*'  -regex '.*\b(int(eger)?|str(ing)?|bytes|dict|tuple)\b.*'
#1771878852
find . -type f                                             -regextype egrep -regex '.*[.]([ch])(([+p])\3)?$' -not -regex '.*test.*'  -regex '.*(int(eger)?|str(ing)?|bytes|dict|tuple).*'
#1771878867
bat ./Objects/clinic/dictobject.c.h
#1771878918
dua
#1771878921
cd ..
#1771878934
mv cpython/ cpython-3.12-shallow
#1771878941
git clone --branch=3.12 git@github.com:python/cpython.git
#1771878963
ipython
#1771879225
wz-wip 
#1771879243
wz-wip 
#1771879250
wz-wip 
#1771879252
wz-wip -h
#1771879255
wz-wip --help
#1771879286
wz-wip --help
#1771879288
wz-wip 
#1771879304
wz-wip 
#1771879310
wz-wip -p 1
#1771879511
ack --py '(click|callback)' ~/opt/libexec/
#1771879616
wz-wip -p 1 -p 2 -o foobar
#1771879655
wz-wip -p 1 -p 2 -o foobar
#1771879695
wz-wip -p 1 -p 2 -o foobar
#1771879713
wz-wip -p 1 -p 2 -o foobar
#1771879794
ipython
#1771879755
wz-wip -p 1 -p 2 -p 1 -o foobar -o foobar -o foobar2
#1771879929
wz-wip -p 1 -p 2 -p 1 -o foobar -o foobar -o foobar2
#1771879933
wz-wip -p 1 -p 2 -p 1 -o foobar -o foobar -o foobar2
#1771879951
wz-wip -p 1 -p 2 -p 1 -o foobar -o foobar -o foobar2
#1771879959
wz-wip -p 1 -p -42 -p 2 -p 1 -o foobar -o foobar -o foobar2
#1771880021
wz-wip -p 1 -p -42 -p 2 -p 1 -o foobar -o foobar -o foobar2
#1771880189
declare -p ${!WEZT*}
#1771880430
Emacs-arm64-11 -nw -q -Q 
#1771879971
ipython
#1771880831
cd ~/opt/libexec/
#1771880831
git st
#1771880838
git diff git-q
#1771880853
git q
#1771880962
git q
#1771880970
git st
#1771881000
git diff
#1771881006
git commit git-q 
#1771881016
git st
#1771881018
git diff
#1771881031
git commit -am wip
#1771881036
git whatchanged wz-wip
#1771881039
git whatchanged -p wz-wip
#1771881092
git checkout 6fc64cfc01830e93c069c031fb9b9a1b8e1df0f3 -- wz-wip
#1771881117
git checkout 47679320e2e4513e480f5b3c7bc6c2ca9f42f740 -- wz-wip
#1771881152
git st
#1771881157
git restore --staged wz-wip 
#1771881159
git restore wz-wip 
#1771881772
declare -p ${!WEZT*}
#1771881790
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; echo "${var}=${refvar}" " # ${refvar@a}"; done
#1771881953
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ (([/][^/[:space:]\n]+)|([a-zA-Z0-9/.-]+)) ]]; then echo "${BASH_REMATCH@A}"; fi; done
#1771881984
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ (([/][^/[:space:]\n]+)|([a-zA-Z0-9/.-]+)) ]]; then echo "${BASH_REMATCH[@]@A}"; fi; done
#1771881998
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ (([/][^/[:space:]\n]+)|([a-zA-Z0-9/.-]+)) ]]; then declare -p BASH_REMATCH; fi; done
#1771882047
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ (([/][^/[:space:]\n]+)|([a-zA-Z0-9]*?[/].*?)+) ]]; then declare -p BASH_REMATCH; fi; done
#1771882100
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ ([^/]*[/][^/[:space:]\n]+.*?)+ ]]; then declare -p BASH_REMATCH; fi; done
#1771882125
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ (.*[/].*)+ ]]; then declare -p BASH_REMATCH; fi; done
#1771882192
for var in ${!WEZT*}; do if [[ -v refvar ]]; then unset -n refvar; fi; declare -I -n refvar="${var}"; if [[ "${refvar}" =~ (.*[/].*)+ ]]; then gstat -c '%F %N' "${refvar}"; fi; done
#1771882468
wz-wip 
#1771882721
black wz-wip 
#1771882775
black wz-wip 
#1771882826
black wz-wip 
#1771882919
wezterm cli --help
#1771883036
wezterm cli list --help
#1771883046
wezterm 
#1771883049
wezterm cli --help
#1771883067
cls;wezterm cli --help | batman
#1771883079
cls;wezterm cli get-text --help | batman
#1771883182
cls;wezterm cli list --help | batman
#1771883294
cls;wezterm cli get-text --help | batman
#1771883602
black wz-wip 
#1771883611
black wz-wip 
#1771883790
git st
#1771883799
git checkout 47679320e2e4513e480f5b3c7bc6c2ca9f42f740 -- wz-wip
#1771883805
mv wz-wip wz-wip-old
#1771883808
git st
#1771883813
chmod +x wz*
#1771883815
git add .
#1771883820
git commit -am wz-wip-old 
#1771884084
wz-wip-old wz-wip-old 
#1771884088
wz-wip-old 
#1771884118
wz-wip-old 
#1771884131
git st
#1771884143
git st
#1771884153
git clean -df
#1771884155
cd -
#1771881059
git whatchanged -p wz-wip
#1771884177
rm -rfv {c,}python
#1771884191
workbench
#1771884200
uptime
#1771884224
sudo shutdown -h now
#1771613600
sudo ack -i '(Menlo|Font)' /var/log
git diff entrypoint.sh
cd
cd ~/.shell.d/
git diff entrypoint.sh
 histry
ps axo ppid,ppid,etime $$
#1771869184
>run.sh echo -e '#!/Applications/Emacs.app/Contents/MacOS/Emacs-arm64-11 --batch -x --script
#1771565224
bash --norc --noprofile -l -i
#1771830675
man perlfunc
#1771463066
git dh entrypoint.sh
#1771453472
man bash
#1771469738
1>get-image.sh echo -e '#!/usr/bin/env bash


declare -r image_download_url="https://downloads.raspberrypi.com/raspios_arm64/images/raspios_arm64-2025-12-04/2025-12-04-raspios-trixie-arm64.img.xz";
declare -r image_sha256_hash="f7afb40e587746128538d84f217bf478a23af59484d4db77f2d06bf647f7c82e"


#1771542498
man pandoc
#1771149657
man bash
#1771872722
bat pyproject.toml 
#1771589333
man perlre
#1771785560
launch_emacs_daemon() {
#1771564818
man bash
#1771785672
Emacs-arm64-11 --help | batman
#1771209885
bat 1770237021.json
#1771153067
rg --help | bat -l man
#1771148851
${SHELL} --norc --noprofile -i
#1771565211
bash --norc --noprofile -l -i 
#1771567853
python3
#1771518078
ipython
#1771858896
ipython
#1771168487
ipython
#1771858793
ipython
#1771870267
ipython
#1771884618
cd chrome-extensions/uniquefy-tabs/
#1771884619
ll
#1771884621
cd ..
#1771884646
cp -rfv uniquefy-tabs save-tabs
#1771884651
cd save-tabs
#1771884653
rm -rf build/
#1771884679
mv uniquefy_tabs/ save_tabs
#1771884682
git add .
#1771884725
refactors 'uniquefy([_-])tabs' 'save${1}tabs' -wp save_tabs/ 
#1771884727
refactors 'uniquefy([_-])tabs' 'save${1}tabs' -wp scripts/
#1771884735
refactors 'uniquefy([_-])tabs' 'save${1}tabs' -wp package.json 
#1771884738
refactors 'uniquefy([_-])tabs' 'save${1}tabs' -wp manifest.json 
#1771884749
mv .git ../save-tabs.git
#1771884750
ll
#1771884754
rm -rf node_modules/ dist/
#1771884761
refactors 'uniquefy([_-])tabs' 'save${1}tabs' -wp .
#1771884767
git st
#1771884776
mv ../save-tabs.git/ .git
#1771884776
git st
#1771884778
git add .
#1771884793
ack -i 'uniquefy'
#1771884812
refactors 'Uniquefy([_-]?)Tabs' 'Save${1}Tabs' -wp .
#1771884818
git st
#1771884822
git diff
#1771884830
git add .
#1771884839
git commit -am 'rename  uniquefy-tabs save-tabs'
#1771884852
refactors 'UNIQUEFY([_-]?)TABS' 'SAVE${1}TABS' -wp .
#1771884857
git st
#1771884863
ack -i 'uniquefy'
#1771884874
refactors 'uniquefy([_-]?)Tabs' 'save${1}Tabs' -wp .
#1771884890
refactors 'Uniquefy([_[:space:]-]?)Tabs' 'Save${1}Tabs' -wp .
#1771884895
git st
#1771884896
git add .
#1771884898
ack -i 'uniquefy'
#1771884907
refactors 'Uniquefy([_[:space:]-]?)tabs' 'Save${1}tabs' -wp .
#1771884912
git st
#1771884914
git diff
#1771884915
git add .
#1771884916
git st
#1771884926
git commit -am 'rename  uniquefy-tabs save-tabs'
#1771884933
cd workbench
#1771884939
cargo add chrono
#1771884946
cargo add chrono -F serde
#1771887725
cargo add --dev k9
#1771888217
cd eskktae-search/
#1771888222
git br
#1771888227
git reflog 
#1771888233
man git-reflog 
#1771888274
git reflog show --format='%h %b' 
#1771888310
git reflog --format='%h %t'
#1771888318
git reflog -1 --format='%h %t'
#1771888335
git reflog -5 --format='%h %t %ad'
#1771888339
git reflog -5 --format='%h %t %aD'
#1771888354
git reflog -5 --format='%h %t %aN %ae'
#1771888358
git reflog -5 --format='%h %t %aN <%ae>'
#1771888375
git reflog -5 --format='%h %t %at  %aN <%ae>'
#1771888390
git reflog -5 --format='%h %t %at  %aN <%aE>'
#1771888408
git reflog -5 --format='%h %t %at  %aN <%aE> %aL'
#1771888410
git reflog -5 --format='%h %t %at  %aN <%aE> %al'
#1771888441
git reflog -5 --format='%h %t %at %aN %ct %cN <%aE> %aL'
#1771888448
git reflog -5 --format='%h %t %at  %aN <%aE> %al'
#1771888476
git reflog -5 --format='%h %t %d %D %at  %aN <%aE> %al'
#1771888482
git reflog -5 --format='%h %t %D %at  %aN <%aE> %al'
#1771888517
git reflog -5 --format='%h %t %D %s %S %at  %aN <%aE> %al'
#1771888535
git reflog -5 --format='%h %D % %at  %aN <%aE> %al'
#1771888548
git reflog -5 --format='%D@%h % %at  %aN <%aE> %al'
#1771888566
git reflog -5 --format='%D @ %h %at'
#1771888574
git reflog -5 --format='%D @ %h %at %e'
#1771888586
git reflog -5 --format='%D @ %h %at %f'
#1771888599
git reflog -5 --format='%D @ %h %at %f %B'
#1771888615
git reflog -5 --format='%D @ %h %at %f %s %b'
#1771888618
git reflog -5 --format='%D @ %h %at %f %s %B'
#1771888628
git reflog -5 --format='%D @ %h %at %f %N'
#1771888639
git reflog -5 --format='%D @ %h %at %f %GG'
#1771888642
git reflog -5 --format='%D @ %h %at %f %GG %G'
#1771888675
git reflog -5 --format='%D @ %h %at %f %GG %GS %GK %G?'
#1771888689
git reflog -5 --format='%D @ %h %at %f GG:%GG %S:%GS GK:%GK G?:%G?'
#1771888708
git reflog -5 --format='%D @ %h %at %f GG:%GG %GS:%GS GK:%GK G?:%G?'
#1771888729
git reflog -5 --format='%D @ %h %at %f GG:%GG %GS:%GS GK:%GK GF:%GF G?:%G?'
#1771888742
git reflog -5 --format='%D @ %h %at %f %gs GG:%GG %GS:%GS GK:%GK GF:%GF G?:%G?'
#1771888789
git reflog -5 --format='%D @ %h %at %f %gs %(decorate:prefix=,suffix=,tag=,separator= )'
#1771888792
git reflog -5 --format='%D @ %h %at %f %gs -- %(decorate:prefix=,suffix=,tag=,separator= )'
#1771888278
man git-log
#1771888825
git st
#1771888830
git log
#1771888833
bat rust-toolchain.toml 
#1771888921
ack --toml  '(arch|arm|amd)[0-9-]*64' ~/projects/{personal,work/poems.codes/{tools,poc,wip}}/*/rust-toolchain.toml 
#1771888927
ack -C 4 --toml  '(arch|arm|amd)[0-9-]*64' ~/projects/{personal,work/poems.codes/{tools,poc,wip}}/*/rust-toolchain.toml 
#1771888945
bat /Users/gabrielfalcao/projects/work/poems.codes/poc/zmq-reverse-shell/rust-toolchain.toml
#1771888949
cp /Users/gabrielfalcao/projects/work/poems.codes/poc/zmq-reverse-shell/rust-toolchain.toml rust-toolchain.toml 
#1771888950
git st
#1771888952
git diff
#1771888984
git switch -c behind-linux-2026-from-$(git log -1 --format=%h)
#1771889025
git commit -am 'adds other targets to rust-toolchain.toml'
#1771889032
cargo build --target
#1771889044
cargo build --target "aarch64-unknown-linux-gnu"
#1771889069
wz-ls 
#1771889098
wz-ls ". | select(pane_id==${WEZTERM_PANE})"
#1771889104
wz-ls ". | select(.pane_id==${WEZTERM_PANE})"
#1771889110
wz-ls ".[] | select(.pane_id==${WEZTERM_PANE})"
#1771889116
wz-ls ".[] | select(.pane_id==${WEZTERM_PANE}) | .window_id"
#1771889132
wz-ls ".[] | select(.window_id == 2) "
#1771889147
wz-ls ".[] | select(.window_id == 2) | select(.pane_id != ${WEZTERM_PANE})"
#1771889161
set -x
#1771889161
wz-ls ".[] | select(.window_id == 2) | select(.pane_id != ${WEZTERM_PANE})"
#1771889177
set +x
#1771889180
echo wz-ls ".[] | select(.window_id == 2) | select(.pane_id != ${WEZTERM_PANE})"
#1771889221
wezterm cli set-title="$(basename $(pwd))"
#1771889225
wezterm cli set-tab-title="$(basename $(pwd))"
#1771889228
wezterm cli set-window-title="$(basename $(pwd))"
#1771889233
wezterm cli --set-window-title="$(basename $(pwd))"
#1771889238
wezterm cli set-window-title="$(basename $(pwd))"
#1771889248
wezterm cli set-window-title "$(basename $(pwd))"
#1771889252
wezterm cli set-tab-title "$(basename $(pwd))"
#1771889258
wezterm cli set-title "$(basename $(pwd))"
#1771889285
pushmkd ~/workbench/$(today)
#1771889304
launch_emacs_desktop --debug-init
#1771889315
which emacsclient 
#1771889324
popd
#1771889333
emacsclient ~/.shell.d/entrypoint.sh
#1771889356
emacsclient --socket-name=~/.emacs.d/socket/server  ~/.shell.d/entrypoint.sh
#1771889369
which -a emacsclient
#1771889372
which emacsclient
#1771889375
which emacsclient | xargs path cacnon
#1771889377
which emacsclient | xargs path canon
#1771889387
/Applications/Emacs.app/Contents/MacOS/bin-arm64-11/emacsclient --help
#1771889422
/Applications/Emacs.app/Contents/MacOS/bin-arm64-11/emacsclient --socket-name="${HOME}/.emacs.d/socket/server"
#1771889797
ps aux
#1771889832
ps aux | grephd
#1771889881
which grep
#1771889884
which -a grep
#1771889930
which -a ack
#1771889937
which ack | xargs path canon
#1771890920
ack existing-file-current-buffer --el ~/.emacs.d/
#1771889458
/Applications/Emacs.app/Contents/MacOS/bin-arm64-11/emacsclient --socket-name="${HOME}/.emacs.d/socket/server"  ~/.shell.d/entrypoint.sh
#1771891983
cd mu
#1771891984
cd ..
#1771892253
cp -rf mu ./tabslip && (cd ./tabslip && rm -rfv {build,node_modules,dist,src,tracing-server,*.log,*.out})
#1771892286
musgz 
#1771893808
cd
#1771893812
pushmkd ~/workbench/$(today)
#1771893836
echo "$(pbpaste)" > mu-click-on-remove-hack.js
#1771893837
bat mu-click-on-remove-hack.js 
#1771893843
git st
#1771893845
git add *.js
#1771893849
git init
#1771893850
git st
#1771893857
git add .
#1771893860
git commit -am
#1771893867
cd
#1771893869
cd ~/opt/libexec/
#1771893873
git whatchanged -p git-q
#1771893900
git checkout fb0c3a76ed77a79d5f8114a8fd374cfe20417ab5 -- git-q
#1771893924
mv git-q git-q-fb0c3a7
#1771893925
git st
#1771893937
git add .
#1771893947
chmod grephd git* em*
#1771893950
chmod a+x grephd git* em*
#1771893955
git add -f grephd git* em*
#1771893955
git st
#1771893990
git checkout HEAD -- git-q
#1771893991
git add .
#1771893992
git st
#1771894023
rm -f emacs*.{pid,log}
#1771894025
git add .
#1771894026
git st
#1771894032
git q
#1771894034
git q-fb0c3a7 
#1771894044
git whatchanged 
#1771894136
git st
#1771894146
git checkout eaf8ec25d6b22b2c775675241d0e817ed53ebfb5 -- git-q
#1771894154
mv git-q git-q-fb0c3a7 
#1771894155
git st
#1771894157
git add .
#1771894157
git st
#1771894164
git checkout HEAD -- git-q
#1771894166
git st
#1771894173
chmod a+x grephd git* em*
#1771894175
git st
#1771894179
git q-fb0c3a7 
#1771894204
mv git-q-fb0c3a7 git-q-eaf8ec2
#1771894206
git add .
#1771894207
gti st
#1771894208
git st
#1771894210
git q
#1771894217
git q-eaf8ec2 
#1771894240
mv git-q git-q-broken-.i.e.:wip
#1771894252
git st
#1771894256
mv git-q-eaf8ec2 git-q
#1771894257
git st
#1771894264
git add .
#1771894265
git st
#1771894284
mv git-q-broken-.i.e.\:wip git-q-broken-i-e-wip
#1771894285
git st
#1771894286
git add .
#1771894287
git st
#1771894297
git q
#1771894090
git whatchanged -p
#1771894304
gitgit st
#1771894305
git st
#1771894306
git q
#1771894315
cargo build --target "aarch64-unknown-linux-gnu"
#1771894352
brew info openssl
#1771894366
brew install openssl  --help
#1771894398
cargo info bash
#1771894401
brew info bash
#1771894434
brew install --build-from-source readline ncurses gettext bash
#1771894471
brew info openssl
#1771894493
brew info openssl --json=v2
#1771894501
brew --prefix openssl
#1771894509
path canon $(brew --prefix openssl)
#1771894519
path canon $(brew --prefix openssl)/lib
#1771894536
brew info readline
#1771894583
cd
#1771894585
cd ~/.shell.d/
#1771894586
git st
#1771894591
git dh -- 0001000-build-essential.sh
#1771894660
echo 'path canon $(brew --prefix openssl)/lib' | pbcopy 
#1771894665
path canon $(brew --prefix openssl)/lib
#1771894668
ll path canon $(brew --prefix openssl)/lib
#1771894693
ll /opt/homebrew/Cellar/openssl@3/3.6.0/
#1771894710
cls;brew info readline
#1771894750
echo $(path canon /opt/homebrew/opt/readline)
#1771894764
cls;brew info readline
#1771894789
find /opt/homebrew/opt -path  '*/lib/pkgconfig'
#1771894817
find /opt/homebrew/Cellar -type d  -path  '*/lib/pkgconfig/*'
#1771894827
find /opt/homebrew/Cellar  -path  '*/lib/pkgconfig/*'
#1771894833
find /opt/homebrew/Cellar  -path  '*/lib/pkgconfig'
#1771894864
find /opt/homebrew/Cellar  -path  '*/lib/pkgconfig' -exec gstat -c '%F {}' '{}' \;
#1771894877
find /opt/homebrew/Cellar  -path  '*/lib/pkgconfig' -exec gstat -c '%Y %W {}' '{}' \;
#1771894899
find /opt/homebrew/Cellar  -path  '*/lib/pkgconfig' -exec gstat -c '%Y %W {}' '{}' \; > homebrew-pkgconfig-$(nowdz).txt
#1771894906
git st
#1771894908
git add homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771894927
sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895065
sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | awk '{lines[lc++]=$0} END { for (key in lines) { if (key <=5 || key >= (lc - 5)) { print(lines[key]); }}}'
#1771895097
sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | awk '{lines[lc++]=$0} END { for (key in lines) { if (key <=5 || key >= (lc - 5)) { printf("%*s %s", length(lc), key, lines[key]); }}}'
#1771895101
sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | awk '{lines[lc++]=$0} END { for (key in lines) { if (key <=5 || key >= (lc - 5)) { printf("%*s %s\n", length(lc), key, lines[key]); }}}'
#1771895144
sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | gawk 'BEGIN{delete lines;} {lines[lc++]=$0} END { for (key in lines) { if (key <=5 || key >= (lc - 5)) { printf("%*s %s\n", length(lc), key, lines[key]); }}}'
#1771895151
cls;sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | gawk 'BEGIN{delete lines;} {lines[lc++]=$0} END { for (key in lines) { if (key <=5 || key >= (lc - 5)) { printf("%*s %s\n", length(lc), key, lines[key]); }}}'
#1771895162
wc -l homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895184
cls;sed -n -E '1,5p;244,249p'
#1771895188
cls;sed -n -E '1,5p;244,249p' homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895213
cls; sort -nr homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | sed -n -E '1,5p;244,249p'
#1771895277
gawk   'BEGIN{ delete lines; delete paths_by_changed_timestamp;  delete paths_by_created_timestamp; } { 
changed=$1;
created=$2
pkgconfig_path=$NF

if (!paths_by_changed_timestamp[path]) {
paths_by_changed_timestamp[path]=strtonum(changed);
}
if (!paths_by_created_timestamp[path]) {
paths_by_created_timestamp[path]=strtonum(created);
}
if (!lines[path]) {
lines[path]=NR
}
}
END {
for (path in lines) {
print(path)
}
}
'
#1771895448
gawk   'BEGIN{ delete lines; delete paths_by_changed_timestamp;  delete paths_by_created_timestamp; } {
changed=$1;
created=$2
pkgconfig_path=$NF
if (!paths_by_changed_timestamp[path]) {
paths_by_changed_timestamp[path]=strtonum(changed);
}
if (!paths_by_created_timestamp[path]) {
paths_by_created_timestamp[path]=strtonum(created);
}
if (!lines[path]) {
lines[path]=NR
}
}
END {
for (path in lines) {
print(path)
}
}
' homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895450
gawk   'BEGIN{ delete lines; delete paths_by_changed_timestamp;  delete paths_by_created_timestamp; } {
changed=$1;
created=$2
pkgconfig_path=$NF
if (!paths_by_changed_timestamp[path]) {
paths_by_changed_timestamp[path]=strtonum(changed);
}
if (!paths_by_created_timestamp[path]) {
paths_by_created_timestamp[path]=strtonum(created);
}
if (!lines[path]) {
lines[path]=NR
}
}
END {
for (path in lines) {
print(path)
}
}
' homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895478
1> homebrew-pkgconfig-filter.gawk
#1771895504
gawk -f - -o- < homebrew-pkgconfig-filter.gawk 
#1771895509
gawk -f - -o- < homebrew-pkgconfig-filter.gawk > homebrew-pkgconfig.gawk
#1771895521
mv homebrew-pkgconfig.gawk homebrew-pkgconfig-filter.gawk 
#1771895522
git st
#1771895539
git st
#1771895542
git add homebrew-pkgconfig-
#1771895544
git add homebrew-pkgconfig-*
#1771895545
git st
#1771895548
git add .
#1771895548
git q
#1771895554
gawk -f - -o- < homebrew-pkgconfig-filter.gawk > homebrew-pkgconfig.gawk
#1771895555
git st
#1771895559
mv homebrew-pkgconfig.gawk homebrew-pkgconfig-filter.gawk 
#1771895559
git st
#1771895624
git st
#1771895626
git q
#1771895636
chmod +x homebrew-pkgconfig-filter.gawk 
#1771895637
git st
#1771895639
git q
#1771895648
./homebrew-pkgconfig-filter.gawk homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895670
./homebrew-pkgconfig-filter.gawk homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt 
#1771895687
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk | wc -l
#1771895700
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771895936
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771895945
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771895975
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771895977
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896506
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896516
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896520
sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896527
c;s;sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896535
cls;s;sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896784
cls;s;sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896788
cls;sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771896819
cls;sort -rn homebrew-pkgconfig-2026-02-23.22-01-39.1771894899.txt | ./homebrew-pkgconfig-filter.gawk 
#1771897174
pushmkd ~/workbench/$(today)
#1771897182
ll
#1771897185
pbpaste
#1771897193
cd tools/
#1771897346
pbpaste
#1771897315
(cargo craft -csm -d copypasta -d objc2 -d objc2-notifications clipbeard && cd clipbeard) || (cargo craft -csm -d copypasta -d objc2 clipbeard && cd clipbeard) 
#1771897444
(echo;pbpaste;echo) | tee mosquito-trap.urls | grep youtube.com > mosquito-trap.video.urls && for url in $(grep 'https:.*youtube' mosquito-trap.video.urls); do yt-dlp "${url}"; done
#1771897480
(echo;pbpaste;echo) | tee mosquito-trap.urls | grep youtube.com > mosquito-trap.video.urls;for url in $(grep 'https:.*youtube' mosquito-trap.video.urls); do yt-dlp "${url}"; done
#1771897491
cat mosquito-trap.video.urls 
#1771897495
cat mosquito-trap.urls 
#1771897503
(echo;pbpaste;echo) | tee mosquito-trap.urls | grep youtube.com > mosquito-trap.video.urls;for url in $(grep 'https:.*youtube' mosquito-trap.video.urls); do yt-dlp "${url}"; done
#1771897516
which yt-dlp
#1771897521
which yt-dlp | xargs bat
#1771897536
~/.shell.d/.venv/bin/pip install -U yt-dlp
#1771897553
for url in $(grep 'https:.*youtube' mosquito-trap.video.urls); do yt-dlp "${url}"; done
#1771897671
find /opt/homebrew/Cellar  -path  '*/lib/pkgconfig' -exec gstat -c '%Y %W {}' '{}' \; 
#1771897806
ipython
#1771898233
git st
#1771898234
git add .
#1771898240
black homebrew-pkgconfig-filter.py 
#1771898263
black homebrew-pkgconfig-filter.py 
#1771898316
black homebrew-pkgconfig-filter.py 
#1771898333
black homebrew-pkgconfig-filter.py 
#1771899267
ipython
#1771899605
chmod +x *.py
#1771899610
./homebrew_casks.py 
#1771899629
./homebrew_casks.py 
#1771899638
./homebrew_casks.py 
#1771899649
./homebrew_casks.py 
#1771899703
./homebrew_casks.py 
#1771899706
./homebrew_casks.py 
#1771899724
./homebrew_casks.py 
#1771899732
./homebrew_casks.py 
#1771899785
ipython
#1771899827
./homebrew_casks.py 
#1771899849
ipython
#1771899916
./homebrew_casks.py 
#1771899925
./homebrew_casks.py 
#1771899978
./homebrew_casks.py 
#1771899990
./homebrew_casks.py 
#1771900013
./homebrew_casks.py 
#1771900122
./homebrew_casks.py 
#1771900140
ipython
#1771901321
find . -type f -not -path '*/.git/*'
#1771901331
find . -type f -not -path '*/.git/*' -exec touch {} \;
#1771901332
git st
#1771901340
cd bufpager/
#1771901342
cargo run
#1771901377
git st
#1771901403
emc src/main.rs 
#1771901588
launch_emacs_desktop 
#1771901602
st
#1771901617
eject
#1771901620
st
#1771901629
x
#1771901635
find /Users/gabrielfalcao/workbench/ -name mu-data
#1771901679
find /Users/gabrielfalcao/workbench/ -name mu-data |xargs  -Imudata wezterm cli  spawn --cwd mudata --new-window
#1771901685
dua
#1771901696
ll
#1771901708
ll ./todo-links-2026-01-14-01-15-03-1768364103-group/
#1771901714
bat ./todo-links-2026-01-14-01-15-03-1768364103-group/urls 
#1771901724
ll
#1771901730
rm mu-data 
#1771901735
pwd | pbcopy 
#1771901744
ln -s $HOME/workbench/2026-02-15/mu-data ./mu-data
#1771901746
cd ./mu-data
#1771901747
ll
#1771901748
pwd
#1771901760
ack ock
#1771901780
ack 'ock=[4-9]'
#1771901783
cls;ack 'ock=[4-9]'
#1771901801
cls;ack 'ock=[4-9]' | grep -v pornstar
#1771901815
cls;grep -E -r 'ock=[4-9]' .
#1771901830
cls;grep -E -r 'ock=[4-9]' urls.1.txt 
#1771901878
cls;         sed -n -E 's/^(https.*)#ock=[4-9].*/\1/gp' urls.1.txt 
#1771901894
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.1.txt 
#1771901900
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.1.txt urls.2.txt 
#1771901910
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.1.txt urls.2.txt | grep -v pornstar
#1771901918
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.1.txt urls.2.txt | grep -Ev '(pornstar|profile)'
#1771901927
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.1.txt urls.2.txt urls.3.txt | grep -Ev '(pornstar|profile)'
#1771901940
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile)'
#1771901944
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile)' | 
#1771901947
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile)' | bat
#1771901961
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile|models)' | bat
#1771901969
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile|models)' | cat
#1771901973
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile|models)' | cat | pbcopy 
#1771901985
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile|models)' | wc -l
#1771901999
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -Ev '(pornstar|profile|models)'
#1771902010
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | grep -E '(models)'
#1771902030
cls;         sed -n -E 's/^(https.*)#.*/\1/gp' urls.* | grep -E '(models)'
#1771902032
cls;         sed -n -E 's/^(https.*)#.*/\1/gp' urls.* | grep -E '(models)'
#1771902038
cls;         sed -n -E 's/^(https.*)#.*/\1/gp' urls.* | grep -E '(models)' | sort -u
#1771902069
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed -n -E 's/(.*)#.*/\1/g'
#1771902071
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed -n -E 's/(.*)#.*/\1/gp'
#1771902077
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'
#1771902081
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u
#1771902090
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(models)'
#1771902095
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(models)' | pbcopy 
#1771902111
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(porn.?star)'
#1771902118
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(profile)'
#1771902121
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(profile)' | sort -u
#1771902210
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(profile)' | sort -u
#1771902213
cls;         sed -n -E 's/^(https.*)#ock=[0-9].*/\1/gp' urls.* | sed  -E 's/(.*)#.*/\1/g'  | sort -u | grep -E '(profile)' | sort -u | pbcopy 
#1771902229
cd
#1771902234
st
#1771902237
st
#1771902241
st
#1771902251
cd /Volumes/nothing/unknown/
#1771902252
ll
#1771902260
cd ..
#1771902350
ll
#1771903172
cd
#1771903525
cd chrome-extensions/
#1771903525
ll
#1771903529
cd ./css-injector/
#1771903542
which emacsclient 
#1771903551
emacsclient  --help
#1771903557
cd emacs
#1771903558
pwd
#1771903579
find . -regextype egrep -regex '.*emacsclient.*'
#1771903592
emc lib-src/emacsclient.c 
#1771903892
launch_emacs_desktop 
#1771903914
launch_emacs_desktop 
#1771903938
cd
#1771903940
cd ~/.emacs.d/
#1771903941
git st
#1771903946
git add .
#1771903948
git whatchanged 
#1771903957
git stash 
#1771903969
launch_emacs_desktop 
#1771902366
dua i ./APFEL/\*scratch\*/ ./unknown/APFEL/\*scratch\*/ ./unknown/APFEL ./xxx/ ./ | tee ~/workbench/2026-02-24/nothing-duai
#1771904087
cd ~/workbench/2026-02-24/nothing-duai
#1771904094
cd ~/workbench/2026-02-24/
#1771904097
ll
#1771904099
vim nothing-duai 
#1771904104
git st
#1771904106
git add nothing-duai 
#1771904109
git init
#1771904111
git st
#1771904113
git add .
#1771904114
git q
#1771904148
sed -e "s,[.]/,/Volumes/nothing/,g" nothing-duai 
#1771904155
vlc /Volumes/nothing/xxx/upstream/nubiles-17-11-11-charlotte-carmen-play-with-me-xxx-1080p-mp4-ktr-n1c-mp4-ktr-n1c/nubiles-17-11-11-charlotte-carmen-play-with-me-n1c.mp4
#1771904163
sed -e "s,[.]/,/Volumes/nothing/,g" nothing-duai 
#1771904167
sed -e "s,[.]/,/Volumes/nothing/,g" -i nothing-duai  
#1771904168
git st
#1771904169
git q
#1771904172
git whatchanged -p
#1771904187
cp nothing-duai nothing-duai-all
#1771904190
git add .
#1771904196
bat nothing-duai
#1771904225
ack '([.](ts|x))'
#1771904231
grep -E '/([.](ts|x))'
#1771904235
grep -E '/([.](ts|x))' nothing-duai
#1771904251
grep -Ei '/([.](ts|x)|jpeg?)' nothing-duai
#1771904258
grep -Ei '/([.](jpe?g)' nothing-duai
#1771904265
grep -Ei '/[.](jpe?g)' nothing-duai
#1771904276
grep -Ei '[.](jpe?g)' nothing-duai
#1771904280
grep -Ei '[.](jpe?g|png)' nothing-duai
#1771904294
grep -Ei '[.](jpe?g|png)' nothing-duai | xargs file
#1771904301
grep -Ei '[.](jpe?g|png)' nothing-duai
#1771904307
echo ${IFS@Q}
#1771904333
for path in $(grep -Ei '[.](jpe?g|png)' nothing-duai); do open "${path}"
#1771904363
g p -r chrome -k
#1771904373
for path in $(grep -Ei '[.](jpe?g|png)' nothing-duai); do echo "${path}"; done
#1771904377
for path in $(grep -Ei '[.](jpe?g|png)' nothing-duai); do open "${path}"; done
#1771904490
open /Volumes/nothing/APFEL/\*scratch\*/.ts/ek.rq/ /Volumes/nothing/APFEL/*scratch*/.cats/fiore.png /Volumes/nothing/APFEL/*scratch*/.cats/luisdes2012
#1771904785
x
#1771904853
cp ''/Volumes/nothing/APFEL/*scratch*/.ts/eevee_bee-0gljpwvb6r2hhhethvq5d_source.mp4'' .
#1771904861
cp '/Volumes/nothing/APFEL/*scratch*/.ts/eevee_bee-0gljpwvb6r2hhhethvq5d_source.mp4' .
#1771904792
cp ''/Volumes/nothing/APFEL/*scratch*/.ts/ek.rq/FD7EBF2.mp4' .
'
#1771904888
cp '/Volumes/nothing/APFEL/*scratch*/.ts/ek.rq/FD7EBF2.mp4' .
#1771904918
open /Volumes/nothing/APFEL/\*scratch\*/.ts/ek.rq/ /Volumes/nothing/APFEL/*scratch*/.cats/fiore.png /Volumes/nothing/APFEL/*scratch*/.cats/
#1771906127
x
#1771906131
ls
#1771906133
ll
#1771906137
bat ext.txt 
#1771906184
sed -E "s/('([^']+)')\s*/\1\n/g" ext.txt 
#1771906188
sed -E "s/('([^']+)')\s*/\1\n/g" -i ext.txt 
#1771906198
sed -E '/^\s*$/d' ext.txt 
#1771906208
sed -E '/^\s*$/d' -i ext.txt 
#1771906220
open '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/'
#1771907009
find '/Volumes/nothing/APFEL/*scratch*/.ts/sarijahi/sari_jahi' -name '*.mp4' 
#1771907018
find '/Volumes/nothing/APFEL/*scratch*/.ts/sarijahi/' -name '*.mp4' 
#1771907025
find '/Volumes/nothing/APFEL/*scratch*/.ts/sarijahi/' -name '*.mp4' | xargs vlc
#1771907044
find '/Volumes/nothing/APFEL/*scratch*/.ts/sarijahi/' -name '*.mp4' | xargs vlc
#1771906266
1>ext.2.txt echo "
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/img_4078.MP4'
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/img_3311.MP4' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/img_3312.MP4'
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/img_4256.MP4'
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/img_4262.MP4'
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/img_5920.MOV'
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5201868444373479680_y.jpg'
'/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5201929085016732810_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5298601183872673599_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5298601183872673600_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5298601183872673601_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5303064097274848121_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5332691597726443381_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5332691597726443382_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5334821317389705695_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5334821317389705696_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5334821317389705697_x.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5334821317389705701_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5334821317389705704_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5334821317389705705_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478579_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478582_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478583_x.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478584_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478585_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478586_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478588_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478589_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478590_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478591_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5339310812344478592_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5773796777818965341_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5778651830325200269_y.jpg' '/Volumes/nothing/APFEL/*scratch*/.ts/deutsch/photo_5778651830325200275_y.jpg'

'/Volumes/nothing/APFEL/*scratch*/.ts/ekmxfsp/0b4sk8d.yaml'
'/Volumes/nothing/APFEL/*scratch*/.ts/essk/0b4sk8d.yaml'
'/Volumes/nothing/APFEL/*scratch*/.ts/jailhailet06/Posts/Free/Videos/0glpg6itog8s17sikileo_source.mp4' '/Volumes/nothing/APFEL/*scratch*/.ts/jailhailet06/Posts/Free/Videos/5f4ecf98471a1ff4101a4_source.mp4'
'/Volumes/nothing/APFEL/*scratch*/.ts/k3s/q8xf4o0.yaml'
'/Volumes/nothing/APFEL/*scratch*/.ts/KJW'
'/Volumes/nothing/APFEL/*scratch*/.ts/ksk/5.mp4' '/Volumes/nothing/APFEL/*scratch*/.ts/ksk/document_4900148906928636826.mp4' '/Volumes/nothing/APFEL/*scratch*/.ts/ksk/2.mp4' '/Volumes/nothing/APFEL/*scratch*/.ts/ksk/0b4sk8d.yaml' '/Volumes/nothing/APFEL/*scratch*/.ts/ksk/explore.key' '/Volumes/nothing/APFEL/*scratch*/.ts/ksk/lmay.yaml'
'/Volumes/nothing/APFEL/*scratch*/.ts/otc-rtqo/ecuadorian-in-painful-in-her-first-porn-video---brazilxporn-com-31254739.mp4'

'/Volumes/nothing/APFEL/*scratch*/.ts/qsdkofdeanenfmt'

'/Volumes/nothing/APFEL/*scratch*/.ts/ror'





"
#1771907245
eject
#1771907362
st
#1771907363
eject
#1771907398
env | grep EMACS
#1771907403
file ${EMACS_SOCKET_NAME} 
#1771907411
emacsclient package.json 
#1771907434
yarn dev
#1771907443
yarn dev
#1771907447
yarn
#1771907615
cd ./clipbeard/
#1771907628
wz-wip-old 
#1771894594
git whatchanged -p 0001000-build-essential.sh
#1771907640
wz-wip
#1771907646
wz-wip-old 
#1771907656
cd bufpager/
#1771907658
cargo run
#1771910869
x
#1771910883
(echo ;pbpaste;echo) >>> urls.$(today).x
#1771910886
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910901
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910906
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910909
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910912
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910916
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910924
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910933
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910940
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910944
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910951
(echo ;pbpaste;echo) >> urls.$(today).x
#1771910961
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911029
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911039
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911057
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911098
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911101
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911422
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911430
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911551
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911561
pbpaste
#1771911571
yt-dlp "$(pbpaste)"
#1771911593
(echo;pbpaste;echo) >> urls.2026-02-24.x 
#1771911616
yt-dlp "$(pbpaste)"
#1771911640
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911663
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911667
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911671
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911676
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911681
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911731
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911779
(echo ;pbpaste;echo) >> urls.$(today).x
#1771911782
nohup yt-dlp "$(pbpaste)" &
#1771911813
nohup yt-dlp "$(pbpaste)" &
#1771911837
nohup yt-dlp "$(pbpaste)" &
#1771911852
nohup yt-dlp "$(pbpaste)" &
#1771911893
nohup yt-dlp "$(pbpaste)" &
#1771911906
nohup yt-dlp "$(pbpaste)" &
#1771911916
nohup yt-dlp "$(pbpaste)" &
#1771911936
nohup yt-dlp "$(pbpaste)" &
#1771911945
nohup yt-dlp "$(pbpaste)" &
#1771912666
ll
#1771912680
ll
#1771912845
x
#1771912853
x
#1771912954
g p -r chrome -k
#1771912953
g p -r chrome -k
#1771913058
date
#1771913437
(echo ;pbpaste;echo) >> urls.$(today).x.cukes
#1771913443
grep -i cucumber urls.$(today).x.cukes
#1771913456
grep -i cucumber urls.$(today).x.cukes | sed -E 's/#.*//g'
#1771913459
grep -i cucumber urls.$(today).x.cukes | sed -E 's/#.*//g' | sort -u
#1771913463
grep -i cucumber urls.$(today).x.cukes | sed -E 's/#.*//g' | sort -u| pbcopy 
#1771916178
cd bufpager/
#1771916226
git st
#1771916231
git add src/ui.rs 
#1771916231
git q
#1771916242
mv src/main.rs src/cli.rs
#1771916249
mv src/ui.rs src/main.rs
#1771916282
3
#1771916285
git clone --depth=1 https://github.com/crossterm-rs/crossterm.git
#1771916289
cd crossterm/
#1771916290
ll
#1771916300
ll examples/
#1771916185
cargo docs --open
#1771916251
cargo run
#1771916210
emacsclient src/main.rs 
#1771916335
g p -r emacs -k
#1771916339
launch_emacs_desktop 
#1771916362
cargo add ratatui
#1771916421
wz-ls ".[] | select(pane_id==${WEZTERM_PANE}) | .window_id "
#1771916430
wz-ls | jq  ".[] | select(pane_id==${WEZTERM_PANE}) | .window_id "
#1771916439
wz-ls | jq  ".[] | select(.pane_id==${WEZTERM_PANE}) | .window_id "
#1771916450
wz-ls | jq  ".[] | select(.window_id== 3)"
#1771916489
wezterm cli kill-pane 37
#1771916495
wezterm cli kill-pane --help
#1771916499
wezterm cli kill-pane --pane-id 37
#1771916513
cargo run --example
#1771916526
wezterm cli kill-pane --pane-id 37
#1771916531
wz-ls | jq  ".[] | select(.window_id== 3)"
#1771916540
wezterm cli kill-pane --pane-id 39
#1771916546
cargo run
#1771916553
cargo run
#1771916635
cargo run
#1771916738
cargo run
#1771916747
cargo run
#1771916761
cargo run
#1771916768
cargo run
#1771916780
cargo run
#1771916787
cargo run
#1771916800
cargo run
#1771916831
echo ${COLUMNS} ${LINES}}
#1771916846
echo ${COLUMNS} ${LINES}}
#1771916848
cargo run
#1771916863
cargo run
#1771916869
cargo run
#1771916920
cd ratatui
#1771916925
git pull --rebase origin main 
#1771916927
git st
#1771916933
git add .
#1771916935
git stash 
#1771916936
git pull --rebase origin main 
#1771916942
cargo run --example
#1771916946
git stash pop
#1771916947
cargo run --example
#1771916888
cargo doc --open
#1771916994
cargo run
#1771917003
reset
#1771917006
cargo run
#1771916981
cargo run --example list;cargo run --example table;cargo run --example tabs;cargo run --example calender;cargo run --example block
#1771962478
cargo run --example block
#1771962483
cargo run --example block
#1771962486
cargo run --example block
#1771962488
cargo run --example block
#1771962512
cargo run
#1771962521
cargo run
#1771962637
rustup doc --open
#1771962639
rustup doc
#1771962645
rustup doc std
#1771962917
cargo run
#1771962532
emc src/main.rs 
#1771962923
cargo run
#1771962944
cargo run
#1771962953
cargo run
#1771963010
cargo run
#1771963014
cargo run
#1771963104
cargo run
#1771963174
cargo run
#1771963186
cargo run
#1771963220
cargo run
#1771963231
cargo run
#1771963241
cargo run
#1771963260
cargo run
#1771963273
cargo run
#1771963280
cargo run
#1771963290
cargo run
#1771963305
cargo run
#1771963310
cargo run
#1771963324
cargo run
#1771963336
cargo run
#1771963344
cargo run
#1771963363
cargo run
#1771963366
cargo run
#1771963400
cargo run
#1771963403
cargo run
#1771963425
ipython
#1771963684
yt-dlp "$(pbpaste)"
#1771964535
ssh lan-pi
#1771964563
cargo install --locked zola
#1771964567
hugo
#1771964746
ack dnsserver ~/opt/libexec/
#1771964657
npm create astro@latest
#1771964763
sudo  networksetup -setdnsservers Wi-Fi 192.168.18.211
#1771964770
sudo  networksetup -getdnsservers Wi-Fi
#1771964775
ssh lan-pi
#1771964834
sudo                            networksetup -setdnsservers Wi-Fi 127.0.0.1
#1771964839
sudo  networksetup -getdnsservers Wi-Fi
#1771964864
cd ./xurupira/
#1771964891
pwd
#1771964900
path canon -f .
#1771964903
path canon -f . | pbcopy 
#1771965283
x
#1771965284
ll
#1771965290
cd ./mu-data/
#1771965291
ll
#1771965297
ack bab urls.*
#1771964867
npm run dev
#1771965430
npm run dev
#1771965444
bat package
#1771965446
bat package.json 
#1771965455
npm run build
#1771965459
ll
#1771965467
cd ./dist/
#1771965467
ll
#1771965473
cd ..
#1771965474
ll
#1771965487
scp -r dist lan-pi:httpserver/
#1771963778
ssh lan-pi
#1771966743
ssh lan-pi
#1771966802
cargo install --lock zola
#1771966804
cargo install --locked zola
#1771968593
dns-server wl
#1771968597
dns-server wl https://japannews.yomiuri.co.jp/features/japan-focus/20241228-229891/
#1771968657
git st
#1771968721
git st
#1771968730
cd wezterm
#1771968731
git st
#1771968738
git st
#1771968747
git pull --rebase origin main 
#1771968780
cd wezterm-cell/
#1771968780
ll
#1771968784
bat Cargo.toml 
#1771968794
emc src/lib.rs 
#1771968757
cargo build
#1771968848
ll
#1771968850
cd ..
#1771968861
ll
#1771968882
cargo run
#1771968898
gi st
#1771968900
git st
#1771968902
git q
#1771968903
git st
#1771968922
ll
#1771968955
git st
#1771968957
emc src/main.rs 
#1771969046
cargo run
#1771969073
cargo run
#1771969082
cargo run
#1771969087
cargo run
#1771969195
cargo run
#1771969200
cargo run
#1771969204
cargo run --help
#1771969207
cargo run -- --help
#1771969277
cargo run -- --help
#1771969289
cargo run -- --help
#1771969321
cargo run -- --help
#1771969340
cargo run -- --help
#1771969350
cargo run -- --help
#1771969356
cargo run -- 
#1771969359
cargo run foo
#1771969438
cargo run foo
#1771969516
cargo run foo
#1771969530
git st
#1771969531
git diff
#1771969540
cargo run foo
#1771969543
git sst
#1771969544
git st
#1771969593
git st
#1771969595
git dh
#1771969622
chmod -x ~/opt/libexec/git-common-ancestor-to-ref 
#1771969634
git nst
#1771969635
git st
#1771969645
git commit -am 'temporarily removes subcommands'
#1771969697
git log
#1771969703
git checkout  d48244c449c8c2be50735b6467f75629a08bf51b
#1771969707
git checkout -
#1771969708
git st
#1771969712
git switch d48244c449c8c2be50735b6467f75629a08bf51b
#1771969714
git st
#1771969719
git log
#1771969732
git revert d48244c449c8c2be50735b6467f75629a08bf51b 
#1771969734
git st
#1771969736
git dh
#1771969746
git st
#1771969754
git whatchanged 
#1771969758
git reset --hard 
#1771969768
git checkout d48244c449c8c2be50735b6467f75629a08bf51b -- src/main.rs
#1771969769
git st
#1771969770
git dh
#1771969775
cargo run
#1771970956
cd cargo-craft
#1771970957
git st
#1771970964
emc src/main.rs 
#1771971028
ack receipt
#1771971048
bat ~/.cargo/craft-history.txt 
#1771971055
bat ~/.cargo/craft-receipts.ldjson 
#1771971062
ack workbench ~/.cargo/craft-receipts.ldjson
#1771971084
grep -En workbench ~/.cargo/craft-receipts.ldjson 
#1771971086
grep -En workbench ~/.cargo/craft-receipts.ldjson 
#1771971098
grep -En at:.*workbench ~/.cargo/craft-receipts.ldjson 
#1771971102
grep -En at.*:.*workbench ~/.cargo/craft-receipts.ldjson 
#1771971104
grep -En at.*:.*workbench ~/.cargo/craft-receipts.ldjson 
#1771971139
sed -nE '58p'
#1771971141
sed -nE '58p' ~/.cargo/craft-receipts.ldjson
#1771971145
sed -nE '58p' ~/.cargo/craft-receipts.ldjson | jq .
#1771971155
cargo deps list
#1771971441
cdmkd ./tmp
#1771971443
cargo craft -csm -C env -C context -C switch -C path -C sh -C goto -C list -C init -C doctor -C find -C show -C today -C update -C delete -C edit -C server -C client -C bootstrap -C refresh -C shell -C tool workbench
#1771971470
ll
#1771971472
rm -rf workbench/
#1771971531
git st
#1771971545
pushmkd ~/workbench/$(today)
#1771971550
ll
#1771971554
popd
#1771971556
git st
#1771971563
git untracked 
#1771971526
cargo craft -csm -C env -C context -C switch -C path -C sh -C goto -C list -C init -C doctor -C find -C show -C today -C update -C delete -C edit -C server -C client -C bootstrap -C refresh -C shell -C tool -C parse -C export -C import -C web -C stash -C save -C load -C write -C read workbench
#1771972368
pwd
#1771976736
cd emacs
#1771976749
ack call-process
#1771976753
ack call-process -l
#1771976768
ack call-process --c
#1771976772
ack --c call-process 
#1771976775
ack call-process 
#1771976784
ack --cpp call-process 
#1771976786
cls;ack --cpp call-process 
#1771976802
emc src/callproc.c 
#1771976819
emacsclient -n src/callproc.c
#1771976853
launch_emacs_desktop 
#1771976873
ll
#1771976881
emc workbench/src/main.rs 
#1771976897
cd ..
#1771976904
mv tmp/ ~/workbench/$(today)
#1771976906
pwd
#1771976908
git t
#1771976909
git st
#1771976911
git add .
#1771976931
mkdir src/cli/commands
#1771976934
mkdir -p src/cli/commands
#1771976960
git st
#1771976962
git add .
#1771976964
cargo run
#1771976996
pbpaste > commands
#1771977003
git st
#1771977056
for cmd in $(cat commands); do title=$(heck-string --to=pascal "${cmd}"); echo "${title},"; done | pbcopy 
#1771977115
for cmd in $(cat commands); do title=$(heck-string --to=pascal "${cmd}"); echo "${title}Opt,"; done | pbcopy 
#1771977162
git st
#1771977181
git st
#1771977186
git add src/cli/
#1771977188
git whatchanged 
#1771977191
git st
#1771977201
for cmd in $(cat commands); do title=$(heck-string --to=pascal "${cmd}");  cp src/cli/commands/mod.rs src/cli/commands/${name}.rs
#1771977251
git st
#1771977254
git add commands 
#1771977260
for cmd in $(cat commands); do
#1771977269
for cmd in $(cat commands); do
#1771977293
for cmd in $(cat commands); do title=$(heck-string --to=pascal "${cmd}");   echo -e "// ${title}Opt
$(cat src/cli/commands/mod.rs)
" > src/cli/commands/${cmd}.rs; done
#1771977345
git st
#1771977376
mv src/cli/commands/context.rs template.rs
#1771977379
git clean -f
#1771977447
git st
#1771977456
cp src/cli/commands/mod.rs template.rs
#1771977464
git st
#1771977466
git add add-command.sh 
#1771977467
git st
#1771977468
git clean -f
#1771977479
cp src/cli/commands/mod.rs template.rs
#1771977844
cd cargo-craft
#1771977845
ll
#1771977847
ll src/
#1771977862
cd path-finder
#1771977863
ll src/
#1771977864
ll src/cli/
#1771977866
ll src/cli/commands/
#1771977872
ll src/cli/commands/show/
#1771977936
git st
#1771977952
bat src/cli/mod.rs 
#1771977959
bat src/cli/find/opts.rs 
#1771977969
bat src/cli/find/common.rs 
#1771977980
bat --plain src/cli/find/common.rs 
#1771978261
git st
#1771978264
git st
#1771978268
git clean -f
#1771978268
git st
#1771978270
git add .
#1771978271
git st
#1771978324
ls
#1771978338
git st
#1771978339
git q
#1771978347
git whatchanged -p src/main.rs
#1771978361
git whatchanged src/main.rs
#1771978371
git show 447db0c46511184b3b3efbdabdfdf5cfa3e9b663
#1771978387
git log
#1771978394
git checkout d48244c449c8c2be50735b6467f75629a08bf51b -- src/main.rs
#1771978411
emc src/main.rs 
#1771978422
ggit st
#1771978424
git st
#1771978425
git dh
#1771978441
git st
#1771978446
git restore --staged src/main.rs 
#1771978466
git st
#1771978470
git restore src/main.rs 
#1771978504
git st
#1771978505
git diff
#1771978507
git add .
#1771978508
git st
#1771978548
cp -rfv ../path-finder/src/cli/find/ src/cli/commands/bootstrap
#1771978550
git add .
#1771978557
cd ./src/cli/commands/
#1771978557
git st
#1771978571
refactors Find Bootstrap -wp .
#1771978572
git st
#1771978574
git add .
#1771978909
git st
#1771978910
git add .
#1771978911
git st
#1771978917
git st
#1771978919
ll
#1771978922
rm .refactorsignore 
#1771978927
cd ..
#1771978929
git add .
#1771978929
git st
#1771978931
cd ..
#1771978932
cd ..
#1771978933
git st
#1771978946
git st
#1771978960
git add -f src/cli/
#1771978961
git st
#1771978966
git whatchanged src/cli/
#1771978987
git commit src/cli/ --amend -m src/cli/commands/bootstrap
#1771979037
git st
#1771979266
git st
#1771979268
git q
#1771979379
git st
#1771979585
ll
#1771979620
bash add-command.sh 
#1771979655
bash add-command.sh 
#1771979659
bash add-command.sh 
#1771979661
bash add-command.sh 
#1771979662
bash add-command.sh 
#1771979690
bash add-command.sh 
#1771979756
bash add-command.sh 
#1771979771
bash add-command.sh 
#1771979790
bash add-command.sh 
#1771979811
bash add-command.sh 
#1771979835
bash add-command.sh 
#1771979842
bash add-command.sh 
#1771979889
git st
#1771979900
git log
#1771979903
git whatchanged 
#1771979911
git dh add-command.sh
#1771979926
git dh add-command.sh
#1771979932
git reset --hard 
#1771979949
git st
#1771979950
git whatchanged 
#1771979952
git st
#1771979958
rm -rf src/cli/commands/env/
#1771979960
git add .
#1771979964
git commit --amend -C HEAD
#1771979968
git st
#1771979972
bash add-command.sh 
#1771979991
bash add-command.sh 
#1771980005
bash add-command.sh 
#1771980019
bash add-command.sh 
#1771980065
bash add-command.sh 
#1771980080
echo "${IFS@Q}"
#1771980094
echo "${IFS@Q}"
#1771980096
bash add-command.sh 
#1771980103
bash add-command.sh 
#1771980109
bash add-command.sh 
#1771980115
bash add-command.sh 
#1771980121
bash add-command.sh 
#1771980131
git st
#1771980133
git dh
#1771980135
git q
#1771980154
bash add-command.sh 
#1771980158
git t
#1771980159
git st
#1771980163
git commit -am add-command.sh 
#1771980164
git st
#1771980183
git st
#1771980188
git q
#1771980198
git whatchanged 
#1771980200
git st
#1771980203
git q
#1771980210
git switch -c add-commands
#1771980212
cargo run
#1771980318
git st
#1771980319
git add .
#1771980321
cargo run
#1771980344
cargo run
#1771980400
cargo run
#1771980428
cargo run
#1771980444
cargo run
#1771980506
cargo run
#1771980554
cargo run
#1771980568
cargo run
#1771980597
cargo run
#1771980618
cargo run
#1771980629
cargo run
#1771980650
cargo run
#1771980672
ack 'pub\s*[(]crate[)]'
#1771980698
ack 'pub\s*[(]crate[)]' -l | xargs sed -E 's/pub\s*[(]crate[)]/pub/g' 
#1771980700
ack 'pub\s*[(]crate[)]' -l | xargs sed -E 's/pub\s*[(]crate[)]/pub/g'  -i
#1771980701
git st
#1771980703
git add .
#1771980704
cargo run
#1771980714
cargo run
#1771980720
git st
#1771980722
git add .
#1771980723
git st
#1771980724
cargo run
#1771980727
git st
#1771980729
git switch -
#1771980730
git st
#1771980741
git commit -am 'fix build'
#1771980744
git log
#1771980746
git whatchanged 
#1771980763
git rebase -i 447db0c46511184b3b3efbdabdfdf5cfa3e9b663
#1771980787
export EDITOR='emacsclient'
#1771980789
git rebase -i 447db0c46511184b3b3efbdabdfdf5cfa3e9b663
#1771980820
git log
#1771980822
git st
#1771980824
cargo run
#1771980863
cargo run
#1771980866
ll
#1771980867
git st
#1771980889
mv src/cli/commands/bootstrap/common.rs src/cli/commands/bootstrap/shared.rs
#1771980890
git add .
#1771980901
cd ./src/cli/commands/
#1771980910
refactors common shared -wp .
#1771980911
git st
#1771980916
refactors Common Shared -wp .
#1771980918
git st
#1771980921
git add .
#1771980923
git dh
#1771980925
cd -
#1771980926
cargo run
#1771980932
cd ./src/
#1771980933
rm -rf src/cli/commands/env/
#1771980936
git st
#1771980947
refactors Common Shared -wp .
#1771980949
cd -
#1771980950
cargo run
#1771980953
git st
#1771980955
git add .
#1771980956
git log
#1771980960
git commit --amend -C HEAD
#1771980961
cargo run
#1771980964
./add-command.sh 
#1771980998
./add-command.sh 
#1771981015
git st
#1771981017
git whatchanged 
#1771981024
git reset --hard bcaf187d3057ec5116fcbd3c5d128653e681c377
#1771981025
git st
#1771981027
git switch -
#1771981030
git switch -
#1771981034
git br -D add-commands 
#1771981039
git switch -c add-commands
#1771981040
git st
#1771981135
cargo run
#1771981139
./add-command.sh 
#1771981154
./add-command.sh 
#1771981164
git st
#1771981167
git clean -df
#1771981181
git clean -df
#1771981184
git st
#1771981186
./add-command.sh 
#1771981211
git clean -df
#1771981213
./add-command.sh 
#1771981229
./add-command.sh 
#1771981241
./add-command.sh 
#1771981243
./add-command.sh 
#1771981249
./add-command.sh 
#1771981264
./add-command.sh 
#1771981267
./add-command.sh 
#1771981270
./add-command.sh 
#1771981340
./add-command.sh 
#1771981355
./add-command.sh 
#1771981372
./add-command.sh 
#1771981379
cargo run
#1771981418
rust-autocomplete 
#1771981420
rust-autocomplete list
#1771981429
rust-autocomplete list src/cli/commands/env/
#1771981432
rust-autocomplete list src/cli/commands/env/
#1771981438
rust-autocomplete list src/cli/commands/env/
#1771981500
git st
#1771981503
git add add-command.sh 
#1771981506
git commit add-command.sh -m add-command.sh 
#1771981511
git reset --hard 
#1771981547
rust-autocomplete list src/cli/commands/env/
#1771981550
rust-autocomplete list src/cli/commands/bootstrap/
#1771981600
rust-autocomplete list src/cli/commands/bootstrap/mod.rs 
#1771981624
bat src/cli/commands/
#1771981627
rust-autocom src/cli/commands/
#1771981635
rust-autocomplete list src/cli/commands/
#1771981648
rust-autocomplete list src/cli/commands/mod.rs o
#1771981649
rust-autocomplete list src/cli/commands/mod.rs 
#1771981650
bat src/cli/commands/mod.rs
#1771981717
cat src/cli/commands/mod.rs | pbcopy 
#1771981862
git st
#1771981864
git add .
#1771981929
cargo run
#1771981937
git st
#1771981939
git dh
#1771982057
git st
#1771982059
git diff
#1771982061
git q
#1771982063
./add-command.sh 
#1771982064
git st
#1771982068
git diff
#1771982073
cargo run
#1771982094
git st
#1771982097
git clean -df
#1771982100
git reset --hard 
#1771982139
git reset --hard 
#1771982145
./add-command.sh 
#1771982171
git st
#1771982173
git clean -df
#1771982175
git reset --hard 
#1771982201
git st
#1771982203
git q
#1771982205
./add-command.sh 
#1771982230
git st
#1771982232
git reset --hard 
#1771982234
git clean -df
#1771982256
./add-command.sh 
#1771982271
cargo run
#1771982273
git st
#1771982275
git clean -df
#1771982277
git st
#1771982282
git reset --hard 
#1771982283
git st
#1771982297
git st
#1771982300
./add-command.sh 
#1771982302
git st
#1771982312
git reset --hard ;git clean -df
#1771982346
./add-command.sh 
#1771982354
git st
#1771982356
git reset --hard ;git clean -df
#1771982365
cargo run -- bootstrap
#1771982369
cargo run -- --help
#1771982393
./add-command.sh 
#1771982400
git st
#1771982410
git reset --hard ;git clean -df
#1771982412
./add-command.sh 
#1771982422
./add-command.sh ; echo $?
#1771982431
cargo run
#1771982439
git reset --hard ;git clean -df
#1771982442
cargo run
#1771982448
cargo run -- bootstrap
#1771982454
cargo run -- bootstrap --help
#1771982464
./add-command.sh ; echo $?
#1771982468
git st
#1771982472
git reset --hard ;git clean -df
#1771982533
git st
#1771982533
git q
#1771982537
./add-command.sh 
#1771982542
git log
#1771982546
git reset --hard 
#1771982549
git switch 
#1771982553
git st
#1771982555
git clean -df
#1771982557
git switch -
#1771982560
git log -
#1771982563
git switch -
#1771982564
git log
#1771982567
git whatchanged 
#1771982572
git reset --hard e495239ea4d40fcb0f0260de304d6125cd401bbc
#1771982573
git log
#1771982576
git switch -
#1771982582
git merge --squash add-commands 
#1771982583
git st
#1771982585
git log
#1771982588
git commit
#1771982593
git whatchanged 
#1771982603
git commit --amend -m add-command.sh 
#1771982605
git whatchanged 
#1771982611
git switch -
#1771982614
git st
#1771982620
./add-command.sh 
#1771982625
git log
#1771982630
git st
#1771982637
git reset --hard ;git clean -df
#1771982638
git st
#1771982659
git switch -c add-commands 
#1771982667
git st
#1771982678
git q
#1771982678
./add-command.sh 
#1771982692
git st
#1771982701
git log
#1771982721
git reset --hard 321b930d1d853fac20a6c54596e953199609a677
#1771982722
git st
#1771982723
git clean -df
#1771982765
git q
#1771982766
./add-command.sh 
#1771982771
git log
#1771982774
git whatchanged 
#1771982776
git whatchanged -p
#1771982780
git st
#1771982785
git reset --hard 321b930d1d853fac20a6c54596e953199609a677
#1771982790
git clean -df
#1771982793
git st
#1771982796
./add-command.sh 
#1771982804
git st
#1771982810
git reset --hard 321b930d1d853fac20a6c54596e953199609a677
#1771982811
git clean -df
#1771982822
git log
#1771982832
./add-command.sh 
#1771982835
git reset --hard 321b930d1d853fac20a6c54596e953199609a677
#1771982838
git clean -df
#1771982839
./add-command.sh 
#1771982858
git reset --hard 321b930d1d853fac20a6c54596e953199609a677;git clean -df
#1771982876
git q
#1771982880
git log
#1771982882
git whatchanged 
#1771982884
git switch -
#1771982896
git merge --squash add-commands 
#1771982898
git st
#1771982911
git checkout add-commands -- src/main.rs
#1771982912
git st
#1771982913
git dh
#1771982917
git st
#1771982919
git commit
#1771982925
git log
#1771982931
git commit --amend -m add-command.sh 
#1771982934
git switch -
#1771982943
cargo run -- bootstrap --help
#1771982947
./add-command.sh 
#1771983712
git reset --hard 321b930d1d853fac20a6c54596e953199609a677;git clean -df
#1771983809
./add-command.sh 
#1771983814
git log
#1771983839
./add-command.sh 
#1771983852
git reset --hard 321b930d1d853fac20a6c54596e953199609a677;git clean -df
#1771983853
git st
#1771983868
git log
#1771983878
git reset --hard c7e9bae70c79fb7b4f19e0367d72dbab6ad1ef31 && git clean -df;
#1771983886
git reset --hard c7e9bae70c79fb7b4f19e0367d72dbab6ad1ef31 ; git clean -df;
#1771983890
./add-command.sh 
#1771983898
cargo run
#1771983903
git whatchanged -p src/
#1771983918
git st
#1771983921
git clean -df
#1771983923
cargo run
#1771983930
git st
#1771983941
git reset --hard c7e9bae70c79fb7b4f19e0367d72dbab6ad1ef31 ; git clean -df;
#1771983943
git whatchanged 
#1771983984
cargo run
#1771983986
./add-command.sh 
#1771984002
git st
#1771984008
bat src/cli/commands/env/mod.rs 
#1771984016
git reset --hard c7e9bae70c79fb7b4f19e0367d72dbab6ad1ef31 ; git clean -df;
#1771984028
git diff
#1771984035
git q
#1771984038
git log
#1771984046
git reset --hard b59b79118a2e9f314cc9c6e1771e9e0964935256 ; git clean -df;
#1771984054
./add-command.sh 
#1772048416
bat add-command.sh 
#1772048418
git st
#1772048420
git dh
#1772048427
git st
#1772048429
git log
#1772048443
git commit -am 'add all commands'
#1772048454
cargo run
#1772049925
brew update
#1772049947
cd /opt/homebrew/
#1772049956
cd -
#1772049974
pushd "$(dirname /opt/homebrew/etc/bash_completion.d/brew)"
#1772049988
pushd "$(dirname /opt/homebrew/etc/bash_completion.d/)"
#1772050003
pushd "$(dirname /opt/homebrew/etc/)"
#1772050005
git st
#1772050015
pushd "$(dirname /opt/homebrew/etc/bash_completion.d/brew)"
#1772050017
ll
#1772050018
git st
#1772050032
git st
#1772050034
ll
#1772050047
git fetch -a open
#1772050050
git remotes
#1772050059
git path
#1772050070
cd
#1772050074
cd projects/.gitrepos/
#1772050075
dua
#1772050097
git init --bare $(slugify-string /opt/homebrew/etc).git
#1772050107
path canon -fu /Users/gabrielfalcao/projects/.gitrepos/opt-homebrew-etc.git/
#1772050120
popd
#1772050130
pushd "$(dirname /opt/homebrew/etc/bash_completion.d/)"
#1772050132
git path
#1772050155
git remote add local "${HOME}/projects/.gitrepos/opt-homebrew-etc.git"
#1772050170
git push --mirror local 
#1772050176
git push -u local
#1772050267
mkdir -p ~/workbench/$(today)
#1772050292
mv .git ~/workbench/$(today)/$(slugify-string $(pwd)).git
#1772050294
git st
#1772050296
git path
#1772050299
git st
#1772050314
pushd "$(dirname /opt/homebrew/etc/bash_completion.d/brew)"
#1772050317
git whatchanged .
#1772050323
ll
#1772050335
git remotes
#1772050338
git br
#1772050354
git reset  --hard origin/main 
#1772050358
brew update
#1772050369
rm -f /opt/homebrew/etc/bash_completion.d/brew
#1772050373
brew update
#1772050384
mv ~/workbench/$(today)/$(slugify-string $(pwd)).git .git
#1772050409
mv ~/workbench/2026-02-25/opt-homebrew-etc.git/ .git
#1772050419
brew seach utils
#1772050423
brew search utils
#1772050535
pushdmkd ~/workbench/$(today)
#1772050538
git init
#1772050539
git st
#1772050571
declare -a brew_utils_list=( moreutils psutils dateutils bintutils debianutils findutils recutils patchutils osxutils nfcutils libparserutils recutils plotutils patchutils xml-coreutils usbutils uutils-findutils uutils-coreutils uutils-diffutils )
#1772050579
echo "${brew_utils_list[*]}"
#1772050587
echo "${brew_utils_list[*]}" | unique-lines 
#1772050600
echo "${brew_utils_list[*]}" | sort -u
#1772050603
echo "${brew_utils_list[*]}" | sort -u
#1772050619
echo "${brew_utils_list[*]}" | sort -u > brew-utils.to-install.txt
#1772050648
declare -a brew_utils_list=( $(cat ./brew-utils.to-install.txt ) )
#1772050657
echo "${brew_utils_list[*]}"
#1772050675
for name in ${brew_utils_list[@]}; do json_path="./brew-info/${name}.json" ; mkdir -p "${json_path}"; brew info --json=v2 > "${jsno_path}"; done
#1772050762
ll
#1772050768
rm -rf brew-info/
#1772050778
for name in ${brew_utils_list[@]}; do json_path="./brew-info/${name}.json" ; mkdir -p "$(dirname "${json_path}")"; brew info --json=v2 > "${jsno_path}"; done
#1772050786
for name in ${brew_utils_list[@]}; do json_path="./brew-info/${name}.json" ; mkdir -p "$(dirname "${json_path}")"; brew info --json=v2 > "${json_path}"; done
#1772050802
for name in ${brew_utils_list[@]}; do json_path="./brew-info/${name}.json" ; mkdir -p "$(dirname "${json_path}")"; brew info --json=v2 "${name}" > "${json_path}"; done
#1772050838
echo -e '\ninetutils' >> brew-utils.to-install.txt 
#1772050840
git st
#1772050845
git add brew-utils.to-install.txt 
#1772050847
git st
#1772050849
git clean -df
#1772050854
pwd | pbcopy 
#1772051151
brew info --help | batman
#1772051363
git st
#1772051371
echo '*.json' >> .gitignore
#1772051373
git add .
#1772051374
git st
#1772051375
git q
#1772051382
chmod +x *.sh
#1772051382
ll
#1772051383
git st
#1772051386
pwd
#1772051396
git whatchanged -p .gitignore
#1772051419
echo '*.json' >> .gitignore
#1772051420
git st
#1772051423
git add .
#1772051428
chmod a+x *.sh
#1772051429
git st
#1772051432
git q
#1772051447
git st
#1772051456
rm brew-utils.to-install.txt 
#1772051461
mv brew-install-utils.sh brew-info-utils.sh 
#1772051463
git add .
#1772051467
git commit -am brew-info-utils.sh
#1772051478
./brew-info-utils.sh 
#1772051481
git st
#1772052673
./brew-info-utils.sh 
#1772052737
git st
#1772052740
git q
#1772052741
bat tmp.sh 
#1772052744
rm tmp.sh 
#1772052747
git st
#1772052754
rm -rf brew-info
#1772052755
./brew-info-utils.sh 
#1772052874
./brew-info-utils.sh 
#1772052880
./brew-info-utils.sh 
#1772052958
./brew-info-utils.sh 
#1772053023
git q
#1772053026
./brew-info-utils.sh 
#1772053095
./brew-info-utils.sh 
#1772053474
git q
#1772053477
./brew-info-utils.sh 
#1772053589
./brew-info-utils.sh 
#1772053644
./brew-info-utils.sh 
#1772053658
./brew-info-utils.sh 
#1772053799
./brew-info-utils.sh 
#1772053903
./brew-info-utils.sh 
#1772053976
./brew-info-utils.sh 
#1772053981
./brew-info-utils.sh 
#1772054010
./brew-info-utils.sh 
#1772054075
./brew-info-utils.sh 
#1772054080
./brew-info-utils.sh 
#1772054097
shopt -p -s
#1772054105
shopt -p -s
#1772054107
./brew-info-utils.sh 
#1772054112
./brew-info-utils.sh 
#1772054119
echo ${COLUMNS} 
#1772054139
echo ${COLUMNS} 
#1772054140
./brew-info-utils.sh 
#1772054156
./brew-info-utils.sh 
#1772054166
./brew-info-utils.sh 
#1772054171
./brew-info-utils.sh 
#1772054218
./brew-info-utils.sh 
#1772054229
./brew-info-utils.sh 
#1772054277
./brew-info-utils.sh 
#1772054320
./brew-info-utils.sh 
#1772054333
brew info --eval-all --variations --json="v1" "bintutils"
#1772054356
cd /opt/homebrew/
#1772054356
git st
#1772054361
git fetch -a origin 
#1772054368
git remotes
#1772054370
git remotes -a
#1772054377
git br
#1772054425
declare -- opt_brew_local_remote="$HOME/projects/.gitrepos/$(slugify-string "$(pwd)").git"
#1772054427
echo ${opt_brew_local_remote} 
#1772054433
git init --bare ${opt_brew_local_remote}
#1772054441
git remote add local ${opt_brew_local_remote}
#1772054447
git push --mirror local 
#1772054478
git push -u local main 
#1772054483
git remotes
#1772054490
git diff origin/main 
#1772054492
git log
#1772054501
git push -u local main 
#1772054515
ll
#1772054519
./brew-info-utils.sh 
#1772054537
./brew-info-utils.sh 
#1772054552
brew info --eval-all --variations --json="v1" "coreutils"
#1772054568
pushd "$(dirname '/opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/b/bashmod.rb')"
#1772054571
ll
#1772054581
git whatchanged -p bashmod.rb
#1772054595
pushd $(git path)
#1772054602
ll
#1772054629
git submodule foreach ?
#1772054630
git submodule foreach 
#1772054634
man git-submodule foreach 
#1772054673
git-submodule foreach 'echo $(pwd)'
#1772054681
git br
#1772054683
git remotes
#1772054687
git remotes
#1772054692
git init --bare ${opt_brew_local_remote}
#1772054702
git remote add local ${opt_brew_local_remote}
#1772054707
git remotes
#1772054709
git remotes -n
#1772054712
git remotes -a
#1772054718
git remote 
#1772054724
man git-remote 
#1772054726
git remote show
#1772054736
git remote list
#1772054748
git remote -v
#1772054790
git remotes
#1772054795
git path
#1772054773
git push --mirror local 
#1772054843
local_remote_path=$(path join ~/projects/.gitrepos  $(slugify-string $(pwd)).git)
#1772054846
echo ${local_remote_path} 
#1772054860
git remotes
#1772054864
git remote
#1772054875
git remote set-url local ${local_remote_path}
#1772054880
git remote show -n
#1772054883
git remote show -n local
#1772054891
git push  --mirror local 
#1772054898
git init --bare ${local_remote_path}
#1772054903
st
#1772054899
git push  --mirror local 
#1772054973
cd /opt/homebrew/
#1772054974
dua
#1772055014
pbcopy <<< 'git reflog expire --expire=now'
#1772055019
git reflog expire --expire=now
#1772055025
git reflog expire --expire=now --all
#1772055085
ll ~/opt/libexec/
#1772055027
git gc --aggressive --prune=now
#1772055095
split-to-lines 
#1772055101
pbcopy | split-to-lines 
#1772055108
split-to-lines  <<< "$(pbpaste)"
#1772055119
for name in $(split-to-lines  <<< "$(pbpaste)"); do echo "$(cd "${name}" && pwd))"; done
#1772055163
for name in $(split-to-lines  <<< "$(pbpaste)"); do gstat -c '%F %N' "$(cd "${name}" && pwd)"; done
#1772055191
echo ${IFS@Q}
#1772055210
for name in $(split-to-lines  <<< "$(pbpaste)"); do gstat -c '%F %N' "$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; done
#1772055225
for name in $(split-to-lines  <<< "$(pbpaste)"); do gstat -c '%Y %W %F %N' "$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; done | sort -nr
#1772055262
for name in $(split-to-lines  <<< "$(pbpaste)"); do  project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; path; gstat -c "%W (%F) ${project_path}" "${project_path}"; done
#1772055368
for name in $(split-to-lines  <<< "$(pbpaste)"); do  project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; gstat -c "%W (%F) ${project_path}" "${project_path}"; done | sort -nr
#1772055384
for name in $(split-to-lines  <<< "$(pbpaste)"); do  project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; gstat -c "%W (%F) ${project_path}" "${project_path}"; done 
#1772055388
for name in $(split-to-lines  <<< "$(pbpaste)"); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; declare -p project_path; done
#1772055437
for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)"; declare -p project_path; done
#1772055458
for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done 
#1772055539
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done 
#1772055553
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done | unique-lines 
#1772055558
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done | lastcol |unique-lines 
#1772055613
pushdmkd /Users/gabrielfalcao/projects/work/poems.codes/wip/regex-related-poc-or-wips
#1772055626
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done | lastcol |unique-lines 
#1772055630
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done | lastcol |unique-lines | firstcol 
#1772055642
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done | lastcol |unique-lines | firstcol | sed -E '/^\s*$/d'
#1772055666
cls;for name in $(split-to-lines  <<< 'regex-army-knife/  regex-el/          regex-parser-nom/  regex-toolbelt/'); do   project_path="$(1>/dev/null 2>/dev/null cd "${name}" && pwd)";  if [ -n "${project_path}" ]; then gstat -c "%W (%F) ${project_path}" "${project_path}"; gstat -c "%Y (%F) ${project_path}" "${project_path}"; fi; done | lastcol |unique-lines | firstcol | sed -E '/^\s*$/d' | xargs -Ifrom mv -fv 'from' $(pwd)
#1772055668
cd
#1772055682
cd tools/
#1772055688
cd -
#1772055688
cd -
#1772055698
cd tools/../wip/regex-related-poc-or-wips/
#1772055699
ll
#1772055703
find . -name Cargo.toml
#1772055731
find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path={};
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename $(pwd))"
(cd "${crate_path}" && cargo deps list)
echo
'
#1772055828
find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path={};
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename $(pwd))"
(cd "${crate_path}" && cargo deps list)
echo
' {} \;
#1772055832
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path={};
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename $(pwd))"
(cd "${crate_path}" && cargo deps list)
echo
' {} \;
#1772055889
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path={};
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename $(pwd))"
echo -e "cargo craft -csm (cd "${crate_path}" && cargo deps list | xargs) $(basename $(pwd))"
echo
' {} \;
#1772055896
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path={};
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename $(pwd))"
echo -e "cargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename $(pwd))"
echo
' {} \;
#1772055931
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename $(pwd))"
echo -e "cargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename $(pwd))"
echo
' {} \;
#1772055954
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename "${crate_path}")"
echo -e "cargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename $(pwd))"
echo
' {} \;
#1772055962
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename "${crate_path}")"
echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename $(pwd))"
echo
' {} \;
#1772055975
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
echo -e "$(basename "${crate_path}")"
echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
echo
' {} \;
#1772056017
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
' {} \;
#1772056023
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | split-to-lines
#1772056069
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -E 's/[[:space:]\n]+/ /g'
#1772056074
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'
#1772056096
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g; a
\n

'
#1772056118
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'
#1772056122
cls;find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'; echo
#1772056130
cls;(find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'; echo)
#1772056132
cls;(find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'; echo) | pbcopy 
#1772056140
cd tools/
#1772056170
> regexpast
#1772056194
cls;(find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'; echo) 
#1772056199
ll
#1772056210
rustup toolchain list
#1772056237
cls;(find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
(cd "${crate_path}" && cargo deps list )

' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'; echo) 
#1772056287
cls;(find . -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -- manifest_path=$(path canon "{}");
declare -- crate_path=$(dirname "${manifest_path}")
#echo -e "$(basename "${crate_path}")"
#echo -e "\tcargo craft -csm $(cd "${crate_path}" && cargo deps list | xargs) $(basename ${crate_path})"
#echo
#(cd "${crate_path}" && cargo deps list )
(cd "${crate_path}" && pwd)
' {} \; | sed -z -E 's/[[:space:]\n]+/ /g'; echo)  
#1772056333
cls;(find . -name Cargo.toml -exec path canon {} \; 
#1772056337
find . -name Cargo.toml -exec path canon {} \; 
#1772056344
cd -
#1772056350
pwd
#1772056353
pushd toold
#1772056363
pushd /Users/gabrielfalcao/projects/work/poems.codes/wip/regex-related-poc-or-wips
#1772056374
find . -name Cargo.toml -exec path canon {} \; 
#1772056379
find . -name Cargo.toml -exec path parent {} \; 
#1772056475
(cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
declare -p


')
#1772056475
(cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
declare -p


')
#1772056506
(cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
declare -p ${!project*}


')
#1772056506
(cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
declare -p ${!project*}


')
#1772056524
(cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
declare -p ${!project*};
echo -e "\n"

')
#1772056524
(cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
declare -p ${!project*};
echo -e "\n"

')
#1772056581
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}" && cargo deps list

')
#1772056587
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list'
#1772056603
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | sort 
#1772056607
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | sort -u
#1772056615
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772056815
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772056844
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772056869
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772056876
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772056891
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772056927
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057099
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057128
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057139
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057166
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057187
find . -name '*.md'
#1772057197
find . -name '*.md' -exec cp {} . \;
#1772057204
dua
#1772057208
bat TODO.md 
#1772057210
bat README.md 
#1772057218
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines TODO.md 
#1772057222
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines TODO.md 
#1772057227
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines TODO.md 
#1772057289
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --line-numbers -n --prefix -pf --suffix="index %d"
#1772057403
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --line-numbers -n --prefix -pf --suffix="index %d"
#1772057461
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057510
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines 
#1772057528
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772057997
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058030
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058069
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058120
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058206
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058231
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058258
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058281
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058320
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058357
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058364
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058372
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatte
#1772058375
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058390
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058421
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058435
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058443
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flat
#1772058448
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058467
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flatten
#1772058469
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flat
#1772058470
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --fla
#1772058476
cls; find . -name Cargo.toml -exec path parent {} \; | xargs -Iprojectpath bash -c 'set -umeTE; set +f; set -o pipefail; declare -r project_path="projectpath";
declare -r project_name=$(basename "${project_path}")
cd "${project_path}"
cargo deps list' | unique-lines --flat
#1772058496
cd tools/
#1772058496
ll
#1772058500
bat regexpast 
#1772058559
split-to-lines cd ..
#1772058561
cd ..
#1772058562
cd ..
#1772058563
cd tools/
#1772058570
find . -type f -name 'Cargo.toml'
#1772058680
find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'if grep -E -i '(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)' "{}"; then
#1772058701
find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'if grep -E -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "{}"; then
echo "{} => ${output}"
fi
' \;
#1772058761
find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "{}"); then
echo "{} => ${output}"
fi
' \;
#1772058766
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "{}"); then
echo "{} => ${output}"
fi
' \;
#1772058801
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "{}"); then
#echo "{} => ${output}"
cd "$(dirname "{}") && cargo deps list | unique-lines --flat
'
#1772058875
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "{}"); then
#echo "{} => ${output}"
cd "$(dirname "{}") && cargo deps list | unique-lines --flat
' \;
#1772058912
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'set -umeTE; set -o pipefail; set +f; declare -- output=""; cd "{}";
if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "Cargo-toml"); then
#echo "{} => ${output}"
cargo deps list | unique-lines --flat
' \;
#1772058949
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'set -umeTE; set -o pipefail; set +f; declare -- output=""; cd "$(dirname "{}")";
if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "Cargo-toml"); then
#echo "{} => ${output}"
cargo deps list | unique-lines --flat
' \;
#1772058977
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'set -umeTE; set -o pipefail; set +f; declare -- output=""; cd "$(dirname "{}")";
if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "Cargo-toml"); then
#echo "{} => ${output}"
cargo deps list | unique-lines --flat
' \;
#1772059000
pushmkd ~/workbench/$(today)
#1772059006
cls;find . -maxdepth 4 -type f -name 'Cargo.toml' -exec bash -c 'set -umeTE; set -o pipefail; set +f; declare -- output=""; cd "$(dirname "{}")";
if output=$(ack -i "(color|palette|palette|ansi[a-z0-9_-]color|color[a-z0-9_-]ansi)" "Cargo-toml"); then
#echo "{} => ${output}"
cargo deps list | unique-lines --flat
' \;
#1772059058
path canon color-related-deps.sh 
#1772059062
cd path-finder
#1772059063
git st
#1772059067
git add src/
#1772059074
ll
#1772059089
1> TODO-$(today).rst echo '# TODO

make sure commands such as `path canon` do not print trailing newline'
#1772059110
git st
#1772059117
git add TODO*
#1772059119
git st
#1772059128
git q
#1772060615
cd ~/workbench/$(today )
#1772060657
pushdmkd ./google-SEO-sponsored-galery-url-examples
#1772060680
fetch 'https://www.google.com/aclk?sa=L&ai=DChsSEwig9P604PWSAxVyVUgAHbD6DIIYACICCAEQFxoCY2U&co=1&ase=2&gclid=CjwKCAiA2PrMBhA4EiwAwpHyC05wGDll_ofckdy6UhfTltXl14JKFULYWr7qotsSdcjpaeua7Mp-fxoCnGAQAvD_BwE&cid=CAASWeRo5Ug5V5stdHWHlO1JIl5bPpaJlKm2QIaT8v9-nA7ZY75yNfweO_0vJ6341kKqtcbvz19Lr1fELnPDbW3iCTde5qn598UbgOxM80DsZRhGQVEHys9zE3PK&cce=2&category=acrcp_v1_32&sig=AOD64_1MQmlr--NjP9qfnGRqql03ZYYCxw&ctype=5&q=&nis=4&ved=2ahUKEwig1Pe04PWSAxUjpJUCHRA-KvEQ5bgDKAB6BAgHEC4&adurl='
#1772060693
cd tools/
#1772060728
#cargo craft -cm -d reqwest -d serde_json fetch
#1772060733
cargo craft --help
#1772060789
ps aux | grep cargo
#1772060810
ps aux | gawk   '
{
printf("NR=%d; NF=%d; %s\n", NR, NF, $0)
}
'
#1772060870
cls;ps aux | gawk   '
$0 ~ /(bash|cargo)/ {
printf("NR=%d; NF=%d; %s\n", NR, NF, $0)
}
'
#1772060741
cargo craft --offline -cm -d reqwest -d serde_json fetch
#1772060898
cls;ps aux | gawk   '{
result = "";
for (i=11;i<NF;i++) {
result = sprintf("%s%s%s", result, $i, FS)
}
print(result)
}
'
#1772061002
ps aux | head
#1772061064
chmod a+x ~/opt/libexec/column-command-from-ps-aux 
#1772061103
cls;ps aux | gawk   '
$0 ~ /(bash|cargo|\/System)/ {
printf("NR=%d; NF=%d; %s\n", NR, NF, $0)
}
'
#1772061110
cls;lsof | gawk   '
$0 ~ /(bash|cargo|\/System)/ {
printf("NR=%d; NF=%d; %s\n", NR, NF, $0)
}
'
#1772061144
cls;lsof |grephd '(/System|bash|cargo)'
#1772061186
ll ~/opt/libexec/
#1772061272
cls;lsof |grephd '(/System|bash|cargo)'
#1772061281
cls;lsof |grephd '(/System|bash|cargo)'
#1772061306
cls;lsof |grephd '(/System|bash|cargo)'
#1772061311
cls;ps aux |grephd '(/System|bash|cargo)'
#1772061314
cls;lsof |grephd '(/System|bash|cargo)'
#1772062722
cd sexprs/
#1772062724
ll
#1772062724
dua
#1772062756
cd fetch
#1772062759
cargo run
#1772062733
cargo build;cargo run
#1772062779
path canon . | pbcopy 
#1772062840
cargo add url http
#1772062899
cargo add regex
#1772062905
cargo add regex -F use_std,pattern
#1772062922
cargo add heck
#1772062975
cargo add strip-ansi-escapes any_ascii
#1772063000
git init
#1772063001
git add .
#1772063003
git q
#1772063006
cargo test
#1772063016
cargo run 
#1772063143
git st
#1772063143
git add .
#1772063144
git q
#1772063198
git st
#1772063201
chmod a+x acceptance.sh 
#1772063202
git q
#1772063203
./acceptance.sh 
#1772063214
./acceptance.sh 
#1772063224
./acceptance.sh 
#1772063280
sleep 100
#1772063293
sleep 100
#1772063295
./acceptance.sh 
#1772063370
ll
#1772063372
ll target/
#1772063502
./acceptance.sh 
#1772063532
./acceptance.sh 
#1772063536
git st
#1772063537
git add .
#1772063560
git add .
#1772063562
cargo urn
#1772063564
cargo run
#1772063572
./acceptance.sh 
#1772063824
node
#1772064282
git st
#1772064283
git add .
#1772064284
git q
#1772065695
cd ~/.emacs.d/
#1772065695
git st
#1772065700
git add c/templates/
#1772065707
git dh -- c/templates/
#1772065722
git commit c/templates/ -m 'color'
#1772065730
git st
#1772065731
git dh
#1772065926
nowdz | pbcopy 
#1772066718
pwd
#1772066719
git st
#1772066723
git add c/staging/
#1772066725
git diff
#1772066731
git commit c/modes.el  -m astro
#1772066731
git st
#1772065968
Emacs-arm64-11 -nw -Q -q
#1772073857
git st
#1772073863
git clean -f
#1772074236
git st
#1772074238
git q
#1772074239
cd 
#1772074248
cd ~/.shell.d/x.d/
#1772074250
git st
#1772074283
echo -e '\n
*.bkp
\n'  >> .gitignore
#1772074292
git st
#1772074300
git dh emacs.sh
#1772074306
git commit emacs.sh -m EMACS_SOCKET_NAME'
#1772074310
git commit emacs.sh -m EMACS_SOCKET_NAME
#1772074311
gi tst
#1772074312
git st
#1772074313
git add .
#1772074321
git commit -am 'wip: colors'
#1772074322
git st
#1772074360
git st
#1772074361
git diff
#1772074363
git diff
#1772074374
git st
#1772074383
git add colors-gawk.el
#1772074384
git st
#1772074385
git dh
#1772074386
git q
#1772074391
launch_emacs_desktop 
#1772074401
pushmkd ~/workbench/$(today)
#1772074402
ll
#1772074414
echo ${TZ} 
#1772074417
git st
#1772074433
git add  color-related-deps.sh 
#1772074434
git st
#1772074437
git add emacs-buffers.2026-02-25.21-32-06.1772065926.buflist.org 
#1772074437
git st
#1772074438
git q
#1772074439
git st
#1772074442
git add .
#1772074446
git commit -am '*.bkp'
#1772074447
cd ..
#1772074448
dua
#1772074449
ll
#1772074453
cd ./2026-02-26/
#1772074454
ll
#1772074457
git st
#1772074458
git init
#1772074458
git st
#1772074461
git add .
#1772074462
git st
#1772074465
git q
#1772074470
ll
#1772074478
mv emacs-buffers-1772074223 ../2026-02-25/
#1772074479
git st
#1772074494
git commit -am "$(history)
#1772074532
git st
#1772074546
git st
#1772074583
git commit -am "$( history 5 | head -1 )"
#1772074609
cd ../2026-02-25/
#1772074610
git st
#1772074611
git add .
#1772074612
git q
#1772074680
cd mu
#1772074684
cd ..
#1772074685
dua
#1772074696
cd ./wezterm/
#1772074697
dua
#1772074699
st
#1772074703
ll target/
#1772074705
dua target/
#1772074713
git br
#1772074716
git remotes
#1772074722
git remote show -n
#1772074726
git remote show -n o
#1772074727
git remote show -n origin
#1772074732
git remote show -n
#1772074736
git remote show -n third_party_local
#1772074768
git remote add upstream git@github.com:wezterm/wezterm.giy
#1772074770
git remote add upstream git@github.com:wezterm/wezterm.git
#1772074773
git remote set-url upstream git@github.com:wezterm/wezterm.git
#1772074778
git remote show -n upstream
#1772074788
git fetch -a upstream
#1772074793
git log upstream
#1772074799
git br
#1772074816
git log upstream/main 
#1772074832
git remotes
#1772074833
git remotes -a
#1772074841
cd git-bandolier/
#1772074848
ll
#1772074842
cargo run
#1772075041
ll ~/opt/libexec/git*
#1772075081
bat ~/opt/libexec/git-offline 
#1772075290
git info
#1772075472
git head
#1772074856
>TODO echo -e "# TODO

## commands

### \x60\x60git remotes -a\x60\x60
list remotes, ordered by most recently updated first

### \x60\x60git untracked\x60\x60
list untracked, unstaged files

### \x60\x60git \x60\x60
quick commit all staged files (if any) then commits each unstaged file by filesystem timestamp (created/changed)

### \x60\x60git \x60\x60
quickly initializes a new git repo, adds gitignore, adds all files and makes a first commit
### \x60\x60git ignore (add|list|delete)\x60\x60
auto-adds untracked files to .gitignore
### \x60\x60git offline\x60\x60
initialized a bare git repo in ~/projects/.gitrepos/path-to-repo-slugified.git, adds that path as \x22git remote\x22 in current repo and runs git push --mirror

if such remote already exists, simply runs git push 

this command is meant to create a \x22local/offline\x22 remote as redundancy to avoid data loss
### \x60\x60git autocommit\x60\x60
auto-commits every untracked and unstaged path by filesystem date
### \x60\x60git path\x60\x60
prints path of current git repo - .e.g.: git rev-parse --show-toplevel
### \x60\x60git path <path to tracked file as shown in git status>\x60\x60
resolves given path automatically
### \x60\x60git br -a\x60\x60
list branches ordered by most recently modified
### \x60\x60git dh/git diff-head\x60\x60
git diff HEAD
### \x60\x60git head [--format=...]\x60\x60
sort of shortcut to \x60\x60git log -1 (--format)\x60\x60

### \x60\x60git common-ancestor-to-ref\x60\x60

prints the common ancestor to given refdeclare -p ${!project*};
"
#1772075628
git st
#1772075631
mv TODO TODO.md
#1772075632
bat TODO.md 
#1772075634
git add .
#1772075635
git q
#1772075663
git br
#1772075668
git log
#1772075671
git log
#1772075677
git fetch -a upstream 
#1772075686
git remote show 
#1772075705
git remote show | xargs -Iremref git fetch  -a remref
#1772075716
git log
#1772075725
git remote
#1772075729
git log third_party_local/main 
#1772075741
git checkout third_party_local/main 
#1772075747
git switch -
#1772075753
git log third_party_local/main
#1772075764
git log upstream/main 
#1772075785
git br
#1772075804
git checkout third_party_local/main 
#1772075822
git switch -c third_party_local_main
#1772075825
git log
#1772075832
git rebase upstream/main 
#1772075834
git st
#1772075835
git log
#1772075840
git remotes
#1772075855
git push third_party_local 
#1772075862
git remote show
#1772075866
git remote show origin
#1772075871
git remote show -n origin
#1772075879
git log origin/main 
#1772075900
git checkout origin/main
#1772075905
git switch -
#1772075910
git log origin/main 
#1772075917
git switch main 
#1772075918
git log
#1772075926
git rebase third_party_local_main 
#1772075928
git log
#1772075931
git diff upstream/main 
#1772075976
ll
#1772075977
bat get-deps 
#1772075994
which emacsclient 
#1772075999
emacsclient -n build.sh 
#1772076098
git diff upstream/main 
#1772076105
git reset --hard upstream/main 
#1772076108
git diff upstream/main 
#1772076110
ll
#1772076113
./get-deps 
#1772076131
emacsclient -n get-deps 
#1772076136
./get-deps 
#1772076202
echo $SUDO
#1772076255
brew search libxkbcommon
#1772076265
brew info libxkbcommon
#1772076299
brew info buildessential
#1772076302
brew info buildessentia
#1772076310
brew list --formulae
#1772076313
brew list --formulae --installed
#1772076316
brew list --formulae 
#1772076321
brew list --help
#1772076335
brew list --formulae --full-name
#1772076341
brew list --formulae --full-name | bat
#1772076506
brew list --formulae --full-name | grep -E '(build|xcb([_-]|.?)util|xcb([_-]|.?)util([_-]|.?)image|libxkb(common)?|fontconfig|libx11)'
#1772076513
brew list --formulae --full-name | grep -E '(build|xcb([_-]|.?)util|xcb([_-]|.?)util([_-]|.?)image|libxkb(common)?|fontconfig|libx11)'  | pbcopy 
#1772076748
brew list --formulae --full-name | grep -E '(build|devel|pkg.?conf|bsd|(g(nu[-]?)?)?(cc|make|gettext)|cmake|perl|python|zip|git|openssl|xcb(([_-]|.?)util)?|libxkb(common)?|fontconfig|libx11)'
#1772076754
brew list --formulae --full-name | grep -E '(build|devel|pkg.?conf|bsd|(g(nu[-]?)?)?(cc|make|gettext)|cmake|perl|python|zip|git|openssl|xcb(([_-]|.?)util)?|libxkb(common)?|fontconfig|libx11)' | pbcopy 
#1772076835
cls;brew list --formulae --full-name | grep -E '(build|devel|pkg.?conf|bsd|(g(nu[-]?)?)?(cc|make|gettext)|cmake|perl|python|zip|git|openssl|xcb(([_-]|.?)util)?|libxkb(common)?|fontconfig|libx11)' | pbcopy 
#1772076915
brew search --help
#1772076963
brew search --formula '/(build|devel|pkg.?conf|bsd|(g(nu[-]?)?)?(cc|make|gettext)|cmake|perl|python|zip|git|openssl|xcb(([_-]|.?)util)?|libxkb(common)?|fontconfig|libx11)/'
#1772076966
cls;brew search --formula '/(build|devel|pkg.?conf|bsd|(g(nu[-]?)?)?(cc|make|gettext)|cmake|perl|python|zip|git|openssl|xcb(([_-]|.?)util)?|libxkb(common)?|fontconfig|libx11)/'
#1772076988
cls;brew search --formula '/(build|devel|pkg.?conf|bsd|(g(nu[-]?)?)?(cc|make|gettext)|cmake|perl|python|zip|git|openssl|xcb(([_-]|.?)util)?|libxkb(common)?|fontconfig|libx11)/' | tee deps.brew
#1772077022
brew info cgit
#1772077047
brew info fastbuild forgit
#1772077095
brew info fastbuild git-game git-get git-if git-ignore git-machete git-multipush
#1772077109
brew install gitea
#1772077133
brew install gitea ifacemaker
#1772077164
# brew uninstall gitea ifacemaker perl6
#1772077167
brew uninstall gitea ifacemaker
#1772077181
brew install --help
#1772077185
brew install --help | batma
#1772077186
brew install --help | batman 
#1772077241
cdmkd ./brew-deps
#1772077247
mv ../deps.brew .
#1772077248
git add .
#1772077249
git st
#1772077208
brew install --build-from-source  gitea ifacemaker perl6
#1772077468
git st
#1772077469
git add .
#1772077474
chmod a+x deps.brew.sh 
#1772077475
git t
#1772077476
git st
#1772077477
git q
#1772077479
./deps.brew.sh 
#1772077517
./deps.brew.sh 
#1772077549
./deps.brew.sh 
#1772077568
git q
#1772077777
which wezterm
#1772077900
cd ~/.ssh/
#1772077901
git st
#1772077903
git whatchanged .
#1772077911
git st
#1772077912
git diff
#1772077918
cd
#1772077918
git st
#1772077924
git q
#1772077926
git st
#1772077992
git st
#1772078006
git commit -am 'ssh config pi 5'
#1772077570
./deps.brew.sh 
#1772078299
ord '|'
#1772078972
cd ~/workbench/$(today)
#1772078994
scp lan-pi:/home/gabrielfalcao/bash_history_root.2026-02-26.1772079042 lan-pi.bash_history_root.2026-02-26.1772079042.txt
#1772078997
git st
#1772078999
git add .
#1772079000
git q
#1772079035
networksetup -getdnsservers Wi-Fi
#1772078009
ssh lan-pi
#1772079129
ifconfig 
#1772079139
ssh lan-pi
#1772079893
cd tools/
#1772079990
cargo craft -csm -C parse -C convert -C match -C replace -C substitute -C colorize -d 'clap -F derive,env,string,unicode,wrap_help' -d 'iocore' -d 'regex -F pattern' -d 'regex-automata' -d 'regex-syntax' -d 'serde -F derive' -d 'nom' -d 'pest' -d 'regex' regex-bandolier ;          cd ~/projects/work/poems.codes/tools/regex-bandolier ; cargo new --lib regex-ast
#1772080025
cd ./regex-bandolier/
#1772080046
echo -e '\nfindutils\n' >> .gitignore 
#1772080063
git clone --depth=1 git@github.com:aixoss/findutils.git && cd ./findutils && ack 'regextype'
#1772080232
g p -r chrome
#1772080235
g p -r chrome -k
#1772084445
cd cargo-features/
#1772084558
emc src/cli.rs 
#1772084683
node
#1772084884
rustup  doc std::deref
#1772084885
rustup  doc std::ops
#1772085238
git st
#1772085239
git add .
#1772085240
git q
#1772085648
git st
#1772085651
git add .
#1772085653
rm src/crates_api.rs 
#1772085654
git add .
#1772085655
git st
#1772086355
git st
#1772086356
gti add .
#1772086359
git add .
#1772086371
cargo run
#1772086379
dua
#1772086382
rm -rf target/
#1772086397
git st
#1772086387
cargo cbt --run
#1772086416
git switch -c crates-api-module
#1772086418
git st
#1772086418
git q
#1772086426
git st
#1772086427
git diff
#1772086439
git st
#1772086442
git restore  src/http/client.rs 
#1772086769
git st
#1772086770
git add .
#1772086773
git commit -am WIP
#1772086775
git switch -
#1772086776
git log
#1772086792
git br
#1772086795
git log crates-api-module 
#1772086808
git log
#1772086815
git reset --hard 7396a260d0a55d6b37ba3986d9928f748eb003b3
#1772086823
git st
#1772086830
git st
#1772086816
cargo run
#1772087693
cd ~/workbench/$(today)
#1772087694
ll
#1772087695
git st
#1772087726
cdmkd ./regex-ast-and-general-parser-related-crates
#1772087756
(echo; pbpaste; echo) >  crates_io_urls.txt
#1772087758
cat crates_io_urls.txt 
#1772088609
cd color-picker-tui/
#1772088611
cd colorconv/
#1772088613
ll
#1772088613
git st
#1772088615
git path
#1772088618
cargo deps list
#1772089722
cargo deps
#1772089724
cargo deps list
#1772089733
ll
#1772089734
git st
#1772089735
git add .
#1772089736
git q
#1772089751
(echo; pbpaste; echo) >  crates_io_urls_2.txt
#1772089758
mv crates_io_urls.txt crates_io_urls_1.txt 
#1772089767
git add .
#1772089767
git q
#1772090055
ll
#1772090056
git t
#1772090057
git st
#1772089769
ipython
#1772090133
git st
#1772090135
git diff
#1772090154
sed -E '/^\s*$/d' -i crates_io_urls_*
#1772090156
git st
#1772090157
git diff
#1772090185
git commit -am 'uniquefy urls'
#1772090202
for urls_file in crates_io_urls_{1,2}.txt; do
crates_file=$(sed -E  's/crates_io_urls_([12])[.]txt/crates_ui_names\1.txt' <<< "${urls_file}"); sed -E 's,^(.*)/([a-zA-Z0-9_-]+)([^a-zA-Z0-9_-]*)$/\2/g' "${urls_file}" > "${crates_file}"; done
#1772090379
for urls_file in crates_io_urls_{1,2}.txt; do
crates_file=$(sed -E  's/crates_io_urls_([12])[.]txt/crates_ui_names\1.txt' <<< "${urls_file}"); sed -E 's,^(.*)/([a-zA-Z0-9_-]+)([^a-zA-Z0-9_-]*)$,\2,g' "${urls_file}" > "${crates_file}"; done
#1772090391
for urls_file in crates_io_urls_{1,2}.txt; do
crates_file=$(sed -E  's/crates_io_urls_([12])[.]txt/crates_ui_names\1.txt' <<< "${urls_file}"); sed -E 's,^(.*),([a-zA-Z0-9_-]+)([^a-zA-Z0-9_-]*)$,\2,g' "${urls_file}" > "${crates_file}"; done
#1772090432
for urls_file in crates_io_urls_{1,2}.txt; do
crates_file=$(sed -E  's/crates_io_urls_([12])[.]txt/crates_ui_names\1.txt/g' <<< "${urls_file}"); sed -E 's,^(.*)/([a-zA-Z0-9_-]+)([^a-zA-Z0-9_-]*)$,\2,g' "${urls_file}" > "${crates_file}"; done
#1772090435
git st
#1772090444
git clean -f
#1772090460
for urls_file in crates_io_urls_{1,2}.txt; do
crates_file=$(sed -E  's/crates_io_urls_([12])[.]txt/crates_io_names\1.txt/g' <<< "${urls_file}"); sed -E 's,^(.*)/([a-zA-Z0-9_-]+)([^a-zA-Z0-9_-]*)$,\2,g' "${urls_file}" > "${crates_file}"; done
#1772090462
git st
#1772090463
git add .
#1772090470
bat crates_io_names1.txt 
#1772090492
for urls_file in crates_io_urls_{1,2}.txt; do
crates_file=$(sed -E  's/crates_io_urls_([12])[.]txt/crates_io_names\1.txt/g' <<< "${urls_file}"); sed -n -E 's,^(.*)/([a-zA-Z0-9_-]+)([^a-zA-Z0-9_-]*)$,\2,gp' "${urls_file}" > "${crates_file}"; done
#1772090495
bat crates_io_names1.txt 
#1772090501
bat crates_io_names2.txt 
#1772090503
git add .
#1772090504
git st
#1772090506
git q
#1772090522
for num in {1..2}; do echo ${num}; done
#1772090540
for num in {1..2}; do  cat "./crates_io_names${num}.txt"; done
#1772090568
cargo features
#1772090570
cargo features --help
#1772090656
for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel cargo features --json-dump-filename "./crates${num}/{}/{}.features.json" {}; cat "./crates_io_names${num}.txt" | parallel cargo features --reverse-dependencies --json-dump-filename "./crates${num}/{}/{}.features.reverse.json" {}; done
#1772090716
ll
#1772090718
git st
#1772090832
for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel bash -c 'declare -- crate_name="{}"; 
json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
mkdir -p "$(dirname "${json_features_output_path}")"
mkdir -p "$(dirname "${json_rev_deps_output_path}")"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091061
for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; 
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091075
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; 
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091300
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel --seqreplace "${num}"  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num={#};
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
declare -p ${!json_*} ${!crate*} num
exit 111
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091355
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel --seqreplace "${num}"  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num={#};'
#1772091382
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel --seqreplace "${num}"  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num={#};
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
declare -p ${!json_*} ${!crate*} num
exit 111'; done
#1772091425
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num={#};
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
declare -p ${!json_*} ${!crate*} num
exit 111
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091456
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel  bash -c 'set -umeTE; set +f; set -o pipefail; set -x; declare -r crate_name="{}"; declare -gri num={#};
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"

exit 111
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091165
man parallel
#1772091516
ll
#1772091544
grep -E -l regex crates_io_names*
#1772091558
grep -E -l regex-syntax crates_io_names*
#1772091561
cls;grep -E -l regex-syntax crates_io_names*
#1772091644
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num=$(grep -l -E "^${crate_name}\$" crates_io_names* | head -1 | sed -E "s,crates_io_names([0-9]+).txt,\1,g");
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
declare -p ${!json_*} ${!crate*} num
exit 111
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091687
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num=$(grep -l -E "^${crate_name}\$" crates_io_names* | head -1 | sed -E "s,crates_io_names([0-9]+).txt,\1,g");declare -- varname="";
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
for varname in ${!json_*} ${!crate*} num; do
declare -I -n refvar="${varname}"
echo -e "${refvar@A}"
unset -n refvar

exit 111
mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091754
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel  bash -c 'set -umeTE; set +f; set -o pipefail; declare -r crate_name="{}"; declare -gri num=$(grep -l -E "^${crate_name}\$" crates_io_names* | head -1 | sed -E "s,crates_io_names([0-9]+).txt,\1,g");declare -- varname="";
declare -r json_features_output_path="./crates${num}/${crate_name}/${crate_name}.features.json"
declare -r json_rev_deps_output_path="./crates${num}/${crate_name}/${crate_name}.reverse_deps.json"
for varname in ${!json_*} ${!crate*} num; do
declare -I -n refvar="${varname}"
echo -e "${refvar@A}"
unset -n refvar

mkdir -p "./crates${num}/${crate_name}"
cargo features -j "${crate_name}" > "${json_features_output_path}"
cargo features --reverse-dependencies -j "${crate_name}" > "${json_rev_deps_output_path}"
'; done
#1772091777
emacsclient -n fetch.sh 
#1772091788
git st
#1772091792
git add fetch.sh 
#1772091796
dua
#1772091800
dua i crates
#1772091809
rm -rf crates
#1772091810
git st
#1772091813
git q
#1772091952
git q
#1772092116
cls;for num in {1..2}; do   cat "./crates_io_names${num}.txt" | parallel ./fetch.sh '{}' "${num}"; done
#1772092167
ll
#1772092168
git st
#1772092172
git clean -df
#1772092185
pbpaste> run.sh
#1772092201
git st
#1772092204
git add .
#1772092269
1>run.stdout.log 2>run.stderr.log ./run.sh < /dev/null &
#1772092272
disown -a
#1772092297
git st
#1772092321
ll
#1772092322
git st
#1772092345
ps aux | grep -E '(run|fetch)[.]sh'
#1772092359
ps aux ppid,pid 
#1772092364
ps axo ppid,pid,args
#1772092387
ps axo ppid,pid,args | grep -E "^\s*$$\s+"
#1772092394
ps axo ppid,pid,args | grep -v grep | grep -E "^\s*$$\s+"
#1772092548
git st
#1772092631
echo ${PPID}}
#1772092632
echo ${PPID}
#1772092637
echo ${PPID} ${PID}
#1772092649
echo ${PPID} ${$}
#1772092658
man bash
#1772092807
ps axo ppid,pid,args
#1772092849
ps axo ppid,pid,args | grep -v grep | grep -E "^\s*$$\s+"
#1772093058
./go.sh 
#1772093152
ll
#1772093159
git st
#1772093163
gti add *.sh
#1772093166
dua
#1772093188
ps aux | grep =E '(go|run|fetch)[.]sh'
#1772093192
ps aux | grep -E '(go|run|fetch)[.]sh'
#1772093251
ps axo ppid,pid,args | grep -v grep | grep -E "^\s*((${PPID}|$$)\s+)+"
#1772093284
ps axo ppid,pid,args | grep -v grep | grep -E "^\s*(($$)\s+){1,2}"
#1772093369
ps axo ppid,pid,args | grep -E -v "^\s*(($$)\s+){1,2}\s*(.*)((go|run|fetch)[.]sh)"
#1772093391
echo ${PPID}}
#1772093414
ps axo ppid,pid,args | grep -E -v "^\s*${PPID}\s+" | grep -E -v "^\s*(($$)\s+){1,2}\s*(.*)((go|run|fetch)[.]sh)"
#1772093416
cls;ps axo ppid,pid,args | grep -E -v "^\s*${PPID}\s+" | grep -E -v "^\s*(($$)\s+){1,2}\s*(.*)((go|run|fetch)[.]sh)"
#1772093445
cls;ps axo ppid,pid,args | grep -E -v "^\s*${PPID}\s+" | grep -E "^\s*(($$)\s+){1,2}\s*(.*)((go|run|fetch)[.]sh)" # | grep -E -v "^\s*(($$)\s+){1,2}\s*(.*)((go|run|fetch)[.]sh)" 
#1772093454
cls;ps axo ppid,pid,args | grep -E -v "^\s*${PPID}\s+" | grep -E "^\s*(($$)\s+){1,2}"  | grep -E -v "^\s*(($$)\s+){1,2}\s*(.*)((go|run|fetch)[.]sh)" 
#1772093486
cls;ps axo ppid,pid,args | grep -E -v "^\s*${PPID}\s+" | grep -E "^\s*(($$)\s+){1,2}"  | grep -E -v "^\s*(($$)\s+){1,2}\s*(ps\s+(axo|aux)|grep|.*)((go|run|fetch)[.]sh)" 
#1772093569
cls;ps axo ppid,pid,args | grep -E -v "^\s*${PPID}\s+" | grep -E "^\s*(($$)\s+){1,2}"  | grep -E -v "^\s*[0-9]+\s+[0-9]+\s+(ps\s+(axo|aux)|grep)"
#1772093615
ps axo ppid,pid -p ${PPID}
#1772093636
ps axo ppid -p ${PPID}
#1772093657
ps axo ppid,pid | grep -E "^\s*${PPID}"
#1772093663
ps axo ppid,pid,args | grep -E "^\s*${PPID}"
#1772093678
ps axo ppid,pid | grep -E "^\s*${PPID}"
#1772093726
./go.sh 
#1772093745
./go.sh 
#1772093797
./go.sh 
#1772093803
echo ${PPID}}
#1772093832
./go.sh 
#1772093842
./go.sh 
#1772093890
git st
#1772093899
git add go.sh 
#1772093911
echo -e '\n' '*.log' >> .gitignore
#1772093911
git st
#1772093923
git st
#1772093928
ll crates1/
#1772093930
ll crates1/*
#1772093936
git st
#1772093937
git add .
#1772093938
git q
#1772093940
./go.sh 
#1772093956
./go.sh 
#1772094017
./go.sh 
#1772094027
./go.sh 
#1772094080
./go.sh 
#1772094085
ps axo ppid,pid | grep -E "^\s*${PPID}"
#1772094099
ps aux | grep -E '(go|run|fetch)[.]sh'
#1772094101
ps aux | grep -E '(go|run|fetch)[.]sh'
#1772094104
ps aux | grep -E '(go|run|fetch)[.]sh'
#1772094112
./go.sh 
#1772094235
./go.sh 
#1772094251
./go.sh 
#1772094279
./go.sh 
#1772094351
./go.sh 
#1772094359
./go.sh 
#1772094382
./go.sh 
#1772094418
./go.sh 
#1772094424
./go.sh 
#1772094430
./go.sh 
#1772094466
./go.sh 
#1772094473
./go.sh 
#1772094477
ps aux | grep -E '(go|run|fetch)[.]sh'
#1772094488
ps aux | grep -E '(go|run|fetch)[.]sh'
#1772094550
git st
#1772094552
./go.sh 
#1772094556
dua
#1772094567
./go.sh 
#1772094600
git st
#1772094603
git q
#1772094614
git st
#1772094622
git add crates1/
#1772094623
git st
#1772094637
git commit .gitignore -m .gitignore i
#1772094639
git st
#1772094643
git restore --staged crates1/
#1772094644
git s
#1772094645
git st
#1772094647
git q
#1772094649
git st
#1772094693
for folder in crates{1,2}; do tar cJf ../${folder}.tar.xz ${folder} && mv -fv ${folder} ../firstrun.${folder}; done
#1772094775
git st
#1772094777
./go.sh 
#1772094778
ll
#1772094780
git st
#1772094784
./go.sh 
#1772094798
./go.sh 
#1772094806
./go.sh 
#1772094808
./go.sh 
#1772094809
./go.sh 
#1772094811
./go.sh 
#1772094821
git st
#1772094850
ll
#1772094853
git st
#1772094857
git add status.sh 
#1772094915
git st
#1772094917
git q
#1772094930
git st
#1772094931
./status.sh 
#1772094963
./status.sh 
#1772094970
git st
#1772094971
git q
#1772094975
dua
#1772094984
dua ../
#1772094990
dua ../ .
#1772095015
dua (path canon ..) $(path canon .)
#1772095030
dua $(path canon "..") $(path canon .)
#1772095038
dua $(path canon "..")/ $(path canon .)/
#1772095069
dua $(path canon "../firstrun.crates{1,2}*" $(path canon .)/crates{1,2}
#1772095079
dua $(path canon "../firstrun.crates{1,2}*") $(path canon .)/crates{1,2}
#1772095086
dua $(path canon "../firstrun.crates{1,2}*") ; dua $(path canon .)/crates{1,2}
#1772095129
head  crates_io_names1.txt 
#1772095138
./fetch.sh awk-rs 1
#1772095185
ack 'set\s+[-]x'
#1772095188
git st
#1772095191
git diff
#1772095199
shfmt-o run.s
#1772095200
shfmt-o run.sh
#1772095202
git st
#1772095209
shfmt-o -w run.sh
#1772095211
shfmt-o -w fetch.sh 
#1772095213
shfmt-o -w go.sh 
#1772095218
shfmt-o -w status.sh 
#1772095218
git st
#1772095221
git dh
#1772095227
git q
#1772095228
git st
#1772095231
./fetch.sh awk-rs 1
#1772095264
./fetch.sh awk-rs 1
#1772095284
bat /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/reverse-dependencies/https-crates-io-api-v1-crates-awk-rs-reverse_dependencies-page-1-per_page-10.json
#1772095297
bat /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/awk-rs.features.json 
#1772095316
bat /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/https-crates-io-api-v1-crates-awk-rs.json 
#1772095340
diff -u --color /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/{awk-rs.features.json,https-crates-io-api-v1-crates-awk-rs.json}
#1772095351
diff -u --color /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/{awk-rs.features.json,https-crates-io-api-v1-crates-awk-rs.json}
#1772095375
diff -u --color /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/{awk-rs.features.json,features.https-crates-io-api-v1-crates-awk-rs.json}
#1772095399
bat /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/features.https-crates-io-api-v1-crates-awk-rs.json
#1772095411
ll crates1/awk-rs/awk-rs.*
#1772095413
bat crates1/awk-rs/awk-rs.*
#1772095448
diff -u --color crates1/awk-rs/awk-rs.features.json /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/awk-rs.features.json 
#1772095469
cls;diff -u --color crates1/awk-rs/awk-rs.features.json /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/awk-rs.features.json 
#1772095488
cls;diff -u --color crates1/awk-rs/awk-rs.features.json /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/awk-rs.features.json 
#1772095502
cls;diff -u --color crates1/awk-rs/awk-rs.features.json /Users/gabrielfalcao/.cargo/features/.crates-json/awk-rs/features/awk-rs.features.json  | bat -l diff
#1772095535
cd cargo-features/
#1772095536
git st
#1772095539
emc src/main.rs 
#1772095741
git st
#1772095742
git diff
#1772095749
dua
#1772095751
dua target/
#1772095754
cargo build
#1772095807
cargo build
#1772095829
cargo build
#1772095834
cargo build
#1772095847
cargo build
#1772095863
cargo build
#1772095875
which -a cargo-features 
#1772095884
cargo uninstall cargo-features
#1772095886
which -a cargo-features 
#1772095897
install ./target/debug/cargo-features /Users/gabrielfalcao/.cargo/bin/cargo-features
#1772095900
cargo-features 
#1772095909
./fetch.sh awk-rs 1
#1772095932
cargo-features --help
#1772096005
cls;./fetch.sh awk-rs 1
#1772096207
cls;./fetch.sh awk-rs 1
#1772096217
man install
#1772096468
./install.sh 
#1772096474
cls;./fetch.sh awk-rs 1
#1772096515
./install.sh 
#1772096517
cls;./fetch.sh awk-rs 1
#1772096651
cls;./fetch.sh awk-rs 1
#1772096653
./install.sh 
#1772096677
pwd
#1772096716
ll
#1772096746
cls;./fetch.sh awk-rs 1
#1772096760
cls;./fetch.sh awk-rs 1
#1772096790
cls;./fetch.sh awk-rs 1
#1772096720
bat install.sh 
#1772096830
cargo add debug-et-diagnostics
#1772096841
cargo rm debug-et-diagnostics
#1772096860
cd wezterm
#1772096851
cargo add --path ~/projects/work/poems.codes/tools/debug-et-diagnostics/
#1772096860
diua
#1772096861
dua
#1772096869
st
#1772096872
st
#1772096864
rm -rf target/
#1772096873
st
#1772096876
st
#1772096908
cls;./fetch.sh awk-rs 1
#1772096948
cls;./fetch.sh awk-rs 1
#1772097071
cls;./fetch.sh awk-rs 1
#1772097218
cls;./fetch.sh awk-rs 1
#1772097283
cls;./fetch.sh awk-rs 1
#1772097319
cls;./fetch.sh awk-rs 1
#1772097392
cls;./fetch.sh awk-rs 1
#1772097474
cls;./fetch.sh awk-rs 1
#1772097486
cls;./fetch.sh awk-rs 1
#1772097520
cls;./fetch.sh awk-rs 1
#1772097570
cls;./fetch.sh awk-rs 1
#1772097573
cls;./fetch.sh awk-rs 1
#1772097592
ll crates1/awk-rs/
#1772097622
ll ./crates1/awk-rs/crates1/awk-rs/
#1772097629
dua i ./crates1/
#1772097632
dua i ./crates1/awk-rs/
#1772097668
pbpaste | xargs -Ieach bat --plain each
#1772097680
pbpaste | xargs bat
#1772097708
dua i ./crates1/awk-rs/ | xargs bat
#1772097731
fdupes -f .
#1772097749
cls;find . -type f -name '*.json' -exec sha256sum {} \;
#1772097771
cls;find  ./crates1/awk-rs/  -type f -name '*.json' -exec sha256sum {} \;
#1772097782
cls;find  ./crates1/awk-rs/  -type f -name '*.json' -exec sha256sum {} \; | sort -u
#1772097878
cls;find  ./crates1/awk-rs/  -type f -name '*.json' -exec bash -c 'declare -- json_file="${1}"; declare --checksum=$(sha256sum "${json_file}" | awk "{ print \$1 }");' '{}' \; | sort -u
#1772097904
git st
#1772097906
git add double-check-checksum.sh 
#1772097915
git st
#1772097919
git diff fetch.sh
#1772097932
git commit fetch.sh -m 'rebuild cargo-features each time'
#1772098091
sha256sum --help
#1772098099
sha256sum --help | batman 
#1772098108
man bat
#1772098113
bat --help | batman
#1772098135
bat --help | batman
#1772098171
sha256sum --help | batman 
#1772098197
man sha256sum 
#1772098290
man gstat
#1772098487
dua i ./crates1/awk-rs/
#1772098498
./double-check-checksum.sh ./crates1/awk-rs/awk-rs.features.json
#1772098540
./double-check-checksum.sh ./crates1/awk-rs/awk-rs.features.json
#1772098561
./double-check-checksum.sh ./crates1/awk-rs/awk-rs.features.json
#1772098630
cd ~/.shell.d/x.d/col
#1772098632
cd ~/.shell.d/x.d/
#1772098634
git st
#1772098635
ll
#1772098647
gzip -9 *.bkp
#1772098648
git st
#1772098673
git status --porcelain | grep -E '^[?[:space:]][?]'
#1772098679
git status --porcelain | grep -E '^[?[:space:]][?]' | lastcol 
#1772098690
mkdir .trash
#1772098703
git status --porcelain | grep -E '^[?[:space:]][?]' | lastcol  | xargs -Ieach mv -fv 'each' ./.trash/
#1772098713
cd ..
#1772098718
mkdir .trash
#1772098721
git status --porcelain | grep -E '^[?[:space:]][?]' | lastcol  | xargs -Ieach mv -fv 'each' ./.trash/
#1772098723
git st
#1772098727
git diff
#1772098745
git commit conf.d/.wezterm.lua -m conf.d/.wezterm.lua 
#1772098754
cd ./x.d/
#1772098755
git st
#1772098756
ll
#1772098769
cp -fv *~ ../.trash/
#1772098784
mv -fv *~ ../.trash/x.d/
#1772098787
mkdir  -p ../.trash/x.d/
#1772098788
mv -fv *~ ../.trash/x.d/
#1772098790
ll
#1772098794
git st
#1772098796
rm -rf .trash/
#1772098800
git st
#1772098801
ll
#1772098803
cd ..
#1772098806
git st
#1772098838
git switch -c trash-from-$(git log -1 --format=%h)-d2a63fd-refactor-files-with-sed-bisect-2026-02-20
#1772098839
git st
#1772098841
git add .trash/
#1772098842
git st
#1772098848
cd ./x.d/
#1772098849
ll
#1772098863
mv -fv \#* ../.trash/x.d/
#1772098865
ll
#1772098883
find . -type l
#1772098893
find . -type l -exec sha512sum {} \;
#1772098899
find . -type l -delete
#1772098902
ll
#1772098921
cd -
#1772098922
git st
#1772098926
git add -f .trash/
#1772098927
git st
#1772098934
cd .trash/
#1772098959
cd path-finder
#1772098960
git st
#1772098961
cargo run
#1772098968
cargo run -- show README.md 
#1772098971
cargo run  show README.md 
#1772098982
emacsclient -n src/main.rs 
#1772099098
cargo run
#1772099107
cargo run
#1772099122
cargo run
#1772099129
cargo add serde_yaml
#1772099138
cargo add serde_json toml
#1772099160
st
#1772099150
cargo run
#1772099165
cls;cargo run
#1772099185
ack PathInfoDirectory
#1772099198
cls;cargo run
#1772099211
cls;cargo run
#1772099233
cls;cargo run
#1772099245
cls;cargo run
#1772099330
cls;cargo run
#1772099360
cls;cargo run
#1772099374
cls;cargo run
#1772099539
cls;cargo run
#1772099675
cls;cargo run
#1772099736
cls;cargo run
#1772099741
cls;cargo run
#1772099770
cls;cargo run
#1772099828
cls;cargo run
#1772099989
cls;cargo run
#1772100000
cls;cargo run
#1772100006
cls;cargo run -- show
#1772100009
cls;cargo run -- show README.md 
#1772100092
cls;cargo run -- show README.md 
#1772100147
cls;cargo run -- show README.md 
#1772100633
cargo doc --opne
#1772100635
cargo doc --open
#1772100953
cargo doc --open
#1772101083
cargo doc --open
#1772101089
cls;cargo run -- show README.md 
#1772101100
cls;cargo run -- show README.md 
#1772101136
cls;cargo run -- show README.md 
#1772101145
cls;cargo run -- show 
#1772101203
cls;cargo run -- show 
#1772101208
cls;cargo run -- show 
#1772101223
cls;cargo run -- show 
#1772101229
ll
#1772101247
rustup doc std::vec
#1772101478
rustup doc std::
#1772101588
cls;cargo run -- show 
#1772101593
cls;cargo run -- show 
#1772101605
cls;cargo run -- show 
#1772101618
ll
#1772101725
cls;cargo run -- show 
#1772101752
git st
#1772101767
git commit -am 'fix models.rs and poc command show'
#1772101768
git st
#1772101822
cls;find . -exec gstat -c '%F %W %Y %N' {} \;
#1772101775
cargo ip
#1772101833
cls;find . -exec gstat -c '%F %W %Y %N' {} \;
#1772101844
cls;find . -type f
#1772101846
ll
#1772101847
dua
#1772101848
git st
#1772101850
-wd
#1772101851
pwd
#1772101853
cd -
#1772101855
ll
#1772101859
cd ./.trash/
#1772101861
git st
#1772101864
cls;find . -exec gstat -c '%F %W %Y %N' {} \;
#1772101870
path show README.md 
#1772101882
find src/ -type f
#1772101888
find src -maxdepth 2 -type f 
#1772101893
find src -mindepth 2 -maxdepth 2 -type f 
#1772101898
find src -mindepth 1 -maxdepth 2 -type f 
#1772101906
find src -mindepth 1 -maxdepth 2 -type f
#1772101911
find src -mindepth 1 -maxdepth 2 -type f | cargo run -- show
#1772101917
cargo ip
#1772101929
cls;find .  | path show
#1772101940
cls;find .  | path show > index.yaml
#1772101962
cls;find . type f -not -name index.yaml
#1772102487
cargo ip
#1772102553
cargo ip
#1772102586
cargo ip
#1772102597
cargo ip
#1772102608
cargo ip
#1772102627
cargo ip
#1772102638
cargo ip
#1772102655
cargo run
#1772102661
cargo run -- show 
#1772102670
cargo run -- show -o foo.yaml
#1772102673
bat foo
#1772102674
bat foo.yaml 
#1772102685
cargo run -- show -h
#1772102786
path base
#1772102788
path base README.md 
#1772102791
path base -h
#1772102802
path extension README.md
#1772102812
path base $(path canon README.md )
#1772102861
path parent $(path canon README.md )
#1772102866
path parent -h
#1772102880
path parent $(path canon README.md )
#1772102890
path join "$(path parent $(path canon README.md ))"
#1772102892
path join "$(path parent $(path canon README.md ))" README.md 
#1772103021
cargo ip
#1772103036
cargo run -- show README.md 
#1772103075
cargo run -- show README.md 
#1772103148
cargo run -- show README.md 
#1772103155
cargo run -- show --minified README.md 
#1772103473
st
#1772103476
ls /Volumes/
#1772105323
pushd ~/.shell.d/
#1772105324
git st
#1772105330
git add .trash/
#1772105333
find src -mindepth 1 -maxdepth 2 -type f | cargo run -- show
#1772105336
cd -
#1772105339
cd -
#1772102768
cls;find . type f -not -name index.yaml -exec bash -c 'set -umeTe; set +f; set -o pipefail; declare -- path="$(path canon "${1}")";
declare -- base=$(path base "${path}")
declare -- extension=$(path extension "${path}")
declare -- parent=$(path parent "${path}")
cls;find . type f -not -name index.yaml -exec bash -c 'set -umeTe; set +f; set -o pipefail; declare -- path="$(path canon "${1}")";
#1772105351
declare -- base=$(path base "${path}")
#1772105351
declare -- extension=$(path extension "${path}")
#1772105351
declare -- parent=$(path parent "${path}")
#1772105474
popd
#1772105476
cls;
#1772105478
cargo run
#1772105531
cargo run
#1772105542
cargo run -- show README.md 
#1772105547
cargo run -- show --array README.md 
#1772105553
cargo ip
#1772105566
git st
#1772105572
git add src/
#1772105574
git dh src/
#1772105581
git commit -am 'show'
#1772105582
git st
#1772105596
path show --help
#1772105433
cls;find . type f -not -name index.yaml -exec bash -c 'set -umeTe; set +f; set -o pipefail; declare -- path="$(path canon "${1}")";
declare -- base=$(path base "${path}")
declare -- extension=$(path extension "${path}")
declare -- parent=$(path parent "${path}")
declare -- index=$(path join "${parent}" "${base}.info.json")
echo "path show ${path@Q} -f -o ${index@Q}"
path show "${path}" -f -o "${index}"
' '{}' \;
#1772105642
cargo ip
#1772105679
cls;find . type f -not -name index.yaml -exec bash -c 'set -umeTe; set +f; set -o pipefail; declare -- path=""; path=$(path canon "${@}")";
declare -- base=$(path base "${path}")
declare -- extension=$(path extension "${path}")
declare -- parent=$(path parent "${path}")
declare -- index=$(path join "${parent}" "${base}.info.json")
echo "path show ${path@Q} -f -o ${index@Q}"
path show "${path}" -f -o "${index}"
' {} \;
#1772105736
cls;find . type f -not -name index.yaml -exec bash -c 'set -umeTe; set +f; set -o pipefail; declare -- input=""; input="{}"; declare -- path=""; path="$(path canon "${input}")";
declare -- base=$(path base "${path}")
declare -- extension=$(path extension "${path}")
declare -- parent=$(path parent "${path}")
declare -- index=$(path join "${parent}" "${base}.info.json")
echo "path show ${path@Q} -f -o ${index@Q}"
path show "${path}" -f -o "${index}"
'  \;
#1772105907
cargo run -- show --array README.md 
#1772105922
cargo run -- show -f -o readme.info README.md 
#1772105930
cargo run -- show  -o readme.info README.md 
#1772105936
ll readme.info 
#1772106009
cargo run -- show  -o readme.info README.md 
#1772106023
cargo run -- show  -o readme.info2 README.md 
#1772106024
cargo run -- show  -o readme.info2 README.md 
#1772106028
cargo run -- show -f -o readme.info2 README.md 
#1772106037
cargo run -- show --yaml -f -o readme.info1 README.md 
#1772106038
ll
#1772106041
bat readme.info*
#1772106254
cargo run -- show --yaml -f -o readme.info1 README.md 
#1772106259
cargo run -- show --yaml -f -o readme.info1 README.md 
#1772106274
cls;cargo run -- show --yaml -f -o readme.info1 README.md 
#1772106289
cls;cargo run -- show --yaml -f -o readme.info1 README.md 
#1772106298
cls;cargo run -- show --toml -f -o readme.info3 README.md 
#1772106301
bat readme.info*
#1772106315
cls;cargo run -- show --array --toml -f -o readme.info3 README.md 
#1772106318
bat readme.info*
#1772106333
cls;cargo run -- show --array --toml -f -o readme.info3 bash.1.*
#1772106350
cargo add toml
#1772106362
cargo add toml -F preserve_order,unbounded
#1772106364
cls;cargo run -- show --array --toml -f -o readme.info3 bash.1.*
#1772106400
cls;cargo run -- show --array --toml -f -o readme.info3 bash.1.*
#1772106409
cls;cargo run -- show --yaml --toml -f -o readme.info3 bash.1.*
#1772106418
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106444
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106490
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106651
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106667
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106675
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106691
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106709
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106717
bat readme.info3 
#1772106752
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.*
#1772106755
bat readme.info3 
#1772106807
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.* && bat readme.info3 
#1772106943
rustup doc std::collections
#1772107306
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.* && bat readme.info3 
#1772107361
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.* && bat readme.info3 
#1772107411
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.* && bat readme.info3 
#1772107449
git st
#1772107458
git commit -am 'toml array'
#1772107464
cargo ip
#1772107604
git st
#1772107608
git dh
#1772107610
git st
#1772107612
git add src/
#1772107641
cls;cargo run -- show  --toml -f -o readme.info3 bash.1.* && bat readme.info3 
#1772107681
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772107698
export RUST_BACKTRACE=full
#1772107699
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772108702
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772108751
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772108836
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772108885
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772108909
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772108926
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772109006
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772109052
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772109067
cls;cargo run -- show  --toml -f -o nonexisting foobar.too
#1772109073
bat nonexisting 
#1772109086
cls;cargo run -- show  --json -f -o nonexisting foobar.too
#1772109094
cls;cargo run -- show -f -o nonexisting foobar.too
#1772109098
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772109188
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772109220
ll
#1772110284
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772110299
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772110339
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772110651
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772110824
cls;cargo run -- show -f -o nonexisting foobar.too && bat nonexisting 
#1772110828
git add .
#1772110937
git st
#1772110951
git restore --staged  *.*
#1772110952
git st
#1772110956
git status --porcelain 
#1772110962
git status --porcelain | grep -E '^A'
#1772110966
git status --porcelain | grep -E '^A' | lastcol 
#1772110972
git status --porcelain | grep -E '^A' | lastcol  | xargs git restore  --staged  
#1772110973
git st
#1772110988
mkdir tmp
#1772111002
git status --porcelain | grep -E '^[?]'
#1772111005
git status --porcelain | grep -E '^[?]' | lastcol 
#1772111015
git status --porcelain | grep -E '^[?]' | lastcol  | xargs -Ieach mv -fv 'each' ./tmp/
#1772111015
git st
#1772111028
cd ./tmp/
#1772111031
cargo run
#1772111036
cd -
#1772111049
path canon tmp/
#1772111052
path canon tmp/ | pbcopy 
#1772111077
cls; (cd /Users/gabrielfalcao/projects/work/poems.codes/tools/path-finder/tmp && cargo run -- show -f -o nonexisting foobar.404 && bat nonexisting)
#1772111159
cls; (cd /Users/gabrielfalcao/projects/work/poems.codes/tools/path-finder/tmp && cargo run -- show -f -o nonexisting foobar.404 && bat nonexisting)
#1772111207
cls; (cd /Users/gabrielfalcao/projects/work/poems.codes/tools/path-finder/tmp && cargo run -- show -f -o nonexisting foobar.404 && bat nonexisting)
#1772111241
ll
#1772111261
ln -s $(pwd)/refactor.sh $(pwd)/symlink-to-refactor.bash
#1772111263
ll
#1772111285
find . -mindepth 1 -maxdepth 1
#1772111289
find . -mindepth 1 -maxdepth 1 -not -type d
#1772111309
cls;find . -mindepth 1 -maxdepth 1 -not -type d -exec gstat -c '%F %N' '{}' \;
#1772111340
cls;find . -mindepth 1 -maxdepth 1 -not -type d -exec gstat -c '%W %Y %F %N %w => %y' '{}' \;
#1772111358
cls;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec gstat -c '%W %Y %F %N %w => %y' '{}' \;
#1772111368
cls;echo;;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec gstat -c '%W %Y %F %N %w => %y' '{}' \;echo
#1772111372
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec gstat -c '%W %Y %F %N %w => %y' '{}' \;echo
#1772111376
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec gstat -c '%W %Y %F %N %w => %y' '{}' \; ; echo;
#1772111411
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec bash -c 'echo; gstat -c "%W %Y %F %N %w => %y" "{}"; echo' \;
#1772111418
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec bash -c 'gstat -c "%W %Y %F %N %w => %y" "{}"; echo' \;
#1772111421
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec bash -c 'gstat -c "%W %Y %F %N %w => %y" "{}"; ' \;
#1772111425
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*'  -exec bash -c 'gstat -c "%W %Y %F %N %w => %y" "{}"; ' \; ; echo
#1772111440
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*' -not -name '.*' -exec bash -c 'gstat -c "%W %Y %F %N %w => %y" "{}"; ' \; ; echo
#1772111625
cls;echo;find . -mindepth 1 -maxdepth 1 -not -type d -name '*refactor*' -not -name '.*' -exec bash -c 'declare -i modified=$(gstat -c "%Y" "{}"); declare -i fg=$(( modified % 231 )); echo -en "\x1b[0m\x1b[1;38;5;${fg}m"; gstat -c "%W %Y %F %N %w => %y" "{}"; echo -en "\x1b[0m" ' \; ; echo
#1772111670
pbpaste > find-exec-checklinks.sh
#1772111837
path canon -fu . |pbcopy 
#1772112149
which date
#1772112151
which gdate
#1772112324
nowaapl 
#1772112387
man gdate
#1772112392
man gstat
#1772112410
dua
#1772112435
gstat -c '%N %F %s bytes (optional I/O: %o)
' target/debug/path
#1772112457
gstat -c '%N %F %s bytes (optional I/O: %o) %%B %B
%%b %b

' target/debug/path
#1772112479
gstat -c '%N %F %s bytes
%%o %o 
%%B %B
%%b %b

' target/debug/path
#1772112492
ipython
#1772112506
man gstat
#1772112533
gstat -c '%N %F %s bytes
%%o %o 
%%B %B
%%b %b
%%f %f


' target/debug/path
#1772112757
ipython
#1772112826
which python3
#1772112855
export PATH="${HOME}/.shell.d/.venv/bin:${PATH}"
#1772112861
hash -d
#1772112862
hash -r
#1772112866
which python3
#1772112876
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))'
#1772112881
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p
#1772112883
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1
#1772112924
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | xargs printf '%d'
#1772112930
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | xargs printf '%d '
#1772112991
hex
#1772113008
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | xargs while read hex; do
#1772113020
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | xargs | while read hex; do
#1772113028
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | while read hex; do echo $(( 0x${hex} )); done
#1772113051
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | while read hex; do echo $(( 0x${hex} )); done | sort -n
#1772113098
~/.shell.d/.venv/bin/ipython3
#1772113470
ll
#1772113487
. ~/.bashrc.static
#1772113487
set -o interactive-comments;
#1772113487
set -o monitor;
#1772113487
set -o posix;
#1772113487
# end of func='shell_d_export_state_part4_shellopts'
#1772113487
# start of func='shell_d_export_state_part5_functions'
#1772113487
# <function name="K">
#1772113487
K () {     if [ -n "$*" ]; then         echo "unexpected arguments: \"$*\"" 1>&2;         return 1;     fi;     history_clear_and_disable;     history_enable_and_read; }
#1772113487
# </function>
#1772113487
# <function name="__shell_d_sh_trap_function_return__">
#1772113487
__shell_d_sh_trap_function_return__ () {     echo "${FUNCNAME[1]}" 1>&2;     set +x; }
#1772113487
# </function>
#1772113487
# <function name="active_prefixed">
#1772113487
active_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_active}m${prefix}\x1b[1;38;2;${color_medium_active}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="aluminum_dark_prefixed">
#1772113487
aluminum_dark_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_aluminum_dark}m${prefix}\x1b[1;38;2;${color_medium_aluminum_dark}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="aluminum_light_prefixed">
#1772113487
aluminum_light_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_aluminum_light}m${prefix}\x1b[1;38;2;${color_medium_aluminum_light}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="bash_static_state">
#1772113487
bash_static_state () {     cls;     local -r variables="$(declare -p | sed -E 's/\s*$/;/g' | sed -E 's/[;]{2,}$/;/g' | base64 -w0)";     local -r functions="$(declare -f | base64 -w0)";     local -ar mobile_state_keys=('shopt_disabled' 'shopt_enabled' 'shell_opt_flags' 'shellopts_names' 'functions' 'variables');     local -A mobile_state_map=();     mobile_state_map['variables']="${variables}";     mobile_state_map['functions']="${functions}";     mobile_state_map['shellopts_names']="$(get_shellopts_names | grep -v -E '^\s*$' | base64 -w0)";     mobile_state_map['shell_opt_flags']="$(get_shell_opt_flags | grep -v -E '^\s*$' | base64 -w0)";     mobile_state_map['shopt_enabled']="$(get_shopt_enabled | grep -v -E '^\s*$' | base64 -w0)";     mobile_state_map['shopt_disabled']="$(get_shopt_disabled | grep -v -E '^\s*$' | base64 -w0)";     local -r mobile_state_map;     local -i index=0;     local -- key='';     local -- value='';     local -- result="";     local -i key_max_length=16;     echo -e '#\n';     echo -e 'set -umeTE';     echo -e 'set +f';     echo -e 'set -o pipefail';     for key in ${mobile_state_keys[@]};     do         value="${mobile_state_map[${key}]}";         echo;         printf '#%*s#%s#%-*s#\n' "${key_max_length}" "" "${key}" "${key_max_length}" "" | tr ' ' '#';         echo;
        printf 'eval "$(base64 -d <<< %s)";\n' "${value@Q}";         echo;         printf '#%*s#%s#%-*s#\n' "${key_max_length}" "" "${key}" "${key_max_length}" "" | tr ' ' '#';         echo;     done;     echo -e '#\n'; }
#1772113487
# </function>
#1772113487
# <function name="blame_command_exit_code">
#1772113487
blame_command_exit_code () {     local -- color="";     local -i code=0;     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -i exit_code=-1;     local -- prog="";     local -a prog_args=();     local -- ty="";     local -- actual_ty_path='';     local -- actual_ty='';     local -- actual_arg='';     local -a alias_parts=();     if [ ${argc} -eq 0 ]; then         echo -e "${FUNCNAME[0]}" "missing arguments <EXIT CODE> <COMMAND> [ARGS...]" 1>&2;         return 1;     fi;     for index in ${!argv[@]};     do         current=$(($index + 1));         arg="${argv[$index]}";         case "${index}" in             0)                 if [[ ! ${arg} =~ ^[0-9]+$ ]]; then                     echo -e "${FUNCNAME[0]}" "invalid argument <EXIT CODE> (not a number): ${arg@Q}" 1>&2;                     return 1;                 fi;                 exit_code="${arg}";                 if [ "${exit_code}" != "${arg}" ]; then                     echo -e "${FUNCNAME[0]}" "invalid argument <EXIT CODE> (not a number): ${arg@Q}" 1>&2;                     return 1;                 fi;             ;;             1)                 ty=$(builtin type -t "${arg}");                 if [ -z "${ty}" ]; then                     echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (not found): ${arg@Q}" 1>&2;                     return 1;                 fi;                 case "${ty}" in                     'keyword')                         echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (reserved shell keyword): ${arg@Q}" 1>&2;                         return 1;                     ;;                     'builtin')                         true;                     ;;                     'file')                         true;                     ;;                     'alias')                         export IFS='
';
                        if ! alias_parts=($(sed -n -E 's/^[^=]+=(.)([^[:space:]]+)\s*(.*)(.)$/\2\n\3/g;h;z;{g;s/\s+/\n/gp}' <<< "${arg}")); then                             unset IFS;                             echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (unresolved alias): ${arg@Q}" 1>&2;                             return 1;                         fi;                         unset IFS;                         actual_arg=${alias_parts[@]:0:1};                         actual_ty=$(builtin type -t "${actual_arg}");                         if [ -n "${actual_ty}" ]; then                             if actual_ty_path=$(builtin type -t -P "${actual_arg}"); then                                 actual_ty=$(builtin type -t "${actual_ty_path}");                             fi;                         else                             echo -e "${FUNCNAME[0]}" "invalid argument <COMMAND> (unresolved alias): ${arg@Q}" 1>&2;                             return 1;                         fi;                     ;;                 esac;                 prog="${arg}";             ;;             *);                 prog_args+=("${arg}");             ;;         esac;     done;     if [ ${exit_code} -eq 0 ]; then         color='112';     else         color=1;     fi;     echo -e "\n\n\x1b[1;38;5;248mcommand \x1b[1;38;5;220m${prog} $(printf '\x1b[1;38;5;222m%s\x1b[0m ' ${prog_args[@]})\x1b[1;38;5;248mexited with code=\x1b[1;38;5;${color}m${exit_code}\x1b[0m"; }
#1772113487
# </function>
#1772113487
# <function name="brown_prefixed">
#1772113487
brown_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_brown}m${prefix}\x1b[1;38;2;${color_medium_brown}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="butter_prefixed">
#1772113487
butter_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_butter}m${prefix}\x1b[1;38;2;${color_medium_butter}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="c">
#1772113487
c () {     if [ ! -f Cargo.toml ]; then         return 1;     fi;     k;     if [ ${#@} -gt 0 ]; then         if [ "$1" == "a" ]; then             cargo cbt --all-targets && cargo cbt --release --all-targets;             return $?;         else             cargo $@;             return $?;         fi;     else         cargo c;         return $?;     fi; }
#1772113487
# </function>
#1772113487
# <function name="cbt">
#1772113487
cbt () {     if [ -n "${IFS@A}" ]; then         local -- declare_IFS="${IFS@A}";     else         local -- declare_IFS="";     fi;     unset IFS;     local -a cargo_subcommands=("check" "build" "test");     local -A subcommand_fg_colors=(["check"]=231 ["build"]=220 ["test"]=154);     if [ ! -f Cargo.toml ]; then
        if [ -n "${declare_IFS}" ] && ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' > /dev/random 2> /dev/random <<< "${declare_IFS}"; then             eval "${declare_IFS}";         fi;         return 1;     fi;     for cargo_subc in ${cargo_subcommands[@]};     do         local -a cargo_call=(cargo "${cargo_subc}" "--offline");         if ! ${cargo_call[@]}; then             exit_code=$?;             fg_color="${subcommand_fg_colors[$cargo_subc]}";             echo -e "command \x1b[1;38;5;${fg_color}m${cargo_subc}\x1b[0m failed with status ${exit_code}: \x1b[1;38;5;202m${cargo_call[@]}\x1b[0m" 1>&2;
            if [ -n "${declare_IFS}" ] && ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' > /dev/random 2> /dev/random <<< "${declare_IFS}"; then                 eval "${declare_IFS}";             fi;             return $exit_code;         fi;     done;
    if [ -n "${declare_IFS}" ] && ack '^(declare(\s+|[-][a-z0-9-])+)([a-z0-9_-]+)[^=]*[=](.*)$' > /dev/random 2> /dev/random <<< "${declare_IFS}"; then         eval "${declare_IFS}";     fi;     return $?; }
#1772113487
# </function>
#1772113487
# <function name="cd_emacs_d_home_path">
#1772113487
cd_emacs_d_home_path () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -- target="";     if [ ${argc} -eq 0 ]; then         target=$HOME/opt/libexec;     else         for index in ${!argv[@]};         do             current=$(($index + 1));             arg="${argv[$index]}";             case "${arg}" in                 c)                     target="$HOME/.emacs.d/c";                 ;;                 ~ | root)                     target="$HOME/.emacs.d";                 ;;                 *)                     target="$HOME/.emacs.d/c";                 ;;             esac;         done;     fi;     local -- rgb="211;215;207m";     echo -e "\x1b[1;38;2;${rgb}${target}\x1b[0m" 1>&2;     pushd "${target}" > /dev/random 2> /dev/random; }
#1772113487
# </function>
#1772113487
# <function name="cd_opt_home_path">
#1772113487
cd_opt_home_path () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -- target="";     if [ ${argc} -eq 0 ]; then         target=$HOME/opt/libexec;     else         for index in ${!argv[@]};         do             current=$(($index + 1));             arg="${argv[$index]}";             case "${arg}" in                 libexec)                     target="$HOME/opt/libexec";                 ;;                 lib)                     target="$HOME/opt/lib";                 ;;                 ~ | root)                     target="$HOME/opt";                 ;;                 *)                     target="$HOME/opt/libexec";                 ;;             esac;         done;     fi;     local -- rgb="211;215;207m";     echo -e "\x1b[1;38;2;${rgb}${target}\x1b[0m" 1>&2;     pushd "${target}" > /dev/random 2> /dev/random; }
#1772113487
# </function>
#1772113487
# <function name="cd_shell_d_home_path">
#1772113487
cd_shell_d_home_path () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -- target="";     if [ ${argc} -eq 0 ]; then         target=$HOME/.shell.d;     else         for index in ${!argv[@]};         do             current=$(($index + 1));             arg="${argv[$index]}";             case "${arg}" in                 x | x.d)                     target="$HOME/.shell.d/x.d";                 ;;                 *)                     target="$HOME/.shell.d";                 ;;             esac;         done;     fi;     local -- rgb="211;215;207m";     echo -e "\x1b[1;38;2;${rgb}${target}\x1b[0m" 1>&2;     pushd "${target}" > /dev/random 2> /dev/random; }
#1772113487
# </function>
#1772113487
# <function name="cdmkd">
#1772113487
cdmkd () {     local -- target="${@}";     local -- backup_cdpath="";     local -i cdpath_was_defined=0;     if [[ -v CDPATH ]]; then         backup_cdpath="${CDPATH}";         cdpath_was_defined=1;         unset CDPATH;     fi;     mkdir -p "${target}" && cd "${target}";     export CDPATH="${backup_cdpath}"; }
#1772113487
# </function>
#1772113487
# <function name="chameleon_prefixed">
#1772113487
chameleon_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_chameleon}m${prefix}\x1b[1;38;2;${color_medium_chameleon}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="chocolate_prefixed">
#1772113487
chocolate_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_chocolate}m${prefix}\x1b[1;38;2;${color_medium_chocolate}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="cls">
#1772113487
cls () {     builtin history -a;     echo -en "\x1b[2J\x1b[3J\x1b[H" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="clsreset">
#1772113487
clsreset () {     cls;     reset; }
#1772113487
# </function>
#1772113487
# <function name="craft">
#1772113487
craft () {     set +e;     if path=$(cargo craft --script $*); then         name=$(basename "$path");         if [ -d "${path}/src" ]; then             old_manifest_bin_entry_regex="[.]/${name}.rs";             new_manifest_bin_entry="src/main.rs";             old_main_path="${path}/${name}.rs";             new_main_path="${path}/src/main.rs";             if [ -f "${old_main_path}" ]; then                 ( cd "${path}" && git commit -am 'save current state' );                 mv -fv "${old_main_path}" "${new_main_path}";                 refactors "${old_main_path}" "${new_main_path}" -wp "${path}/Cargo.toml";             fi;         fi;     else         code=$?;         if [ ${code} -eq 0 ]; then             code=101;         fi;         return $code;     fi; }
#1772113487
# </function>
#1772113487
# <function name="crates_io_get_git_repo_url">
#1772113487
crates_io_get_git_repo_url () {     local -a argv=($@);     local -- argc=${#argv[@]};     case ${argc} in         1)             crate_name="$1";         ;;         0)             echo "crates_io_get_git_repo_url missing argument: <CRATE-NAME>" 1>&2;         ;;         *)             local -- args_list="$(sed "s/\s\+/'/g" <<< "${argv[@]}")";             echo "crates_io_get_git_repo_url too many arguments: ${args_list@Q}" 1>&2;             return 1;         ;;     esac;     json_path=$(pwd)/.${crate_name};     crates_api_url="https://crates.io/api/v1/crates/${crate_name}";     if repo=$(/usr/bin/curl -s ${crates_api_url} 2> /dev/random | jq .crate.repository | tr -d '"'); then         echo "${repo}";     else         bar_text_left 231 196 "ERROR: failed to fetch json from ${crates_api_url}";         return 1;     fi; }
#1772113487
# </function>
#1772113487
# <function name="create_state_path_or_refresh_stat_info">
#1772113487
create_state_path_or_refresh_stat_info () {     export TZ="UTC";     if [ ! -e "${bash_static_state_path}" ]; then         overwrite_static_state_path;     fi;     declare -gi now=$(date +'%s');     declare -gi bash_static_state_last_modified=$(gstat -c '%Y' "${bash_static_state_path}");     declare -gi bash_static_state_last_modified_delta=$((now - bash_static_state_last_modified)); }
#1772113487
# </function>
#1772113487
# <function name="dbg">
#1772113487
dbg () {     local -- dbg_bash_rematch_value="$(dbg_bash_rematch)";     echo -e "${dbg_bash_rematch_value@A}";     local -- history_length_value="$(history_length)";     echo -e "${history_length_value@A}";     local -- get_callers_value="$(get_callers)";     echo -e "${get_callers_value@A}"; }
#1772113487
# </function>
#1772113487
# <function name="dbg_bash_rematch">
#1772113487
dbg_bash_rematch () {     export IFS='
';     export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}";     local -- output=$(echo -e "\n$(history)\n");     local -a lines=($(echo "${output}"));     local -i lines_count=${#lines[@]};     hist_time_regexp_timestamp_tz='^\s*([0-9]+)\s+(@([1-9][0-9]{9,}):([+-]?[0-9]+|[A-Z]+))\s+(.*)$'; }
#1772113487
# </function>
#1772113487
# <function name="debug">
#1772113487
debug () {     eval "${ui_msgfunc_ctx}";     debug_prefixed "[debug] [${script_name}:${linenum}]" "${@}"; }
#1772113487
# </function>
#1772113487
# <function name="debug_prefixed">
#1772113487
debug_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${debug_prefix_color_rgb}m${prefix}\x1b[1;38;2;${debug_color_rgb}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="defer">
#1772113487
defer () {     local -a defer_argv=($@);     local -i defer_argc=${#defer_argv[@]};     local -- defer_command="$@";     local -- log_name=$(slugify-string "$@");     local -- defer_log_path="$(workbench --log-path)/logs";     local -- stdout="${defer_log_path}/${log_name}.stdout.log";     local -- stderr="${defer_log_path}/${log_name}.stderr.log";     if [ ${argc} -eq 0 ]; then         echo -e "[defer] no command provided" 1>&2;         return 1;     fi;     local -- progname="${defer_argv[0]}";     local -- progtype="";     if ! progtype=$(get_prog_type "${progname}"); then         return $?;     fi;     deferred_prog_commands+=("${defer_command}");     deferred_prog_stderr+=(["${defer_command}"]="${stderr}");     deferred_prog_stdout+=(["${defer_command}"]="${stdout}");     deferred_prog_started_at_utc+=(["${defer_command}"]="$(date +%s)");     ( ${defer_argv[@]} 2> ${stderr} > ${stdout} && deferred_prog_finished_at_utc+=(["${defer_command}"]=$(date +%s)) ) & local -- prog_pid=$!;     disown -a;     deferred_prog_pids+=(["${defer_command}"]="${prog_pid}"); }
#1772113487
# </function>
#1772113487
# <function name="defer_maintenance">
#1772113487
defer_maintenance () {     local -- cmd="";     local -- deferred_pid="";     local -- deferred_psaux="";     local -- stdout="";     local -- stderr="";     local -i stderr_size=0;     local -i stdout_size=0;     local -i is_running=0;     local -- psaux_regex="^[^[:space:]]+\s+(${deferred_pid})\s+.*";     set +u;     for cmd in ${deferred_prog_commands[@]};     do         if ! deferred_pid=${deferred_prog_pids["${cmd}"]} || [ -z "${deferred_pid}" ]; then             continue;         fi;         if deferred_psaux=$(ps aux | grep -E "${psaux_regex}"); then             is_running=1;             deferred_prog_psaux_lines+=(["${cmd}"]="${deferred_psaux}");         fi;         if stderr=${deferred_prog_stderr["${cmd}"]} && [ -n "${deferred_pid}" ]; then             if [ -f "${stderr}" ]; then                 stderr_size=$(gstat -c %s "${stderr}");             fi;             if (($is_running)) && [ ${stderr_size} -eq 0 ]; then                 rm -f "${stderr}";             fi;         fi;         if stdout=${deferred_prog_stdout["${cmd}"]} && [ -n "${deferred_pid}" ]; then             if [ -f "${stdout}" ]; then                 stdout_size=$(gstat -c %s "${stdout}");             fi;             if (($is_running)) && [ ${stdout_size} -eq 0 ]; then                 rm -f "${stdout}";             fi;         fi;     done; }
#1772113487
# </function>
#1772113487
# <function name="describe_set">
#1772113487
describe_set () {     local -- flag="";     local -- desc="";     local -A descriptions=();     for help_line in $(help set | grep '^[[:space:]]\+[-][[:alpha:]][[:space:]]');     do
        flag=$(sed 's/^[[:space:]]\+[-]\([[:alpha:]]\)[[:space:]]\+\(.\+\)$/\1/g' <<< "${help_line}");
        desc=$(sed 's/^[[:space:]]\+[-]\([[:alpha:]]\)[[:space:]]\+\(.\+\)$/\2/g' <<< "${help_line}");         if [ -n "${flag}" ] && [ -n "${desc}" ]; then             descriptions+=(["${flag}"]="${desc}");         else             echo -e "failed to parse flag from ${help_line@Q}" 1>&2;             break;         fi;     done;     local -- flags="${-}";     local -- count=${#flags};     local -a unknown_flags=();     local -a explained_flags=();     for index in $(seq $(($count - 1)));     do         curr=$(($index + 1));         flag="${flags:${index}:1}";         desc="${descriptions[${flag}]}";         if [ -n "${desc}" ]; then             explained_flags+=("flag ${flag@Q} - ${desc}");         else             unknown_flags+=("${flag}");         fi;     done;     local -- explained_count=${#explained_flags[@]};     local -- unknown_count=${#unknown_flags[@]};     if [ ${explained_count} -gt 0 ] && [ ${unknown_count} -gt 0 ]; then         echo -e "bash variable \${-} has ${explained_count} flags explained in \`help set\` but ${unknown_count} flags are unknown\n";         echo -e "explained in \`help set\`:";         for expl in ${explained_flags[@]};         do             echo "    ${expl}";         done;         echo -e "\nunknown flags:";         for unknown in ${unknown_flags[@]};         do             echo "    ${unknown}";         done;     else         if [ ${explained_count} -gt 0 ] && [ ${unknown_count} -eq 0 ]; then             echo -e "bash variable \${-} has ${explained_count} flags explained in \`help set\`:";             for expl in ${explained_flags[@]};             do                 echo "    ${expl}";             done;         else             echo -e "all flags in bash variable \${-} are unknown\n";             for unknown in ${unknown_flags[@]};             do                 echo "    ${unknown}";             done;         fi;     fi; }
#1772113487
# </function>
#1772113487
# <function name="dump_history_to_workbench">
#1772113487
dump_history_to_workbench () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     export PS4='\r\n${FUNCNAME[0]}:${LINENO[0]} ';     local -i workbench_last_epoch=$(gdate --utc +%s);     local -- workbench_day=$(gdate +"${workbench_strftime_fs_day}" --date=@${workbench_last_epoch});     local -- workbench_fs_timestamp=$(gdate +"${workbench_strftime_fs_timestamp}" --date=@${workbench_last_epoch});     local -- workbench_root="$HOME/workbench";     local -- workbench_path="${workbench_root}/${workbench_day}";     local -- workbench_logs_safe_path="${workbench_root}/logs/${workbench_day}";     local -- workbench_logs="${workbench_path}/logs";     local -- workbench_stderr="${workbench_logs}/stderr.log";     local -- workbench_stdout="${workbench_logs}/stdout.log";     local -a hash_material=("${BASH_LINENO[@]}" "${#BASH_LINENO[@]}" "\${$}=${$}" "\${!}=${!}" "\${PWD}=${PWD@Q}");     export IFS='
';     local -- hl_reset='\x1b[0m';     local -- hl_outer_at='\x1b[1;38;2;52;101;164m';     local -- hl_inner_at='\x1b[1;38;2;114;159;207m';     local -- hl_outer_star='\x1b[1;38;2;78;154;6m';     local -- hl_inner_star='\x1b[1;38;2;138;226;52m';     local -- hl_tag_star_open="${hl_outer_star}<\${hash_material[*]}>${hl_reset}";     local -- hl_content_star="${hl_inner_star}${hash_material[*]}${hl_reset}";     local -- hl_tag_star_close="${hl_outer_star}</\${hash_material[*]}>${hl_reset}";     local -a hl_star_lines=("$(echo -en "${hl_tag_star_open}")" "$(echo -en "${hl_content_star}")" "$(echo -en "${hl_tag_star_close}")");     echo -e "${hl_star_lines[*]}";     local -- history_with_context="$(history_with_context)";     local -- commit_subject="save state $(nowdz)\n";     local -- commit_body="$(echo -e \"$(git status | grep -E -v '(^On\s+branch\s+|.*[(]\s*use.*git(\s*(add|push)).*)' | sed -E 's/^([[:space:]]{1,})([^[:space:]]+.*)$/    \2/g')\n\")";     local -- commit_message="$(echo -e \"${commit_subject}\n${commit_body}\n\n\")";     echo -e "\${commit_subject}=${commit_subject}";     echo -e "\${commit_body}=${commit_body}";     echo -e "\${commit_message}=${commit_message}";     unset PS4; }
#1772113487
# </function>
#1772113487
# <function name="env_keys">
#1772113487
env_keys () {     env | sed -n -E 's/^([A-Z_]+[A-Z0-9_]+)=(.*)$/\n\1\n/gp' | sort -u | sed -E '/^\s*$/d'; }
#1772113487
# </function>
#1772113487
# <function name="env_var_names">
#1772113487
env_var_names () {     env_keys; }
#1772113487
# </function>
#1772113487
# <function name="error">
#1772113487
error () {     eval "${ui_msgfunc_ctx}";     error_prefixed "[error] [${script_name}:${linenum}]" "${@}"; }
#1772113487
# </function>
#1772113487
# <function name="error_prefixed">
#1772113487
error_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${error_prefix_color_rgb}m${prefix}\x1b[1;38;2;${error_color_rgb}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="gawk_prettify_stdin">
#1772113487
gawk_prettify_stdin () {     if [ -t 0 ]; then         echo -e "[${FUNCNAME[0]} error]" "stdin is a tty" 1>&2;         return 1;     fi;     local -- pretty_printed_output="";     local -i code=0;     local -- original_input="$(cat < /dev/stdin)";
    if ! pretty_printed_output="$(gawk -f - -o- <<< "${original_input}")"; then         code=$?;     fi;     local -r pipeline='s/[\n[:space:]]+/ /g;s/(\n\s+|\s+\n)//g;s/[{]\s+[}]/{}/g;h;p';
    local -- minified_input=$(sed -E "${pipeline}" <<< "${original_input}");
    local -- minified_output=$(sed -E "${pipeline}" <<< "${pretty_printed_output}");     local -i unix_ts=$(date --utc +'%s');     local -- batch_id=$(date +'%Y-%m-%d.%H-%M-%S.%s' --date=@${unix_ts});     local -- tmp_workdir="$(mktemp -d)";     local -- tmp_original_input_file="${tmp_workdir}/original_input.${batch_id}.awk";     local -- tmp_original_output_file="${tmp_workdir}/original_output.${batch_id}.awk";     local -- tmp_minified_input_file="${tmp_workdir}/minified_input.${batch_id}.awk";     local -- tmp_minified_output_file="${tmp_workdir}/minified_output.${batch_id}.awk";     echo "${original_input}" > ${tmp_original_input_file};     echo "${pretty_printed_output}" > ${tmp_original_output_file};     echo "${minified_input}" > ${tmp_minified_input_file};     echo "${minified_output}" > ${tmp_minified_output_file};     local -i diff_exit_code=0;     local -- diff_output="";     if ! diff_output=$(diff -u "${minified_input}" "${minified_output}"); then         diff_exit_code=$?;     fi;     echo "${pretty_printed_output}";     if [ ${diff_exit_code} -ne 0 ] || [ "${diff_output}" -gt 0 ]; then         echo -e "[important]" "naive check of the resulting prettified code has found a differences that you might like to be aware of. could be nothing important but that's up for you to decide." 1>&2;         diff -u --colorv "${minified_input}" "${minified_output}";     fi;     return ${code}; }
#1772113487
# </function>
#1772113487
# <function name="gc3">
#1772113487
gc3 () {     . ~/opt/lib/ansi.sh;     set +ue;     export IFS='
';     repo="";     local -a argv=($@);     local -- argc=$((${#argv} + 0));     local -a git_argv=();     repo_url="";     default_target_path="$HOME/projects/third_party";     target_path="$default_target_path";     local -- argv_array_items="$(echo -n "${argv[@]}" | tr '[:space:]' ',')";     for idx in ${!argv[@]};     do         nidx=$(($idx + 1));         arg=${argv[$idx]};         next_arg=${argv[$nidx]};         if [ -n "${next_arg}" ] && printf "%d" "${next_arg}" > /dev/random 2> /dev/random; then             next_arg_num=$(("${next_arg}"));         fi;         case "$arg" in             "--help" | "help")                 echo -e 'NAME
    gc3 - git-clones third-party

SYNOPSIS
    gc3 [-d|--depth] [-b|--backup] [-n|--namespace] <URL>

DESCRIPTION

    shallow clones git repository inside of ~/projects/third_party and
    automatically tries to build the project, run tests, code examples
    and/or open the documentation of the project in the target git
    repository.

    (currently supports rust, nodejs and golang projects and works best in rust projects)

    Options:

      -n, --namespace
          places the git repository inside of `$HOME/projects/third_party/<REPOSITORY OWNER>/<REPOSITORY NAME>\x27
          instead of the default ($HOME/projects/third_party/<REPOSITORY NAME>)

      -d, --depth <NUMBER>
          if this option is provided, the <NUMBER> value must be
          an unsigned, non-zero number which is then forwarded to the corresponding `--depth\x27 option in the
          underlying git command (.i.e.: `git clone --depth <GIT_REMOTE_URL>\x27)

          Default value: 1

      -b, --backup
          by default gc3 skips cloning a git repository if the target
          path in the filesystem already exists, however, if this
          option is specified then an existing target path is
          backed-up and a new copy of the target repo is cloned there.
';                 return 0;             ;;             "-d" | "--depth")                 if [ -n "${next_arg_num}" ]; then                     depth=$next_arg_num;                 else                     error_function "missing numeric value of --depth argument on position ${nidx} of [${argv_array_items}]";                     return 1;                 fi;                 git_argv+=("--depth" "${depth}");             ;;             "-b" | "--backup")                 backup="true";             ;;             "-n" | "--namespace")                 if [ -z "$target_path" ] || [ "${target_path}" == "${default_target_path}" ] || [ -e "$target_path" ]; then                     target_path="${default_target_path}/${owner_name}";                 else                     error_function "target_path already set to: ${target_path}";                     return 1;                 fi;             ;;             *)                 if grep '^\(https\?\|git\)\(://\|@\)\([^/]\+\)\(.*\)\([.]git\)\?$' 2> /dev/random > /dev/random <<< "${arg}"; then                     if [ -z "$repo" ]; then                         repo="$arg";                         repo_url="$arg";                     else                         error_function "repo already set to: ${repo@Q}";                         return 1;                     fi;                 else                     bar_text_left 231 196 "${arg@Q} does not seem to be a git repo address" 1>&2;                     return 1;                 fi;             ;;         esac;     done;     if [ -z "$repo" ]; then         clipboard="$(pbpaste)";
        if grep '^\(https\?\|git\)\(://\|@\)\([^:/]\+\)\(.*\)\([.]git\)\?$' 2> /dev/random > /dev/random <<< "${clipboard}"; then             repo="${clipboard}";         fi;     fi;     if [ -z "$repo" ]; then         bar_text_left 231 196 "ERROR: missing git repo url";         return 1;     fi;
    repo="$(sed 's/git@\([^:]\+\):/https:\/\/\1\//g' <<< "${repo}")";
    repo="$(sed 's/\(^"\+\|"\+$\)//g' <<< "${repo}")";
    repo="$(sed "s/\(^'\+\|'\+$\)//g" <<< "${repo}")";
    gits="$(sed 's/^\(\(https\?:\/\/\|git@\|git:\/\/\)[^[:space:]]\+\([.]git\)\?\)$/gitrepo/g' <<< "$repo")";
    if grep "https://crates.io/crates/" 2> /dev/random > /dev/random <<< "${repo}"; then         crate_name=$(echo "$repo" | sed 's/^\s*https:\/\/crates[.]io\/crates\/\+\([^\/?]\+\).*/\1/g');         bar_text_left 82 16 "crate name: ${crate_name}";         if ! repo=$(crates_io_get_git_repo_url "${crate_name}"); then             bar_text_left 231 196 "ERROR: failed to fetch json from ${crates_api_url}";             return 1;         fi;     else
        if grep "https://docs[.]rs/[a-z_-]\+" 2> /dev/random > /dev/random <<< "${repo}"; then             crate_name=$(echo "$repo" | sed 's/^\s*https:\/\/docs[.]rs\/\+\([^\/?]\+\).*/\1/g');             bar_text_left 82 16 "crate name: ${crate_name}";             if ! repo=$(crates_io_get_git_repo_url "${crate_name}"); then                 bar_text_left 231 196 "ERROR: failed to fetch json from ${crates_api_url}";                 return 1;             fi;         fi;     fi;
    if grep '[a-z0-9_+-]\+@' > /dev/random 2> /dev/random <<< "${repo}"; then         repo="$(echo -n "$repo" | tr -d '[:space:]' | sed 's/\/\?\([.]git\)\?$//g' | sed 's/\(https:\/\/[^?]\+\)[?].*$/\1/g' | sed 's/git@[^:]\+://g')";     else         repo="$(echo -n "$repo" | tr -d '[:space:]' | sed 's/\/\?\([.]git\)\?$//g' | sed 's/\(https:\/\/[^?]\+\)[?].*$/\1/g')";     fi;
    owner_name="$(sed 's/^\(https:\/\/\|git:\/\/\|git@\)[^\/:]\+:\?\/\([^\/]\+\)\/\([^\/]\+\)/\2/g' <<< ${repo})";
    repo_name="$(sed 's/^\(https:\/\/\|git:\/\/\|git@\)[^\/:]\+:\?\/\([^\/]\+\)\/\([^\/]\+\)/\3/g' <<< ${repo})";     if [ ${#git_argv} -eq 0 ]; then         git_argv+=("--depth" "1");     fi;     if [ -z "${repo_name}" ]; then         bar_text_left 231 196 "ERROR: could not determine repo name from url: ${repo@Q}";         return 1;     fi;     if [ -z "${owner_name}" ]; then         bar_text_left 231 196 "ERROR: could not determine owner name from url: ${repo@Q}";         return 1;     fi;     if [ "$gits" != "gitrepo" ]; then         bar_text_left 231 196 "ERROR: invalid git repo url: ${repo_url@Q}";         return 1;     fi;     tput clear;     mkdir -p "$target_path";     target_repo_path="${target_path}/$repo_name";     if [ -e "$target_repo_path" ]; then         if [ "${backup}" == "true" ]; then             mv "$target_repo_path" "$target_path/${repo_name}-$(t16g)";         else             bar_text_center 101 16 "into existing ${target_repo_display}";         fi;     else         bar_text_center 121 16 "cloning ${repo_name} to \x1b[1;38;5;233m${target_repo_path}";         git clone "${repo}.git" ${git_argv[@]} "$target_repo_path";     fi;     cd "$target_repo_path";     ls -latrh;     if [ -f ".gitmodules" ]; then         git submodule init;         git submodule update;     fi;     if [ -f "Cargo.toml" ]; then         if [ -f "rust-toolchain.toml" ]; then             sed 's/channel\s*=\s*"[^"]\+"/channel = "nightly-2025-09-09"/g' -i rust-toolchain.toml;         fi;         if [ -d "examples" ]; then             varname="${repo_name//-/_}_path";             varname="${varname@L}";
            cat > cargo-run-examples.sh <<EOF
#!/usr/bin/env bash

. \$HOME/opt/lib/ansi.sh

ctrlc() {
    echo -e "\r"
    ansi_up
    bar_text_left 196 231 "Cancelled with Control-C"
    reset
    2>/dev/null 1>/dev/null stty sane
    exit 1
}
trap ctrlc int

${varname}="${target_repo_path}"

bar 235
failed=""
for example in \$(2>/dev/null wc -l \${${varname}}/examples/*.rs | sort -n | grep -v 'total\$' | lastcol | xargs-each basename); do
    example=\${example/%.rs/}
    bar_text_left 222 233 "cargo run --example \${example}"
    if ! cargo run --example \${example}; then
        if [ -z "${failed}" ] || [ "${failed}" != "false" ]; then
            rm -rf target
            break
        else
            failed="true"
        fi
    else
        bar_text_left 222 233 "\$(ansi_spaced 233 222 "FINISHED")\$(ansi_spaced 222 233 "cargo run --example \${example}")"
        failed="false"
    fi
done

EOF
              chmod +x cargo-run-examples.sh;             ./cargo-run-examples.sh;         else             if [ -f "src/main.rs" ] || [ $(ack '[[]bin[]]' Cargo.toml | wc -l) -gt 0 ]; then                 bar_text_left 222 233 "cargo run # (${target_repo_path})";                 if ! cargo run; then                     rm -rf target;                 else                     bar_text_left 222 233 "$(ansi_spaced 233 222 "FINISHED")$(ansi_spaced 222 233 "cargo run")";                 fi;             else                 if [ $(ack '[[]workspace[]]' Cargo.toml | wc -l) -gt 0 ]; then                     bar 235;                     failed="";                     for bin_name in $(find . -type f -name Cargo.toml -exec bash -c 'test -f $(dirname {})/src/main.rs && grep "^[[:space:]]*name\s*=\s*" {} | sed "s/^name\s*=\s*\"\([^\"]\+\)\".*/\1/g"' \;);                     do                         bar_text_left 222 233 "cargo run --bin ${bin_name} # (${target_repo_path})";                         if ! cargo run --bin ${bin_name}; then                             if [ -z "${failed}" ] || [ "${failed}" != "false" ]; then                                 rm -rf target;                                 break;                             else                                 failed="true";                             fi;                         else                             bar_text_left 222 233 "$(ansi_spaced 233 222 "FINISHED")$(ansi_spaced 222 233 "cargo run --bin ${bin_name}")";                             failed="false";                         fi;                     done;                 else                     bar_text_center 154 235 "running cargo cbt";                     cargo cbt;                 fi;             fi;         fi;         if web_browser_is_open; then             cargo doc --open;         else             cargo doc;         fi;     fi;     if [ -f "package.json" ]; then         bar_text_left 154 235 'package.json detected';         node_run_command=(npm run);         if [ -f "package-lock.json" ]; then             npm i;             node_run_command=(npm run);         else             if [ -f "yarn-lock.json" ]; then                 yarn;                 node_run_command=(yarn);             else                 if [ -f "pnpm-lock.json" ]; then                     pnpm i;                     node_run_command=(pnpm);                 fi;             fi;         fi;         local -a script_names=($(jq '.scripts | keys[]' package.json | ansistrip | tr -d '"'));         local -a autorun_build=();         local -a autorun_script_names=();         if [ ${#script_names[@]} -gt 0 ]; then             echo -e "\x1b[1;38;5;159mpackage.json scripts\x1b[0m";             fgcolor=159;             for script_name in ${script_names[@]};             do                 case "${script_name}" in                     "build" | "compile")                         autorun_build+=("${script_name}");                         fgcolor=220;                     ;;                     "dev" | "start" | "start:dev" | "dev:start")                         autorun_script_names+=("${script_name}");                         fgcolor=154;                     ;;                     *)                         fgcolor=159;                     ;;                 esac;                 echo -e "    \x1b[1;38;5;${fgcolor}m${node_run_command[@]} ${script_name}\x1b[0m";             done;             for script_name in ${autorun_build[@]};             do                 fgcolor=220;                 echo -e "\x1b[1;38;5;${fgcolor}m${node_run_command[@]} ${script_name}\x1b[0m";                 ${node_run_command[@]} ${script_name};             done;             for script_name in ${autorun_script_names[@]};             do                 fgcolor=154;                 echo -e "\x1b[1;38;5;${fgcolor}m${node_run_command[@]} ${script_name}\x1b[0m";                 ${node_run_command[@]} ${script_name};             done;         fi;     fi;     if [ -f "go.mod" ]; then         go_version=$(go version 2> /dev/random);         go_version=${go_version/#go version go/};         go_version=${go_version/% */};         if [ -n "${go_version}" ]; then             go build .;         fi;     fi; }
#1772113487
# </function>
#1772113487
# <function name="get_caller">
#1772113487
get_caller () {     local -a gc_argv=($@);     local -i gc_argc=${#gc_argv[@]};     local -- raw_printf_format="";     local -- printf_format="";     local -- raw_caller_index="";     if [ ${gc_argc} -eq 0 ]; then         echo -e "[${FUNCNAME[0]}]" "missing argument <CALLER_INDEX>" 1>&2;         return 1;     fi;     local -- raw_caller_index="${gc_argv[@]:0:1}";     raw_printf_format="${gc_argv[@]:1}";     printf_format="${raw_printf_format}";     if [[ ! "${raw_caller_index}" =~ ^[-]?[0-9]+$ ]]; then         echo -e "[${FUNCNAME[0]}]" "argument <CALLER_INDEX> got invalid non-integer value: ${raw_caller_index@Q}" 1>&2;         return 1;     fi;     local -i caller_index=$((raw_caller_index + 1));     local -- caller_function_name="";     local -- caller_line_number="";     current_caller_frame=();     current_caller_info=();     if [[ -v LINENO[$caller_index] ]]; then         caller_line_number="${LINENO[$caller_index]}";         current_caller_frame+=("${caller_line_number}");         current_caller_info["line"]="${caller_line_number}";         current_caller_info["lineno"]="${caller_line_number}";         current_caller_info["line_number"]="${caller_line_number}";     fi;     if [[ -v FUNCNAME[$caller_index] ]]; then         caller_function_name="${FUNCNAME[$caller_index]}";         current_caller_frame+=("${caller_function_name}");         current_caller_info["function"]="${caller_function_name}";         current_caller_info["function_name"]="${caller_function_name}";         current_caller_info["name"]="${caller_function_name}";         current_caller_info["type"]="function";     else         current_caller_info["name"]="${BASH_SOURCE[0]}";         current_caller_info["function"]="body of ${BASH_SOURCE[0]}";         current_caller_info["function_name"]="body of ${BASH_SOURCE[0]}";         current_caller_info["type"]="shell";     fi;     if [ -n "${printf_format}" ]; then         local -- key="";         local -- value="";         local -- raw_value="";         local -- regex="";         for key in ${!current_caller_info[@]};         do             regex="[\x24\x25][{]${key}[}]";             raw_value="${current_caller_info[${key}]}";             value="${raw_value//\//\\\/}";             local -- ctx="key=${key@Q} raw_value=${raw_value@Q} value=${value@Q}";             echo -e "\r\x1b[0m\n\x1b[1;38;5;247m" 1>&2;             echo "ctx=${ctx}" 1>&2;             echo -e "\n" 1>&2;             echo "before \${printf_format}=${printf_format@Q}" 1>&2;
            printf_format="$(sed -E "s/${regex}/${value}/g" <<< "${printf_format}")";             echo -e "\n" 1>&2;             echo "after \${printf_format}=${printf_format@Q}" 1>&2;         done;         echo "${printf_format}";     fi;     echo -e "\r\x1b[0m\n\x1b[1;38;5;220m<\${current_caller_info[@]}>\x1b[0m" 1>&2;     value="${current_caller_info[@]@A}";     printf '\x1b[0m\x1b[1;38;5;233m\x1b[1;48;5;220m%-*s\x1b[0m\n' "${COLUMNS}" "${value}" 1>&2;     for key in ${!current_caller_info[@]};     do         value="${current_caller_info[${key}]}";         printf '\x1b[0m\x1b[1;38;5;233m\x1b[1;48;5;220m%s=%-*s\x1b[0m\n' "${key}" "${COLUMNS}" "${value}" 1>&2;     done;     echo -e "\r\x1b[0m\x1b[1;38;5;220m</\${current_caller_info[@]}>\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="get_callers">
#1772113487
get_callers () {     local -i count=${#LINENO[@]};     if [ ${count} -gt 0 ]; then         local -i last=$((count - 1));         local -i index=0;         for index in $(seq -1 ${last} | sort -nr);         do             get_caller "${index}";         done;         return 0;     fi;     return 1; }
#1772113487
# </function>
#1772113487
# <function name="get_error_code">
#1772113487
get_error_code () {     local -- label="$@";     if [[ -v workbench_error_label_to_code_mapping["${label}"] ]]; then         local -- code=${workbench_error_label_to_code_mapping["${label}"]};         if [ -z "${code}" ]; then             echo "[${FUNCNAME[0]} internal error]" "failed to obtain error code of label: ${label@Q} is not a valid number: ${code@Q}" 1>&2;             return 2;         else             if [[ ! "${code}" =~ ^[0-9]+$ ]]; then                 echo "[${FUNCNAME[0]} internal error]" "failed to obtain error code of label: ${label@Q} is not a valid number: ${code@Q}" 1>&2;                 return 2;             fi;         fi;     else         echo "[${FUNCNAME[0]} internal error]" "no code found for label ${label@Q}: it appears that there is either a typo in the given label or there is no numeric code corresponding to the label" 1>&2;         return 404;     fi; }
#1772113487
# </function>
#1772113487
# <function name="get_prog_type">
#1772113487
get_prog_type () {     unset IFS;     local -- progname="$1";     if [ -z "${progname}" ]; then         echo -e "[progtype] missing argument <PROGNAME>" 1>&2;         return 1;     fi;     local -- regex_not='[^]a-z0-9!*%^@[-]';     local -- regex_yes='[]a-z0-9!*%^@[-]';     local -- sed_regex="(${regex_yes}*)(${regex_not}+)(${regex_yes}*)";     local -- sed_repl='\1\x1b[1;38;5;196m\2\x1b[0m\3';
    local -a invalid_chars=($(sed -n -E "s/${sed_regex}/\2/gp" <<< "${progname}"));
    local -- printout="$(sed -n -E "s/${sed_regex}/${sed_repl}/gp" <<< "${progname}")";     if [ ${#invalid_chars[@]} -gt 0 ]; then         echo -e "[progtype] invalid chars in progname ${printout}" 1>&2;         return 1;     fi;     if [ -n "$(alias | cut -d= -f1 | grep -E "^${progname}\$")" ]; then         echo "alias";         return;     fi;     local -- functionname="";
    if functionname=$(sed -n -E 's/^(declare\s+[-]f\s+)(.+)$/\x1b[1;38;5;237m\1\x1b[0m\2/gp' <<< "${progname}"); then         echo "function";         return;     fi;     if progpath=$(which "${progname}"); then         echo "executable";         return;     fi;     echo -e "[progtype] cannot determine type of ${progname}" 1>&2;     return 1; }
#1772113487
# </function>
#1772113487
# <function name="get_shell_opt_flags">
#1772113487
get_shell_opt_flags () {     export IFS='
';     local -- shell_opts_flags="";     local -- flags="${-}";     local -a shell_opts_flags=();
    shell_opts_flags=($(sed -E 's/([a-zA-Z])/\n\1\n/g' <<< "${-}"));     echo "";     printf 'set -%s;\n' ${shell_opts_flags[@]};     echo ""; }
#1772113487
# </function>
#1772113487
# <function name="get_shellopts_names">
#1772113487
get_shellopts_names () {     export IFS=':';     local -a shell_opts_names=();     local -- name='';     for name in ${SHELLOPTS};     do         shell_opts_names+=("${name}");     done;     export IFS='
';     echo "";     printf 'set -o %s;\n' ${shell_opts_names[@]};     echo ""; }
#1772113487
# </function>
#1772113487
# <function name="get_shopt_disabled">
#1772113487
get_shopt_disabled () {     export IFS='
';     local -a shopt_names_disabled=($(shopt -s | awk '{ print $1 }'));     echo "";     printf 'shopt -u %s;\n' ${shopt_names_disabled[@]};     echo ""; }
#1772113487
# </function>
#1772113487
# <function name="get_shopt_enabled">
#1772113487
get_shopt_enabled () {     export IFS='
';     local -a shopt_names_enabled=($(shopt -s | awk '{ print $1 }'));     echo "";     printf 'shopt -s %s;\n' ${shopt_names_enabled[@]};     echo ""; }
#1772113487
# </function>
#1772113487
# <function name="git_clone_godot_oss_repos">
#1772113487
git_clone_godot_oss_repos () {     local -- input="$@";     if [ -z "${input}" ]; then         input="$(pbpaste)";     fi;     if [ -z "${input}" ] && [ ! -t 0 ]; then         local -a stdin_lines=();         export IFS='
';         while read line; do             if ! stdin_lines+=("$line"); then                 continue;             fi;         done < /dev/stdin;         input="$(echo "${stdin_lines[*]}")";     fi;     if [ -z "${input}" ]; then         echo -e "[${FUNCNAME[0]} error]" "missing urls via argv, clipboard or stdin" 1>&2;         return 1;     fi;     local -A repos_to_clone=();     local -a urls_to_clone=();     local -a urls=($(printf '%s\n' "${input}" | grep -E "https://"));     local -a github_urls=($(printf '%s\n' "${urls[@]}" | grep -E "github[.]com"));     local -- gh_repo_owner='';     local -- gh_repo_name='';     local -a godot_games_oss_repos=();     local -- godot_github_examples_path="$HOME/godot/github_examples";     local -- clone_url="";     local -- clone_path="";     godot_games_oss_repos=($(printf '%s\n' "${github_urls[@]}" | grep -E -v 'github[.]com/topics' | grep -i -E "github[.]com/[a-z0-9_-]+/[a-z0-9_-]+"));     mkdir -p "${godot_github_examples_path}";     for url in ${godot_games_oss_repos[@]};     do         local -- regexp='^.*github[.]com/([^/]+)/([^/]+)([/]?([.]git)?)?$';
        gh_repo_owner=$(sed -n -E "s,${regexp},\1,gp" <<< "${url}");
        gh_repo_name=$(sed -n -E "s,${regexp},\2,gp" <<< "${url}");         if [ -z "${gh_repo_owner}" ]; then             echo -e "[${FUNCNAME[0]} warning]" "could not parse gh_repo_owner from url ${url@Q}" 1>&2;             continue;         fi;         if [ -z "${gh_repo_name}" ]; then             echo -e "[${FUNCNAME[0]} warning]" "could not parse gh_repo_name from url ${url@Q}" 1>&2;             continue;         fi;         local -- clone_dirname="${gh_repo_owner}__${gh_repo_name}";         if [[ ! "${clone_dirname}" =~ ^([a-zA-Z0-9_-]+)__([a-zA-Z0-9_-]+)$ ]]; then             echo -e "[${FUNCNAME[0]} warning]" "could not parse determine clone_dirname from url ${url@Q}: ${clone_dirname@Q}" 1>&2;             continue;         fi;         local -- clone_url="https://github.com/${gh_repo_owner}/${gh_repo_name}.git";         local -- clone_path="${godot_github_examples_path}/${gh_repo_owner}__${gh_repo_name}";         if [[ ! -v repos_to_clone["${clone_url}"] ]]; then             repos_to_clone["${clone_url}"]="${clone_path}";             urls_to_clone+=("${clone_url}");         fi;     done;     local -i index=0;     local -i total=${#repos_to_clone[@]};     local -- pos="";     local -- action="";     local -- remote="";     local -- branch="";     for index in ${!urls_to_clone[@]};     do         remote="origin";         branch="";         clone_url=${urls_to_clone[$index]};         clone_path=${repos_to_clone[${clone_url}]};         pos="$(printf '%-*s of %s' ${#total} $((index + 1)) ${total})";         if [ -d "${clone_path}/.git" ] && branch=$(cd "${clone_path}" && git branch | sed -n -E 's/[*]\s+([a-zA-Z0-9_-]+[^[:space:]]*)/\1/g; t success q1; :success p'); then             action="updating existing clone";         else             action="cloning";         fi;         echo -e "${action} from ${clone_url} in ${clone_path}" 1>&2;         if [ "${action}" == "cloning" ]; then             git clone --depth=1 "${clone_url}" "${clone_path}";         else             ( cd "${clone_path}" && git pull --rebase "${remote}" "${branch}" );         fi;     done; }
#1772113487
# </function>
#1772113487
# <function name="gitdebugrevparse">
#1772113487
gitdebugrevparse () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -- prefix_result_string='';     local -- top_level_result_string='';     local -- final_result_string="";     local -- here=$(pwd);     local -a top_level_command=(git rev-parse '--show-toplevel');     local -a prefix_command=(git rev-parse '--show-prefix');     local -A final=();     if ! top_level_result_string="$(${top_level_command[@]})"; then         echo -e "[${FUNCNAME[0]} error]" "not under a git repo: ${here@Q}" 1>&2;         return 404;     else         final["${top_level_command[@]}"]="${top_level_result_string}";     fi;     prefix_result_string="$(${prefix_command[@]})";     final["${prefix_command[@]}"]="${prefix_result_string}";     final["${final_command[@]}"]="${final_result_string}";     local -a base_final_command=(git rev-parse '--prefix' "${prefix_result_string}");     local -a final_command=(${base_final_command[@]});     if (($argc)); then         final_command+=('--' ${argv[@]});     fi;     final_result_string="$(${final_command[@]})";     ( cd "${git_root}" && echo "${final_result_string}" ); }
#1772113487
# </function>
#1772113487
# <function name="green_prefixed">
#1772113487
green_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_green}m${prefix}\x1b[1;38;2;${color_medium_green}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="hist_regexp_for_entry_ids">
#1772113487
# </function>
#1772113487
# <function name="history_clear_and_disable">
#1772113487
# </function>
#1772113487
# <function name="history_enable_and_read">
#1772113487
# </function>
#1772113487
# <function name="history_entries">
#1772113487
# </function>
#1772113487
# <function name="history_entry_ids">
#1772113487
# </function>
#1772113487
# <function name="history_length">
#1772113487
# </function>
#1772113487
# <function name="history_show">
#1772113487
# </function>
#1772113487
# <function name="history_with_context">
#1772113487
# </function>
#1772113487
# <function name="inactive_prefixed">
#1772113487
inactive_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_inactive}m${prefix}\x1b[1;38;2;${color_medium_inactive}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="info">
#1772113487
info () {     eval "${ui_msgfunc_ctx}";     info_prefixed "[info]" "${@}"; }
#1772113487
# </function>
#1772113487
# <function name="info_prefixed">
#1772113487
info_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${info_prefix_color_rgb}m${prefix}\x1b[1;38;2;${info_color_rgb}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="initialize_shell_d_core_global_vars">
#1772113487
initialize_shell_d_core_global_vars () {     if [[ ! -v shell_d_entrypoint_source_path_relative ]]; then         echo -e "[shell.d entrypoint error]" "core global variable undefined: shell_d_entrypoint_source_path_relative " 1>&2;         return 1;     fi;     declare -gr shell_d_entrypoint_source_directory_path="$(cd "$(dirname "${shelL_d_entrypoint_source_path_relative}")" && pwd)";     declare -gr shell_d_entrypoint_source_filename="$(basename "${shell_d_entrypoint_source_path_relative}")";     declare -r actual_shell_d_path="${shelL_d_entrypoint_source_directory_path}";     declare -r actual_x_d_path="${actual_shell_d_path}/x.d";     if [ "${actual_shell_d_path}" != "${default_shell_d_path}" ]; then         echo -e "[shell.d entrypoint error]" "actual_shell_d_path different than default_shell_d_path: ${actual_shell_d_path@Q} != ${default_shell_d_path@Q}" 1>&2;         return 1;     fi;     if [ "${actual_x_d_path}" != "${default_x_d_path}" ]; then         echo -e "[shell.d entrypoint error]" "actual_x_d_path different than default_x_d_path: ${actual_x_d_path@Q} != ${default_x_d_path@Q}" 1>&2;         return 1;     fi;     if ! "$(cd "${entrypoint_dirname}" && pwd)"; then         SHELL_D_PATH="${HOME}/.shell.d";     fi;     local -- X_D_PATH="${SHELL_D_PATH}/x.d"; }
#1772113487
# </function>
#1772113487
# <function name="k">
#1772113487
k () {     if [ -n "$*" ]; then         echo "unexpected arguments: \"$*\"" 1>&2;         return 1;     fi;     echo -e '\x1b[0m\x1b]1337;ClearCapturedOutput\a\x1b]1337;ClearScrollback\a\x1b[0m';     tput clear;     echo -e "\x1b[2J\x1b[3J\x1b[H";     reset;     export PS1_VARIANT=""; }
#1772113487
# </function>
#1772113487
# <function name="l">
#1772113487
l () {     local -- arg="${arg}";     if [ -z "${arg}" ]; then         l ~/.shell.d/0000101-functions.sh;     else         if [ ! -e "${arg}" ]; then             case "${arg}" in                 "f" | "-f")                     l ~/.shell.d/0000101-functions.sh;                 ;;                 "e" | "-e")                     l ~/.shell.d/0000110-env.sh;                 ;;                 "h" | "-h")                     l ~/.shell.d/x.d/history.sh;                 ;;                 "ansi")                     l ~/opt/lib/ansi.sh;                 ;;                 "a" | "-a")                     l ~/.shell.d/entrypoint.sh;                 ;;                 "c" | "-c" | "--completions" | "--autocomplete" | "--auto-complete" | "--complete")                     l ~/opt/lib/completions.sh;                 ;;                 "t" | "-t" | "--tools" | "tools")                     l ~/opt/lib/tools.sh;                 ;;                 *)                     cat 1>&2 <<EOF
USAGE: ${FUNCNAME[0]} [path] | [FLAG]
EOF
                  ;;             esac;         fi;     fi; }
#1772113487
# </function>
#1772113487
# <function name="last_job_pid">
#1772113487
last_job_pid () {     local -i pid=-1;     pid="${!}";     if [ ${pid} -gt 0 ]; then         printf '$!=%s' ${pid};     fi; }
#1772113487
# </function>
#1772113487
# <function name="list_nvm_managed_node_versions">
#1772113487
list_nvm_managed_node_versions () {     ls --color -l $HOME/.nvm/versions/node 2> /dev/random | ansistrip | lastcol | sort -r -n; }
#1772113487
# </function>
#1772113487
# <function name="local_var_declarations">
#1772113487
local_var_declarations () {     local -p | sed -E "s/${shell_script_var_declaration_regexp}/\1/g"; }
#1772113487
# </function>
#1772113487
# <function name="mute_shell_command">
#1772113487
mute_shell_command () {     local -a msc_argv=($@);     local -i msc_argc=${!msc_argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     if [ ${msc_argc} -eq 0 ]; then         echo -e "[${BASH_SOURCE[0]}:${BASH_LINENO[0]}]" "missing arguments" 1>&2;         exit 1;     fi;     for index in ${!msc_argv[@]};     do         current=$(($index + 1));         arg="${msc_argv[$index]}";         case "${arg}" in             -h | --help)                 echo -e "HELP" 1>&2;             ;;             *)             ;;         esac;     done;
    grep -E '^\s*[0-9]+\s*$' <<< "${arg}"; }
#1772113487
# </function>
#1772113487
# <function name="n">
#1772113487
n () {     export RUSTFLAGS="-C opt-level=3 -g -Zmacro-backtrace";     if [ ! -f Cargo.toml ]; then         return 1;     fi;     k;     cargo n $*; }
#1772113487
# </function>
#1772113487
# <function name="notes">
#1772113487
notes () {     cd $NOTES_ROOT; }
#1772113487
# </function>
#1772113487
# <function name="orange_prefixed">
#1772113487
orange_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_orange}m${prefix}\x1b[1;38;2;${color_medium_orange}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="ord_num">
#1772113487
ord_num () {     local -i number=$(($1));     local -i abs=${number#-};     local -i last_two=$((${abs} % 100));     local -i last_digit=$((${abs} % 10));     case "${last_two}" in         11 | 12 | 13)             echo "th";             return;         ;;     esac;     case "${last_digit}" in         1)             echo "st";             return;         ;;         2)             echo "nd";             return;         ;;         3)             echo "rd";             return;         ;;         *)             echo "th";             return;         ;;     esac; }
#1772113487
# </function>
#1772113487
# <function name="ordinal">
#1772113487
ordinal () {     unset IFS;     local -a ord_argv=($@);     local -i ord_argc=${!ord_argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -a numbers=();     local -- ord="";     if [ ${ord_argc} -eq 0 ]; then         echo -e "[${FUNCNAME[0]}:${LINENO[0]}]" "missing arguments" 1>&2;         exit 1;     fi;     for index in ${!ord_argv[@]};     do         current=$(($index + 1));         arg="${ord_argv[$index]}";
        if grep -E '^\s*[0-9]+\s*$' > /dev/random 2> /dev/random <<< "${arg}"; then             numbers+=("${arg}");         fi;     done;     for no in ${numbers[@]};     do         ord=$(ord_num $no);         printf '%d%s\n' "${no}" "${ord}";     done; }
#1772113487
# </function>
#1772113487
# <function name="overwrite_static_state_path">
#1772113487
overwrite_static_state_path () {     bash_static_state > "${bash_static_state_path}"; }
#1772113487
# </function>
#1772113487
# <function name="plum_prefixed">
#1772113487
plum_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_plum}m${prefix}\x1b[1;38;2;${color_medium_plum}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="previous_command_exit_code">
#1772113487
previous_command_exit_code () {     local -i exit_code=-1;     exit_code="${?}";     if [ ${exit_code} -ge 0 ]; then         printf '$?=%s' ${exit_code};     fi; }
#1772113487
# </function>
#1772113487
# <function name="ps1_prefix">
#1772113487
ps1_prefix () {     local -a parts=($(last_job_pid) $(previous_command_exit_code));     printf '%s ' "[${parts[@]}]"; }
#1772113487
# </function>
#1772113487
# <function name="purple_prefixed">
#1772113487
purple_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_purple}m${prefix}\x1b[1;38;2;${color_medium_purple}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="q">
#1772113487
q () {     if [ ! -f Cargo.toml ]; then         return 1;     fi;     k;     cargo q $*; }
#1772113487
# </function>
#1772113487
# <function name="r">
#1772113487
r () {     if [ ! -f Cargo.toml ]; then         return 1;     fi;     k;     unset RUSTFLAGS;     cargo r $*; }
#1772113487
# </function>
#1772113487
# <function name="raw_bin_bash">
#1772113487
raw_bin_bash () {     bash -c "$(printf '%s;\n' ${argv[@]} | sed -E 's/(^\s*(\s*[;]+\s*)+\s*$)//g' | sed -E 's/(^\s+|\s+$)//g')"; }
#1772113487
# </function>
#1772113487
# <function name="repl">
#1772113487
repl () {     local -a stty_args=();     case "$1" in         -*no*stdin | no*stdin | -*no*echo | no*echo | capture)             args+=('-echo');         ;;         *)             args+=('sane');         ;;     esac;     stty ${stty_args[@]} 2> /dev/random > /dev/random || true; }
#1772113487
# </function>
#1772113487
# <function name="reverse_indexed_array_by_ifs_fields">
#1772113487
reverse_indexed_array_by_ifs_fields () {     local -a array=($@);     local -i length=${#array[@]};     if [ ${length} -eq 0 ]; then         return;     fi;     local -i rev_index=0;     local -i index=0;     local -- item="";     for rev_index in ${!array[@]};     do         local -i index=$((${length} - ${rev_index}));         local -- item=${array[$index]};         echo "${item}";     done; }
#1772113487
# </function>
#1772113487
# <function name="reverse_indexed_array_by_reference">
#1772113487
reverse_indexed_array_by_reference () {     local -- array_name="$1";     if [ -z "${array_name}" ]; then         return;     fi;     local -I -n array="${array_name}";     local -i length=${#array[@]};     if [ ${length} -eq 0 ]; then         return;     fi;     local -i rev_index=0;     local -i index=0;     local -- item="";     for rev_index in ${!array[@]};     do         local -i index=$((${length} - ${rev_index}));         local -- item=${array[$index]};         echo "${item}";     done; }
#1772113487
# </function>
#1772113487
# <function name="rf">
#1772113487
rf () {     export RUSTFLAGS="-C opt-level=0 -g -Zmacro-backtrace";     export RUST_BACKTRACE=1; }
#1772113487
# </function>
#1772113487
# <function name="ro">
#1772113487
ro () {     unset RUSTFLAGS;     unset RUST_BACKTRACE; }
#1772113487
# </function>
#1772113487
# <function name="scarlet_red_prefixed">
#1772113487
scarlet_red_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_scarlet_red}m${prefix}\x1b[1;38;2;${color_medium_scarlet_red}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="set_ifs">
#1772113487
set_ifs () {     true; }
#1772113487
# </function>
#1772113487
# <function name="set_key_value_in_history_context">
#1772113487
set_key_value_in_history_context () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -A arg_index_regexes=();     local -A arg_index_name=();     local -A arg_index_values=();     local -A arg_name_values=();     local -- varname_regexp='^([a-zA-Z_]+[a-zA-Z0-9_]+)$';     local -- value_regexp='^(.*)$';     local -- regexp='';     local -- arg_name="";     local -- varname="";     local -- key="";     local -- value="";     arg_index_name[0]="varname";     arg_index_name[1]="key";     arg_index_name[2]="value";     arg_index_regexes["varname"]="${varname_regexp}";     arg_index_regexes["key"]="${varname_regexp}";     arg_index_regexes["value"]="${value_regexp}";     if [ ${argc} -lt 3 ]; then         echo -e "[${FUNCNAME[0]}]" "missing arguments: <VARNAME> <KEY> <VALUE>" 1>&2;         return 1;     fi;     for index in ${!argv[@]};     do         current=$(($index + 1));         arg="${argv[$index]}";         prefix=$(printf '%*s of %s' ${argc} ${current} ${argc});         if [ ${index} -le 3 ]; then             arg_name=${arg_index_name[$index]};             regexp=${arg_index_regexes[$index]};             if [[ "${arg}" =~ ${regexp} ]]; then                 arg_index_values["${index}"]="${arg}";                 arg_name_values["${arg_name}"]="${arg}";             else                 echo -e "[${FUNCNAME[0]} error in argument ${prefix}]" "${arg_name} argument does not match regexp ${regexp@Q}" 1>&2;                 return 1;             fi;         else             echo -e "[${FUNCNAME[0]} error in argument ${prefix}]" "unexpected argument ${arg@Q}" 1>&2;             return 1;         fi;     done;     varname=${arg_name_values['varname']};     key=${arg_name_values['key']};     value=${arg_name_values['value']};     local -- surrogate_map_name="${varname}_map";     local -- surrogate_list_name="${varname}_list";     local -- surrogate_list_type="${surrogate_list_name@a}";     local -- surrogate_map_type="${surrogate_map_name@a}";     if [[ ! -v "${surrogate_list_name[@]}" ]]; then         echo -e "[${FUNCNAME[0]} error]" "varname ${surrogate_list_name@Q} does not exist" 1>&2;         return 1;     else         if [ "${surrogate_list_name@a}" != "a" ]; then             echo -e "[${FUNCNAME[0]} error]" "type variable ${surrogate_list_name@Q} should be indexed array (.i.e.: 'a') but is ${surrogate_list_type@Q} (${surrogate_list_name[@]@A})$" 1>&2;             return 1;         fi;     fi;     if [[ ! -v "${surrogate_map_name[@]}" ]]; then         echo -e "[${FUNCNAME[0]} error]" "varname ${surrogate_map_name@Q} does not exist" 1>&2;         return 1;     else         if [ "${surrogate_map_name@a}" != "A" ]; then             echo -e "[${FUNCNAME[0]} error]" "type variable ${surrogate_map_name@Q} should be indexed array (.i.e.: 'A') but is ${surrogate_map_type@Q} (${surrogate_map_name[@]@A})$" 1>&2;             return 1;         fi;     fi;     local -I -n history_context="${varname}";     history_context["${key}"]="${value}"; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_declare_ui_functions">
#1772113487
shell_d_declare_ui_functions () {     export IFS='
';     local -a color_names=($(builtin declare -p | /opt/homebrew/bin/gawk '$2 ~ /[-][-]/ && $3 ~ /^color_(light|medium|dark)_/ { print gensub(/^color_(light|medium|dark)_([a-z_]+).*/, "\\2", "g", $3) }' | sort -u));     local -- color_name="";     local -i eco=0;     for color_name in ${color_names[@]};     do         local -- code="${color_name}_prefixed() {

    local -- prefix=\"\$1\"
    shift
    local -- message=\"\$@\"
    1>&2 echo -e \"\x1b[1;38;2;\${color_light_${color_name}}m\${prefix}\x1b[1;38;2;\${color_medium_${color_name}}m \${message}\x1b[0m\"

}";         if ! eval "${code}"; then             eco=$?;         fi;     done;     unset IFS; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_fallback_get_canonical_path">
#1772113487
shell_d_fallback_get_canonical_path () {     if [ ${#} -eq 0 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing argument: <RELATIVE_PATH>" 1>&2;         return 1;     else         if [ ${#} -gt 1 ]; then             echo -e "[${FUNCNAME[0]} error]" "too many arguments" 1>&2;             return 1;         fi;     fi;     local -- working_dir=$(pwd);     local -- relative_path="${1}";     local -- relative_dirname="$(dirname "${relative_path}")";     local -- filename="$(basename "${1}")";     shell_d_sh_validate_non_empty_regular_file_argument "relative_path" "${relative_path}";     local -- full_dirname="$(cd "${relative_dirname}" 2> /dev/null > /dev/null && pwd)";     local -- full_path="${full_dirname}/${filename}";     echo "${full_path}" 2>&1; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_fs_get_canonical_path">
#1772113487
shell_d_fs_get_canonical_path () {     if [ ${#} -eq 0 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing argument: <RELATIVE_PATH>" 1>&2;         return 1;     else         if [ ${#} -gt 1 ]; then             echo -e "[${FUNCNAME[0]} error]" "too many arguments" 1>&2;             return 1;         fi;     fi;     local -- relative_path="${1}";     shell_d_sh_validate_non_empty_regular_file_argument "relative_path" "${relative_path}";     if [ -x "${HOME}/.cargo/bin/path" ]; then         ${HOME}/.cargo/bin/path canon "${path}";         return $?;     else         shell_d_fallback_get_canonical_path "${path}";         return $?;     fi; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_load_libs">
#1772113487
shell_d_load_libs () {     export PS4='';     local -a argv=($@);     local -i argc=${#argv[@]};     local -- script_path="${BASH_SOURCE[0]}";     local -- input_script_path="";     if [ ${argc} -eq 1 ]; then         script_path="${argv[0]}";     else         if [ ${argc} -gt 1 ]; then             if [ -s "${argv[@]}" ]; then                 input_script_path="${argv[@]}";             else                 for arg in ${argv[@]};                 do                     if [ -z "${input_script_path}" ] && [ -s "${arg}" ]; then                         input_script_path="${arg}";                     else                         if [ -z "${input_script_path}" ] && [ -e "${arg}" ]; then                             echo -e "[warning]" "ignoring empty script path ${arg@Q}" 1>&2;                         else                             if [ -n "${input_script_path}" ]; then                                 echo -e "[warning]" "ignoring arg ${arg@Q} because input_script_path already set to ${input_script_path@Q}" 1>&2;                             else                                 echo -e "[warning]" "ignoring arg ${arg@Q} because is not an existing path" 1>&2;                             fi;                         fi;                     fi;                 done;                 script_path=$(python3 -c "${shell_d_python_script}" "${input_script_path}");             fi;         fi;     fi;     local -- script_filename="$(basename "${script_path}")";     local -- script_folder="$(dirname "${script_path}")";     local -- script_ui_path="${script_folder}/.${script_filename/%.sh/.ui}";     local -- script_lib_path="${script_folder}/.${script_filename/%.sh/.lib}";     local -a loaded=();     if [ -r "${script_ui_path}" ]; then         builtin source "${script_ui_path}";         loaded+=("${script_ui_path}");     fi;     if [ -r "${script_lib_path}" ]; then         builtin source "${script_lib_path}";         loaded+=("${script_ui_path}");     fi;     export PS4=''; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_sh_check_shell_script">
#1772113487
shell_d_sh_check_shell_script () {     set +x;     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     if [ ${argc} -eq 0 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>" 1>&2;         return 1;     fi;     local -- shell_script_path="${argv[0]}";     shell_d_sh_validate_non_empty_regular_file_argument "shell_script_path" "${shell_script_path}";     shell_script_path=$(shell_d_fs_get_canonical_path "${shell_script_path}");     local -- ps_var="\${BASH_SOURCE[0]}:\${BASH_LINENO[0]} ";     local -a shell_d_shell_d_sh_check_shell_script_lines=('set -mTE; set +f; set -o pipefail;' '' '' '' '' "$(cat "${shell_script_path}")");     shell_d_shell_d_sh_check_shell_script_command="$(printf '%s\n' ${shell_d_shell_d_sh_check_shell_script_lines[@]})";     local -a call_args=("bash" "--noprofile" "--norc" "-s");     local -- logprefix="$(slugify-string "${shell_script_path}")";     local -- stderr_path="${HOME}/workbench/2026-02-08/${logprefix}.pid.${$}.stderr";     local -- stdout_path="${HOME}/workbench/2026-02-08/${logprefix}.pid.${$}.stdout";     local -i code=0;     echo 1>&2;
    if ! ${call_args[@]} 2> ${stderr_path} > ${stdout_path} <<< "${shell_d_shell_d_sh_check_shell_script_command}"; then         code=$?;     fi;     local -- stderr=$(sed -E '/^\s*$/d' "${stderr_path}");     local -i stderr_linecount=0;     if [ -n "${stderr}" ]; then
        local -i stderr_linecount=$(wc -l <<< "${stderr}");     fi;     local -- stderr_attrs="";     if [ ${stderr_linecount} -gt 0 ]; then         echo "found errors in ${shell_script_path@Q}:" 1>&2;         echo "${stderr}" 1>&2;         return ${stderr_linecount};     fi; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_sh_declare">
#1772113487
shell_d_sh_declare () {     local -a argv=($@);     local -i argc=${#argv[@]};     local -i index=0;     local -i current=0;     local -- arg="";     local -- value="";     local -A param_map=();     local -- pos="";     local -i prev_arg_value_index=0;     local -- prev_arg_value_pos='';     local -i var_ty_index=0;     local -- var_ty_pos='';     local -- var_ty_letter="";     if [ ${argc} -lt 2 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing arguments" 1>&2;         return 1;     fi;     local -ra param_order=(g a A i l u x r);     for index in ${!argv[@]};     do         current=$(($index + 1));         arg="${argv[$index]}";         value="${arg#-}";         pos="$(printf '%*s of %s' "${#argc}" ${current} ${argc})";         prev_arg_value_index=0;         prev_arg_value_pos='';         if [[ -v param_map["${value}"] ]]; then             prev_arg_value_index=${param_map["${value}"]};             prev_arg_value_pos="$(printf '%s of %s' $((prev_arg_value_index + 1)) ${argc})";         fi;         case "${arg}" in             -f | -F | -p)                 echo -e "[${FUNCNAME[0]} error]" "invalid option ${pos} ${arg@Q} only acceptable in bash's builtin declare" 1>&2;                 return 1;             ;;             -t)                 echo -e "[${FUNCNAME[0]} error]" "invalid option ${pos} ${arg@Q} only acceptable in bash's function definitions" 1>&2;                 return 1;             ;;             -I | -n)                 echo -e "[${FUNCNAME[0]} error]" "invalid option ${pos} ${arg@Q} only acceptable in bash's builtin local" 1>&2;                 return 1;             ;;             -a | -A | -i | -x | --)                 if [ -n "${var_ty_letter}" ]; then                     echo -e "[${FUNCNAME[0]} error]" "invalid \"var type\" ${arg} option ${pos} already set to ${var_ty_letter} by argument ${var_ty_pos}" 1>&2;                 else                     if [[ -v param_map["${value}"] ]]; then                         echo -e "[${FUNCNAME[0]} warning]" "ignoring option ${pos} ${arg@Q} already provided in position ${prev_arg_value_pos}" 1>&2;                     else                         var_ty_letter="${value}";                         var_ty_pos="${pos}";                         var_ty_index="${index}";                         param_map["${value}"]=${index};                     fi;                 fi;             ;;             -g | -r | -l | -u)                 if [[ ! -v param_map["${value}"] ]]; then                     param_map["${value}"]=${index};                 else                     echo -e "[${FUNCNAME[0]} warning]" "ignoring option ${pos} ${arg@Q} already provided in position ${prev_arg_value_pos}" 1>&2;                 fi;             ;;         esac;         local -- options="";         for value in ${param_order[@]};         do             if [[ -v param_map["${value}"] ]]; then                 options="${options}${value}";             fi;         done;     done; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_sh_load_source">
#1772113487
shell_d_sh_load_source () {     if [ ${#} -eq 0 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing argument: <SHELL_SCRIPT_PATH>" 1>&2;         return 1;     else         if [ ${#} -gt 1 ]; then             echo -e "[${FUNCNAME[0]} error]" "too many arguments" 1>&2;             return 1;         fi;     fi;     local -- shell_script_path="${1}";     shell_d_sh_validate_non_empty_regular_file_argument "shell_script_path" "${shell_script_path}";     shell_script_path=$(shell_d_fs_get_canonical_path "${shell_script_path}"); }
#1772113487
# </function>
#1772113487
# <function name="shell_d_sh_validate_non_empty_argument">
#1772113487
shell_d_sh_validate_non_empty_argument () {     if [[ ! -v FUNCNAME[1] ]]; then         echo -e "[${FUNCNAME[0]} error]" "undefined variable \${FUNCNAME[1]}this function should be called from another shell function" 1>&2;         return 1;     else         if [[ ! -v LINENO[1] ]]; then             echo -e "[${FUNCNAME[0]} error]" "undefined variable \${LINENO[1]}this function should be called from another shell function" 1>&2;             return 1;         fi;     fi;     local -- caller_funcname=${FUNCNAME[1]};     local -- caller_lineno=${LINENO[1]};     local -- caller_frame="${caller_funcname}:${caller_lineno}";     local -a argv=($@);     local -i argc=${#argv[@]};     if [ ${argc} -lt 2 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing arguments: <ARGUMENT_NAME> <ARGUMENT_VALUE>" 1>&2;         return 1;     else         if [ ${argc} -gt 2 ]; then             echo -e "[${FUNCNAME[0]} error]" "too many arguments, this function takes exacly 2 arguments: <ARGNAME> and <VALUE>" 1>&2;             return 1;         fi;     fi;     local -- caller_argument_name="${argv[@]:0:1}";     local -- caller_argument_value="${argv[@]:1:1}";     if [ -z "${caller_argument_name}" ]; then         echo -e "[${FUNCNAME[0]} error]" "${caller_frame} missing argument: <ARGUMENT_NAME>" 1>&2;         return 1;     else         if [[ ! "${caller_argument_name}" =~ ^[a-zA-Z_]+[a-zA-Z0-9_]*$ ]]; then             echo -e "[${FUNCNAME[0]} error]" "${caller_frame} invalid variable name {caller_argument_name@Q}" 1>&2;             return 1;         fi;     fi;     if [ -z "${caller_argument_value}" ]; then         echo -e "[${caller_funcname} error]" "missing argument: <${caller_argument_name@U}>" 1>&2;         return 1;     fi; }
#1772113487
# </function>
#1772113487
# <function name="shell_d_sh_validate_non_empty_regular_file_argument">
#1772113487
shell_d_sh_validate_non_empty_regular_file_argument () {     if [[ ! -v FUNCNAME[1] ]]; then         echo -e "[${FUNCNAME[0]} error]" "undefined variable \${FUNCNAME[1]} this function should be called from another shell function" 1>&2;         return 1;     else         if [[ ! -v BASH_LINENO[1] ]]; then             echo -e "[${FUNCNAME[0]} error]" "undefined variable \${BASH_LINENO[1]} this function should be called from another shell function" 1>&2;             return 1;         fi;     fi;     local -- caller_funcname=${FUNCNAME[1]};     local -- caller_lineno=${BASH_LINENO[1]};     local -- caller_frame="${caller_funcname}:${caller_lineno}";     local -a argv=($@);     local -i argc=${#argv[@]};     if [ ${argc} -lt 2 ]; then         echo -e "[${FUNCNAME[0]} error]" "missing arguments: <ARGUMENT_NAME> <ARGUMENT_VALUE>" 1>&2;         return 1;     else         if [ ${argc} -gt 2 ]; then             echo -e "[${FUNCNAME[0]} error]" "too many arguments, this function takes exacly 2 arguments: <ARGNAME> and <VALUE>" 1>&2;             return 1;         fi;     fi;     local -- caller_argument_name="${argv[@]:0:1}";     local -- caller_argument_value="${argv[@]:1:1}";     if [ -z "${caller_argument_name}" ]; then         echo -e "[${FUNCNAME[0]} error]" "${caller_frame} missing argument: <ARGUMENT_NAME>" 1>&2;         return 1;     else         if [[ ! "${caller_argument_name}" =~ ^[a-zA-Z_]+[a-zA-Z0-9_]*$ ]]; then             echo -e "[${FUNCNAME[0]} error]" "${caller_frame} invalid variable name {caller_argument_name@Q}" 1>&2;             return 1;         fi;     fi;     if [ -z "${caller_argument_value}" ]; then         echo -e "[${caller_funcname} error]" "missing argument: <${caller_argument_name@U}>" 1>&2;         return 1;     else         if [ ! -e "${caller_argument_value}" ]; then             echo -e "[${caller_funcname} error]" "path does not exist: ${caller_argument_value@Q}" 1>&2;             return 1;         else             if [ ! -f "${caller_argument_value}" ]; then                 echo -e "[${caller_funcname} error]" "not a file: ${caller_argument_value@Q}" 1>&2;                 return 1;             else                 if [ ! -r "${caller_argument_value}" ]; then                     echo -e "[${caller_funcname} error]" "file not readable: ${caller_argument_value@Q}" 1>&2;                     return 1;                 else                     if [ ! -s "${caller_argument_value}" ]; then                         echo -e "[${caller_funcname} error]" "empty file: ${caller_argument_value@Q}" 1>&2;                         return 1;                     fi;                 fi;             fi;         fi;     fi; }
#1772113487
# </function>
#1772113487
# <function name="show_newest_node_version_nvm_managed">
#1772113487
show_newest_node_version_nvm_managed () {     list_nvm_managed_node_versions | head -1; }
#1772113487
# </function>
#1772113487
# <function name="sky_blue_prefixed">
#1772113487
sky_blue_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_sky_blue}m${prefix}\x1b[1;38;2;${color_medium_sky_blue}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="spawn_wezterm_cli">
#1772113487
spawn_wezterm_cli () {     if [ -n "$(ps aux | ack -i 'wezterm[.]app' | ack -v ack)" ]; then         wezterm cli spawn ${@};     else         echo "wezterm cli spawn ${@}";     fi; }
#1772113487
# </function>
#1772113487
# <function name="ssh_ag">
#1772113487
ssh_ag () {     g p -r ssh -k 2> /dev/random > /dev/random;     eval "$(ssh-agent)";     ssh-add -k;     ssh-add ~/.ssh/id_gafagomo;     ssh-add ~/.ssh/gabrielteratos@gmail.com; }
#1772113487
# </function>
#1772113487
# <function name="st">
#1772113487
st () {     status; }
#1772113487
# </function>
#1772113487
# <function name="state">
#1772113487
state () {     date_dirname=$(date +"%Y-%m-%d");     time_dirname=$(date +"%H-%M-%S-%Z");     state_dir_location=${HOME}/state/${date_dirname}/${time_dirname};     readme_location=${state_dir_location}/README.rst;     title="STATE $(date +"%Y/%m/%d %H:%M:%S %Z")";
    undertitle=$(sed 's/./~/g' <<< "${title}");     h1="${title}\n${undertitle}";     mkdir -p "${state_dir_location}";     echo -e "${h1}\n\n::\n   ${state_dir_location}\n\n" > ${readme_location};     cd "${state_dir_location}";     git init;     git add README.rst;     git commit -am "${title}"; }
#1772113487
# </function>
#1772113487
# <function name="static_state_path_is_expired">
#1772113487
static_state_path_is_expired () {     create_state_path_or_refresh_stat_info;     if [ ${bash_static_state_last_modified} -lt ${bash_expiration_seconds} ] || [ ${bash_static_state_last_modified_delta} -gt ${bash_expiration_seconds} ]; then         if [ ! -e "${bash_static_state_path}" ] || [ ! -s "${bash_static_state_path}" ]; then             true;         fi;     fi;     export IFS='
'; }
#1772113487
# </function>
#1772113487
# <function name="stty_outputs">
#1772113487
stty_outputs () {     unset PS4;     local -i code=0;     local -a stty_cmd=();     declare -g -A stty_outputs=();     local -- stty='';     local -- tmp='';     local -- stderr="$(mktemp)";     local -- stderr_prefix="";     local -- sed_command="";     for stty in $(which -a stty);     do         code=0;         stty_cmd=("${stty}" '-a');         if ! tmp="$(${stty_cmd[@]} 2> ${stderr})"; then             code=$?;         fi;         if [ "${code}" -ne 0 ]; then             stderr_prefix="${stty_cmd[@]} failed with exit code ${code}";             sed_command="s%^%${stderr_prefix}%g";             stty_outputs["${stty}"]="$(sed -E "${sed_command}" "${stderr}")";         else             stty_outputs["${stty}"]="${tmp}";         fi;     done; }
#1772113487
# </function>
#1772113487
# <function name="t">
#1772113487
# </function>
#1772113487
# <function name="t1">
#1772113487
# </function>
#1772113487
# <function name="terminal_fill_string">
#1772113487
# </function>
#1772113487
# <function name="terminal_get_minwidth_to_string_unchecked">
#1772113487
# </function>
#1772113487
# <function name="terminal_get_width">
#1772113487
# </function>
#1772113487
# <function name="tfull">
#1772113487
# </function>
#1772113487
# <function name="third_party">
#1772113487
# </function>
#1772113487
# <function name="throw_error">
#1772113487
# </function>
#1772113487
# <function name="tn">
#1772113487
# </function>
#1772113487
# <function name="trace">
#1772113487
# </function>
#1772113487
# <function name="tt">
#1772113487
# </function>
#1772113487
# <function name="usage">
#1772113487
usage () {     repl no echo;     echo -e "$(basename $0) <ARGUMENT>" 1>&2;     repl sane; }
#1772113487
# </function>
#1772113487
# <function name="warn">
#1772113487
warn () {     eval "${ui_msgfunc_ctx}";     warn_prefixed "[warn]" "${@}"; }
#1772113487
# </function>
#1772113487
# <function name="warn_prefixed">
#1772113487
warn_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${warn_prefix_color_rgb}m${prefix}\x1b[1;38;2;${warn_color_rgb}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# <function name="web_browser_is_open">
#1772113487
web_browser_is_open () {     if [ -n "$(web_browser_processes | tr -d '[:space:]')" ]; then         return 0;     else         return 1;     fi; }
#1772113487
# </function>
#1772113487
# <function name="web_browser_processes">
#1772113487
web_browser_processes () {     local -A web_browser_processes_by_pid=($(ps aux | ack -i '(Google\s*Chrome|Firefox|Ladybug|Helium)[.]app' | ack -v ack | ack "^${USER}\s+(\d+)" | sed -n "s/^${USER}\s\+\([0-9]\+\)\s\+.*[0-9]\s\+\(\/[A-Za-z0-9].\+\)/[\1]=\"\2\"/gp"));     for pid in ${!web_browser_processes_by_pid[@]};     do         command_string=${web_browser_processes_by_pid[${pid}]};         echo -e "${pid}\t${command_string}";     done; }
#1772113487
# </function>
#1772113487
# <function name="wip">
#1772113487
wip () {     . ~/opt/lib/ansi.sh;     local -- verbose="false";     if [ -n "$1" ]; then         case "$1" in             "-v")                 verbose="true";                 shift;             ;;             *)             ;;         esac;     fi;     local -a what=($@);     if [ ${#what[@]} -eq 0 ]; then         bar_text_left 233 231 "missing description";         return 1;     fi;     local -- bashpid="$$";     local -- title="WIP ON $(date +"%Y/%m/%d %H:%M:%S") (bash pid: ${bashpid})";     local -- under=$(echo "$(seq ${#title})" | tr -d '[:digit:]' | tr '\n' '~');     entries=$(lsof | ack -i "(bash | ghostty | wezterm | terminal)" | grep cwd | lastcol | ack -v "^${HOME}\$" | sort -u | sed "s/^/$(date +"%s") /g");     export HISTTIMEFORMAT="${hist_time_format_timestamp_tz}";     local -- note=$(echo -e "${title}\n${under}\n\n${what[@]} in directory $(pwd)\n\n${entries}\n\n$(history)\n\n");     base_log_path=$HOME/projects/notes/wip/mit-context;     ts=$(nowts | xargs slugify-string);     log_path=${base_log_path}.${ts}.txt;     mkdir -p $(dirname "${log_path}");     echo -e "${note}" > ${log_path};     if [ "${verbose}" == "true" ]; then         echo "wrote: ${log_path}" 1>&2;     fi; }
#1772113487
# </function>
#1772113487
# <function name="workbench_category_names_length">
#1772113487
workbench_category_names_length () {     echo "${#workbench_category_to_directory_name_mapping[@]}"; }
#1772113487
# </function>
#1772113487
# <function name="workbench_category_names_list">
#1772113487
workbench_category_names_list () {     builtin printf '%s\n' "${!workbench_category_to_directory_name_mapping[@]}"; }
#1772113487
# </function>
#1772113487
# <function name="workbench_engine_check">
#1772113487
workbench_engine_check () {     workbench_engine_check_validate_categories; }
#1772113487
# </function>
#1772113487
# <function name="workbench_engine_check_validate_categories">
#1772113487
workbench_engine_check_validate_categories () {     if [ ${workbench_category_count} -eq 0 ]; then         throw_error "empty_list" "no category names mapped in \${workbench_category_to_directory_name_mapping}";         return;     fi;     local -- category='';     local -a cats=($(workbench_category_names_list));     local -- prefix="";     local -i index=0;     local -i current=0;     for index in ${!cats[@]};     do         current=$((index + 1));         prefix="$(printf '%*s of %s' ${#workbench_category_count} ${current}" ${current}")";         local -- prefix="";         category=${cats[$index]};         if [[ ! -v workbench_category_to_directory_name_mapping["${category}"] ]]; then             echo "[uncharted category error]" "no directory name mapped to the category ${category@Q}" 1>&2;             return 404;         fi;         return;     done; }
#1772113487
# </function>
#1772113487
# <function name="workbench_load">
#1772113487
workbench_load () {     workbench_root="$HOME/workbench";     workbench_last_epoch=$(date +%s);     workbench_day=$(date +"%Y-%m-%d" --date=@${workbench_last_epoch});     workbench_logs_safe_path="${workbench_root}/logs/${workbench_day}";     workbench_path="${workbench_root}/${workbench_day}";     workbench_logs="${workbench_path}/logs";     workbench_manifest="${workbench_path}/.workbench.created";     workbench_todays_locations=(["logs"]="${workbench_logs_safe_path}" ["path"]="${workbench_path}");     workbench_stderr="${workbench_logs}/stderr.log";     workbench_stdout="${workbench_logs}/stdout.log";     declare -gx stderr="${workbench_stderr}";     declare -gx stdout="${workbench_stdout}";     workbench_category_setup; }
#1772113487
# </function>
#1772113487
# <function name="workbench_load_current_date">
#1772113487
workbench_load_current_date () {     local -i code=0;     local -- current_date="";     local -r regexp='[[:space:]]\n]*(([0-9]{4})-([0-9]{2})-([0-9]{2}))[[:space:]]\n]*';     if [ -s "${workbench_current_state_path}" ]; then         if ! current_date=$(sed -E "s/^${regexp}\$/\1/g;t date q9; :date {p}"); then             code=$?;         fi;     fi; }
#1772113487
# </function>
#1772113487
# <function name="x">
#1772113487
x () {     clsreset;     export PS1_VARIANT=x;     cdmkd ~/*scratch*/.x/; }
#1772113487
# </function>
#1772113487
# <function name="xD">
#1772113487
xD () {     export PS4='';     local -a path_list=($@);     local -i path_count=${#path_list[@]};     local SHELL_D_PATH="${HOME}/.shell.d";     local X_D_PATH="${SHELL_D_PATH}/x.d";     local -- sh="";     if [ ${path_count} -eq 0 ]; then         echo -e "[error]" "xD missing argument(s): <PATH> [PATH...]" 1>&2;     fi;     for sh in ${path_list[@]};     do         if [ -e "${SHELL_D_PATH}/${sh}" ] && [ -r "${SHELL_D_PATH}/${sh}" ] && [ -s "${SHELL_D_PATH}/${sh}" ]; then             builtin source "${SHELL_D_PATH}/${sh}";             shell_d_load_libs "${SHELL_D_PATH}/${sh}";         else             if [ -e "${X_D_PATH}/${sh}" ] && [ -r "${X_D_PATH}/${sh}" ] && [ -s "${X_D_PATH}/${sh}" ]; then                 builtin source "${X_D_PATH}/${sh}";                 shell_d_load_libs "${X_D_PATH}/${sh}";             else                 echo -e "[error]" "xD could not find readable non-empty file ${sh@Q}" 1>&2;                 return 5;             fi;         fi;     done; }
#1772113487
# </function>
#1772113487
# <function name="yellow_prefixed">
#1772113487
yellow_prefixed () {     local -- prefix="$1";     shift;     local -- message="$@";     echo -e "\x1b[1;38;2;${color_light_yellow}m${prefix}\x1b[1;38;2;${color_medium_yellow}m ${message}\x1b[0m" 1>&2; }
#1772113487
# </function>
#1772113487
# end of func='shell_d_export_state_part5_functions'
#1772113487
set +x
#1772113487
export IFS=$'
'
#1772113075
python3 -c 'import string;print("".join(sorted(string.digits + string.ascii_letters)))' | xxd -p -c 1 | while read hex; do echo $(( 0x${hex} )); done | while read codepoint; do case ${codepoint} in
#1772113521
dirs
#1772113527
git st
#1772113529
cargo run
#1772113543
nohup  cargo ip &
#1772113544
disown -a
#1772113550
pbpaste
#1772113560
pbpaste > indexes.sh
#1772113565
pushd ~/.shell.d/
#1772113566
gi tst
#1772113567
git st
#1772113580
bat .trash/x.d/shell-state.info.json
#1772113582
git st
#1772113584
git add .
#1772113584
git st
#1772113592
git commit .trash -m .trash
#1772113598
git lof
#1772113599
git log
#1772113606
git switch -
#1772113608
git st
#1772113611
git log
#1772113617
git switch -
#1772113620
git st
#1772113622
git log
#1772113629
git commit --amend -m .trash.info.json 
#1772113630
git st
#1772113632
git switch -
#1772113642
git br
#1772113669
git whatchanged -p
#1772113692
ack '[-][-]mac-os-apps'
#1772113771
pushd ~/
#1772113772
ll
#1772113783
popd
#1772113796
pushd ~/workbench/2026-02-26/
#1772113797
ll
#1772113801
bat bash.15814.entrypoint.trace.log
#1772113829
popd
#1772113866
which -a ps1
#1772113871
which -a ps1
#1772113874
ps1 --help
#1772113970
wezterm cli set-window-title functional
#1772113972
wezterm cli set-tab-title functional
#1772113851
./test.entrypoint.sh 
#1772114103
pushd ~/
#1772114105
git st
#1772114122
git add -f .bash*rc* .bash*profile
#1772114124
git st
#1772114137
git status --porcelain | grep -E '^A'
#1772114152
git status --porcelain | grep -E '^A' | lastcol | xargs dua
#1772114173
git status --porcelain | gawk '{
if ($1 ~ /^A/) {
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
'
#1772114227
git status --porcelain | gawk '{
if ($1 ~ /^A/) {
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' | xargs dua
#1772114287
git status --porcelain | gawk '{
if (($1 ~ /^A/) && ($NF ! ~ /static[.][a-f0-9]+/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' | xargs 
#1772114293
git status --porcelain | gawk '{
if (($1 ~ /^A/) && (!$NF  ~ /static[.][a-f0-9]+/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' | xargs 
#1772114296
git status --porcelain | gawk '{
if (($1 ~ /^A/) && (!$NF  ~ /static[.][a-f0-9]+/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' 
#1772114316
git status --porcelain | gawk '{
if (($1 ~ /^A/) && (!$NF  ~ /static[.](202|006|pb)/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' 
#1772114323
git status --porcelain | gawk '{
if (($1 ~ /^A/) && ($NF  ~ /static[.](202|006|pb)/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' 
#1772114327
git status --porcelain | gawk '{
if ($1 ~ /^A/) {
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' | xargs dua
#1772114334
git st
#1772114340
git status --porcelain | gawk '{
if (($1 ~ /^A/) && ($NF  ~ /static[.](202|006|pb)/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
' 
#1772114346
git status --porcelain | gawk '{
if (($1 ~ /^A/) && ($NF  ~ /static[.](202|006|pb)/)){
print(gensub(/gabrielfalcao\//, "", "g", $NF))
}
}
'  | xargs git restore   --staged  
#1772114347
git st
#1772114364
git add -f .bashrc .bashrc-debug  .bashrc.static
#1772114365
git st
#1772114367
git add .
#1772114368
gti st
#1772114369
git st
#1772114400
dua .bash*
#1772114419
find . -mindepth 1 -maxdepth 1 -not -type d -name '.bash*'
#1772114430
find . -mindepth 1 -maxdepth 1 -not -type d -name '.bash*' -exec basename {} \; | xargs dua
#1772114469
man run
#1772114471
man rm
#1772114496
dua-wipe-empty 
#1772116785
ord %
#1772116807
ord %s
#1772116960
cat ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el 
#1772116964
bat ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el  
#1772116969
cat ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el
#1772116972
cat ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el | pbcopy 
#1772117172
pushd ~/.shell.d/x.d/
#1772117172
git st
#1772117181
git add colors.txt colors_bash_vars.sh 
#1772117182
git st
#1772117185
git diff
#1772117188
git q
#1772117222
git st
#1772117312
Emacs-arm64-11 -nw -Q -q
#1772117225
bat colors-gawk-replace-regexp-to-string.el
#1772117646
git st
#1772117651
git st
#1772117653
git log
#1772117678
git commit -am '$(git status --porcelain | lastcol | xargs )"
#1772117687
git commit -am "$(git status --porcelain | lastcol | xargs )"
#1772117690
git st
#1772117732
git st
#1772117735
git add -f *.sh
#1772117736
git st
#1772117739
git whatchanged  tango.sh
#1772118027
git st
#1772118054
git st
#1772118064
git add colors_bash_vars_showcase.sh 
#1772118065
gi tst
#1772118066
git st
#1772118072
git diff tango.sh
#1772118091
git st
#1772118095
bat .tango.sh.emacs-auto-save
#1772118097
rm .tango.sh.emacs-auto-save
#1772118097
git st
#1772118099
git add .
#1772118237
ssh lan-pi
#1772118256
ssh lan-pi
#1772118257
ssh lan-pi
#1772118264
ssh pi
#1772118399
ssj lan
#1772118438
ps aux | grep ssh | grep -v grep
#1772118402
ssh lan-pi
#1772118441
sudo ps aux | grep ssh | grep -v grep
#1772118446
sudo ps aux | grep ssh | grep -v grep
#1772118452
sudo ps aux | grep -i -E '(ssh)'
#1772118459
reset;cls
#1772118634
git st
#1772118636
git add .
#1772118637
git q
#1772119208
git st
#1772119209
git st
#1772119581
ll
#1772119586
bash ansi-truecolor-tango.sh 
#1772119599
git st
#1772119601
git diff
#1772119602
git q
#1772119621
echo -e '\x24'
#1772119637
bash ansi-truecolor-tango.sh 
#1772119649
git st
#1772119654
git restore ansi-truecolor-tango.sh 
#1772119655
git st
#1772119657
git dh
#1772119658
git q
#1772119709
git st
#1772119712
git diff
#1772119713
git q
#1772119729
bash ansi-truecolor-tango.sh 
#1772119795
bash ansi-truecolor-tango.sh 
#1772119804
bash ansi-truecolor-tango.sh 
#1772119806
git st
#1772119808
git restore ansi-truecolor-tango.sh 
#1772119811
bash ansi-truecolor-tango.sh 
#1772119854
bash ansi-truecolor-tango.sh 
#1772119920
bash ansi-truecolor-tango.sh 
#1772120154
bash ansi-truecolor-tango.sh 
#1772120174
git tst
#1772120175
git t
#1772120176
git st
#1772120179
git st
#1772120182
git diff
#1772120185
git restore ansi-truecolor-tango.sh 
#1772120220
bash ansi-truecolor-tango.sh 
#1772120243
git st
#1772120246
git restore ansi-truecolor-tango.sh 
#1772120249
git st
#1772120252
git q
#1772120283
bash ansi-truecolor-tango.sh 
#1772120336
git st
#1772120390
bash ansi-truecolor-tango.sh 
#1772120460
bash ansi-truecolor-tango.sh 
#1772120513
bash ansi-truecolor-tango.sh 
#1772120519
bash ansi-truecolor-tango.sh 
#1772120562
bash ansi-truecolor-tango.sh 
#1772120598
bash ansi-truecolor-tango.sh 
#1772120662
bash ansi-truecolor-tango.sh 
#1772120729
bash ansi-truecolor-tango.sh 
#1772120735
bash ansi-truecolor-tango.sh  | head
#1772120739
cls;bash ansi-truecolor-tango.sh  | head
#1772120834
cls;bash ansi-truecolor-tango.sh  
#1772120843
git st
#1772120847
git restore  ansi-truecolor-tango.sh 
#1772120848
git st
#1772120849
git q
#1772120889
cls;bash ansi-truecolor-tango.sh  
#1772120893
cls;bash ansi-truecolor-tango.sh   | head
#1772120900
git restore  ansi-truecolor-tango.sh 
#1772120901
git st
#1772120939
cls;bash ansi-truecolor-tango.sh   | head
#1772120971
cls;bash ansi-truecolor-tango.sh   | head
#1772121024
cls;bash ansi-truecolor-tango.sh   | head
#1772121057
git restore  ansi-truecolor-tango.sh 
#1772121062
cls;bash ansi-truecolor-tango.sh   | head
#1772121071
cls;bash ansi-truecolor-tango.sh   
#1772121120
git restore  ansi-truecolor-tango.sh 
#1772123755
git st
#1772123756
git add .
#1772123757
git q
#1772123848
ll
#1772123849
git st
#1772123852
bash test-ansi-truecolor-tango.sh 
#1772123896
bash test-ansi-truecolor-tango.sh 
#1772124235
bash test-ansi-truecolor-tango.sh 
#1772124747
bash test-ansi-truecolor-tango.sh 
#1772124772
bash test-ansi-truecolor-tango.sh 
#1772124926
bash test-ansi-truecolor-tango.sh 
#1772124939
bash test-ansi-truecolor-tango.sh 
#1772124979
bash test-ansi-truecolor-tango.sh 
#1772125043
bash test-ansi-truecolor-tango.sh 
#1772125058
git st
#1772125061
git whatchanged 
#1772125070
git commit -a --amend -m 'progress'
#1772125071
git whatchanged 
#1772125082
bash test-ansi-truecolor-tango.sh 
#1772125244
bash test-ansi-truecolor-tango.sh 
#1772125267
bash test-ansi-truecolor-tango.sh 
#1772125308
bash test-ansi-truecolor-tango.sh 
#1772125331
bash test-ansi-truecolor-tango.sh 
#1772125365
bash test-ansi-truecolor-tango.sh 
#1772125395
git whatchanged 
#1772125435
bash ansi-truecolor-tango.sh
#1772125441
cls;bash ansi-truecolor-tango.sh
#1772125492
git st
#1772125515
git commit -am 'satisfactorily "stable": colors-gawk-replace-regexp-to-string.el'
#1772125516
git st
#1772125552
ord '\\x0a'
#1772125583
cls;bash ansi-truecolor-tango.sh
#1772125672
cls;bash ansi-truecolor-tango.sh
#1772125680
cls;bash ansi-truecolor-tango.sh
#1772125785
git st
#1772125789
git add .
#1772125793
git commit -am tweaks
#1772126394
git st
#1772126394
git st
#1772126396
git q
#1772126467
bash test-ansi-truecolor-tango.sh 
#1772126689
ipython
#1772126801
git st
#1772126805
git diff test-ansi-truecolor-tango.sh
#1772126844
sed -E 's/"252;373;62"/"252;175;62"/g' -i *.sh
#1772126846
git st
#1772126851
ack 252;373;62
#1772126860
ack -l '252;373;62'
#1772126868
ack -l '252;373;62' | xargs sed -E 's/"252;373;62"/"252;175;62"/g' -i
#1772126868
git st
#1772126871
ack -l '252;373;62'
#1772126892
git st
#1772126901
git st
#1772126902
git add .
#1772126905
git dh tango.sh
#1772126916
git add .
#1772126921
ack '252;373'
#1772126937
ack 'sed' *.sh
#1772126967
git st
#1772126969
git add .
#1772126971
sed -E 's/([\x22\x27])252;175;62\1/\1252;175;62\1/g' -i *.sh
#1772126971
git st
#1772127002
ack -l '252;373;62' | xargs sed -E "s/'252;175;62'/'252;175;62'/g" -i
#1772127003
git st
#1772127010
git diff
#1772127251
path canon ~/.shell.d/.venv/bin/python3
#1772127260
path canon ~/.shell.d/.venv/bin/python3 
#1772127265
ll ~/.shell.d/.venv/bin/python3
#1772127279
cd
#1772127281
cd .shell.d/
#1772127286
ll .venv/
#1772127306
mv .venv/requirements.txt venv-requirements-$(nowdz).txt
#1772127311
bat .venv/pyvenv.cfg 
#1772127318
rm -rf .venv/
#1772127385
uv
#1772127405
uv venv --help
#1772127419
uv --help
#1772127421
cls;uv --help
#1772127431
uv sync -h
#1772127433
cls;uv sync -h
#1772127438
uv sync
#1772127454
git st
#1772127455
cd ..
#1772127456
git st
#1772127460
git add x.d/
#1772127466
git commit x.d/ -m colors
#1772127467
gi tst
#1772127469
git st
#1772127486
git add venv-requirements-2026-02-26.14-35-06.1772127306.txt .venv/requirements.txt
#1772127488
git st
#1772127493
git diff
#1772127495
git add .
#1772127497
git commit -am venv
#1772127507
ll
#1772127510
uv lock
#1772127512
ll
#1772127524
git st
#1772127527
dua .venv/
#1772127530
ll .venv/
#1772127538
ll .venv/bin/
#1772127541
ll .venv/bin/python
#1772127542
ll .venv/bin/python*
#1772127553
dirs
#1772127588
pushd path-finder
#1772127589
git st
#1772127607
git add *.sh *.py *.bash
#1772127610
git st
#1772127614
git br
#1772127643
git switch -c test-scripts-from-$(git log -1 --format=%h)-at-$(today)
#1772127644
git st
#1772127648
git add tmp/
#1772127650
git st
#1772127682
git commit tmp/ indexes.* find-exec-checklinks.sh symlink-to-refactor.bash -m 'test scripts from main@4255ece'
#1772127684
git st
#1772127686
git switch -
#1772127687
git st
#1772127688
git diff
#1772127701
cargo run
#1772127711
git br
#1772127725
git diff refactor-stdin -- src/cli/commands/env/
#1772127730
git diff osx-main  -- src/cli/commands/env/
#1772127769
ack refactor-stdin
#1772127774
ack valid_os_platform
#1772127983
echo /Applications/ ~/Applications/ /System/Applications/
#1772128579
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772128641
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772128927
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772128939
cargo run
#1772128960
cargo run
#1772129063
cargo run
#1772129069
cargo run env
#1772129147
cargo run env
#1772129179
cargo run env
#1772129320
bat ~/.shell.d/x.d/ansi-truecolor-tango.sh 
#1772129323
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772129374
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772129379
ack valid_os_platform
#1772129380
cargo run env
#1772129400
ack valid_os_platform
#1772129402
cargo run env
#1772129422
cargo run env
#1772129431
cargo run env
#1772129438
cargo run env
#1772129480
cargo run env
#1772129494
cargo run env
#1772129536
cargo run env
#1772129565
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772129644
cargo run env
#1772129695
cls;ack --rs 'Debug' ../iocore/crates/iocore/src/
#1772129910
cargo run env
#1772129947
cargo run env
#1772129965
cargo run env
#1772130009
ll /System/Applications/Maps.app/Contents/MacOS/
#1772130053
rustup doc std::vec
#1772130101
cargo run env
#1772130127
cargo run env
#1772130213
cargo run env
#1772130277
cargo run env
#1772130283
cargo run env
#1772130325
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772130367
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772130368
cargo run env
#1772130483
cargo run env
#1772130500
cargo run env
#1772130514
cargo run env
#1772130542
cargo run env
#1772130550
cargo run env
#1772130609
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772130714
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772130716
cargo run env
#1772130729
cargo run env
#1772130735
cargo run env
#1772130754
cargo run env
#1772131051
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772144810
cargo run env
#1772144858
cargo run
#1772144870
cargo run
#1772144882
cargo run
#1772144937
cargo run
#1772144950
cargo run
#1772145026
cargo run
#1772145032
cargo run env
#1772145086
cargo run env
#1772145247
cargo run env
#1772145387
cargo run env
#1772145395
cls;cargo run env
#1772145502
cls;cargo run env
#1772145595
cls;cargo run env
#1772145624
git st
#1772145632
git switch -c path-env-macos
#1772145633
git st
#1772145635
git commit -am wip
#1772145636
git switch -
#1772145638
git log
#1772145675
git config --global log.date rfc
#1772145676
git log
#1772145693
git config --global log.date iso
#1772145694
git log
#1772145709
git config --global log.date "format:%a %b %d %Y %I:%M:%S %p"
#1772145731
git log
#1772145747
git log
#1772145758
git log
#1772145764
git log
#1772145780
git log
#1772145786
git log
#1772145807
declare -p ${!LC*}
#1772145791
man strftime
#1772145827
declare -p ${!LC*}
#1772145851
cd git-bandolier/
#1772145852
ll
#1772145854
vim  TODO.md 
#1772145888
git q
#1772145890
cd -
#1772145895
git switch -c path-env-macos
#1772145902
git switch -
#1772145904
git switch -
#1772145906
git log
#1772145949
git log --date-relative
#1772145954
git log --date=relative
#1772146011
git log -1
#1772146023
git log -1  --format='commit %H '
#1772146075
git log -1  --format='%C(auto)commit %H '
#1772146080
git log -1  --format='%C(auto)  commit %H '
#1772146084
git log -1  --format='%C(auto)   %H '
#1772146092
git log -1  --format='%C(auto) commit%C(auto)   %H '
#1772146097
git log -1  --format='%C(yellow) commit%C(auto)   %H '
#1772146101
git log -1  --format='%C(yellow)commit%C(auto)   %H '
#1772146109
git log -1  --format='%C(yellow)commit%C(auto) %H '
#1772146115
git log -1  --format='%C(yellow)commit%C(auto) %H %b'
#1772146129
git log -1  --format='%C(yellow)commit%C(auto) %H => %C(auto) %F'
#1772146131
git log -1  --format='%C(yellow)commit%C(auto) %H => %C(auto) %f'
#1772146141
man git-log
#1772146158
git log -1  --format='%C(yellow)commit%C(auto) %H => %C(auto) %d'
#1772146165
git log -1  --format='%C(yellow)commit%C(auto) %H %C(auto) %d'
#1772146171
git log -1  --format='%C(yellow)commit%C(auto) %H %C(auto)%d'
#1772146176
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d'
#1772146185
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor'
#1772146194
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor %ad'
#1772146201
man git-log
#1772146216
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor %aN %aE'
#1772146220
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor %aN <%aE>'
#1772146222
git log
#1772146229
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>'
#1772146245
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD'
#1772146258
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %ad'
#1772146265
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %aS'
#1772146267
man git-log
#1772146276
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %ar'
#1772146282
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %C(auto)%ar'
#1772146286
man git-log
#1772146320
man git-config
#1772146361
git log -1  --format='%C(yellow)commit%C(auto) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %C(#FCE94F)%ar'
#1772146375
git log -1  --format='%C(#EDD400)commit%C(#EDD400) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %C(#FCE94F)%ar'
#1772146403
git log -1  --format='%C(#EDD400)commit%C(#EDD400) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %C(#FCE94F)%ar'
#1772146471
git log -1  --format='%C(#EDD400)commit%C(#EDD400) %H%C(auto)%d%nAuthor: %aN <%aE>%nDate: %aD %C(#FCE94F)%ar'
#1772146478
git log -1  --format='%C(#73D216)commit%C(#8AE234) %H%C(#EDD400)%d%nAuthor: %aN <%aE>%nDate: %aD %C(#3265A4)%ar'
#1772146526
git log -1  --format='%C(#73D216)commit%C(#8AE234) %H%C(#EDD400)%d%nAuthor: %aN <%aE>%nDate: %aD %C(#3265A4)%ar'
#1772146539
git log -1  --format='%C(#73D216)commit%C(#8AE234) %H%C(#EDD400)%d%n%C(#EDD400)Author: %C(#EDD400)%aN %C(#EDD400)<%aE>%n%C(#729FCF)Date: %aD %C(#3265A4)%ar'
#1772146648
git log -1  --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#EF2929)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#3265A4)%ar'
#1772146672
git log -1  --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#EF2929)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#3265A4)%ar'
#1772146675
git log -1  --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#3265A4)%ar'
#1772146699
git log -1  --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar'
#1772146722
git log
#1772146737
git log
#1772146787
git config --global log.date "format:%a %b %d %Y %I:%M:%S %p"
#1772146790
git log
#1772146812
git whatchanged -p
#1772146832
git reset --hard a6b29dd33853e3c2803e87b3e79c800ddb4afc59
#1772146835
cargo ip
#1772146954
sed -n -z -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/gp'
#1772146971
sed -n -z -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/gp' ~/.shell.d/*.sh ~/.shell.d/x.d/*.sh
#1772146987
sed -n -z -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/g' ~/.shell.d/*.sh ~/.shell.d/x.d/*.sh
#1772147002
sed -n -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/gp' ~/.shell.d/*.sh ~/.shell.d/x.d/*.sh
#1772147008
sed -n -z -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/g' ~/.shell.d/*.sh ~/.shell.d/x.d/*.sh 
#1772147025
sed -n -z -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/g;t success D;:success p' ~/.shell.d/*.sh ~/.shell.d/x.d/*.sh 
#1772147052
sed -n -z -E 's/(path[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147090
sed -n -z -E 's/((path|[$]?[a-z_]+)[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\2\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147100
sed -n -z -E 's/((path|[$]?[a-z_]+)[[:space:]\n]*env[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147145
sed -n -z -E 's/((path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)([^\n]+[\n]+)/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147182
sed -n -z -E 's/.*?((path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)([^\n]+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147202
sed -n -z -E 's/.*?[\n][^\n]*((path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)([^\n]+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147205
cls;sed -n -z -E 's/.*?[\n][^\n]*((path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)([^\n]+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147216
cls;sed -n -z -E 's/.*?[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)([^\n]+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147261
cls;sed -n -z -E 's/.*?[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147286
cls;sed -n -z -E 's/.*?[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n\x1b[1;38;5;231m\0\x1b[0m/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147311
cls;sed -n -z -E 's/(.*?)[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?/\x1b[1;38;5;220m\1\x1b[1;38;5;154m\3\x1b[0m\n\x1b[1;38;5;231m\0\x1b[0m/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147322
cls;sed -n -z -E 's/(.*?)[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?/\x1b[1;38;5;220m\2\x1b[1;38;5;154m\3\x1b[0m\n\x1b[1;38;5;231m\0\x1b[0m/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147329
cls;sed -n -z -E 's/(.*?)[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?/\x1b[1;38;5;220m\2\x1b[1;38;5;154m\3\x1b[0m\n\x1b[1;38;5;231m\4\x1b[0m/g;t success D;:success p' ~/.shell.d/x.d/path.sh 
#1772147364
sed -E 's/[^(|)]+//g' <<< '(.*?)[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?'
#1772147370
sed -E 's/[^()]+//g' <<< '(.*?)[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?'
#1772147374
sed -E 's/[^()]+//g' <<< '(.*?)[\n]([^\n]*(path|[$]?[a-z_]+)[[:space:]\n]+env[[:space:]\n]*[A-Za-z0-9_]+[[:space:]\n]*)(([^\n]|[\\][\n])+[\n]+).*?' | wc -c
#1772147476
bat ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el 
#1772147500
bat ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el 
#1772147520
cp ~/.shell.d/x.d/colors-gawk-replace-regexp-to-string.el ~/.shell.d/x.d/colors-gawk-replace-py-regexp-to-string.el
#1772149692
cd ~/.shell.d/x.d/
#1772149693
git st
#1772149695
git add .
#1772149696
git q
#1772150076
ipython
#1772150879
ll
#1772150880
git st
#1772150881
git q
#1772150888
black py-truecolor-tango.py 
#1772150906
black py-truecolor-tango.py 
#1772150916
ipython
#1772150970
black py-truecolor-tango.py 
#1772150980
git st
#1772150981
git q
#1772150982
black py-truecolor-tango.py 
#1772151040
ipython
#1772151117
ipython
#1772151768
bash ansi-truecolor-tango.sh 
#1772151826
git st
#1772151828
git diff
#1772151832
git st
#1772152004
git st
#1772152009
git st
#1772152155
reset
#1772152156
git st
#1772152157
git diff
#1772152160
git reset --hard 
#1772152161
git st
#1772152197
launch_emacs_desktop 
#1772152208
declare -p -x
#1772152217
cls;declare -p -x
#1772152281
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g'
#1772152292
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v WEZTERM
#1772152367
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '\b(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD)\b'
#1772152396
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '\s+(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD)(\s+|[="])'
#1772152401
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '\s+(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD)(\s+|[="])?'
#1772152407
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD)'
#1772152422
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER))'
#1772152425
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)|USER)'
#1772152468
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)|USER|TERM|SHLVL|SHELL)[=_]'
#1772152479
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)|USER|TERM|SHLVL|SHELL)[=_]|LaunchInstanceID'
#1772152488
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)|USER|TERM|SHLVL|SHELL)[=_]|LaunchInstanceID'
#1772152510
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)|USER|TERM|SHLVL|SHELL)[=_])'
#1772152517
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle\w+|_USER)|USER|TERM|SHLVL|SHELL)[=_])'
#1772152545
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)|USER|TERM|SHLVL|SHELL)[A-Z=_]+)'
#1772152586
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|TERM|SHLVL|SHELL)[=_])'
#1772152590
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|TERM|SHLVL|SHELL)[=_]'
#1772152604
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|TERM|SHLVL|SHELL|SESSIONID|SECURITY)[=_]'
#1772152652
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|TERM|SHLVL|SHELL|SESSIONID|SECURITY|IFS)[=_]'
#1772152662
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|HOME|TERM|SHLVL|SHELL|SESSIONID|SECURITY|IFS)[=_]'
#1772152672
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|HOME|TERM|SHLVL|SHELL|SESSIONID|SECURITY|IFS|LaunchInstanceID)[=_]'
#1772152702
cls;declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|HOME|TERM|SHLVL|SHELL|SESSIONID|SECURITY|IFS|LaunchInstanceID)[=_]'
#1772152778
cd ..
#1772152778
git st
#1772152784
git diff
#1772152786
git q
#1772152792
export_static_env_vars_to_another_shell() {     declare -p -x | sed -E 's/^declare\s+[-]x\s+([A-Za-z0-9_]+[^=]*)[=]("(.*)")$/export \1=\2/g' | grep -E -v '(WEZTERM|XPC|AUTH_SOCK|TMPDIR|(OLD)?PWD|__CF(Bundle|_USER)[A-Za-z_]*|USER|HOME|TERM|SHLVL|SHELL|SESSIONID|SECURITY|IFS|LaunchInstanceID)[=_]'; }
#1772152795
export_static_env_vars_to_another_shell 
#1772152824
export_static_env_vars_to_another_shell > ~/.bashrc.env.static
#1772152858
ls
#1772154810
./test.entrypoint.sh 
#1772154942
./test.entrypoint.sh 
#1772154982
env
#1772154990
declare -p
#1772155038
cls;declare -p -x
#1772155105
ack --sh staging ~/.shell.d/
#1772155781
git st
#1772155789
git add fn.staging.d/export_shell_env_vars.sh 
#1772155792
git commit fn.staging.d/export_shell_env_vars.sh -m fn.staging.d/export_shell_env_vars.sh
#1772155794
git diff entrypoint.sh
#1772155898
declare -p PATH CDPATH
#1772155905
(echo;declare -p PATH CDPATH;echo) | pbcopy 
#1772156066
cd
#1772156071
cd vm
#1772156145
cd vm
#1772156146
git st
#1772156174
cdmkd ./macos-debian-mate-13.3.0
#1772156182
vim download.sh
#1772156197
path canon .
#1772156222
git st
#1772156224
git st
#1772156225
ll
#1772156228
git add .
#1772156229
git q
#1772156235
./download.sh 
#1772156252
st
#1772156453
declare -a macos_log_paths=( /private/var/log/wifi.log /private/var/log/com.apple.xpc.launchd/launchd.log /Users/gabrielfalcao/Library/Logs/Homebrew/gitea/01.make.log /Users/gabrielfalcao/Library/Logs/Homebrew/gitea/01.make.cc.log /Users/gabrielfalcao/Library/Logs/Homebrew/gitea/02.gitea.log /private/var/log/system.log /Users/gabrielfalcao/Library/Logs/Homebrew/ncurses/config.log /private/var/log/udev-ntfsfix/ntfsfix-udev-rule-script.sh.add.log /Library/Logs/MCXTools.log /Users/gabrielfalcao/Library/Logs/CoreSimulator/CoreSimulator.log /Users/gabrielfalcao/Library/Logs/fsck_hfs.log /private/var/log/install.log /private/var/log/alf.log /private/var/log/fsck_apfs.log /Library/Logs/DiagnosticReports/JetsamEvent-2025-04-21-222908.ips /Library/Logs/LKDC-setup.log /Users/gabrielfalcao/Library/Logs/DiscRecording.log  )
#1772156469
echo "${macos_log_paths[*]}"
#1772156473
echo "${macos_log_paths[*]}" | unique-lines 
#1772156483
declare -a system_log_paths=( $(echo "${macos_log_paths[*]}" | unique-lines ) )
#1772156488
echo ${system_log_paths[@]}
#1772156570
echo 'tail -f ${system_log_paths[@]} | grep -E -v "(log repeated|modelmanager)" '
#1772156577
echo 'tail -f ${system_log_paths[@]} | grep -E -v "(log repeated|modelmanager)" ' > tailsyslogs.sh
#1772156591
declare -p ${!system*}
#1772156605
declare -p ${!system*} > system_logs_paths.sh
#1772156608
bat system_logs_paths.sh
#1772156612
ll
#1772156621
cp tailsyslogs.sh system_logs_paths.sh ~/.shell.d/
#1772156630
cp tailsyslogs.sh system_logs_paths.sh ~/workbench/2026-02-26/
#1772156245
./download.sh 
#1772156782
st
#1772156790
sudo diskutil 
#1772156805
open -a DiskUtil
#1772156838
# /System/Applications/Utilities/Disk\ Utility.app
#1772156846
open -a 'Disk Utility'
#1772156861
st
#1772156864
ls /Volumes/Untitled/
#1772156874
st
#1772156880
cd st
#1772156883
cd /Volumes/Untitled/
#1772156885
dua
#1772156893
cd -
#1772156899
/bin/ls /Volumes/Untitled/
#1772156901
/bin/ls /Volumes/Untitled/~davincy/
#1772156919
/bin/ls -latrh /Volumes/Untitled/~davincy/
#1772156935
/bin/ls  --date
#1772156937
/bin/ls  --format
#1772156941
man ls
#1772156962
/bin/ls -D '%Y%m%d %H%M%S' -latrh /Volumes/Untitled/~davincy/
#1772156973
/bin/ls -D '%Y-%m-%d %H-%M%S' -latrh /Volumes/Untitled/~davincy/
#1772156983
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/
#1772156992
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/part*
#1772156996
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/part1
#1772156997
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/part2
#1772156998
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/part3
#1772157021
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/projects
#1772157024
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/sync
#1772157034
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/
#1772157050
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/~davincy/Downloads
#1772157053
/bin/ls -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/
#1772157057
/bin/ls -G -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/
#1772157067
/bin/ls -G -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox
#1772157076
/bin/ls -G -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/
#1772157079
/bin/ls -G -D '%Y-%m-%d %H-%M-%S %s ' -latrh /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p
#1772157096
x
#1772157134
echo rsync -auvp --ignore-errors --progress /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p/1080p-only-fans-kitty2002102-14.mp4  /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p/1080p-only-fans-kitty2002102-14.mp4
#1772157139
/bin/ls -latrh /Volumes/Untitled/
#1772157189
rsync -auvp --mkpath --ignore-errors --progress /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p/1080p-only-fans-kitty2002102-14.mp4  /Volumes/Untitled/13-03-2025-webdl-yurievij-pure-sunset-jav-1-models-720p.mp4 /Users/gabrielfalcao/*scratch*/x/$(today)/
#1772158020
/bin/ls -latrh /Volumes/Untitled/
#1772158024
st
#1772158034
st
#1772158036
/bin/ls -latrh /Volumes/Untitled/
#1772158043
/bin/ls -latrh /Volumes/Untitled/
#1772158051
/bin/ls -latrh /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p
#1772158057
cd
#1772158059
cd projects/
#1772158078
pushmkd ~/workbench/$(today )
#1772158080
git init
#1772158081
git st
#1772158086
git add *.sh
#1772158087
git q
#1772158088
git st
#1772158107
/bin/ls -latrh /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | lastcol
#1772158133
/bin/ls -latrh /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | lastcol |grep -E '[.](mp4|mkv|avi|webm|mov)$'
#1772158294
find /Users/gabrielfalcao/projects/ -type d -regextype egrep -regex '.*/(node_modules|target)[/]?$' -not -regex '.*[/](node_modules|target)[/].*[/](node_modules|target).*'
#1772158307
find /Users/gabrielfalcao/projects/ -type d -regextype egrep -regex '.*/(node_modules|target)[/]?$' -not -regex '.*[/](node_modules|target)[/].*[/](node_modules|target).*' > disk-usage-heavy-hitters
#1772158311
find /Users/gabrielfalcao/projects/ -type d -regextype egrep -regex '.*/(node_modules|target)[/]?$' -not -regex '.*[/](node_modules|target)[/].*[/](node_modules|target).*' | tee disk-usage-heavy-hitters
#1772158315
rm disk-usage-heavy-hitters 
#1772158324
cls;find /Users/gabrielfalcao/projects/ -type d -regextype egrep -regex '.*/(node_modules|target)[/]?$' -not -regex '.*[/](node_modules|target)[/].*[/](node_modules|target).*' | tee disk-usage-heavy-hitters-$(today).txt
#1772158345
man tee
#1772158357
cls;find /Users/gabrielfalcao/projects/ -type d -regextype egrep -regex '.*/(node_modules|target)[/]?$' -not -regex '.*[/](node_modules|target)[/].*[/](node_modules|target).*' | tee disk-usage-heavy-hitters-$(today).txt
#1772158378
bat ~/.shell.d/fn.staging.d/export_shell_env_vars.sh 
#1772158382
. ~/.shell.d/fn.staging.d/export_shell_env_vars.sh
#1772158385
export_static_env_vars_to_another_shell 
#1772158400
export_static_env_vars_to_another_shell  | grep -E 'PATH='
#1772158405
export_static_env_vars_to_another_shell  | grep -E 'PATH=' |pbcopy 
#1772158510
ll
#1772158559
cls;cat disk-usage-heavy-hitters-2026-02-26.txt | time xargs dua | strip-ansi-escapes | tee disk-usage-heavy-hitters-2026-02-26.dua.txt
#1772158589
st
#1772158631
man dtrace 
#1772158216
/bin/ls -latrh /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | lastcol |grep -E '[.](mp4|mkv|avi|webm|mov)$' | xargs -Imveach33 rsync -auvp --mkpath --ignore-errors --progress /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p/mveach33 /Users/gabrielfalcao/*scratch*/x/$(today)/
#1772158732
sudo dtrace -a -s -f -l -n ls  -W ls 
#1772158753
/bin/ls -latrh /Volumes/Untitled
#1772158636
man dtruss 
#1772158760
sudo dtrace -a -s  -l -n ls  -W ls 
#1772158764
/bin/ls -latrh /Volumes/Untitled
#1772158787
/bin/ls -latrh /Volumes/Untitled
#1772158783
sudo dtruss -a -s -f -l -n ls  -W ls 
#1772158814
while true ; do log_ts=$(notdz); 2>dtruss.bin.ls.${log_ts}.stderr.log sudo dtruss -a -s -f -l -n ls  -W ls | tee -a dtruss.bin.ls.${log_ts}.log; sone
#1772158879
cls;/bin/ls -latrh /Volumes/Untitled
#1772158884
cls;/bin/ls -G -latrh /Volumes/Untitled
#1772158889
cls;/bin/ls -G -latrh /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox
#1772158900
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox
#1772158906
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | head
#1772158959
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("NF: %d; NR: %d", NF, NR);
printf("<%s>\n%s\n</%s>\n", hdr, $0, hdr);
}'
#1772159047
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR);
printf("<%s>\n\x1b[1;38;2;52;101;164m%s\xb[0m\n</%s>\n", hdr, $0, hdr);
}'
#1772159078
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR);
printf("<%s>\n\x1b[1;48;2;52;101;164m\x1b[1;38;2;211;215;207m%s\xb[0m\n</%s>\n", hdr, $0, hdr);
}'
#1772159085
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR);
printf("<%s>\n\x1b[1;48;2;52;101;164m\x1b[1;38;2;211;215;207m%s\x1b[0m\n</%s>\n", hdr, $0, hdr);
}'
#1772159122
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR);
printf("<%s>\n\x1b[1;38;2;52;101;164m\x1b[1;48;2;211;215;207m%s\x1b[0m\n</%s>size: %d\n\n\n", hdr, $0, $5, hdr);
}'
#1772159185
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);

printf("<%s>\n\x1b[1;38;2;52;101;164m\x1b[1;48;2;211;215;207m%s\x1b[0m\n</%s>size: %d\nfile: '%s'\n\n", hdr, $0, hdr, $5, bin_ls_filename);
}'
#1772159266
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
}
printf("<%s>\n\x1b[1;38;2;52;101;164m\x1b[1;48;2;211;215;207m%s\x1b[0m\n</%s>size: %d\nfile: '%s'\n\n", hdr, $0, hdr, $5, bin_ls_filename);
}'
#1772159310
git st
#1772159319
ll
#1772159321
git st
#1772159327
git add gawk-and-bin-ls.gawk 
#1772159329
git q
#1772159331
git st
#1772159336
dua
#1772159341
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
}
printf("<%s>\n\x1b[1;38;2;52;101;164m\x1b[1;48;2;211;215;207m%s\x1b[0m\n</%s>size: %d\nfile: '%s'\n\n", hdr, $0, hdr, $5, bin_ls_filename);
}'
#1772159374
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
}
if (! bin_ls_filename ~ /^[.]{1,2}$/) {
printf("<%s>\n\x1b[1;38;2;52;101;164m\x1b[1;48;2;211;215;207m%s\x1b[0m\n</%s>size: %d\nfile: '%s'\n\n", hdr, $0, hdr, $5, bin_ls_filename);
}
}'
#1772159441
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
}
if (!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) {
printf("<%s>\n\x1b[1;38;2;52;101;164m\x1b[1;48;2;211;215;207m%s\x1b[0m\n</%s>size: %d\nfile: '%s'\n\n", hdr, $0, hdr, $5, bin_ls_filename);
}
}'
#1772159517
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if (!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}'
#1772159578
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}'
#1772159591
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}' | grep -e -i cream
#1772159596
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}' | grep -E -i cream
#1772159635
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}' | grep -E -i cream
#1772159665
rsync -auvp --mkpath --ignore-errors --progress /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/trainer-hard-ass-fuckes-and-facefuckes-redhead-after-workout-to-anal-creampie.mp4  /Volumes/Untitled/13-03-2025-webdl-yurievij-pure-sunset-jav-1-models-720p.mp4 /Users/gabrielfalcao/*scratch*/x/$(today)/
#1772159689
cls;/bin/ls -G -latr /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}' | grep -E -i cream
#1772158874
cls;while true ; do log_ts=$(notdz); 2>dtruss.bin.ls.${log_ts}.stderr.log sudo dtruss -a -s -f -l -n ls  -W ls | tee -a dtruss.bin.ls.${log_ts}.log; sone; 
#1772159696
ll
#1772159702
st
#1772159713
ll
#1772159725
sha512sum debian-live-13.3.0-amd64-mate.iso > debian-live-13.3.0-amd64-mate.iso.sha512
#1772159749
cls;/bin/ls -G -latr /Volumes/Untitled
#1772159759
cls;/bin/ls -G -latr /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p
#1772159779
cls;/bin/ls -G -latr /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}'
#1772159811
cls;/bin/ls -G -latr /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((file_size > 8192) && (!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("%s %d\n", bin_ls_filename, file_size);
}
}'
#1772159838
# rsync -auvp --mkpath --ignore-errors --progress /Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/trainer-hard-ass-fuckes-and-facefuckes-redhead-after-workout-to-anal-creampie.mp4  /Volumes/Untitled/13-03-2025-webdl-yurievij-pure-sunset-jav-1-models-720p.mp4 /Users/gabrielfalcao/*scratch*/x/$(today)/
#1772159875
cls;/bin/ls -G -latr /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((file_size > 8192) && (!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("rsync -auvp --mkpath --ignore-errors --progress %s /Users/gabrielfalcao/*scratch*/x/$(today)/\n", bin_ls_filename);
}
}'
#1772159884
cls;/bin/ls -G -latr /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/13-11-2023-webdl-yurievij-tpb-sweetie-fox/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((file_size > 8192) && (!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("rsync -auvp --mkpath --ignore-errors --progress %s /Users/gabrielfalcao/*scratch*/x/$(today)/\n", bin_ls_filename);
}
}' > sync.sh
#1772159897
vim sync.sh 
#1772159924
bash sync.sh 
#1772159937
/bin/ls -l /Volumes/Untitled/
#1772159955
cls;/bin/ls -G -latr /Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p | gawk '{ hdr=sprintf("\x1b[1;38;2;115;210;22mNF: %d; NR: %d\x1b[0m", NF, NR); bin_ls_filename="/Volumes/Untitled/22-06-2025-webdl-yurievij-only-fans-kitty-aka-kitty2002102-21-videos-1080p/";
for (i=9;i<=NF;i++) {
bin_ls_filename=sprintf("%s%s%s", bin_ls_filename, $i, FS);
} 
file_size=strtonum($5);

if ((file_size > 8192) && (!bin_ls_filename ~ /^[a-zA-Z0-9_.,/_-]*[^[:space:]]+$/) && (bin_ls_filename != ".") && (bin_ls_filename != "..")) {
printf("rsync -auvp --mkpath --ignore-errors --progress %s /Users/gabrielfalcao/*scratch*/x/$(today)/\n", bin_ls_filename);
}
}' > sync.sh
#1772159959
bash sync.sh 
#1772159978
cat debian-live-13.3.0-amd64-mate.iso.sha512
#1772159981
ack d429a04f0dc89ee6f74d35b94a5eb3a73fae1555ffa668c111e8900c5b38a2e6bfcdee1deb85bdeea4dadb299947d87ddf1b750160c509b6379d6a988dcdd60c
#1772160008
open .
#1772160191
cd
#1772160193
cd -
#1772160194
cd ..
#1772160209
3
#1772160210
cd -
#1772160217
pushd ~/projects/third_party/
#1772160222
popd
#1772160235
nohup git clone git@github.com:utmapp/UTM.git &
#1772160245
git clone git@github.com:TuringSoftware/CrystalFetch.git
#1772160472
aria2c -c https://naveenrajm7.github.io/utm-gallery/getbox.sh
#1772160475
bat getbox.sh 
#1772160534
ll
#1772160536
cd ./UTM/
#1772160537
pwd
#1772160545
ln -s /Users/gabrielfalcao/projects/third_party/UTM ./UTM
#1772160551
cd ../CrystalFetch/
#1772160554
pwd
#1772160561
ln -s /Users/gabrielfalcao/projects/third_party/CrystalFetch CrystalFetch 
#1772160563
ll
#1772160567
l
#1772160575
st
#1772160648
st
#1772160652
ll
#1772160658
bat ext.*
#1772160704
sed -E  "s/('([^']+)')\s+'/\1\n'/g" ext.*
#1772160720
sed -z -E  "s/('([^']+)')\s+'/\1\n'/g" ext.* > ext3.txt
#1772160724
sed -z -E  "s/('([^']+)')\s+'/\1\n'/g" ext.* 
#1772160746
sed -z -E  "s/'\s+'/'\n'/g" ext.* 
#1772160751
sed -z -E  "s/'\s+'/'\n'/g" ext.*  | unique-lines 
#1772160757
sed -z -E  "s/'\s+'/'\n'/g" ext.*  | unique-lines > ext3.txt 
#1772160758
git st
#1772160763
git add *.txt
#1772160763
dua
#1772160768
git st
#1772160769
git q
#1772160773
git add *.sh
#1772160774
git q
#1772160775
git st
#1772160780
ll
#1772160785
bat ext3.txt 
#1772160801
bat ext3.txt 
#1772160815
cat ext3.txt
#1772158773
man dtruss 
#1772160826
st
#1772160869
grep -E '[.]ts/(ksk|qsdkofdeanenfmt|ror|atgoeskt-vrx.p)' ext3.txt 
#1772160886
bat ext3.txt 
#1772160895
cat ext3.txt | strip-ansi-escapes 
#1772160900
cat ext3.txt | strip-ansi-escapes > ext33
#1772160913
mv ext3.txt ext3_.txt 
#1772160919
mv ext33 ext3.txt
#1772160923
grep -E '[.]ts/(ksk|qsdkofdeanenfmt|ror|atgoeskt-vrx.p)' ext3.txt 
#1772160927
cls;grep -E '[.]ts/(ksk|qsdkofdeanenfmt|ror|atgoeskt-vrx.p)' ext3.txt 
#1772160956
sed -E "s/^'(.*)'\$/\1/g" ext3.txt 
#1772160960
sed -E "s/^'(.*)'\$/\1/g" -i ext3.txt 
#1772160964
cls;grep -E '[.]ts/(ksk|qsdkofdeanenfmt|ror|atgoeskt-vrx.p)' ext3.txt 
#1772160998
cls;grep -E '[.]ts/(ksk|qsdkofdeanenfmt|ror|atgoeskt-vrx.p)' ext3.txt  | xargs -Ieachpath gstat -c '%F %s eachpath' 'eachpath'
#1772161015
cd /Volumes/nothing/APFEL/*scratch*/.ts/qsdkofdeanenfmt
#1772161025
cd /Volumes/nothing/APFEL/*scratch*/.ts/ror
#1772161050
cls;grep -E '[.]ts/(ksk|atgoeskt-vrx.p)' ext3.txt  | xargs -Ieachpath gstat -c '%F %s eachpath' 'eachpath' 
#1772161059
cls;grep -E '[.]ts/(ksk|atgoeskt-vrx.p)' ext3.txt  | xargs -Ieachpath file 'eachpath'
#1772161087
cls;grep -E '[.]ts/(atgoeskt-vrx.p)' ext3.txt  | xargs -Ieachpath file 'eachpath'
#1772161128
cls;grep -E '[.]ts/(atgoeskt-vrx.p)' ext3.txt  | xargs -Ieachpath rsync -auvp --mkpath --ignore-errors --progress 'eachpath' ./ &
#1772161130
disown  -a
#1772161152
bat ext3
#1772161153
bat ext3.txt 
#1772161162
mv ext3_.txt  _ext3_.txt 
#1772161187
cdmkd ./KJW
#1772161189
dua /Volumes/nothing/APFEL/*scratch*/.ts/KJW
#1772161223
g p -r chrome -k
#1772161211
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/KJW/ ./
#1772161245
file /Volumes/nothing/APFEL/*scratch*/.ts/ekmxfsp/0b4sk8d.yaml
#1772161247
bat /Volumes/nothing/APFEL/*scratch*/.ts/ekmxfsp/0b4sk8d.yaml
#1772161270
bat /Volumes/nothing/APFEL/*scratch*/.ts/essk/0b4sk8d.yaml
#1772161273
file /Volumes/nothing/APFEL/*scratch*/.ts/essk/0b4sk8d.yaml
#1772161282
ls -latrh /Volumes/nothing/APFEL/*scratch*/.ts/essk/0b4sk8d.yaml
#1772161303
file /Volumes/nothing/APFEL/*scratch*/.ts/6e7b57e2.mp4
#1772161307
pwd
#1772161316
cd ..
#1772161323
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/6e7b57e2.mp4 .
#1772161291
bat ext3.txt 
#1772161345
grep deutsch ext3.txt
#1772161391
grep deutsch ext3.txt  | xargs -Ieachfile rsync -auvp --progress --ignore-errors 'eachfile' ./deutsch/
#1772161400
ll
#1772161403
bat ext3.txt 
#1772161409
file /Volumes/nothing/APFEL/*scratch*/.ts/k3s/q8xf4o0.yaml
#1772161410
bat /Volumes/nothing/APFEL/*scratch*/.ts/k3s/q8xf4o0.yaml
#1772161432
file /Volumes/nothing/APFEL/\*scratch\*/.ts/k3s/q8xf4o0/4/42/42b2/42b230/42b230b7c777343f31127d1879a749d5.0b4sk8d 
#1772161437
dua /Volumes/nothing/APFEL/\*scratch\*/.ts/k3s/q8xf4o0/4/42/42b2/42b230/42b230b7c777343f31127d1879a749d5.0b4sk8d
#1772161444
cat /Volumes/nothing/APFEL/*scratch*/.ts/k3s/q8xf4o0.yaml
#1772161454
pbpaste | base64 -d
#1772161458
pbpaste | base64 -d | gunzip 
#1772161463
pbpaste | base64 -d  > wat
#1772161465
file wat
#1772161490
mv wat 0b4sk8d.yaml.gz.bz2.xz.bz2
#1772161496
bunzip2 0b4sk8d.yaml.gz.bz2.xz.bz2 
#1772161514
mv 0b4sk8d.yaml.gz.bz2.xz.bz2 0b4sk8d.yaml.gz.bz2.xz.bz2".gz
#1772161517
mv 0b4sk8d.yaml.gz.bz2.xz.bz2 0b4sk8d.yaml.gz.bz2.xz.bz2.gz
#1772161520
gunzip 0b4sk8d.yaml.gz.bz2.xz.bz2.gz
#1772161525
bunzip2 0b4sk8d.yaml.gz.bz2.xz.bz2 
#1772161528
ll
#1772161532
unxz 0b4sk8d.yaml.gz.bz2.xz 
#1772161536
bunzip2 0b4sk8d.yaml.gz.bz2 
#1772161541
gunzip 0b4sk8d.yaml.gz 
#1772161542
ll
#1772161543
bat 0b4sk8d.yaml 
#1772161549
l
#1772161551
ll
#1772161553
rm 0b4sk8d.yaml 
#1772161164
bat ext3.txt 
#1772161588
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/otc-rtqo/ecuadorian-in-painful-in-her-first-porn-video---brazilxporn-com-31254739.mp4 .
#1772161595
cd /Volumes/nothing/APFEL/*scratch*/.ts/otc-rtqo/
#1772161597
ll
#1772161601
cd ..
#1772161602
ll
#1772161606
dua .triplox/
#1772161607
dua .triplox/triplox/
#1772161625
path canon .triplox/triplox/
#1772161628
path canon .triplox/triplox/ | pbcopy 
#1772161650
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/.triplox/triplox/ ./triplox/ 
#1772161654
ll
#1772161660
file .nke.zip 
#1772161673
dua i .patreon
#1772161681
path canon .patreon
#1772161701
ll .xhses-bndfe
#1772161693
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/.patreon/ ./patreon
#1772161713
path .xhses-bndfe/w*
#1772161716
path .xhses-bndfe/wat/
#1772161721
path canon  .xhses-bndfe/w*
#1772161723
path canon  .xhses-bndfe/wat/
#1772161725
path canon  .xhses-bndfe/whatsapp/
#1772161731
pwd
#1772161732
dua
#1772161757
dua /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/
#1772161760
st
#1772161828
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/wat /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/whatsapp /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/jj-part1 /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/jj-part2 ./.xhses-bndfe/
#1772161840
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/wat /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/whatsapp /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/jj-part1 /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/jj-part2 /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/vera ./.xhses-bndfe/
#1772161858
pwd
#1772161860
cd ..
#1772161861
cd ..
#1772161854
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/wat /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/whatsapp /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/jj-part1 /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/jj-part2 /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/kim /Volumes/nothing/APFEL/*scratch*/.ts/.xhses-bndfe/vera ./.xhses-bndfe/
#1772161884
cd .x/ersties/
#1772161888
cd ..
#1772161895
cd ./.ouro/
#1772161896
dua
#1772161899
pwd
#1772161917
dua
#1772161910
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.x/.ouro ./.ouro/
#1772161920
file *
#1772161925
cd ksk/
#1772161926
dua
#1772161928
file *
#1772161931
bat lmay.yaml explore.key 
#1772161944
ll
#1772161947
pwd
#1772161950
pwd
#1772161953
dua
#1772161954
ll
#1772161963
cd ../.of/
#1772161964
ll
#1772161967
bat .urls 
#1772161970
cd ..
#1772161970
dua
#1772161972
ll
#1772161978
cd .Trash/
#1772161978
ll
#1772161979
cd -
#1772161981
pwd
#1772161992
cd ./php/
#1772161992
ll
#1772161994
file 11739_2018_1899_Fig1_HTML.jpg 
#1772161997
open 11739_2018_1899_Fig1_HTML.jpg 
#1772162001
cd ..
#1772162002
ll
#1772162006
ll
#1772162018
ll ./.qiq/
#1772162022
cd ./.cats/
#1772162023
ll
#1772162031
cd ..
#1772162039
cd ./pbay-magnetz/
#1772162040
ll
#1772162042
cd -
#1772162043
ll
#1772162047
cd ./x/
#1772162048
ll
#1772162050
dua
#1772162055
pwd
#1772162059
pwd
#1772162069
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/x/ ./xxxx
#1772162076
cd ../.srekinom/
#1772162076
ll
#1772162078
dua
#1772162087
cd ../.srenikom/
#1772162088
dua
#1772162092
cd ..
#1772162099
cd ./.x/
#1772162101
ll
#1772162105
dua snappening-concat/
#1772162113
path canon snappening-concat/
#1772162128
ll
#1772162124
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.x/snappening-concat ./snappening-concat 
#1772162138
cd ./ersties/
#1772162140
pwd
#1772162147
ll
#1772162155
cd 
#1772162164
cd ~/workbench/2026-02-26/
#1772162165
ll
#1772162169
bat
#1772162171
bat disk-usage-heavy-hitters-2026-02-26.dua.txt
#1772162184
lastcol  disk-usage-heavy-hitters-2026-02-26.dua.txt
#1772162192
cat   disk-usage-heavy-hitters-2026-02-26.dua.txt | lastcol 
#1772162200
cat   disk-usage-heavy-hitters-2026-02-26.dua.txt | lastcol  | grep -E -v '^total$'
#1772162216
ll
#1772162218
st
#1772162220
st
#1772162224
ll
#1772162228
ll
#1772162231
dua
#1772162235
st
#1772162238
pwd
#1772162207
cat   disk-usage-heavy-hitters-2026-02-26.dua.txt | lastcol  | grep -E -v '^total$' | xargs rm -rf
#1772162243
pwd
#1772162246
pwd
#1772162266
ll
#1772162268
pwd
#1772162271
cd ..
#1772162271
ll
#1772162281
open trippie_bri
#1772162304
dua stepdaughter/
#1772162310
dua stepdaughter/Posts/Free/Videos/
#1772162314
open stepdaughter/Posts/Free/Videos/
#1772162317
dua
#1772162318
ll
#1772162321
open tayallard
#1772162326
open tzara
#1772162330
open youngblondedaddy
#1772162338
open vextape
#1772162346
open sslikeyesss
#1772162350
open aquaticblonde
#1772162353
open kate-bloom/
#1772162357
cd ./2025/
#1772162358
ll
#1772162258
rsync -auvp --progress --ignore-errors --mkpath /Volumes/nothing/APFEL/*scratch*/.x/ersties/ ./ersties/
#1772162370
dua
#1772162388
dua | ansistrip | grep -E '\s+[0-9][.]GB'
#1772162399
dua | ansistrip | grep -E '\s+[0-9][.][0-9]+GB'
#1772162403
dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB'
#1772162407
dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol 
#1772162424
dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol | xargs -Ieachpath open eachpath
#1772162459
dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol | xargs -Ieachpath bash -c 'cd "eachpath"; path canon .; dua'
#1772162567
find $(dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol | xargs ) -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*'
#1772162592
cls;dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol | xargs -Ieachpath find 'eachpath' -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*'
#1772162609
cls;dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol | xargs -Ieachpath find 'eachpath' -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*' -exec path canon {} \;
#1772162612
cls;dua | ansistrip | grep -E '\s+[0-9][.][0-9]+\s+GB' | lastcol | xargs -Ieachpath find 'eachpath' -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*' -exec path canon {} \; | pbcopy 
#1772162616
pwd
#1772162617
cd ..
#1772162636
(echo;pbpaste;echo)> playlist-$(today).$(nowdz).txt
#1772163820
st
#1772163824
cd
#1772163826
st
#1772163828
cd -
#1772163830
pwd
#1772163834
ll
#1772163842
cd
#1772163846
x
#1772163850
(echo;pbpaste;echo)> playlist-$(today).$(nowdz).txt
#1772163851
ll
#1772163853
bat playlist-2026-02-27.2026-02-27.00-44-10.1772163850.txt 
#1772163865
cat playlist-2026-02-27.2026-02-27.00-44-10.1772163850.txt | xargs vlc
#1772163882
cat playlist-2026-02-27.2026-02-27.00-44-10.1772163850.txt | xargs vlc
#1772163972
cd -
#1772163976
cd -
#1772163993
head playlist-2026-02-27.2026-02-27.00-44-10.1772163850.txt 
#1772164005
cd /Volumes/nothing/APFEL/*scratch*/.x/2025/
#1772164033
find . -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*' -exec path canon {} \; | pbcopy 
#1772164036
cd -
#1772164037
cd -
#1772164040
find . -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*' -exec path canon {} \; | pbcopy 
#1772164042
x
#1772164050
(echo;pbpaste;echo)> playlist-$(today).$(nowdz).txt
#1772164052
ll
#1772164054
pwd
#1772164055
x
#1772164057
ll
#1772164062
pwd
#1772164064
ll
#1772164069
bat playlist-2026-02-27.2026-02-27.00-44-10.1772163850.txt 
#1772164083
pwd
#1772164088
head playlist-2026-02-27.2026-02-27.00-44-10.1772163850.txt 
#1772164094
x
#1772164135
find /Volumes/nothing/APFEL/*scratch*/.x/2025 -type f -regextype egrep -iregex '.*(creampie|breed|teenpies|ypies|audition|shroom|exx+tra|dixie|bratty|taboo|dadcrush).*' -exec path canon {} \; > playlist2025.$(nowdz).txt
#1772165051
x
#1772165056
eject
#1772165064
st
#1772165073
cd
#1772165075
eject
#1772165081
st
#1772165214
pwd
#1772165216
x
#1772165218
dua
#1772165232
ssh pi
#1772165236
ssh-a
#1772165223
ssh lan-pi
#1772165239
ssh-ag
#1772165240
ssh pi
#1772165244
ssh lan-pi
#1772165282
st
#1772165285
dua
#1772165294
ll .ouro/
#1772165295
ll .ouro/.ouro/
#1772165301
cd .ouro/.ouro/
#1772165302
find-vids 
#1772165307
find-vids  | xargs vlc
#1772165386
cd ..
#1772165387
cd ..
#1772165388
dua
#1772165400
st
#1772165412
dua | ansistrip  | grep GB
#1772165415
dua | ansistrip  | grep GB | lastcol
#1772165418
dua | ansistrip  | grep GB | lastcol | grep -v total
#1772165426
cd
#1772165427
st
#1772165428
st
#1772165429
st
#1772165430
st
#1772165431
st
#1772165431
st
#1772165432
st
#1772165433
st
#1772165435
st
#1772165439
dua
#1772165442
x
#1772165443
dua
#1772165422
dua | ansistrip  | grep GB | lastcol | grep -v total | xargs rm -rf
#1772165457
mv lemon-popsicle-16571909.mp4 ~/Kino/
#1772165460
rm bar-hopping-hotties-full-movie-2003-8358005.mp4 
#1772165462
find-vids 
#1772165473
open snappening-concat/snappening-concat/*{mkv,mp4}
#1772165526
dua
#1772165537
dua i 2026/
#1772165545
find-vids 
#1772165554
find-vids  | xargs -Ieach rm -f 'each'
#1772165564
st
#1772165566
dua
#1772165581
rm -rf snappening-concat/
#1772165585
cd
#1772165621
brew info findutils
#1772165655
brew info findutils3
#1772165656
4
#1772165657
3
#1772165665
git clone --depth=1 https://git.savannah.gnu.org/git/findutils.git
#1772165928
cd ~/.shell.d/
#1772165929
./test.entrypoint.sh 
#1772166208
./test.entrypoint.sh 
#1772166448
cd path-finder
#1772166449
git st
#1772166464
ll
#1772166452
cargo run
#1772166476
cd
#1772166478
cd ~/.shell.d/
#1772166480
./test.entrypoint.sh 
#1772166556
./test.entrypoint.sh 
#1772166903
help type
#1772167097
cd
#1772167098
cd findutils/
#1772167099
ll
#1772167104
cd ./find/
#1772167106
ack regextype
#1772167110
cd ..
#1772167113
ack regextype
#1772167126
emc lib/regextype.c 
#1772167145
ack RE_SYNTAX_EGREP
#1772167152
cls;ack RE_SYNTAX_EGREP
#1772167162
ack RE_SYNTAX_EGREP
#1772167166
rg RE_SYNTAX_EGREP
#1772167171
rg RE_SYNTAX_
#1772167174
cls;rg RE_SYNTAX_
#1772167313
ack "(findutils-default|awk|ed|egrep|emacs|gnu-awk|grep|posix-awk|posix-basic|posix-egrep|posix-extended|posix-minimal-basic|sed)"
#1772167335
ll
#1772167337
bash regex-type-name.sh 
#1772167357
bash regex-type-name.sh 
#1772167385
bash regex-type-name.sh 
#1772167399
bat NEWS 
#1772167447
emc find/defs.h 
#1772167500
find . -type f -regextype egrep -iregex '.*(regex[a-z_-]*)[.][ch]'
#1772167526
git submodule init
#1772167676
bat .gitmodules 
#1772167683
git remotes
#1772167530
git submodule update
#1772167697
find . -type f -regextype egrep -iregex '.*(regex[a-z_-]*)[.][ch]'
#1772167705
ack "(findutils-default|awk|ed|egrep|emacs|gnu-awk|grep|posix-awk|posix-basic|posix-egrep|posix-extended|posix-minimal-basic|sed)"
#1772167743
echo -e '\n find . -type f -regextype egrep -iregex '.*(regex[a-z_-]*)[.][ch]' | pbc
#1772167756
echo -e "\n find . -type f -regextype egrep -iregex '.*(regex[a-z_-]*)[.][ch]"
#1772167759
echo -e "\n find . -type f -regextype egrep -iregex '.*(regex[a-z_-]*)[.][ch]" | pbcopy 
#1772167781
bash regex-type-name.
#1772167782
bash regex-type-name.sh 
#1772167791
bash regex-type-name.sh 
#1772167797
bash regex-type-name.sh 
#1772167805
bash regex-type-name.sh 
#1772167855
bash regex-type-name.sh 
#1772167882
bash regex-type-name.sh 
#1772167908
bash regex-type-name.sh 
#1772167923
bash regex-type-name.sh 
#1772167925
clsbash regex-type-name.sh 
#1772167928
cls;bash regex-type-name.sh 
#1772167942
cls;ack RE_SYNTAX_EGREP
#1772167959
emc gnulib/tests/test-regex.c 
#1772167969
emc gnulib/lib/regex.h
#1772167986
musgz 
#1772168022
cd ~/workbench/2026-02-26/
#1772168026
pushmkd ~/workbench/$(today )
#1772168030
git init
#1772168032
git add .
#1772168055
(echo;pbpaste;echo) >> regex-crates.1
#1772168062
(echo;pbpaste;echo) >> regex-crates.2
#1772168070
cat regex-crates.* | unique-lines 
#1772168084
cat regex-crates.* | unique-lines  > regex-crates.union
#1772168086
bat regex-crates.union
#1772168116
cat regex-crates.* | unique-lines | grep -E -v '[.]io/search[?]'  > regex-crates.union
#1772168124
cat regex-crates.{1,2} | unique-lines | grep -E -v '[.]io/search[?]'  > regex-crates.union
#1772168129
bat regex-crates.union
#1772168147
mv regex-crates.union regex-crates.and-stuff
#1772168160
grep -Ei regex regex-crates.and-stuff > regex-crates.union
#1772168161
bat regex-crates.union
#1772168166
cat regex-crates.union | pbcopy 
#1772168850
sed -E 's,^.*/,,g' regex-crates.union 
#1772168883
sed -E 's,^.*/,,g' regex-crates.union | xargs -Ieachcrate cargo features -j -f -o eachcrate.json eachcrate
#1772168888
cargo features
#1772168891
cargo features -h
#1772168924
sed -E 's,^.*/,,g' regex-crates.union | xargs -Ieachcrate cargo features -j -d $(pwd) -f $(pwd)/eachcrate.json eachcrate
#1772168942
ll
#1772168966
cdmkd ./regex-plus-other-stufff
#1772168977
mv ../regex-crates.and-stuff .
#1772168997
pushmkd ~/workbench/$(today )
#1772168998
ll
#1772168999
git st
#1772169025
jq '.repository' *.json
#1772169028
jq '.' *.json
#1772169033
jq '. | keys' *.json
#1772169038
jq '.crate | keys' *.json
#1772169052
jq '.crate.repository' *.json
#1772169060
jq '.crate.repository | select( . != null)' *.json
#1772169079
jq '.crate.repository | select( . | contains("github.com"))' *.json 
#1772168991
sed -E 's,^.*/,,g' regex-crates.and-stuff | xargs -Ieachcrate cargo features -j -d $(pwd) -f $(pwd)/eachcrate.json eachcrate
#1772169095
jq '.crate.repository | select( . | test("https://.*git.*"))' *.json 
#1772169107
jq '.crate.repository | select(. != null) | select( . | test("https://.*git.*"))' *.json 
#1772169137
jq -e '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\.(.reposiroty)"' *.json 
#1772169140
jq -e '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\.(.repository)"' *.json 
#1772169143
jq -e '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\.(repository)"' *.json 
#1772169146
jq -e '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository)"' *.json 
#1772169149
jq -e '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json 
#1772169152
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json 
#1772169175
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json  | xargs -Ieachgit git clone --depth=1 eachgit
#1772169197
cd ./regex-plus-other-stufff/
#1772169212
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json  #| xargs -Ieachgit git clone --depth=1 eachgit
#1772169244
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json | sed -E 's,https://www,https://,g' | xargs -Ieachgit git clone --depth=1 eachgit
#1772169250
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json | sed -E 's,https://www,https://,g' #| xargs -Ieachgit git clone --depth=1 eachgit
#1772169255
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json | sed -E 's,https://www.,https://,g' #| xargs -Ieachgit git clone --depth=1 eachgit
#1772176710
x
#1772176725
yt-dlp  'https://www.xvideos.com/video.uifpfooffdd/teaches_his_how_to_fuck_her_pussy'
#1772176847
x
#1772176848
ll
#1772176855
st
#1772176872
cat playlist2025.2026-02-27.00-48-55.1772164135.txt 
#1772176884
cat playlist2025.2026-02-27.00-48-55.1772164135.txt  |xargs vlc
#1772177267
cd
#1772177270
eject
#1772169263
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json | sed -E 's,https://www.,https://,g' | xargs -Ieachgit git clone --depth=1 eachgit
#1772177344
jq -r '.crate | select(.repository != null) | select( .repository | test("https://.*git.*")) | "\(.repository).git"' *.json | sed -E 's,https://www.,https://,g' | xargs -Ieachgit bash -c 'echo eachgit; git clone --depth=1 eachgit'
#1772177367
ll
#1772177371
ddua
#1772177373
dua
#1772177383
ll
#1772177385
cd ../
#1772177386
ll
#1772177402
emc vregex/src/lib.rs 
#1772298176
htop
#1772298193
wz-wip
#1772298195
wz-wip-old 
#1772298210
sudo shutdown -h now
#1772113979
unset PROMPT_COMMAND 
#1772113980
wezterm cli set-tab-title functional
#1772113982
wezterm cli set-window-title functional
#1772166549
./test.entrypoint.sh 
#1772298761
launch_emacs_desktop 
#1772298777
emacsclient -n .shell.d/entrypoint.sh
#1772298795
cd .shell.d/
#1772298796
git st
#1772298808
git add *.sh
#1772298826
git st
#1772298834
vim .gitignore 
#1772298840
git st
#1772298896
cd git-bandolier/
#1772298897
git st
#1772298899
ll
#1772298904
bat TODO.md 
#1772298999
emacsclient -n TODO.md
#1772299231
path show README.md 
#1772299650
which gdate 
#1772299651
which -a gdate 
#1772299815
cls;git status --porcelain 
#1772299865
cls;git status --porcelain entrypoint.sh
#1772299869
cls;git status --porcelain entrypoint.shs
#1772301218
dns-server wl 'https://mowgli.ai'
#1772301302
dns-server wl 'https://mowgli.ai'
#1772301345
dns-server wl 'https://mowgli.ai'
#1772301437
cls;dns-server wl 'https://mowgli.ai'
#1772301507
declare  -p PS{1..4}
#1772301523
cls;dns-server wl 'https://mowgli.ai'
#1772303314
ack write-region ~/.emacs.d/c/
#1772303348
cd
#1772303351
cd .emacs.d/c
#1772303353
lll
#1772303354
git st
#1772303355
ll
#1772303533
ll
#1772303538
ll
#1772303541
cd ..
#1772303542
ll
#1772303544
cd -
#1772303544
git st
#1772303553
git add debug-regexp-history-vars.el 
#1772303554
git st
#1772303558
git q
#1772303568
git st
#1772303587
cls;dns-server wl 'https://mowgli.ai'
#1772303649
cls;dns-server wl 'https://mowgli.ai'
#1772303692
cls;cls;dns-server wl 'https://mowgli.ai'
#1772303827
git status --porcelain 
#1772303832
ll
#1772303836
> tmpdeleteme
#1772303837
ll
#1772303840
git status --porcelain 
#1772304706
cd
#1772308636
cd ~/.emacs.d/c/
#1772308636
git st
#1772308639
git add .
#1772308640
git q
#1772310385
cd ./staging/
#1772310387
ll
#1772310387
git st
#1772310388
git add .
#1772310485
git st
#1772310490
git diff
#1772310493
git whatchanged 
#1772310501
git commit -a --amend -C HEAD
#1772313720
ll ~/.emacs.d/c/staging/save-*
#1772313733
bat ~/.emacs.d/c/staging/save-*
#1772313766
bat ~/.emacs.d/c/staging/save-*
#1772315501
workbench
#1772315521
pushmkd ~/workbench/$(today)
#1772315561
cdmkd ./research-macos-kext-driverkit-hopefully-rust-examples
#1772315594
launch_emacs_desktop 
#1772316519
echo $BASH_REMATCH 
#1772316523
echo ${BASH_REMATCH} 
#1772316755
bashint asd
#1772316759
bashint asd/asd
#1772316819
bashint asd/asd
#1772316889
bashint asd/asd
#1772316908
bashint asd/asd
#1772316929
bashint asd/asd
#1772316933
bashint aaaa/asd
#1772316936
bashint aaaa/bbbb
#1772316951
bashint aaaa/bbbb
#1772316980
bashint aaaa/bbbb
#1772317166
declare -p ${!HIST*}
#1772317445
bashint 
#1772317497
bashint 
#1772317537
bashint 
#1772317635
bashint 
#1772317662
bashint 
#1772317718
bashint 
#1772317765
bashint 
#1772317827
bashint 
#1772317851
bashint 
#1772318009
bashint
#1772318023
bashint 
#1772318024
ls
#1772318029
bashint 
#1772318060
bashint 
#1772318136
bashint 
#1772318236
pushmkd ~/workbench/$(today)
#1772318237
ll
#1772318251
pushmkd ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772318254
bashint 
#1772318343
ll
#1772318344
git t
#1772318353
git add bash-interactive-2026-02-28_22-*
#1772318354
git st
#1772318356
git q
#1772318359
ll
#1772318363
bat bash-interactive-2026-02-28_22-37-34_UTC.history
#1772318385
which yt-dlp 
#1772318392
which pip
#1772318407
~/.shell.d/.venv/bin/pip install -U yt-dlp
#1772318415
cd ~/.shell.d/
#1772318419
ll
#1772318421
ll .venv/
#1772318424
ll .venv/bin/
#1772318432
ls -l .venv/bin/
#1772318437
.venv/bin/yt-dlp
#1772318461
uv pip 
#1772318473
uv add --help
#1772318499
uv add -U yt-dlp pip
#1772319013
pushmkd ~/workbench/$(today)
#1772319038
1>urls-to-unblock-in-dns.txt echo '
https://sf-saas.cdn-apple.com/2.4.0-beta.0/animations/all.css
https://www.apple.com/wss/fonts?families=SF+Pro,v3|SF+Pro+Icons,v3
https://www.apple.com/wss/fonts?family=SF+Mono&v=2
https://devimages-cdn.apple.com/wwdc-services/images/48/2712/2712_wide_900x506_2x.jpg
https://securemetrics.apple.com/b/ss/awdappledeveloper/1/JS-2.27.0/s34117501071635?AQB=1&ndh=1&pf=1&t=28%2F1%2F2026%2019%3A49%3A34%206%20180&fid=140CB976C306C886-39B5C1043F6356BE&ce=UTF-8&pageName=system%20extensions%20and%20driverkit%20-%20wwdc19%20-%20videos&g=https%3A%2F%2Fdeveloper.apple.com%2Fvideos%2Fplay%2Fwwdc2019%2F702%2F&r=https%3A%2F%2Fwww.google.com%2F&c.&getValOnce=3.1&.c&cc=USD&ch=www.videos.developer&server=new%20approach%20legacy&h1=www.videos.developer&c4=D%3Dg&c5=MacIntel%202x&c6=D%3D%22%3A%20%22%2BpageName&c9=10.15.x&c14=system%20extensions%20and%20driverkit%20-%20wwdc19%20-%20videos&c17=52%3A52&c25=third%20party&c28=790&v49=https%3A%2F%2Fwww.google.com%2F&v54=https%3A%2F%2Fdeveloper.apple.com%2Fvideos%2Fplay%2Fwwdc2019%2F702%2F&s=1440x900&c=30&j=1.6&v=N&k=Y&bw=1440&bh=150&AQE=1
https://devstreaming-cdn.apple.com/videos/wwdc/2019/702vygott3n041/702/hls_vod_mvp.m3u8
https://devstreaming-cdn.apple.com/videos/wwdc/2019/702vygott3n041/702/hls_vod_mvp.m3u8?27564
https://devstreaming-cdn.apple.com/videos/wwdc/2019/702vygott3n041/702/hls_vod_mvp.m3u8?27564
https://cma.itunes.apple.com/rtcjs/v1
'
#1772319105
git st
#1772319106
git init
#1772319107
git add .
#1772319110
git st
#1772319116
find . -name .git
#1772319124
git rm -rf --cached ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772319125
git st
#1772319129
git q
#1772319148
pushd ~/opt/libexec/
#1772319149
git st
#1772319153
git dh dns-server
#1772319217
git whatchanged dns-server
#1772319220
git whatchanged -p dns-server
#1772319250
git whatchanged -p dns-server
#1772319280
git st
#1772319290
git commit dns-server -m 'broken: dns-server'
#1772319294
git checkout 0e4470895b987a5c63a1d51f234ebb441ad1f4dd -- dns-server
#1772319303
for url in urls-to-unblock-in-dns.txt ; do dns-server wl "${url}"; done
#1772319319
git st
#1772319901
cd ~/.shell.d/
#1772319905
dirs 
#1772319909
cd -
#1772319914
pushd ~/.shell.d/
#1772319915
dirs
#1772319934
cd /opt/media/
#1772319939
ll /opt/
#1772319962
sudo chown  gabrielfalcao:wheel /opt/
#1772319988
cls;sudo find /opt -type d -exec  chown -v gabrielfalcao:wheel {} \;
#1772320026
cls;sudo find /opt -type d -exec  bash -c 'exec 2>/dev/null 1>/dev/null;
 chown gabrielfalcao:wheel {}' \;
#1772320041
cls;sudo find /opt -type d -exec  bash -c 'exec 2>/dev/null 1>/dev/null;
 chown gabrielfalcao:wheel {} &
disown -a
' \;
#1772320065
cls;sudo find /opt -type d -exec  bash -c 'exec 2>/dev/null 1>/dev/null;
 chown gabrielfalcao:wheel {}' \; &
#1772320067
disown -a
#1772320070
jobs 
#1772320082
pushd /opt/media/
#1772320085
pushd /opt/gnu
#1772320087
ll
#1772320090
pushd /opt/g
#1772320091
ll
#1772320100
pushd ~/.shell.d/
#1772320102
dirs
#1772320115
declare -p | grep -E /opt/gnu
#1772320122
env | grep -E /opt/gnu
#1772320125
dirs
#1772320136
env | ack /opt
#1772320144
dirs
#1772320149
help dirs
#1772320162
dirs -p
#1772320169
dirs -v
#1772320178
git st
#1772320185
bat tmpdeleteme 
#1772320189
file tmp*
#1772320196
git clean -f
#1772320197
git st
#1772320201
git add .
#1772320202
gi tst
#1772320203
git st
#1772320211
git status --porcelain 
#1772320217
git status --porcelain  | grep -E ^A
#1772320237
git status --porcelain  | grep -E ^A | lastcol  | xargs git commit -m tailsyslogs.sh 
#1772320239
git st
#1772320252
git commit -am  'WIP/broken'
#1772320275
git diff
#1772320287
git restore entrypoint.sh 
#1772320336
git diff
#1772320347
git commit entrypoint.sh -m 'cleanup commented lines'
#1772320403
git st
#1772320407
git diff
#1772320421
git st
#1772320423
git restore entrypoint.sh 
#1772320541
qgit st
#1772320542
git diff
#1772320550
git commit -am 'cleanup more commments'
#1772320583
ack shell_d_load_source entrypoint.sh
#1772320656
ack ^shell_d_load_ entrypoint.sh
#1772320659
ack ^shell_d_ entrypoint.sh
#1772320855
git st
#1772320856
git add .
#1772320865
git st
#1772320866
git diff
#1772320876
git st
#1772320879
git restore entrypoint.sh 
#1772320888
ll
#1772320889
git st
#1772320890
git dh
#1772320893
git st
#1772320895
git q
#1772321223
git st
#1772321224
git add .
#1772321227
git diff
#1772321991
git diff
#1772322025
which path
#1772322070
~/.cargo/bin/pat
#1772322073
~/.cargo/bin/pat --help
#1772322084
~/.cargo/bin/pat --helph
#1772322087
~/.cargo/bin/path --help
#1772322093
~/.cargo/bin/path env --help
#1772322143
cd path-finder
#1772322144
git st
#1772322146
ll
#1772322146
dua
#1772322148
cargo run
#1772322160
emacsclient -n src/env.rs 
#1772322183
git st
#1772322211
git commit-am 'fixes: "error: invalid value 'false' for '--mac-os-apps': invalid os platform: "false"'
#1772322213
git commit -am 'fixes: "error: invalid value 'false' for '--mac-os-apps': invalid os platform: "false"'
#1772322217
cargo ip
#1772322226
ll
#1772322221
cargo run
#1772322240
cp target/debug/path ~/.cargo/bin/path
#1772322339
ack '(user_home_use_variable|user_home_use_ssh)'
#1772322343
ack '(user_home_use_variable|user_home_use_ssh)' src/
#1772322345
ack '(user_home_use_variable|user_home_use_ssh)' src/
#1772322394
cargo run
#1772322399
cp target/debug/path ~/.cargo/bin/path
#1772322439
git st
#1772322443
git clean -f
#1772322445
git diff
#1772322451
git commit -am 'fix conflict'
#1772322459
git st
#1772322478
cd path-finder
#1772322479
git st
#1772322485
cargo ip && exit
#1772322527
git st
#1772322554
echo -e '\n/logs' >> .gitignore 
#1772322554
git st
#1772322557
git add .
#1772322558
git dh
#1772322564
git st
#1772322568
git q
#1772322605
ll logs/
#1772322608
ll logs/2026-02-28/entrypoint.pid_*
#1772322648
git st
#1772322653
git clean -Xdf logs/
#1772322664
git clean -Xdf logs/
#1772323276
git st
#1772323282
git q
#1772323311
git st
#1772323313
git whatchanged -p
#1772323317
git commit -a --amend -C HEAD
#1772323318
git log
#1772323325
git st
#1772323359
cp ~/.cargo/bin/path ~/.shell.d/x.d/path.stable.$(git log -q --format=%h)
#1772323400
git st
#1772323401
cp ~/.cargo/bin/path ~/.shell.d/x.d/path.stable.$(git log -q --format=%h | xargs printf '%s')
#1772323412
cp ~/.cargo/bin/path ~/.shell.d/x.d/path.stable.$(git log -1 --format=%h | xargs printf '%s')
#1772323413
ll
#1772323419
git st
#1772323426
git add .
#1772323426
git q
#1772323428
git st
#1772323437
git st
#1772323470
bat company-box-1.bkp 
#1772323478
git add bashint 
#1772323483
git commit bashint -m bashint
#1772323483
git st
#1772323497
git add git-status-porcelain.gawk*
#1772323502
git commit git-status-porcelain.gawk* -m git-status-porcelain.gawk
#1772323503
git st
#1772323506
git dh
#1772323528
git restore --staged -- dns-server 
#1772323530
git restore -- dns-server 
#1772323531
git st
#1772323545
git add column-command-from-ps-aux 
#1772323547
git commit column-command-from-ps-aux -m column-command-from-ps-aux
#1772323548
git st
#1772323552
git clean -f
#1772323553
git st
#1772323556
git add -p
#1772323561
git st
#1772323641
cd /opt/homebrew/etc/
#1772323641
git st
#1772323643
git whatchanged 
#1772323645
ll
#1772323651
git path
#1772323658
cd ..
#1772323659
ll
#1772323666
cat .git
#1772323668
ll .git
#1772323677
git path
#1772323680
ll .git
#1772323686
cd ..
#1772323696
find . -path '*/ORIG_HEAD'
#1772323721
cd -
#1772323722
ll
#1772323730
cd /opt/homebrew/etc/
#1772323731
ll
#1772323732
git st
#1772323735
ll
#1772323742
path canon dnsmasq.main.conf
#1772323779
pushdmkd ~/workbench/$(today)
#1772323780
ll
#1772323782
cd ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772323783
git st
#1772323784
ll
#1772323789
cat urls.txt 
#1772323793
cd ..
#1772323793
ll
#1772323798
bat urls-to-unblock-in-dns.txt
#1772323842
sed -n -E 's,(https://([^/]+))(.*)/\1/gp' urls-to-unblock-in-dns.txt 
#1772323847
sed -n -E 's,(https://([^/]+))(.*),\1,gp' urls-to-unblock-in-dns.txt 
#1772323851
ll
#1772323852
git st
#1772323859
git ignore
#1772323860
git ignore add
#1772323861
git st
#1772323862
git q
#1772323868
git add .gitignore 
#1772323870
cp ~/.cargo/bin/path ~/.shell.d/x.d/path.stable.$(git log -q --format=%h | xargs printf '%s')
#1772323872
git q
#1772323874
git st
#1772323880
cd
#1772323881
cd .shell.d/
#1772323881
git st
#1772323882
git clean -f
#1772323884
git st
#1772323885
ll
#1772323893
git whatchanged urls-to-unblock-in-dns.txt
#1772323908
sed -n -E 's,(https://([^/]+))(.*),\1,gp' urls-to-unblock-in-dns.txt | unique-lines 
#1772323914
sed -n -E 's,(https://([^/]+))(.*),\1,gp' urls-to-unblock-in-dns.txt | unique-lines > really
#1772323918
mv really urls-to-unblock-in-dns.txt 
#1772323919
git st
#1772323921
git diff
#1772323924
git commit urls-to-unblock-in-dns.txt -m urls-to-unblock-in-dns.txt 
#1772323934
for url in $(grep https urls-to-unblock-in-dns.txt); do dns-server  wl "${url}"; done
#1772323963
cd /opt/homebrew/etc/
#1772323963
git st
#1772323965
git init
#1772323968
git st
#1772323973
git add dnsmasq*
#1772323974
git st
#1772323979
git commit -am 'dnsmasq conf'
#1772323981
git st
#1772323986
dua
#1772323996
git add .
#1772324000
git commit -am 'other conf'
#1772324002
git st
#1772324025
git st
#1772324031
git diff dns-server
#1772324053
for url in $(grep https urls-to-unblock-in-dns.txt); do dns-server  wl "${url}"; done
#1772324085
hash -r
#1772324110
for url in $(grep https urls-to-unblock-in-dns.txt); do dns-server  wl "${url}"; done
#1772324186
for url in $(grep https urls-to-unblock-in-dns.txt); do dns-server  wl "${url}"; done
#1772324214
for url in $(grep https urls-to-unblock-in-dns.txt); do dns-server  wl "${url}"; done
#1772324289
g p -r chrome -k
#1772324426
cd ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772324766
. ~/.shell.d/fn.staging.d/daemonproc.sh 
#1772324786
daemonproc yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/' 
#1772324791
jobs -p
#1772324793
ll
#1772324816
ps aux | grep yt-
#1772324823
kill 63165
#1772324824
ps aux | grep yt-
#1772324825
ps aux | grep yt-
#1772324848
daemonproc ~/opt/libexec/yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/' 
#1772324850
jobs  -p
#1772324853
ps aux | grep yt-
#1772324862
ps aux 64473
#1772324881
~/opt/libexec/yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/'
#1772324893
dns-server wl https://developer.apple.com
#1772324921
ll ..
#1772324929
cat urls.txt 
#1772324938
grep apple urls.txt
#1772324939
grep apple urls.txt
#1772325002
~/opt/libexec/yt-dlp 'https://www.youtube.com/watch?v=HC-ctzMB66I' &
#1772325007
disown  -a
#1772324898
~/opt/libexec/yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/'
#1772325067
ll
#1772325073
ack 'apple[.]com'
#1772325082
cd ..
#1772325084
ack 'apple[.]com'
#1772325090
ll
#1772325099
git whatchanged -p urls-to-unblock-in-dns.txt
#1772325157
cd ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772325163
~/opt/libexec/yt-dlp 
#1772325164
https://developer.apple.com/videos/play/wwdc2019/702/
#1772325175
~/opt/libexec/yt-dlp  https://developer.apple.com/videos/play/wwdc2019/702/
#1772325193
yt-dlp  -h | batman
#1772325236
dns-server wl https://developer.apple.com/videos/play/wwdc2019/702/
#1772325257
sudo killall -HUP mDNSResponder
#1772325272
~/opt/libexec/yt-dlp 'https://www.youtube.com/watch?v=HC-ctzMB66I' &
#1772325279
~/opt/libexec/yt-dlp  https://developer.apple.com/videos/play/wwdc2019/702/
#1772326640
ll
#1772326644
cd ./developer.apple.com/NA/NA.702-1/
#1772326644
ll
#1772326651
cd -
#1772327137
ord '	 '
#1772327150
ord '	  	'
#1772327157
ord '	  	'
#1772327160
ord '	 '
#1772327166
cls;ord '	 '
#1772327995
ord "$(pbpaste)"
#1772328094
cls;ord "$(pbpaste)" | gawk 'BEGIN{delete lines;} { if (!lines[$NF]) {lines[$NF]=$0}} END { for (key in lines) { print(lines[key])}}'
#1772328142
cls;ord "$(pbpaste)" | gawk 'BEGIN{delete lines;} { if (!lines[$NF]) {lines[$NF]=gensub(/^0/, "\\", "g", $3))}} END { for (key in lines) { print(lines[key])}}'
#1772328152
cls;ord "$(pbpaste)" | gawk 'BEGIN{delete lines;} { if (!lines[$NF]) {lines[$NF]=gensub(/^0/, "\\", "g", $3)}} END { for (key in lines) { print(lines[key])}}'
#1772328165
ipython3 
#1772328169
which ipython3 
#1772328170
ipython3 
#1772329913
dns-server  restart
#1772329968
(export IFS=':'; echo "${PATH}"; )
#1772329979
(export IFS=':'; echo ${PATH} )
#1772329989
(export IFS=':'; printf '%s\n' ${PATH} )
#1772330018
cd
#1772330020
cd ~/.shell.d/
#1772330021
git st
#1772330068
mkdir .bin.bkp
#1772330073
mv x.d/path.stable.e75d352 .bin.bkp
#1772330077
git add -f .bin.bkp
#1772330078
git st
#1772330080
git add .
#1772330081
git st
#1772330086
git whatchanged 
#1772330089
git st
#1772330097
git commit x.d/ .bin.bkp/ --amend -C HEAD
#1772330100
git whatchanged 
#1772330103
git st
#1772330110
git commit -am daemonproc
#1772330164
path env
#1772330166
path env --help
#1772330291
git t
#1772330292
git t
#1772330293
git st
#1772330294
git diff
#1772330302
git restore  x.d/path.sh 
#1772330303
git st
#1772330311
cd ~/workbench/$(today)
#1772330312
ll
#1772330321
mv path-test.sh path-test-$(nowdz).sh 
#1772330322
ll
#1772330328
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772330508
git st
#1772330510
git add .
#1772330510
git q
#1772330514
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772330553
path env --help
#1772330754
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772330770
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772330793
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772330865
cd path-finder
#1772330875
emacsclient -n src/cli/commands/env/command.rs 
#1772330979
rustup  doc std::collections
#1772331061
cargo run -- env PATH
#1772331168
rustup  doc std::string
#1772331331
cargo run -- env PATH
#1772331344
cargo run -- env PATH
#1772331351
cargo run -- env PATH
#1772331355
cargo run -- env PATH
#1772331364
echo ${RUST_BACKTRACE} 
#1772331370
ack RUST_BACKTRACE ~/.shell.d/
#1772331388
ack '^\s*RUST_BACKTRACE' ~/.shell.d/
#1772331405
ack '^[^#]+RUST_BACKTRACE' ~/.shell.d/
#1772331426
ack '^[^#]+RUST_BACKTRACE' ~/.bash*
#1772331474
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772331482
cd path-finder
#1772331483
cargo run
#1772331487
cargo run env -p PATH
#1772331556
cargo run env -p PATH
#1772332671
cargo run env -p PATH
#1772332699
cargo run env -p PATH
#1772332831
1>env.test.sh echo "$(declare -f  cls)" '
cargo run env -p PATH -a ./node_modules/.bin -a ~/opt/libexec -a /opt/homebrew/bin/ -s ${HOME} -s ./ -s /opt
'
#1772332838
chmod +x env.test.sh 
#1772332908
./env.test.sh 
#1772332927
./env.test.sh 
#1772332965
./env.test.sh 
#1772332983
./env.test.sh 
#1772332996
./env.test.sh 
#1772333012
./env.test.sh 
#1772333053
git st
#1772333055
git add .
#1772333056
git st
#1772333104
echo git switch -c path-env-unique-vec-string-from-$(git log -1 --format=%h | xargs printf '%s-' | sed -E 's/[-]+$//g')
#1772333108
git switch -c path-env-unique-vec-string-from-$(git log -1 --format=%h | xargs printf '%s-' | sed -E 's/[-]+$//g')
#1772333109
git st
#1772333116
git dh -- src/
#1772333123
git st
#1772333139
git dh -- src/cli/value_parsers.rs src/cli/commands/mod.rs
#1772333173
git dh -- src/cli/value_parsers.rs src/cli/commands/mod.rs
#1772333176
git st
#1772333197
git commit  src/cli/value_parsers.rs src/cli/commands/mod.rs -m 'silence warnings'
#1772333198
git st
#1772333199
git dh
#1772333204
git commit env.test.sh -m env.test.sh 
#1772333205
git dh
#1772333217
git commit-am 'wip: unique_string_list'
#1772333227
git commit -am 'wip: unique_string_list'
#1772333228
git st
#1772333329
ack --rs  'FromIterator' ~/projects/work/poems.codes/tools/sexprs/
#1772333400
git st
#1772333403
git add src/ordered_string_set.rs 
#1772333404
git st
#1772333405
git clean -f
#1772333409
git st
#1772333412
git add .
#1772333416
git st
#1772333418
git diff
#1772333526
git diff
#1772333529
git st
#1772333531
git add .
#1772333532
git st
#1772333536
./env.test.sh 
#1772333885
./env.test.sh 
#1772333910
./env.test.sh 
#1772334020
./env.test.sh 
#1772334028
./env.test.sh 
#1772334042
./env.test.sh 
#1772334062
./env.test.sh 
#1772334076
./env.test.sh 
#1772334112
cargo doc --open
#1772334119
nohup cargo doc --open &
#1772334122
disown  -a
#1772334154
jobs -p
#1772334266
./env.test.sh 
#1772334426
git st
#1772334431
./env.test.sh 
#1772334436
git q
#1772334437
git switch -
#1772334446
git diff path-env-unique-vec-string-from-d15505d
#1772334458
git checkout path-env-unique-vec-string-from-d15505d -- env.test.sh
#1772334458
git st
#1772334462
git st
#1772334487
git st
#1772334492
git diff path-env-unique-vec-string-from-d15505d
#1772334498
git st
#1772334500
git whatchanged 
#1772334512
git whatchanged -p 
#1772334531
git clean -Xdf src/
#1772334539
git clean -Xdfn .
#1772334558
git clean -Xdf zeroed  .refactorsignore foo Cargo.lock \#find-exec-checklinks.sh# 
#1772334559
git st
#1772334561
git clean -Xdfn .
#1772334564
git clean -Xdf nohup.out 
#1772334565
git clean -Xdfn .
#1772334967
git st
#1772334968
git add .
#1772334969
git q
#1772334983
git switch -c unique_string_list
#1772334986
git switch -
#1772334987
git log
#1772334994
git reset --hard d15505d912d8a371585019b1eb4551a2ddaeb9b1
#1772334999
git switch -
#1772335002
./env.test.sh 
#1772335026
cd regex-bandolier/
#1772335028
find . -name .git
#1772335042
find . -name .git -or -name .gitmodule*
#1772335045
find . -name .git -or -name '.gitmodule*'
#1772335049
git st
#1772335056
git add regex-ast/
#1772335057
git st
#1772335319
cd clap
#1772335322
git remotes
#1772335338
git log
#1772335424
git switch -c master-$(slugify-string "$(git log -1 --format=%h | xargs printf '%s')-$(nowdz | tr '.' '-')")
#1772335430
git switch -
#1772335433
git pull --rebase origin 
#1772335437
git pull --rebase origin master 
#1772335440
git switch 
#1772335442
git switch -
#1772335447
git log -1
#1772335459
git switch -
#1772335467
git log
#1772335475
git log --oneline
#1772335485
git log --format='%H %s'
#1772335488
git log --format='%H %s'
#1772335590
git log --format='%H %s' | gawk 'BEGIN {delete lines; found_row_number=0} { if ($1 ~ /cda1b8531b3b21e7d670fd46eaa0cd8f1fdfd90e/) { found_row_number=NR;}
if (found_row_number==0) {
print
}
}
'
#1772335633
git log --format='%H %s' | gawk 'BEGIN {delete lines; found_row_number=0} { if ($1 ~ /cda1b8531b3b21e7d670fd46eaa0cd8f1fdfd90e/) { found_row_number=NR;}
if (found_row_number==0) {
print
}
}
'
#1772335635
git log --format='%H %s' | gawk 'BEGIN {delete lines; found_row_number=0} { if ($1 ~ /cda1b8531b3b21e7d670fd46eaa0cd8f1fdfd90e/) { found_row_number=NR;}
if (found_row_number==0) {
print
}
}
' | wc -l
#1772335641
ll
#1772335650
cd ./clap_complete
#1772335651
ll
#1772335665
cargo run --example
#1772335679
emacsclient -n examples/completion-derive.rs 
#1772335699
cgit st
#1772335701
git st
#1772335703
./env.test.sh 
#1772335731
./env.test.sh 
#1772335740
./env.test.sh 
#1772335752
rustup doc std::iter
#1772335799
./env.test.sh 
#1772335826
./env.test.sh 
#1772335861
./env.test.sh 
#1772335884
./env.test.sh 
#1772335914
./env.test.sh 
#1772336019
./env.test.sh 
#1772336031
./env.test.sh 
#1772336058
./env.test.sh 
#1772336062
./env.test.sh 
#1772336090
git st
#1772336092
git q
#1772336094
cargo ip
#1772336117
path env PATH -p
#1772336129
path env PATH -p -s $HOME
#1772336131
path env PATH -p -s $HOME | bat
#1772336145
bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772336274
(export IFS=':'; printf '%s\n' ${PATH})
#1772336277
(export IFS=':'; printf '%s\n' ${PATH}) | bat 
#1772336302
path env --help
#1772336353
(export IFS=':'; printf '%s\n' ${PATH}) | bat 
#1772336151
emc path-test-2026-02-28.22-58-41.1772330321.sh
#1772336520
cd path-finder
#1772336522
./env.test.sh 
#1772336550
git st
#1772336555
git diff
#1772336573
git commit 'debug_et_diagnostics::dbg! util'
#1772336576
git commit -am 'debug_et_diagnostics::dbg! util'
#1772336637
find src/ -type f -name '*.rs' -exec sed -E '/^[#]!?[[]allow.*unused/d' {} \;
#1772336640
find src/ -type f -name '*.rs' -exec sed -E '/^[#]!?[[]allow.*unused/d' -i {} \;
#1772336641
git st
#1772336663
find src/ -type f -name '*.rs' -exec sed -E '/[#][!]?\[allow.*unused.*/d' -i {} \;
#1772336664
git st
#1772336684
find src/ -type f -name '*.rs' -exec sed -E '/[#][!][[]allow.*unused.*/d' -i {} \;
#1772336685
git t
#1772336686
git st
#1772336708
find src/ -type f -name '*.rs' -exec sed -E '/[#][!][[]allow[(]unused[)][]]\s*/d' -i {} \;
#1772336709
git st
#1772336725
git st
#1772336729
git clean -Xdfn src/
#1772336746
git st
#1772336748
git add .
#1772336752
git dh
#1772336757
git q
#1772336770
cargo cfb
#1772336772
cargo fb
#1772336790
git st
#1772336804
emacsclient -n src/util.rs 
#1772336813
./env.test.sh 
#1772336833
./env.test.sh 
#1772336865
./env.test.sh 
#1772336877
./env.test.sh 
#1772336909
./env.test.sh 
#1772336937
./env.test.sh 
#1772336963
./env.test.sh 
#1772336982
./env.test.sh 
#1772337010
./env.test.sh 
#1772337042
./env.test.sh 
#1772337058
./env.test.sh 
#1772337080
path env PATH -p
#1772337158
path env PATH -p | grep opt/homebre
#1772337161
path env PATH -p | grep opt/homebre | pbcopy 
#1772337237
path env PATH -p | grep opt/homebre | pbcopy 
#1772337243
./env.test.sh 
#1772337252
./env.test.sh 
#1772337277
./env.test.sh 
#1772337295
./env.test.sh 
#1772337566
rustup doc std::vec::Vec
#1772337974
./env.test.sh 
#1772337984
./env.test.sh 
#1772338030
./env.test.sh 
#1772338045
./env.test.sh 
#1772338084
./env.test.sh 
#1772338121
./env.test.sh 
#1772338152
./env.test.sh 
#1772338163
./env.test.sh 
#1772338184
./env.test.sh 
#1772338196
./env.test.sh 
#1772338231
git st
#1772338234
git dh
#1772338238
git st
#1772338269
git commit -am $'fix: path env\x27s "sort-by"'
#1772338275
git st
#1772338283
cargo ip
#1772338309
cls;bash path-test-2026-02-28.22-58-41.1772330321.sh 
#1772338457
(export IFS=':'; printf '%s\n' ${PATH}) | bat 
#1772338559
cd path-finder
#1772338560
./env.test.sh 
#1772340564
cd ~/.emacs.d/
#1772340565
git st
#1772340570
git q
#1772340572
git add c/staging/
#1772340573
git q
#1772340574
git st
#1772340591
git add c/wip
#1772340592
git st
#1772340593
git q
#1772341221
git st
#1772341222
git diff
#1772341245
cd
#1772341247
cd workbench
#1772341249
ll
#1772341255
mkdir archive
#1772341261
rm -rf ./archive/
#1772341264
cd ~/workbench/
#1772341266
ll
#1772341270
mkdir archive
#1772341275
mv 2025* archive/
#1772341277
git st
#1772341281
git init
#1772341282
git st
#1772341300
1>.gitignore echo -e '

/archive/*
/logs/*
*~
*#*
*.*#*
'
#1772341329
git st
#1772341346
git add --help | batman
#1772341354
git add --dry-run 2026-01-01/
#1772341384
vim .gitignore 
#1772341423
git st
#1772341426
git add --dry-run 2026-01-01/
#1772341434
git st | bat
#1772341439
git add .gitignore .current 
#1772341439
git st
#1772341446
git add *.log *.sh
#1772341447
git st
#1772341460
vim .gitignore 
#1772341482
git st
#1772341491
git add emacs-buffers-177207*
#1772341491
git st
#1772341497
git q
#1772341592
cd
#1772341593
cd ~/.emacs.d/
#1772341594
git st
#1772341600
git add c/boot.el 
#1772341613
git st
#1772341618
git add c/staging/save-buffer-list-wip.el 
#1772341618
git st
#1772341624
git commit c/staging/save-buffer-list-wip.el
#1772341626
git st
#1772341632
git commit -m c/staging/save-buffer-list-wip.el
#1772341634
git st
#1772341636
git diff
#1772341639
git q
#1772341667
launch_emacs_desktop 
#1772341687
cd path-finder
#1772341688
git st
#1772341691
git diff
#1772341694
git log
#1772341696
git st
#1772341706
cargo ip
#1772341722
git st
#1772341725
git add .
#1772341727
cd ~/.shell.d/
#1772341730
git st
#1772341732
git diff
#1772341742
git log
#1772341778
git whatchanged 
#1772341796
cd ~/.shell.d/
#1772341798
git whatchanged 
#1772341808
popd
#1772341809
cd -
#1772341811
git st
#1772341821
git st
#1772341822
git diff
#1772341839
git log
#1772341841
git dh
#1772341848
git commit -am fmt
#1772341861
git log -1 --format=%h
#1772341864
git st
#1772341866
git diff
#1772341905
cp target/release/path ~/.shell.d/.bin.bkp/path.stable.$(git log -1 --format=%h)
#1772341909
git st
#1772341910
git add .bin.bkp/
#1772341911
git st
#1772341913
git add .
#1772341937
git st
#1772341938
git log
#1772341940
git st
#1772341917
git log
#1772341944
git st
#1772341950
git log
#1772341957
git st
#1772341959
git whatchanged 
#1772341971
git st
#1772341976
git whatchanged -p x.d/
#1772341997
git commit -am 'path.sh stable'
#1772341999
git br
#1772342044
git tag path-stable-$(today)
#1772342064
git switch osx-merge-linux-migrate 
#1772342072
git switch -
#1772342073
git br
#1772342083
git switch osx
#1772342108
git switch -
#1772342110
git log
#1772342116
git switch -
#1772342117
git st
#1772342147
git merge --squash 9460f0dae1d26fffccf5e68e3c550dcc8c2f69c5
#1772342150
git st
#1772342160
git diff migrate.sh
#1772342165
git st
#1772342176
git checkout 9460f0dae1d26fffccf5e68e3c550dcc8c2f69c5 -- migrate.sh x.d/aliases.sh x.d/colors.sh
#1772342177
git st
#1772342183
git commit
#1772342198
which emacsclient 
#1772342203
which -a emacsclient 
#1772342209
export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin-arm64-11/emacsclient
#1772342212
git st
#1772342214
git commit
#1772342332
git st
#1772342333
git log
#1772342363
bat .git/COMMIT_EDITMSG 
#1772342373
grep -E '^commit' .git/COMMIT_EDITMSG
#1772342376
grep -E '^commit' .git/COMMIT_EDITMSG | pbcopy 
#1772342460
git st
#1772342466
cp squashlist.txt squashlist.txt.orig
#1772342469
gzip squashlist.txt
#1772342476
base64 squashlist.txt.
#1772342478
base64 squashlist.txtg
#1772342480
base64 squashlist.txt.gz 
#1772342484
base64 squashlist.txt.gz  | wc -l
#1772342500
base64 squashlist.txt.gz  >squashlist.txt.gz.b64
#1772342346
git commit --amend 
#1772342526
git st
#1772342528
git log
#1772342554
git br
#1772342558
git st
#1772342561
git clean -f
#1772342563
git st
#1772342565
git switch -
#1772342566
git st
#1772342580
git br
#1772342588
git switch osx-merge-linux-migrate
#1772342595
git merge --squash  9460f0dae1d26fffccf5e68e3c550dcc8c2f69c5
#1772342596
git st
#1772342601
bat .git/COMMIT_EDITMSG 
#1772342649
grep -E '^commit' squash-list.txt
#1772342657
grep -E '^commit' squash-list.txt | awk '{ print $2 }'
#1772342676
grep -E '^commit' squash-list.txt | awk '{ print $2 }' > squash-commit-list.txt
#1772342689
gzip -9 squash-commit-list.txt 
#1772342701
base64 squash-commit-list.txt.gz 
#1772342707
base64 squash-commit-list.txt.gz  > squash-commit-list.txt.gz.b64
#1772342736
cp squash-commit-list.txt.gz squash-commit-list.txt.orig.gz
#1772342742
gunzip squash-commit-list.txt.gz 
#1772342759
wc -l squash-commit-list.txt squash-commit-list.txt.gz.b64 
#1772342773
git log osx
#1772342800
git log osx-merge-linux-migrate 
#1772342818
git log d2a63fd-refactor-files-with-sed-bisect-2026-02-20
#1772342842
git br
#1772342846
git log osx
#1772342608
git commit
#1772342863
git st
#1772342877
git clean -f
#1772342879
git br
#1772342903
pushdmkd ~/workbench/$(today)
#1772342917
cd mu
#1772342919
cd ..
#1772342937
cp -rfv mu tabtree 
#1772343731
git st
#1772343732
pwd
#1772343735
cd -
#1772343751
woman type
#1772343806
woman type
#1772343810
woman type
#1772343931
woman type
#1772343955
woman type
#1772343967
woman type
#1772344017
woman bat 
#1772344036
woman bat 
#1772344039
woman type
#1772344088
woman bat 
#1772344100
woman type
#1772344136
woman type
#1772344141
woman type
#1772344148
woman type
#1772344181
cd -
#1772344183
cd -
#1772344418
echo ${SHLVL} 
#1772344414
bash
#1772344629
bash --init-file ~/.shell.d/entrypoint.sh -l
#1772345427
cd ~/.shell.d/x.d/
#1772345427
git st
#1772345431
git add ansi-truecolor-tango.sh 
#1772345432
git dh
#1772345442
bash ansi-truecolor-tango.sh
#1772345450
git st
#1772345454
git restore --staged ansi-truecolor-tango.sh 
#1772345456
git restore ansi-truecolor-tango.sh 
#1772345456
git st
#1772345458
bash ansi-truecolor-tango.sh
#1772345774
git st
#1772345779
git add ansi-truecolor-tango.sh.linebreaks.sh
#1772345782
git commit ansi-truecolor-tango.sh.linebreaks.sh -m ansi-truecolor-tango.sh.linebreaks.sh
#1772346279
git st
#1772346285
git add ansi-truecolor-tango.sh*
#1772346294
git commit ansi-truecolor-tango.sh-replace-regexp-*
#1772346311
echo git commit ansi-truecolor-tango.sh-replace-regexp-* -
#1772346314
echo git commit ansi-truecolor-tango.sh-replace-regexp-* 
#1772346325
echo git commit ansi-truecolor-tango.sh-replace-regexp-* -m 'ansi-truecolor-tango.sh-replace-regexp-regexp.el ansi-truecolor-tango.sh-replace-regexp-to-string.el'
#1772346326
git st
#1772346340
git commit ansi-truecolor-tango.sh-* -m 'ansi-truecolor-tango.sh-replace-regexp-regexp.el ansi-truecolor-tango.sh-replace-regexp-to-string.el'
#1772346341
git st
#1772346343
git dh
#1772346352
git st
#1772346378
git commit ansi-truecolor-tango.sh  -m 'cleanup: ansi-truecolor-tango.sh'
#1772346379
git st
#1772346410
git whatchanged 
#1772346415
git commit ansi-truecolor-tango.sh  -m 'cleanup: ansi-truecolor-tango.sh' --amend 
#1772346417
git whatchanged 
#1772346421
git whatchanged -p
#1772350571
bash ansi-truecolor-tango.sh
#1772350608
bash ansi-truecolor-tango.sh
#1772350651
bash ansi-truecolor-tango.sh
#1772350664
bash ansi-truecolor-tango.sh
#1772350676
bash ansi-truecolor-tango.sh
#1772350689
bash ansi-truecolor-tango.sh
#1772350726
bash ansi-truecolor-tango.sh
#1772350751
bash ansi-truecolor-tango.sh
#1772350759
bash ansi-truecolor-tango.sh
#1772350811
bash ansi-truecolor-tango.sh
#1772350814
bash ansi-truecolor-tango.sh
#1772350875
bash ansi-truecolor-tango.sh
#1772350887
bash ansi-truecolor-tango.sh
#1772351004
bash ansi-truecolor-tango.sh
#1772351041
bash ansi-truecolor-tango.sh
#1772351061
help printf
#1772351163
help printf
#1772351165
bash ansi-truecolor-tango.sh
#1772351184
bash ansi-truecolor-tango.sh
#1772351187
bash ansi-truecolor-tango.sh
#1772351191
bash ansi-truecolor-tango.sh
#1772351211
bash ansi-truecolor-tango.sh
#1772351220
bash ansi-truecolor-tango.sh
#1772351224
bash ansi-truecolor-tango.sh
#1772351289
bash ansi-truecolor-tango.sh
#1772351295
bash ansi-truecolor-tango.sh
#1772351316
bash ansi-truecolor-tango.sh
#1772351359
wc -c <<< "$(pbpaste)"
#1772351368
wc -c <<< "$(pbpaste)"
#1772351370
bash ansi-truecolor-tango.sh
#1772351412
bash ansi-truecolor-tango.sh
#1772351441
bash ansi-truecolor-tango.sh
#1772351445
bash ansi-truecolor-tango.sh
#1772351477
bash ansi-truecolor-tango.sh
#1772351485
bash ansi-truecolor-tango.sh
#1772351504
bash ansi-truecolor-tango.sh
#1772351511
bash ansi-truecolor-tango.sh
#1772351549
bash ansi-truecolor-tango.sh
#1772351577
bash ansi-truecolor-tango.sh
#1772351585
bash ansi-truecolor-tango.sh
#1772351600
bash ansi-truecolor-tango.sh
#1772351611
bash ansi-truecolor-tango.sh
#1772351632
bash ansi-truecolor-tango.sh
#1772351652
bash ansi-truecolor-tango.sh
#1772351661
bash ansi-truecolor-tango.sh
#1772351671
bash ansi-truecolor-tango.sh
#1772351718
bash ansi-truecolor-tango.sh
#1772351726
bash ansi-truecolor-tango.sh
#1772351745
bash ansi-truecolor-tango.sh
#1772351755
bash ansi-truecolor-tango.sh
#1772351759
bash ansi-truecolor-tango.sh
#1772351767
bash ansi-truecolor-tango.sh
#1772351782
bash ansi-truecolor-tango.sh
#1772351796
bash ansi-truecolor-tango.sh
#1772351861
bash ansi-truecolor-tango.sh
#1772351878
bash ansi-truecolor-tango.sh
#1772351961
bash ansi-truecolor-tango.sh
#1772351969
bash ansi-truecolor-tango.sh
#1772352068
bash ansi-truecolor-tango.sh
#1772352076
bash ansi-truecolor-tango.sh
#1772352111
bash ansi-truecolor-tango.sh
#1772352140
bash ansi-truecolor-tango.sh
#1772352149
bash ansi-truecolor-tango.sh
#1772352239
bash ansi-truecolor-tango.sh
#1772352268
bash ansi-truecolor-tango.sh
#1772352282
bash ansi-truecolor-tango.sh
#1772352315
bash ansi-truecolor-tango.sh
#1772352329
bash ansi-truecolor-tango.sh
#1772352344
bash ansi-truecolor-tango.sh
#1772352349
bash ansi-truecolor-tango.sh
#1772352352
bash ansi-truecolor-tango.sh
#1772352355
bash ansi-truecolor-tango.sh
#1772352390
A
#1772352392
reset
#1772352394
bash ansi-truecolor-tango.sh
#1772352411
bash ansi-truecolor-tango.sh
#1772352417
bash ansi-truecolor-tango.sh
#1772352436
bash ansi-truecolor-tango.sh
#1772352455
bash ansi-truecolor-tango.sh
#1772352460
bash ansi-truecolor-tango.sh
#1772352468
bash ansi-truecolor-tango.sh
#1772352470
bash ansi-truecolor-tango.sh
#1772352481
bash ansi-truecolor-tango.sh
#1772352496
bash ansi-truecolor-tango.sh
#1772352503
bash ansi-truecolor-tango.sh
#1772352534
bash ansi-truecolor-tango.sh
#1772352539
bash ansi-truecolor-tango.sh
#1772352584
bash ansi-truecolor-tango.sh
#1772352591
bash ansi-truecolor-tango.sh
#1772352617
bash ansi-truecolor-tango.sh
#1772352621
bash ansi-truecolor-tango.sh
#1772352624
bash ansi-truecolor-tango.sh
#1772352652
bash ansi-truecolor-tango.sh
#1772352686
bash ansi-truecolor-tango.sh
#1772352694
bash ansi-truecolor-tango.sh
#1772352697
bash ansi-truecolor-tango.sh
#1772352747
bash ansi-truecolor-tango.sh
#1772352754
bash ansi-truecolor-tango.sh
#1772352770
bash ansi-truecolor-tango.sh
#1772352783
bash ansi-truecolor-tango.sh
#1772352807
bash ansi-truecolor-tango.sh
#1772352832
bash ansi-truecolor-tango.sh
#1772352851
bash ansi-truecolor-tango.sh
#1772352869
bash ansi-truecolor-tango.sh
#1772352873
bash ansi-truecolor-tango.sh
#1772352901
bash ansi-truecolor-tango.sh
#1772352914
bash ansi-truecolor-tango.sh
#1772352923
bash ansi-truecolor-tango.sh
#1772352937
bash ansi-truecolor-tango.sh
#1772352952
bash ansi-truecolor-tango.sh
#1772353029
bash ansi-truecolor-tango.sh
#1772353049
bash ansi-truecolor-tango.sh
#1772353068
git whatchanged -p ansi-truecolor-tango.sh
#1772353094
bash ansi-truecolor-tango.sh
#1772353104
bash ansi-truecolor-tango.sh
#1772353106
bash ansi-truecolor-tango.sh
#1772353121
bash ansi-truecolor-tango.sh
#1772353131
bash ansi-truecolor-tango.sh
#1772353165
bash ansi-truecolor-tango.sh
#1772353179
bash ansi-truecolor-tango.sh
#1772353187
bash ansi-truecolor-tango.sh
#1772353211
bash ansi-truecolor-tango.sh
#1772353252
bash ansi-truecolor-tango.sh
#1772353283
bash ansi-truecolor-tango.sh
#1772353319
bash ansi-truecolor-tango.sh
#1772353334
bash ansi-truecolor-tango.sh
#1772353344
bash ansi-truecolor-tango.sh
#1772353357
wc -c <<< "$(pbpaste)"
#1772353377
wc -c <<< "$(pbpaste)"
#1772353379
bash ansi-truecolor-tango.sh
#1772353388
bash ansi-truecolor-tango.sh
#1772353422
bash ansi-truecolor-tango.sh
#1772353442
bash ansi-truecolor-tango.sh
#1772353472
bash ansi-truecolor-tango.sh
#1772353482
bash ansi-truecolor-tango.sh
#1772353491
git st
#1772353566
dns-server  restart
#1772353571
pushdmkd ~/workbench/$(today)
#1772353587
pushdmkd ~/workbench/2026-02-28/
#1772353587
ll
#1772353590
bat urls-to-unblock-in-dns.txt 
#1772353594
cd ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772353594
ll
#1772353606
cat urls.txt 
#1772353618
grep -E '(apple|youtube)' urls.txt 
#1772353621
cls;grep -E '(apple|youtube)' urls.txt 
#1772353634
batu
#1772353636
bat urls.txt 
#1772353679
ack 'https.*(youtube|apple)' 
#1772353694
gzip -9 bash-interactive-2026-02-28_22-*
#1772353696
ll
#1772353704
gzip -9 *.log
#1772353715
ll
#1772353718
ack 'https.*(youtube|apple)' 
#1772353720
ack 'https.*(youtube|apple)'  -l
#1772353724
rm nohup.out 
#1772353731
ack 'https.*(youtube|apple)'  -l
#1772353740
cd ..
#1772353742
ack 'https.*(youtube|apple)'  -l
#1772353767
ack 'https.*(youtube|apple)'  
#1772353776
cd -
#1772353797
jq '.|keys' ./developer.apple.com/NA/NA.702-1/System\ Extensions\ and\ DriverKit\ -\ WWDC19\ -\ Videos\ -\ Apple\ Developer\ \(1\)mkv.info.json 
#1772353817
jq '.webpage_url' ./developer.apple.com/NA/NA.702-1/System\ Extensions\ and\ DriverKit\ -\ WWDC19\ -\ Videos\ -\ Apple\ Developer\ \(1\)mkv.info.json 
#1772353821
jq -r '.webpage_url' ./developer.apple.com/NA/NA.702-1/System\ Extensions\ and\ DriverKit\ -\ WWDC19\ -\ Videos\ -\ Apple\ Developer\ \(1\)mkv.info.json 
#1772353835
which yt-dlp 
#1772353839
yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/'
#1772353858
pwd
#1772353862
cd ./developer.apple.com/
#1772353937
cd ./developer.apple.com/
#1772353933
dns-server restart
#1772353864
yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/'
#1772354000
ll
#1772354003
dua
#1772354019
dua NA/ developer.apple.com/NA/
#1772354021
cd developer.apple.com/NA/
#1772354022
ll
#1772354023
cd ./NA.702-1/
#1772354024
ll
#1772354029
slugify-filenames 
#1772354030
ll
#1772354038
dua
#1772354042
slugify-filenames 
#1772354044
ll
#1772354047
dua
#1772354052
mv System-Extensions-and-DriverKit-WWDC19-Videos-Apple-Developer-1-mkv-fhls-16465-mp4 System-Extensions-and-DriverKit-WWDC19-Videos-Apple-Developer-1-mkv-fhls-16465.mp4
#1772354056
file System-Extensions-and-DriverKit-WWDC19-Videos-Apple-Developer-1-mkv-fhls-16465.mp4
#1772354098
st
#1772354101
cd -
#1772354102
cd ..
#1772354104
cd ..
#1772354106
ll
#1772354107
dua
#1772354113
rm -rf developer.apple.com/
#1772354128
~/.shell.d/.venv/bin/yt-dlp 'https://developer.apple.com/videos/play/wwdc2019/702/'
#1772354889
ll
#1772354904
env | grep cache
#1772354912
declare  -p | grep -i cache
#1772354918
ll
#1772354928
slugify-filenames System\ Extensions\ and\ DriverKit\ -\ WWDC19\ -\ Videos\ -\ Apple\ Developer\ \(1\)\ \[702-1\].mp4 
#1772354930
slugify-filenames 
#1772354931
git st
#1772354934
pwd
#1772354939
ll
#1772354996
mv "System Extensions and DriverKit - WWDC19 - Videos - Apple Developer (1) [702-1].mp4" "$(slugify-string "System Extensions and DriverKit - WWDC19 - Videos - Apple Developer (1) [702-1]").mp4"
#1772354998
git st
#1772354999
ll
#1772355011
mv System-Extensions-and-DriverKit-WWDC19-Videos-Apple-Developer-1-702-1.mp4 ../
#1772355012
cd ..
#1772355013
ll
#1772355015
dua
#1772355022
rm -rf developer-apple-com/
#1772355079
cd ~/.shell.d/
#1772355080
git st
#1772355096
mv x.d/builtin-advices.sh fn.staging.d/
#1772355096
git st
#1772355098
git add .
#1772355102
git commit fn.staging.d/builtin-advices.sh -m fn.staging.d/builtin-advices.sh 
#1772355104
git st
#1772355109
ll
#1772355118
git log --oneline  | wc -l
#1772355132
ll
#1772355139
ack youtube urls.txt 
#1772355153
yt-dlp 'https://www.youtube.com/watch?v=HC-ctzMB66I'
#1772355304
dns-server wl https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015
#1772356243
roku-remote active
#1772356251
roku-remote 
#1772356255
roku-remote list
#1772357283
musgz 
#1772357290
pushd $(musgz -p)
#1772357292
ll
#1772358309
rm -rf ~/godot/dummytmp1/
#1772358466
nowdz | pbcopy 
#1772358791
ipython3
#1772359098
cd
#1772359100
cd godot
#1772359111
~/.shell.d/.venv/bin/yt-dlp 'https://www.youtube.com/watch?v=pw2pDiq2v70'
#1772359183
yt-dlp https://www.youtube.com/watch?v=KfydpMuTBvA
#1772359196
yt-dlp 'https://www.youtube.com/watch?v=pw2pDiq2v70'
#1772359210
vim /opt/homebrew/etc/dnsmasq.conf
#1772359225
dns-server restart
#1772359232
yt-dlp https://www.youtube.com/watch?v=KfydpMuTBvA
#1772359233
yt-dlp 'https://www.youtube.com/watch?v=pw2pDiq2v70'
#1772359584
yt-dlp [ https://www.youtube.com/watch?v=pw2pDiq2v70'
#1772359587
yt-dlp 'https://www.youtube.com/watch?v=pw2pDiq2v70'
#1772359608
pip install -U youtube-dl
#1772359612
pip install -U yt-dlp
#1772359630
launch_emacs_desktop 
#1772359639
yt-dlp 'https://www.youtube.com/watch?v=pw2pDiq2v70'
#1772359679
ll
#1772359647
yt-dlp https://www.youtube.com/watch?v=KfydpMuTBvA
#1772359687
ll
#1772359704
cd ./youtube.com/
#1772359705
slugify-filenames -r
#1772359708
slugify-filenames 
#1772359711
ll
#1772359713
slugify-filenames 
#1772359714
ll
#1772359717
slugify-filenames 
#1772359718
ll
#1772359732
find-vids 
#1772359737
cd -
#1772359753
nohup yt-dlp https://www.youtube.com/watch?v=KfydpMuTBvA &
#1772359767
kill -9 92610
#1772359789
yt-dlp https://www.youtube.com/watch?v=KfydpMuTBvA || ~/.shell.d/.venv/bin/yt-dlp 'https://www.youtube.com/watch?v=KfydpMuTBvA'
#1772359811
ll
#1772359829
cd
#1772359836
ll
#1772359840
cd ./research-macos-kext-driverkit-hopefully-rust-examples/
#1772359841
ll
#1772359845
ack youtube
#1772359928
ll
#1772359861
yt-dlp 'https://www.youtube.com/watch?v=HC-ctzMB66I' || ~/.shell.d/.venv/bin/yt-dlp 'https://www.youtube.com/watch?v=HC-ctzMB66I'
#1772360401
roku-remote active
#1772360405
roku-remote 
#1772360411
roku-remote list
#1772360418
roku-remote 
#1772360423
roku-remote live
#1772360460
until 2>/dev/null roku-remote list; do cls; sleep 30; done
#1772397108
until 2>/dev/null roku-remote list; do cls; sleep 30; done
#1772397190
ll
#1772397211
slugify-filenames Exploring：\ MacOS\ Kernel\ \(System\)\ Extensions\ \[HC-ctzMB66I\].webm 
#1772397234
slugify-filenames 
#1772397236
ll
#1772397264
for file in *-*; do
echo mv -fv "${file}" "$(sed -E 's/^(.*)[-]([a-z0-9]+)$/\1.\2/g' <<< "${file}")
done
#1772397344
for file in *-*; do
echo mv -fv "${file}" "$(sed -E 's/^(.*)[-]([a-z0-9]+)$/\1.\2/g' <<< "${file})"
done
#1772397358
for file in *-*; do
echo mv -fv "${file}" "$(sed -E 's/^(.*)[-]([a-z0-9]+)$/\1.\2/g' <<< "${file}")"; done
#1772397369
for file in *-*; do
mv -fv "${file}" "$(sed -E 's/^(.*)[-]([a-z0-9]+)$/\1.\2/g' <<< "${file}")"; done
#1772397370
git st
#1772397380
ll
#1772397383
git st
#1772397401
ll
#1772397603
ll
#1772397608
cd ..
#1772397609
ll
#1772344982
~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772397621
~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772344662
bash --noprofile  --init-file ~/.shell.d/entrypoint.sh -l -i
#1772397673
qll
#1772397674
ll
#1772397685
bash ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772397691
emacsclient -n ~/.shell.d/x.d/ansi-truecolor-tango.sh
#1772397701
echo ${EMACS_SOCKET_NAME} 
#1772397770
cd slugify-filenames
#1772397771
git st
#1772397774
git dh
#1772397922
ll
#1772397913
cargo run
#1772398569
dcd
#1772398570
cd
#1772398593
cd godot
#1772398593
ll
#1772398606
cd ./youtube.com/
#1772398607
ll
#1772398611
cd ./iaknihs/video.KfydpMuTBvA/
#1772398612
l
#1772398654
ll
#1772398661
cd ../../
#1772398662
cd ..
#1772398666
cd ./youtube-com/
#1772398667
ll
#1772398669
cd ./Letta-Corporation/
#1772398669
ll
#1772398671
cd ./video-pw2pDiq2v70/
#1772398671
ll
#1772398678
dua
#1772398697
vlc Godot\ UI\ Design\ Basics\ Quick\ \&\ Easy\ Guidemkv.mkv 
#1772397417
ffmpeg -i Exploring-MacOS-Kernel-System-Extensions-HC-ctzMB66I.webm Exploring-MacOS-Kernel-System-Extensions-HC-ctzMB66I.mkv
#1772399157
sg
#1772399158
st
#1772399374
cd
#1772399375
cd godot
#1772399376
ll
#1772399378
rm -rf tmpdummy-2026-03-01.06-47-46/
#1772399554
cdmkd tutorialz
#1772399564
cdmkd ./2d-gravity
#1772399570
pbpaste > urls.txt
#1772399578
sort -u urls.txt 
#1772399588
sort -ru urls.txt  > urls.$(nowdz).txt
#1772399601
for url in $(grep https urls.2026-03-01.18-13-08.1772399588.txt ); do ~/.shell.d/.venv/bin/yt-dlp "${url}"; done
#1772399952
nowdz | pbcopy 
#1772400469
cd ..
#1772400472
cdmkd ./tetris
#1772400483
pbpaste | sort -u > urls.$(nowdz).txt
#1772400492
ll
#1772400563
cd ~/godot/
#1772400564
ll
#1772400577
cdmkd ./tutorialz/tetris/
#1772400580
git clone https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa1ZSWElycWJJaVFDWlpvSlBCckFZeDhCY1Vad3xBQ3Jtc0tuOVA5NXlPbHBnSW8xdE1tOGthbEJjTnZGbnU0WGVmRFhOSTd3cmFvUEFydkRZQkM2dkduX3lMeEgyQlJNV25Hb0ZnZDFfS3Bab0VTa1dSZEpyUnVPR2dVZ09BQy14YmdtUGNld3luX1RpeFhRZk1kNA&q=https%3A%2F%2Fgithub.com%2FDendrobyte%2FTetrisClone&v=7bay0x4vKkc
#1772400588
git clone https://github.com/Dendrobyte/TetrisClone
#1772400605
git clone https://github.com/russs123/tetris_tut
#1772400621
git clone https://github.com/wojciech-bilicki/TetrisTutorial
#1772400670
ll
#1772400690
ll
#1772400691
cd ..
#1772400692
ls
#1772400700
cdmkd changeschene2d
#1772400702
pwd
#1772400841
cdmkd ./makertech-godot-platformer-tutorial
#1772400706
yt-dlp 'https://www.youtube.com/watch?v=sKqtCc_HykM'
#1772400854
~/.shell.d/.venv/bin/yt-dlp 'https://www.youtube.com/watch?v=sbv35boXqac&list=PLMQtM2GgbPEUPlBWKoJQQ29ua8uyr72o5'
#1772400501
for url in $(grep https urls.2026-03-01.18-28-03.1772400483.txt ); do ~/.shell.d/.venv/bin/yt-dlp "${url}"; done
#1772401007
echo "$(pbpaste)" | sort -u > urls.$(nowdz).txt
#1772401009
ll
#1772401126
cd ~/Kino/
#1772401140
~/.shell.d/.venv/bin/yt-dlp 'https://www.youtube.com/watch?v=QpUqpLh0iRw'
#1772401151
chmod -x ~/opt/libexec/yt-dlp 
#1772401154
hash -r
#1772401158
hash -r
#1772401160
hash -r
#1772401161
ll
#1772401169
cd ./makertech-godot-platformer-tutorial/
#1772401170
ll
#1772401172
pwd
#1772401024
for url in $(grep http urls.2026-03-01.18-36-47.1772401007.txt ); do ~/.shell.d/.venv/bin/yt-dlp "${url}"; done
#1772401380
cd ..
#1772401389
cd ..
#1772401428
cdmkd puzzle-tutorials
#1772401444
pbpaste | unique-lines 
#1772401450
pbpaste | sort -u
#1772401465
pbpaste | sort -u > urls.$(nowdz).txt
#1772401472
emacsclient urls.2026-03-01.18-44-25.1772401465.txt 
#1772401478
emacsclient urls.2026-03-01.18-44-25.1772401465.txt 
#1772401491
path canon urls.2026-03-01.18-44-25.1772401465.txt | pbcopy 
#1772401565
git st
#1772401573
bat urls.2026-03-01.18-44-25.1772401465.txt 
#1772401608
ll
#1772401609
bat urls.2026-03-01.18-44-25.1772401465.txt 
#1772401616
for url in $(grep http urls.2026-03-01.18-44-25.1772401465.txt ); do which yt-dlp; done
#1772401649
chmod a+x ~/opt/libexec/yt-dlp 
#1772401659
hash -r
#1772401677
for url in $(grep http urls.2026-03-01.18-44-25.1772401465.txt ); do yt-dlp "${url}" || ~/.shell.d/.venv/bin/yt-dlp "${url}"; done
#1772401724
~/.shell.d/.venv/bin/yt-dlp --version
#1772401730
for url in $(grep http urls.2026-03-01.18-44-25.1772401465.txt ); do yt-dlp "${url}" || ~/.shell.d/.venv/bin/yt-dlp "${url}"; done
#1772402212
chmod -x ~/opt/libexec/yt-dlp
#1772402367
which yt-dlp 
#1772402552
cd ~/Kino/
#1772402560
cdmkd ./emp
#1772402575
(echo;pbpaste;echo) >> urls.txt
#1772402621
(echo;pbpaste;echo) >> urls.txt
#1772402625
(echo;pbpaste;echo) >> urls.txt
#1772402640
(echo;pbpaste;echo) >> urls.txt
#1772402642
(echo;pbpaste;echo) >> urls.txt
#1772402799
mv ~/Downloads/cookies.txt ~/.config/yt-dlp.youtube.cookies.txt
#1772404886
cd ~/godot/tmp-2d-controls-2026-03-01.18-19-13/
#1772411661
cd workbench
#1772411676
mkdir docs
#1772411717
mv ~/projects/work/poems.codes/paas/workbench-monorepo/ ./docs/images
#1772411738
git st
#1772411753
git add .
#1772411757
git st
#1772411769
git rm --cached -rf docs/images/
#1772411771
git st
#1772411774
cd docs/images/
#1772411775
ll
#1772411782
git log
#1772411786
git st
#1772411801
cd ..
#1772411821
mv images/ ../../.old.workbench-paas
#1772411827
ll ../../.old.workbench-paas
#1772411867
rsync -auv --exclude="*/.git/*" --exclude=.git --ignore-errors --progress ../../.old.workbench-paas/ ./
#1772411871
ll
#1772411877
cd ..
#1772411881
mv docs/ assets
#1772411882
mkdir docs
#1772411884
mv assets/ docs/
#1772411986
git st
#1772411990
git switch -
#1772412006
git switch -c import-assets-from-paas-idea
#1772412007
git add .
#1772412008
git st
#1772412011
git q
#1772412014
git switch -
#1772412019
git br
#1772412025
git log add-commands 
#1772412042
git merge --squash add-commands 
#1772412044
git st
#1772412060
git checkout add-commands -- add-command.sh src/main.rs
#1772412061
git st
#1772412064
git dh -- src/main.rs
#1772412071
git dh -- add-command.sh
#1772412095
git st
#1772412105
launch_emacs_desktop 
#1772412166
ll
#1772412167
git st
#1772412174
ack EDITOR ~/.shell.d/
#1772412203
which emacsclient 
#1772412206
which -a emacsclient 
#1772412219
ll /opt/homebrew/bin/emacsclient
#1772412260
which -a emacsclient | xargs -Ieachfile gstat -c '%F: %N' eachfile
#1772412275
cd tools/
#1772412277
cd ../poc/
#1772412296
cargo new --lib bash-script-parser
#1772412303
rm -rf bash-script-parser/
#1772412324
cargo craft -d nom -d pest -d pest-derive bash-script-parser
#1772412429
cargo craft -cm -d crossterm -d ratatui -d regex -d nom -d serde_yaml -d serde_json -d toml nanoemacs
#1772412654
git st
#1772412676
export EDITOR=/opt/homebrew/bin/emacsclient
#1772412696
git br
#1772412754
git log --format=%H add-commands 
#1772412784
git log --format=%H add-commands  | wc -l
#1772412646
cargo craft -cm -d crossterm -d ratatui -d regex -d nom -d serde_yaml -d serde_json -d toml emachspager
#1772412793
git log -45 --format=%H add-commands 
#1772412797
git log -45 --format=%H add-commands  | pbcopy 
#1772412683
git commit
#1772412818
git st
#1772412820
git clean -f
#1772412836
cd regex-bandolier/
#1772412837
pwd
#1772412839
cd ..
#1772412853
mv regex-bandolier/ _regex-bandolier/
#1772412857
cd ../poc/
#1772412888
cargo craft -d '--dev k9' -d regex -d pest -d pest-derive -d nom regex-ast
#1772412912
ll
#1772412902
cargo craft -d 'k9' -d regex -d pest -d pest-derive -d nom regex-ast
#1772412920
vim TODO.md 
#1772412971
git st
#1772412978
git commit -am 'finder sidebar'
#1772412998
cd
#1772413043
find workbench -mindepth 4 -type d -name .git -not -path '*/workbench/*/.git'
#1772413067
find workbench -mindepth 4 -type d -name .git -exec path parent {} \;
#1772413071
3
#1772413073
ll
#1772413093
cd anysexpr/
#1772413201
3
#1772413209
git clone --depth=1 git@github.com:ivg-design/SidebarFavorites.git
#1772414745
uptime
#1772414781
cd poc
#1772414781
ll
#1772414813
ll
#1772414818
ll | lastcol
#1772414826
ll | ansistrip | lastcol
#1772414852
ll | ansistrip | lastcol | tail -6
#1772414868
ll | ansistrip | lastcol | tail -6 | grep -E -v '^[.][.]?$'
#1772414892
for name in $(ll | ansistrip | lastcol | tail -6 | grep -E -v '^[.][.]?$'); do wezterm cli spawn --cwd "$(path canon "${name}")"; done
#1772414937
vim /opt/homebrew/etc/dnsmasq.conf
#1772414975
cd poc
#1772414987
ll | ansistrip | lastcol | tail -6 | grep -E -v '^[.][.]?$'
#1772414992
ll | ansistrip | lastcol | tail -6 | grep -E -v '^[.][.]?$' | pbcopy 
#1772415000
pushdmkd ~/workbench/$(today)
#1772415003
pbp
#1772415004
pbpaste
#1772415022
(echo;pbpaste;echo) > pocs.sh
#1772415027
dns-server restart
#1772415039
launch_emacs_desktop 
#1772415053
ll
#1772415060
emacsclient pocs.sh 
#1772415186
emacsclient pocs.sh 
#1772415194
echo ${EMACS_SOCKET_NAME} 
#1772415204
which emacsclient 
#1772415215
bat /Users/gabrielfalcao/opt/libexec/emacsclient
#1772415224
chmod -x /Users/gabrielfalcao/opt/libexec/emacsclient
#1772415228
hash -r
#1772415240
which emacsclient 
#1772415255
cd pocs
#1772415257
cd poc
#1772415267
path canon regex-ast/
#1772415245
emacsclient pocs.sh 
#1772415335
git st
#1772415339
git st
#1772415344
git path
#1772415347
git init
#1772415352
git st
#1772415364
git add pocs.sh 
#1772415384
git st
#1772415421
git st
#1772415423
git add .
#1772415424
git st
#1772415425
git q
#1772415431
sudo reboot
#1772415482
cd regex-ast/
#1772415485
cd
#1772415490
cd godot/tutorialz/
#1772415490
ll
#1772415497
cd ./puzzle-tutorials/
#1772415498
ll
#1772415505
cd slugify-filenames
#1772415506
git st
#1772415509
git br
#1772415520
git diff main
#1772415562
emacsclient src/cli/string.rs 
#1772415569
launch_emacs_desktop 
#1772415580
emacsclient src/cli/string.rs 
#1772415589
git diff main
#1772415640
which slugify-filenames 
#1772415643
cargo ip
#1772415652
cargo ip --force
#1772415768
cd dns-server
#1772415773
ll
#1772415779
cargo deps list
#1772415801
cd dns-servers/
#1772415817
ll
#1772415818
git st
#1772415821
git path
#1772415824
git init
#1772415825
git st
#1772415828
find . -name .git
#1772415841
cargo features -h
#1772415847
cd dns-server
#1772415851
cargo features -r hickory-proto
#1772415869
cargo features  hickory-proto
#1772415877
cargo deps list -f json
#1772415883
cargo deps list -f 
#1772415885
cargo deps list -f debug
#1772415887
cargo deps list -f 
#1772415893
cargo deps list -f cargo-add
#1772415906
cargo deps list -f json
#1772415915
cargo deps list -f json | jq '.[].name'
#1772415933
cargo deps list -f json | jq -r '.[].name | select( . | contains("hickory"))'
#1772415944
cargo deps list -f json | jq -r '.[].name | select( . | contains("hickory"))' | pbcopy 
#1772415956
(echo;pbpaste ;echo) > reverses.txt
#1772415982
git st
#1772415984
git diff
#1772415961
for name in $(cat reverses.txt 
); do cargo features -r "${name}" && cargo features "${name}"; done
#1772415995
cargo cbt --help
#1772416011
ll
#1772416029
bat https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
#1772416039
jq '. | keys' https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
#1772416044
jq '.[0] | keys' https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
#1772416006
cargo cbt 
#1772416062
jq '.[].crate | keys' https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
#1772416065
jq '.[].crate' https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
#1772416081
ll
#1772416090
cdmkd reverse-deps-of-hickory
#1772416101
mv ../reverses.txt .
#1772416104
mv ../*.json .
#1772416110
st
#1772416124
cd ..
#1772416131
pushdmkd ~/workbench/$(today)
#1772416135
cdmkd ./delte
#1772416164
dua i ~/projects/work/poems.codes  | ansistrip | xargs rm -rfv
#1772416195
dua i ~/\*scratch\*/.x/ ~/Downloads/ ~/workbench/ ~/projects/work/poems.codes  | ansistrip | xargs rm -rfv
#1772417185
dua god
#1772416211
dua i  ~/\*scratch\*/.x/ ~/Downloads/ ~/workbench/ ~/projects/work/poems.codes ~/projects/third_party ~/projects/personal/  | ansistrip | xargs rm -rfv
#1772417186
dua godot/
#1772417286
ll /opt/g/libexec/
#1772417289
ll /opt/gnu/
#1772417292
ll /opt/gnu/bin/
#1772417296
ll /opt/
#1772417298
ll /opt/bin/
#1772417306
ll /opt/libexec/
#1772417317
find /opt/ -name slugify-filenames
#1772417322
find -type f /opt/ -name slugify-filenames
#1772417328
find /opt -type f/ -name slugify-filenames
#1772417332
find /opt -type f -name slugify-filenames
#1772417363
st
#1772417470
ll /Volumes/nothing/APFEL
#1772417504
backup. 
#1772417509
st
#1772417528
df -h
#1772417647
backup. 
#1772417683
declare -a  backup_paths=()
#1772417695
declare -A  backup_paths=()
#1772417700
unset backup_paths 
#1772417701
declare -A  backup_paths=()
#1772417739
backup_paths["$(path canon ~/godot)"]="$(path canon ~/godot)"
#1772417745
backup_paths["$(path canon ~/projects)"]="$(path canon ~/projects)"
#1772417788
pushdmkd ~/workbench/$(today)
#1772417805
cdmkd ./backup-nothing-$(nowdz)
#1772417831
1>backup.stdout 2>backup.stderr bash -c 'set -umeTE; set -o pipefail;
rsync -puacvot --ignore-errors --progress /Users/gabrielfalcao/godot/ /Volumes/nothing/APFEL/godot/ ; rsync -puacvot --ignore-errors --progress /Users/gabrielfalcao/projects/ /Volumes/nothing/APFEL/projects/
' &
#1772417843
disown -a
#1772417844
ll
#1772417866
du
#1772417868
cd ..
#1772417869
dua
#1772417871
dua i
#1772417886
cd ./tetris/
#1772417887
ll
#1772417891
bat urls.2026-03-01.18-28-03.1772400483.txt 
#1772417897
ack --txt playlist
#1772417901
ack playlist
#1772417902
cd ..
#1772417904
ack --txt playlist
#1772417908
cd ./puzzle-tutorials/
#1772417911
ll
#1772417918
cd slugify-filenames
#1772417919
git st
#1772417923
git clean -f
#1772417924
git dh
#1772417935
git st
#1772419238
st
#1772419255
cd /Volumes/nothing/APFEL/godot/
#1772419264
git st
#1772419267
git add .
#1772419268
pwd
#1772419269
dua
#1772419281
rm backup.std*
#1772419285
> backup.sh
#1772419305
emacsclient -n backup.sh 
#1772419512
path canon /Volumes/nothing/APFEL
#1772419518
path canon /Volumes/nothing/APFEL/opt/
#1772419634
git st
#1772419636
ll
#1772419638
git add .
#1772419638
git q
#1772419696
bash backup.sh 
#1772419717
bash backup.sh 
#1772419729
bash backup.sh 
#1772419759
find ~ -maxdepth 1 -name '.*'
#1772419765
cd vm
#1772419905
cd -
#1772419906
ll
#1772419909
git st
#1772419944
bash backup.sh 
#1772419970
bash backup.sh 
#1772419978
jobs
#1772419986
ps aux | grep rsync
#1772419996
ps aux | grep rsync | grep -v grep | awk '{print $2}'
#1772420008
declare -a pids=( $(ps aux | grep rsync | grep -v grep | awk '{print $2}' ) )
#1772420014
kill -9 ${pids[@]}
#1772420016
sudo kill -9 ${pids[@]}
#1772420027
for pid in ${pids[@]}; do sudo kill -9 ${pid}; done
#1772420063
sudo bash backup.sh &
#1772420068
disown -a
#1772420069
ll
#1772420074
ll
#1772420721
cd ../
#1772420730
cdmkd ./cleanup-devfiles-$(nowdz)
#1772420789
find /Users/gabrielfalcao/projects -type d -regextype egrep -regex '.*/(node_modules|target)' -not -regex  '.*/(node_modules|target)/.*/(node_modules|target)'
#1772420811
cls;find /Users/gabrielfalcao/projects -type d -regextype egrep -regex '.*/(node_modules|target)' -not -regex  '.*/(node_modules|target)/.*/(node_modules|target)' > todelete.txt 
#1772420815
st
#1772420845
dua
#1772420859
dua /Volumes/nothing/APFEL/godot/
#1772420877
ls
#1772420881
dua
#1772420888
rm *.webm
#1772420937
st
#1772420980
sudo su
#1772420951
sudo su
#1772420995
st
#1772421004
cd -
#1772421006
ll
#1772421010
rm *.log
#1772421011
ll
#1772421019
sudo bash backup.sh 
#1772423541
st
#1772423544
eject
#1772423576
cd 
#1772423578
cd godot
#1772423579
ll
#1772423586
cd ./tutorialz/puzzle-tutorials/
#1772423587
ll
#1772423592
rm *.mkv
#1772423601
ll
#1772423625
cd ~/opt/libexec/
#1772423636
git diff yt-dlp
#1772423886
cd -
#1772423887
ll
#1772423897
for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}"; done
#1772423925
for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}"; done
#1772423944
for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}"; done
#1772423980
for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}"; done
#1772423986
for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772423990
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772424011
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772424063
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772424082
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772424100
emacsclient -n urls.2026-03-01.18-44-25.1772401465.txt 
#1772424127
yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424394
ll
#1772424416
ll
#1772424417
dua
#1772424440
dua
#1772424358
yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424533
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  done
#1772424580
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  done
#1772424609
yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424647
yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424720
cls;yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424732
ll
#1772424760
dua
#1772424786
rm *.log
#1772424787
dua
#1772424866
cls;yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424971
cls;yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772424978
dua
#1772424980
dua
#1772424981
dua
#1772425011
cls;yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772425071
cls;yt-dlp $(grep https urls.2026-03-01.18-44-25.1772401465.txt )
#1772425077
dua
#1772425085
pwd
#1772425090
ll
#1772425094
rm *.log
#1772425095
dua
#1772425099
dua i
#1772425112
rm -rf youtube.com/
#1772425113
git st
#1772425118
git add urls.2026-03-01.18-44-25.1772401465.txt 
#1772425121
git path
#1772425126
cd ..
#1772425131
find . -name '*.txt'
#1772425136
find . -name '*.txt' -exec git add {} \;
#1772425137
git st
#1772425139
git q
#1772425140
git st
#1772425181
cd -
#1772425213
dua
#1772425221
dua
#1772425222
dua
#1772425223
dua
#1772425224
dua
#1772425229
bat *.log
#1772425245
dua
#1772425208
yt-dlp $(grep http urls.2026-03-01.18-44-25.1772401465.txt )
#1772425297
yt-dlp $(grep http urls.2026-03-01.18-44-25.1772401465.txt )
#1772425338
ll
#1772425340
dua
#1772425342
dua
#1772425358
ps aux | grep youtube
#1772425375
ps aux | grep yt-dlp
#1772425435
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772425438
ll
#1772425440
dua
#1772425442
rm *.log
#1772425444
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772425454
dua
#1772425480
rm *.log
#1772425481
ll
#1772425513
hash -r
#1772425516
which yt-dlp 
#1772425519
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp "${url}";  break; done
#1772425335
yt-dlp $(grep http urls.2026-03-01.18-44-25.1772401465.txt )
#1772425570
hash -r
#1772425571
which yt-dlp
#1772425614
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp-harness "${url}" || yt-dlp '--cookies-from-browser' 'chrome' '--cookies' "${HOME}/.config/yt-dlp.youtube.cookies.txt" "${url}"; done
#1772425725
ll
#1772425727
bat todelete.txt 
#1772425771
find /Users/gabrielfalcao/projects/ -type d -name  node_modules
#1772425783
find /Users/gabrielfalcao/projects/personal -type d -name  node_modules
#1772425801
cls;find /Users/gabrielfalcao/projects -type d -regextype egrep -regex '.*/(node_modules|target)' -not -regex  '.*/(node_modules|target)/.*/(node_modules|target)' > todelete.$(nowdz).txt 
#1772425804
st
#1772425851
yt-dlp $(grep http urls.2026-03-01.18-44-25.1772401465.txt )
#1772425953
git clone --depth=1 https://github.com/FOG-Studios/PuzzleGameTutorialProject_Godot_4.2
#1772425714
cargo install deno --locked
#1772426153
ssh lan-pi
#1772426129
yt-dlp-harness 'https://www.youtube.com/watch?v=Nn580BBJHdE&list=PLjX_gt5ygPotWd2_CUG2FjkXIls4zQAiT'
#1772426524
st
#1772426555
which yt-dlp
#1772426768
cdmkd ../puzzle-tutorials-moar
#1772426779
(echo;pbpaste ;echo) > urls.$(nowdz).txt
#1772426780
cat urls.2026-03-02.01-46-19.1772426779.txt 
#1772426796
(echo;pbpaste ;echo) | grep youtube | sort -u > urls.$(nowdz).txt
#1772426799
rm urls.2026-03-02.01-46-*
#1772426800
(echo;pbpaste ;echo) | grep youtube | sort -u > urls.$(nowdz).txt
#1772426802
bat urls.2026-03-02.01-46-40.1772426800.txt 
#1772426807
rm urls.2026-03-02.01-46-40.1772426800.txt 
#1772426818
(echo;pbpaste ;echo) | grep 'youtube[.]com' | sort -u # > urls.$(nowdz).txt
#1772426831
(echo;pbpaste ;echo) | grep -E 'https://\w+.youtube[.]com' | sort -u # > urls.$(nowdz).txt
#1772426834
(echo;pbpaste ;echo) | grep -E 'https://\w+.youtube[.]com' | sort -u  > urls.$(nowdz).txt
#1772426865
dua
#1772426846
yt-dlp-harness $(cat urls.2026-03-02.01-47-14.1772426834.txt )
#1772427020
st
#1772427070
which yt-dlp
#1772427077
yt-dlp --version
#1772427080
cls;for url in $(cat urls.2026-03-01.18-44-25.1772401465.txt); do hash -r; yt-dlp  "${url}"; done
#1772427089
cd ../puzzle-tutorials-moar/
#1772427117
bun
#1772427121
bun upgrade
#1772427183
cd ~/opt/libexec/
#1772427184
git st
#1772427189
rm -f yt-dlp
#1772427192
git add yt-dlp-harness 
#1772427195
git rm -f yt-dlp
#1772427196
git st
#1772427201
git add tango-colors.sh 
#1772427204
git commit tango-colors.sh -m tango-colors.sh
#1772427426
3
#1772427434
cd ~/workbench/$(today)
#1772427447
pushd ~/projects/third_party
#1772427451
git clone  --depth=1 git@github.com:kkos/oniguruma.git
#1772427455
cd ./oniguruma/
#1772427456
pwd
#1772427458
popd
#1772427462
ln -s /Users/gabrielfalcao/projects/third_party/oniguruma
#1772427462
ll
#1772427467
cd ./oniguruma
#1772427467
ll
#1772427468
dua
#1772427488
emacsclient -n src/oniggnu.h 
#1772427097
for url in $(grep youtube urls.2026-03-02.01-47-14.1772426834.txt ); do yt-dlp "${url}"; done
#1772427925
cd ../puzzle-tutorials-moar/
#1772427927
ll
#1772427928
dua
#1772427963
cd ~/workbench/2026-03-01/
#1772427963
dua
#1772427967
cd ./backup-nothing-2026-03-01.23-16-45.1772417805/
#1772427968
ll
#1772427984
mkdir logs1
#1772427987
mv *.logs logs1
#1772427993
mv *.log logs1
#1772427994
dua
#1772428003
mv .*.log logs1/
#1772428004
dua
#1772428007
bash backup.sh 
#1772429278
eject
#1772648063
cd
#1772648071
pushdmkd ~/workbench/$(today)
#1772648072
git init
#1772648075
git st
#1772648075
ll
#1772648087
> .gitignore
#1772648088
git add .
#1772648089
git q
#1772648095
git whatchanged 
#1772648519
st
#1772648535
mv ../*.json .
#1772648514
cargo build
#1772648577
for name in $(cat reverses.txt 
); do mkdir -p "./${name}"; (cd "./${name}" &&  cargo features -r "${name}" && cargo features "${name}"); done
#1772648582
mv ../reverses.txt .
#1772648597
ll
#1772648583
for name in $(cat reverses.txt 
); do mkdir -p "./${name}"; (cd "./${name}" &&  cargo features -r "${name}" && cargo features "${name}"); done
#1772648599
cd ..
#1772648601
dua
#1772648609
mkdir json
#1772648611
mv *.json json
#1772648613
git st
#1772648614
ll
#1772648615
dua
#1772648620
git add .
#1772648630
git commit -m $(basename $(pwd))
#1772648632
git st
#1772648636
ll
#1772648657
ls
#1772648688
jq '.[0] | keys' hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json 
#1772648693
jq '. | keys' hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json 
#1772648698
bat hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
#1772648709
bat hickory-proto/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
#1772648714
bat hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json 
#1772648727
jq '.[0]|keys  hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json 
#1772648731
jq '.[0]|keys'  hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json 
#1772648743
jq '.[0]|crate'  hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json 
#1772648750
jq '.[]|.crate'  hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json 
#1772648797
cdmkd hickory-proto-revdeps
#1772648810
jq -r '.[]|.crate'  ../hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json 
#1772648815
for name in $(jq -r '.[]|.crate'  ../hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json ); do mkdir -p "./${name}" && (cd "./${name}" && cargo features -r "${name}"); done
#1772648911
cd
#1772648914
cd ./Kino/
#1772648918
yt-dlp 'https://www.youtube.com/watch?v=qa8zIjimYKI'
#1772648935
ll
#1772648938
rm -rf A\ 12ga.\ Shotgun\ Slug\ Designed\ Like\ an\ ATOM\ BOMB？\ \[qa8zIjimYKI\].f399.mp4.part 
#1772648947
which yt-dlp
#1772648955
cd
#1772648957
cd godot
#1772648957
dua
#1772648963
cd ./tutorialz/
#1772648963
dia
#1772648965
dua
#1772648968
cd ./puzzle-tutorials
#1772648970
cd -
#1772648973
cd ./puzzle-tutorials-moar/
#1772648973
ll
#1772648980
dua
#1772648985
bat urls.2026-03-02.01-47-14.1772426834.txt 
#1772648992
ll | wc -l
#1772648993
ll
#1772649002
ll
#1772649006
ll | wc -l
#1772649271
cd
#1772649286
pushdmkd ~/.shell.d/x.d/colors/
#1772649288
pwd
#1772649330
1>"$(slugify-string 'algorithm to calculate contrast color for RGB values').txt" pbpaste
#1772649350
1>"$(slugify-string 'algorithm to calculate inverse color for RGB values').txt" pbpaste 
#1772649352
git st
#1772649355
git path
#1772649357
git add .
#1772649357
git q
#1772649364
bat algorithm-to-calculate-contrast-color-for-RGB-values.txt 
#1772649442
1>$(slugify-string  'algorithm to hsl color from RGB values') pbpase
#1772649443
1>$(slugify-string  'algorithm to hsl color from RGB values') pbpaste
#1772649445
git st
#1772649446
git add .
#1772649449
git st
#1772649450
ll
#1772649458
mv algorithm-to-hsl-color-from-RGB-values algorithm-to-hsl-color-from-RGB-values.txt
#1772649459
git add .
#1772649460
git q
#1772649535
pbpaste >urls.txt
#1772649556
pbpaste | mu
#1772649560
pbpaste | mu > urls.json
#1772649683
git st
#1772649686
git add urls.*
#1772649687
git q
#1772649705
roku-remote control
#1772649711
roku-remote control
#1772649761
cd regex-ast/
#1772649767
cdmkd ./resources
#1772649784
(echo;pbpaste;echo;) > urls.txt
#1772649785
git add .
#1772649787
git st
#1772649798
git commit . -m resources
#1772649800
cd ..
#1772649800
git st
#1772649802
git q
#1772649810
rm regex-ast/regex_ast.rs 
#1772649815
git st
#1772649818
git restore regex-ast/regex_ast.rs 
#1772649818
git st
#1772649828
emacsclient -n regex-ast/regex_ast.rs
#1772650304
git st
#1772650306
git add .
#1772650307
git st
#1772650312
git q
#1772650323
git rebase -i --root
#1772650334
git log
#1772650338
git st
#1772650342
git rebase -i --root
#1772650366
ll
#1772650367
cd ..
#1772650369
ll
#1772650406
find . -mindepth 2 -maxdepth 3 -type d -name .git
#1772650408
find . -mindepth 1 -maxdepth 3 -type d -name .git
#1772650422
ll hickory-client/
#1772650429
ll hickory-proto-revdeps/
#1772650436
ll
#1772650444
bat reverses.txt 
#1772650452
for crate in $(grep hick reverses.txt ); do declare -- crate_revdeps_path="./${crate}/revdeps"; set -o pipefail; if ! mkdir -p "${crate_revdeps_path}" && (cd "${crate_revdeps_path}" && cargo features -r "${crate}"); then 1>&2 echo -e "failed to get reverse deps for ${crate@@Q}"; break; fi; done
#1772650594
for crate in $(grep hick reverses.txt ); do declare -- crate_revdeps_path="./${crate}/revdeps"; set -o pipefail; if ! mkdir -p "${crate_revdeps_path}" && (cd "${crate_revdeps_path}" && cargo features -r "${crate}"); then 1>&2 echo -e "failed to get reverse deps for ${crate@@Q}"; break; fi; done
#1772650647
cargo features --help
#1772650627
for crate in $(grep hick reverses.txt ); do declare -- crate_revdeps_path="./${crate}/revdeps"; set -o pipefail; mkdir -p "${crate_revdeps_path}"; if ! cargo features -r "${crate}"); then 
#1772650669
for crate in $(grep hick reverses.txt ); do declare -- crate_revdeps_path="./${crate}/revdeps"; set -o pipefail; mkdir -p "${crate_revdeps_path}"; if ! cargo features -r "${crate}"; then  code=$?; fi; 1>&2 echo -e "failed ${code} to get reverse deps for ${crate@Q}"; break; fi; done
#1772650721
cd ..
#1772650724
ll
#1772650725
cd -
#1772650726
git st
#1772650729
git path
#1772650732
git add .
#1772650736
pbpaste
#1772650750
(echo;pbpaste;echo) > fetch-revdeps.sh
#1772650754
emacsclient fetch-revdeps.sh
#1772650764
git add fetch-revdeps.sh 
#1772650765
git st
#1772650779
find . -type f -name '*.json'
#1772650801
find . -type f -name '*.json' -exec rm --cached -fv '{}' \;
#1772650805
find . -type f -name '*.json' -exec rm --cached -f '{}' \;
#1772650809
find . -type f -name '*.json' -exec git rm --cached -f '{}' \;
#1772650813
git st
#1772650819
ll
#1772650828
1>.gitignore echo -e '
*.json
'
#1772650845
git add -f .gitignore *.txt *.sh
#1772650847
git st
#1772650894
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol
#1772650949
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | xargs -Ieachjson sed -E 's,[/].*,g'
#1772650952
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | xargs -Ieachjson sed -E 's,[/].*,,g'
#1772650970
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -E 's,[/].*,,g'
#1772651003
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -nE 's,^(hickory[a-z0-9._-]+)[/].*,,gp' 
#1772651015
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -nE 's,^\s*(hickory[a-z0-9._-]+)[/].*,,gp' 
#1772651023
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -n -E 's,^\s*(hickory[a-z0-9._-]+)[/].*,,gp' 
#1772651027
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -E 's,^\s*(hickory[a-z0-9._-]+)[/].*,,g' 
#1772651036
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -n -E 's,^\s*(hickory[a-z0-9._-]+)[/].*,,gp' 
#1772651039
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -n -E 's,^\s*(hickory[a-z0-9._-]+)[/].*,\1,gp' 
#1772651048
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -n -E 's,^\s*(hickory[a-z0-9._-]+)[/].*,\1,gp'  | unique-lines 
#1772651106
echo '        deleted:    hickory-client/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-client/https-crates-io-api-v1-crates-hickory-client.json
        deleted:    hickory-dns/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-dns/https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    hickory-proto/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-proto/https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    hickory-resolver/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-resolver/https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    hickory-server/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server-reverse_dependencies-page-1-per_page-10.json
        deleted:    hickory-server/https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-client.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-dns.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-proto.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-resolver.json
        deleted:    json/features.https-crates-io-api-v1-crates-hickory-server.json
        deleted:    json/https-crates-io-api-v1-crates-hickory-client-reverse_dependenci
' | lastcol | sed -n -E 's,^\s*(hickory[a-z0-9._-]+)[/].*,\1,gp'  | unique-lines  | xargs -Ieachdir bash -c 'git restore --staged "eachdir" && git restore "eachdir"'
#1772651109
git st
#1772651140
git commit .gitignore fetch-revdeps.sh 
#1772651147
git st
#1772651161
git commit -am 'delete json'
#1772651166
ll
#1772651322
git st
#1772651411
git st
#1772651528
cargo features --help
#1772651550
cd cargo-features/
#1772651557
git add .
#1772651566
git dh src/
#1772651611
git dh
#1772651617
git dh src/
#1772651631
git dh Cargo.
#1772651632
git dh Cargo.toml
#1772651656
cd debug-et-diagnostics
#1772651659
git dh
#1772651749
git dh
#1772651772
which dh  | xargs bat
#1772651779
which rustfmtall  | xargs bat
#1772651793
which rustfilt 
#1772651797
rustfilt --help
#1772651815
rustfmtall 
#1772651830
cd debug-et-diagnostics
#1772651835
git dh
#1772651847
git dh -- Cargo.toml
#1772651884
emacsclient -n Cargo.toml 
#1772651897
git dh 
#1772651901
git dh 
#1772651913
git whatchanged 
#1772651926
git push 
#1772651934
cargo publish
#1772651959
git diff HEAD -- Cargo.toml
#1772651981
git checkout HEAD -- Cargo.toml
#1772651985
git dh -- Cargo.toml
#1772651988
git whatchanged -p Cargo.toml
#1772651999
ll
#1772652001
emc Cargo.toml 
#1772652021
cargo add --dev debug-et-diagnostics@0.3.1
#1772652030
git add .
#1772652032
git dh src/main.rs
#1772652053
git dh
#1772652070
git dh HEAD
#1772652072
git dh 
#1772652111
git dh src/
#1772652132
git dh
#1772653173
rustup doc std::string::String
#1772655069
rustup doc std::path
#1772657098
man guname
#1772657113
man uname
#1772657155
which -a uname;which -a guname;
#1772657160
which -a uname;echo;which -a guname;
#1772657182
which -a uname | grep -v /opt;echo;which -a guname;
#1772657198
(which -a uname | grep -v /opt;echo;which -a guname;) | unique-lines 
#1772657230
(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname  #unique-lines  
#1772657241
(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  
#1772657245
cls;(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  
#1772657291
declare -a uname_paths=( $(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  ) )
#1772657303
cls;(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  
#1772657318
cls;declare -a uname_paths=( $(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  ) )
#1772657364
cls;(which -a uname | grep -v /opt;echo;which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  
#1772657376
cls;(which -a uname; which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  
#1772657396
echo $((which -a uname; which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  )
#1772657405
declare -a uname_paths=( $((which -a uname; which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  ) )
#1772657411
cls; declare -a uname_paths=( $((which -a uname; which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  ) )
#1772657420
cls; declare -a uname_paths=( $((which -a uname; which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  ) ); echo "${uname_paths[*]}"
#1772657427
cls; declare -a uname_paths=( $((which -a uname; which -a guname;) | xargs -Ieachuname path canon eachuname | unique-lines  ) ); 
#1772657472
for path in ${uname_paths[@]}; do]
#1772657474
for path in ${uname_paths[@]}; do name=$(basename "${path}"); slug=$(slugify-string "${path}"); man_path="$(man -w "${name}")"; 1>${slug}.yaml echo -e "---
name: ${name@Q}
slug: ${slug@Q}
man:  ${path_path@Q}
path: ${path@Q}

"; target_man_path="./${slug}.$(basename "${man_path}")"; cp -fv "${man_path}" "${target_man_path}"; declare -a output_formats=( html xml markdown org rst ); for ofmt in ${output_formats[@]}; do pandoc -f man -i "${target_man_path}" -t "${ofmt}" "${target_man_path}.${ofmt}"; done; done
#1772657881
emacsclient -n ~/workbench/2026-03-04/uname-manpages-to-cwd.sh
#1772657900
pushd ~/workbench/2026-03-04
#1772657903
git add .
#1772657904
git q
#1772658261
which pandocz.sh 
#1772658264
which pandocz.sh  | xargs bat
#1772658291
ack  'pandoc' ~/opt/libexec/
#1772658307
ack  'pandoc' ~/workbench/
#1772658313
ack -l 'pandoc' ~/workbench/
#1772658322
ack --sh -l 'pandoc' ~/workbench/
#1772658384
cls;ack --sh -l 'pandoc' ~/workbench/ | xargs ack -i '(org|html|xml|md|markdown|rst)'
#1772658404
cls;ack --sh -l 'pandoc' ~/workbench/ | xargs ack -l -i '(org|html|xml|md|markdown|rst)'
#1772658437
cls;ack --sh -l 'pandoc' ~/workbench/ | xargs ack -l -i '(org|html|xml|md|markdown|rst)' | xargs -Ieachfile emacsclient 'eachfile'
#1772658593
cd bufpager/
#1772658594
ll
#1772658603
git add src/
#1772658707
printf '%c\n' $(( 16#2f ))
#1772658715
printf '%s\n' $(( 16#2f ))
#1772659051
python -c 'code=0x2f;char=chr(code); hexcode=f"{code:02x}";display=repr(char); print("\n.join([f"chr: {display: 8>}", f"code: {code: 8>}", f"hex: {hexcode: 8>}"]));'
#1772659073
python -c 'code=0x2f;char=chr(code); hexcode=f"{code:02x}";display=repr(char); print("\n.join([f"chr: {display: 8>}", f"code: {code: 8>}", f"hex: {hexcode: 8>}"]));'
#1772659080
chr 0x2f
#1772658548
man pandoc # --help
#1772659171
pandoc --list-output-formats
#1772659180
pbpcopy <<< '

pandoc --list-output-formats


'
#1772659189
pbcopy <<< '

pandoc --list-output-formats


'
#1772659251
pandoc --list-output-formats | pbcopy 
#1772659839
cd
#1772659847
cd ./godot/tutorialz/puzzle-tutorials-moar/
#1772659847
ll
#1772659872
dua
#1772659931
echo Part\ 1* Making\ a\ simple\ sliding\ puzzle\ with\ Godot\ \[aODh7LNiEbI\].webm *Beginner*
#1772659938
echo ${IFS@Q} 
#1772659942
vlc Part\ 1* Making\ a\ simple\ sliding\ puzzle\ with\ Godot\ \[aODh7LNiEbI\].webm *Beginner*
#1772660902
cd
#1772660903
cd godot
#1772660904
dua
#1772660914
pushd ./docs/
#1772660914
ll
#1772660919
open GodotEngine.epub 
#1772660936
g p -r books
#1772660937
g p -r books -l
#1772660939
g p -r books -k
#1772660948
open -a Preview GodotEngine.epub 
#1772660955
ll
#1772660962
open -a 'Google Chrome' index.html 
#1772661221
cd ~/godot/
#1772661224
which god 
#1772661227
man god 
#1772661236
ll
#1772661287
find . -name '*3d*in*2d*'
#1772661296
cd ./godot-demo-projects/viewport/
#1772661297
ll
#1772661306
cd ./3d_in_2d/
#1772661307
ls
#1772661309
open project.godot 
#1772661739
musgz 
#1772661828
cd mu
#1772661829
..
#1772661830
cd ..
#1772661831
ll
#1772661837
dua 
#1772661846
ll
#1772661854
cd dua-cli/
#1772661856
gi tst
#1772661858
git br
#1772661867
git remotes 
#1772661894
git log
#1772662013
git switch -c feature-switch-between-ui-split-horizontally-or-vertically
#1772662016
git switch -
#1772662037
git log
#1772662044
git fetch -a
#1772662049
git log origin/main 
#1772662061
git log
#1772662133
echo git switch -c main-branch-from-$(git log -1 main -q --format=%h)-to-$(git log -1 origin/main -q --format=%h)
#1772662148
cls;git log -3;echo git switch -c main-branch-from-$(git log -1 main -q --format=%h)-to-$(git log -1 origin/main -q --format=%h)
#1772662190
echo git switch -c main/from-$(git log -1 main -q --format=%h)/to-$(git log -1 origin/main -q --format=%h)
#1772662195
git switch -c main/from-$(git log -1 main -q --format=%h)/to-$(git log -1 origin/main -q --format=%h)
#1772662211
git switch -c branch/main/from-$(git log -1 main -q --format=%h)/to-$(git log -1 origin/main -q --format=%h)
#1772662215
git switch -
#1772662216
git br
#1772662222
git reset --hard origin/main 
#1772662246
dua 
#1772662250
dua ~/projects/
#1772662264
ack -i 'enumerating.*items'
#1772662272
emacsclient -n src/aggregate.rs 
#1772662337
cargo deps list
#1772662343
cargo deps list -f json
#1772662375
cargo deps list -f json | jq '.[]'
#1772662405
cargo deps list -f json | jq '.[] | "https://crates.io/crates/\(.name)"'
#1772662414
cargo deps list -f json | jq -r '.[] | "https://crates.io/crates/\(.name)"'
#1772662427
cargo deps list -f json | jq -r '.[] | "https://crates.io/crates/\(.name)"' | pbcopy 
#1772662464
cd mu
#1772662486
emacsclient -n mu/pages/settings.tsx 
#1772662651
git diff
#1772662680
cd ..
#1772662682
ll
#1772662685
cd dua
#1772662687
dua
#1772662906
dua
#1772662918
declare -p -x 
#1772662941
cls;declare -p  ${!COLOR*} ${!TERM*}
#1772662990
declare  -p | ack -i '(COLOR|TERM|true.*color|ansi.*color|.*color.*)'
#1772663143
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {gensub(/([^=]+)=(.*)/, "\1", "g", $3)}}' 
#1772663150
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {print(gensub(/([^=]+)=(.*)/, "\1", "g", $3))}}' 
#1772663164
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {print(gensub(/([^=]+)=(.*)/, "\1", "g", $0))}}' 
#1772663193
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {print(gensub(/(^declare[^[:space:]]+\s+)([^=]+)=(.*)/, "\2", "g", $0))}}' 
#1772663218
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {print(gensub(/(^declare[^[:space:]]+)?(\s+)?([^=]+)=(.*)/, "\2", "g", $3))}}' 
#1772663221
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {print(gensub(/(^declare[^[:space:]]+)?(\s+)?([^=]+)=(.*)/, "\2", "g", $0))}}' 
#1772663243
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {print($3)}}'
#1772663306
declare  -p | gawk '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {delete parts; if (split($3, parts, "=")) {
# if split
# then
# endif:
}
}
}'
#1772663345
cls;gawk -f - -o- <<< '{ if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {delete parts; if (split($3, parts, "=")) {
# if split
# then
# endif:
}
}
}'
#1772663390
cls;declare -p  ${!COLOR*} ${!TERM*} | gawk '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        # then
                        # endif:
                }
        }
}'
#1772663406
cls;declare -p  ${!COLOR*} ${!TERM*} | gawk '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        for (key in parts) {
                            printf("parts[%s]: %s\n", key, parts[key]);
                        }
                        # endif:
                }
        }
}'
#1772663473
cls;declare -p  ${!COLOR*} ${!TERM*} | gawk '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        for (key in parts) {
                            printf("parts[%s]: %s\n", key, parts[key]);
                        }
                        printf("# %d\n\n", NR);
# endif:
                }
        }
}'
#1772663487
cls;declare -p  ${!COLOR*} ${!TERM*} | gawk '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        printf("# %d\n\n", NR);

                        for (key in parts) {
                            printf("parts[%s]: %s\n", key, parts[key]);
                        }
                        printf("# %d\n\n", NR);
# endif:
                }
        }
}'
#1772663504
cls;declare -p  ${!COLOR*} ${!TERM*} | gawk '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        printf("# row %d\n\n", NR);

                        for (key in parts) {
                            printf("parts[%s]: %s\n", key, parts[key]);
                        }
                        printf("# %d\n\n", NR);
# endif:
                }
        }
}'
#1772663559
1>${HOME}/opt/libexec/declare-bash-builtin-filter.gawk echo '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        printf("# row %d\n\n", NR);

                        for (key in parts) {
                            printf("parts[%s]: %s\n", key, parts[key]);
                        }
                        printf("# %d\n\n", NR);
# endif:
                }
        }
}'
#1772663573
chmod a+x ~/opt/libexec/declare-bash-builtin-filter.gawk
#1772663583
emacsclient -n ~/opt/libexec/declare-bash-builtin-filter.gawk
#1772663685
cls;declare -p  ${!COLOR*} ${!TERM*} | gawk '{
        if ($3 ~ /(COLOR|TERM|true.*color|ansi.*color|.*color.*)/) {
                delete parts
                if (split($3, parts, "=")) {
                        # if split
                        printf("# row %d\n\n", NR);

                        for (key in parts) {
                            printf("parts[%s]: %s\n", key, parts[key]);
                        }
                        printf("# %d\n\n", NR);
# endif:
                }
        }
}'
#1772663708
cls; declare -p | declare-bash-builtin-filter.gawk 
#1772663782
cls; declare -p # | declare-bash-builtin-filter.gawk 
#1772664148
help declare
#1772664152
help declare | bat -l man
#1772664168
help declare | bat -l man
#1772665107
export PS1='\u:\w\$ '
#1772665171
git add -f declare-bash-builtin-filter.gawk
#1772666316
ll /Users/gabrielfalcao/.local/share/wezterm/gui-sock-514
#1772666328
gstat -c '%N
    %F
' /Users/gabrielfalcao/.local/share/wezterm/gui-sock-514
#1772666345
cls;gstat -c '%N
    %F
' /Users/gabrielfalcao/.local/share/wezterm/gui-sock-514
#1772666388
ll /Users/gabrielfalcao/.local/share/wezterm/gui-sock-514
#1772670314
cd ~/.emacs.d/c/
#1772670340
git dh
#1772658618
1>>TODO.md  echo -e "
\n
# TODO $(today)

- \x60/\x27 (slash) search support case-insentive
- try to detect language, possibly via tree-sitter
- syntect or similar crate to syntax-highlight guessed language


"
#1772670538
dua i
#1772670557
ll
#1772670559
dua
#1772670581
path show youtube.com/
#1772670586
cd path-finder
#1772670603
emacsclient -n src/cli/commands/show/mod.rs 
#1772670615
dua
#1772670628
cargo run -- show README.md ;cargo build
#1772670715
gstat -c $'\x1b[1;38;5;220m%N\x1b[0m
\x1b[1;38;2;138;226;52m        %%W: %W
\x1b[1;38;2;245;121;0m        %%Y: %Y
\n

' youtube.com/ youtube.com/GitHub youtube.com/GitHub/*
#1772670823
gstat -c $'\x1b[1;38;5;220m%N\x1b[0m
\x1b[1;38;2;138;226;52m        %%W: %W
\x1b[1;38;2;245;121;0m        %%Y: %Y
\n

\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/*
#1772670827
cls;gstat -c $'\x1b[1;38;5;220m%N\x1b[0m
\x1b[1;38;2;138;226;52m        %%W: %W
\x1b[1;38;2;245;121;0m        %%Y: %Y
\n

\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/*
#1772670832
ll youtube.com/GitHub/video.Lxi66vm5hP0/
#1772670867
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m
\x1b[1;38;2;138;226;52m        %%W: %W
\x1b[1;38;2;245;121;0m        %%Y: %Y
\n

\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/* youtube.com/GitHub/*/* | sort -nur
#1772670898
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/* youtube.com/GitHub/*/* 
#1772670923
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/* youtube.com/GitHub/*/* | sort -rn
#1772670929
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/* youtube.com/GitHub/*/* | sort -rn
#1772670953
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' youtube.com/ youtube.com/GitHub youtube.com/GitHub/* youtube.com/GitHub/*/* | sort -rn
#1772670980
date --date=@1771963693 --utc; date --date=@1771963689 --utc; 
#1772670995
mkdir -p  ~/workbench/2026-02-24/
#1772671001
mv youtube.com/ ~/workbench/2026-02-24/
#1772671024
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' xurupira/ xurupira/src/* xurupira/* | sort -rn
#1772671044
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' xurupira/ xurupira/src/* xurupira/* | sort -rn | gawk '{
modified=strtonum($1);
created=strtonum($2);
remaining=gensub(/^\s*\d+\s+\d+\s+/, "", $0);
cmd=sprintf("gdate --date=@%s --utc", modified);
    while ((cmd | getline line) > 0) {
        result=sprintf("%s\n", line);
    }
close(cmd)

printf("%s %s\n", result, remaining);
}
'
#1772671276
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' xurupira/ xurupira/src/* xurupira/* | sort -rn | gawk '{
modified=strtonum($1);
created=strtonum($2);
remaining=gensub(/^\s*\d+\s+\d+\s+/, "", $0);
result=" 
"
cmd=sprintf("gdate --date=@%s --utc", modified);
    while ((cmd | getline line) > 0) {
        result=sprintf("%s%s%s\n", result, FS, line);
    }
close(cmd)

printf("%s %s\n", result, remaining);
}
'
#1772671329
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' xurupira/ xurupira/src/* xurupira/* | sort -rn | gawk '{
modified=strtonum($1);
created=strtonum($2);
remaining=gensub(/^\s*\d+\s+\d+\s+/, "", $0);
result="";
cmd=sprintf("gdate --date=@%s --utc", modified);
    while ((cmd | getline line) > 0) {
        result=sprintf("%s%s%s\n", result, FS, line);
    }
close(cmd)

printf("%s: %s\n", result, remaining);
}
'
#1772671348
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' xurupira/ xurupira/src/* xurupira/* | sort -rn | gawk '{
modified=strtonum($1);
created=strtonum($2);
remaining=gensub(/^\s*[0-9]+\s+[0-9]+\s+/, "", $0);
result="";
cmd=sprintf("gdate --date=@%s --utc", modified);
    while ((cmd | getline line) > 0) {
        result=sprintf("%s%s%s\n", result, FS, line);
    }
close(cmd)

printf("%s: %s\n", result, remaining);
}
'
#1772671413
cls;gstat -c $'%Y %W \x1b[1;38;5;220m%N\x1b[0m\x1b[1;38;2;138;226;52m        %%W: %W\x1b[1;38;2;245;121;0m        %%Y: %Y\x1b[0m' xurupira/ xurupira/src/* xurupira/* | sort -rn | gawk '{
modified=strtonum($1);
created=strtonum($2);
remaining=gensub(/^\s*[0-9]+\s+[0-9]+\s+/, "", $0);
result="";
cmd=sprintf("gdate --date=@%s --utc", modified);
    while ((cmd | getline line) > 0) {
        result=sprintf("%s%s%s\n", result, FS, line);
    }
close(cmd)
raw_result=result; result=gensub(/\s*[\n]+\s*/, "", "g", result);
printf("%s: %s\n", result, remaining);
}
'
#1772671856
cd ~/workbench/$(today)
#1772671875
1>best-vid.txt echo -e "
${HOME}/godot/tutorialz/puzzle-tutorials-moar/Making a simple sliding puzzle with Godot [aODh7LNiEbI].webm"
#1772671958
cls;1>best-vid.txt echo -e "
${HOME}/godot/tutorialz/puzzle-tutorials-moar/Making a simple sliding puzzle with Godot [aODh7LNiEbI].webm"
#1772671981
cls;1>best-vid.txt echo -e "
${HOME}/godot/tutorialz/puzzle-tutorials-moar/Making a simple sliding puzzle with Godot [aODh7LNiEbI].webm"
#1772671994
declare -ga best_videos=()
#1772672018
best_videos=( "${HOME}/godot/tutorialz/puzzle-tutorials-moar/Making a simple sliding puzzle with Godot [aODh7LNiEbI].webm" )
#1772672031
echo "${best_videos[@]@Q}"
#1772672060
declare -ga best_playlist_folders=()
#1772672100
best_playlist_folders=( "$(dirname "${best_videos[@]:0:1}" )" )
#1772672104
echo "${best_videos[@]@Q}"
#1772672109
echo "${best_playlist_folders[@]@Q}"
#1772672115
ll "${best_playlist_folders[@]@Q}"
#1772672123
ls -latrh "${best_playlist_folders[@]:0:1}"
#1772672449
cd
#1772672451
cd ~/Kino/
#1772672457
cdmkd ./mosquito-trap
#1772672459
pbpaste
#1772672478
echo -e "\n$(pbpaste)\n" >> mosquito-trap.urls
#1772672485
for url in (grep http mosquito-trap.urls )
#1772672485
do
#1772672641
cd ..
#1772672644
cdmkd ant-trap
#1772672650
ll ../mosquito-trap/
#1772672658
echo -e "\n$(pbpaste)\n" >> ant-trap.urls
#1772672707
bat best-vid.txt 
#1772672711
ll
#1772672713
git q
#1772673573
cd tabtree/
#1772673578
git br
#1772673584
cd workbench/
#1772673601
cd git-bandolier/
#1772673595
cargo cbt --run
#1772673610
rm -rf target/
#1772673654
git log
#1772673606
cargo build;cargo run
#1772673615
cargo build; cargo run
#1772673710
git switch -c branch/from-mu-8fce3b5/to-tabtree-$(git log -1 -f %h)
#1772673721
git switch -c branch/from-mu-8fce3b5/to-tabtree-$(git log -1 --format=%h)
#1772673728
git switch -c main
#1772673732
git switch main
#1772673739
git reset --hard branch/from-mu-8fce3b5/to-tabtree-119660b
#1772673743
git log
#1772673753
rm -rf src/ tracing-server/
#1772673757
mv mu src
#1772672669
for url in $(grep http ant-trap.urls ); do yt-dlp-harness "${url}" || yt-dlp "${url}"; done; 
#1772673760
emc package.json 
#1772652141
emc src/main.rs 
#1772672494
for url in $(grep http mosquito-trap.urls ); do yt-dlp-harness "${url}" || yt-dlp "${url}"; done
#1772673923
declare -- tmpfoo="'"
#1772673926
echo ${tmpfoo@Q }
#1772673929
echo ${tmpfoo@Q}
#1772673958
declare -- tmpfoo=$'\x60\x27\x22\x22\x27'
#1772673963
echo "${tmpfoo@Q}"
#1772673972
declare -- tmpfoo=$'\x60\x27\x22'
#1772673973
echo "${tmpfoo@Q}"
#1772673994
declare -a tmpfoo=( $'\x60' $'\x27' $'\x22' )
#1772674004
for val in ${tmpfoo[@]}; do declare -p val; echo "\${val} => ${val@Q} => \"${val}\""; done
#1772674051
cls;for val in ${tmpfoo[@]}; do declare -p val; echo "\${val} => ${val@Q} => \"${val}\""; done
#1772674083
cls;for val in ${tmpfoo[@]}; do echo "\${val}=${val@A}"; declare -p val; echo "\${val} => ${val@Q} => \"${val}\""; echo -e '\n'; done
#1772674098
cls;for val in ${tmpfoo[@]}; do echo "\${val}=${val@Q}"; declare -p val; echo "\${val} => ${val@Q} => \"${val}\""; echo -e '\n'; done
#1772674122
cls;for val in ${tmpfoo[@]}; do  quoted=$(printf '%q' "${val}"); echo "\${val}=${val@Q}"; declare -p val; echo "\${val} => ${val@Q} => \"${val}\""; echo -e '\n'; done
#1772674163
cls;for val in ${tmpfoo[@]}; do  quoted=$(printf '%q' "${val}"); echo "\${val}=${val@Q}"; declare -p val quoted; echo "\${val} => ${val@Q} => \"${val}\""; echo -e '\n'; done
#1772674214
echo $'\x1b[1;38;5;220m${val@Q}\x1b[0m'
#1772674225
echo $'\x1b[1;38;5;220m'"${val@Q}"'\x1b[0m'
#1772674266
printf $'\x1b[1;38;5;220m%q\x1b[0m' $'\x27single\x27'
#1772674272
printf $'\x1b[1;38;5;220m%q\x1b[0m\n' $'\x27single\x27'
#1772674355
declare -A escape_chars=(); escape_chars[$'\x27']="single-quote"; escape_chars[$'\x22']="double-quote"; escape_chars[$'\x60']="backtick"; for key in ${!escape_chars[@]}; do value="${escape_chars["${key}"]}"; printf $'\x1b[1;38;5;220m%q\x1b[0m\n' "${value}"; done
#1772674423
declare -A escape_chars=(); escape_chars[$'\x27']="single-quote"; escape_chars[$'\x22']="double-quote"; escape_chars[$'\x60']="backtick"; for key in ${!escape_chars[@]}; do value="${escape_chars["${key}"]}"; printf $'\x1b[1;38;5;220mescape_chars[%q]=%q\x1b[0m\n' "${key}"  "${value}"; done
#1772674451
printf $'\x1b[1;38;5;220m%q\x1b[0m\n' $'\x27single\x27'
#1772674459
printf $'\x1b[1;38;5;220m%q\x1b[0m\n' $'\x27single\''
#1772674512
declare -a from_patterns=()
#1772674545
from_patterns+=( $'(\x27)(mu)(\x27)' )
#1772674549
from_patterns+=( $'(\x22)(mu)(\x22)' )
#1772674598
from_patterns+=( $'([.][/])(mu)([^a-zA-Z0-9])' )
#1772674634
echo -e "\n$(pbpaste)\n" >> sed_patterns.sh
#1772674638
emc sed_patterns.sh 
#1772674755
git add sed_patterns.sh
#1772674763
git add mu
#1772674767
git add src/
#1772674772
echo -e '
*.log
*.pid
' >> .gitignore
#1772674790
git add .
#1772675085
git q
#1772675088
./sed_patterns.sh 
#1772675101
./sed_patterns.sh 
#1772675174
./sed_patterns.sh 
#1772675188
./sed_patterns.sh 
#1772677860
cd ~/.shell.d/
#1772677872
git add x.d/ rc.d/
#1772677898
git commit rc.d/~.yt-dlp%2fconfig -m rc.d/~.yt-dlp%2fconfig 
#1772677945
git add entrypoint.sh 0000110-env.sh 
#1772678430
(echo;pbpaste;echo) | tee > x.d/colors.reb1.el
#1772678435
(echo;pbpaste;echo) | tee x.d/colors.reb1.el
#1772678441
(echo;pbpaste;echo -e '\n\n') | tee x.d/colors.reb1.el
#1772678446
cls;(echo;pbpaste;echo -e '\n\n') | tee x.d/colors.reb1.el
#1772678453
git add x.d/color*
#1772679373
git add x.d/
#1772679390
git commit x.d/ -m 'x.d/colors*.el'
#1772679918
gi tst
#1772679971
git add .
#1772679979
git commit -m x.d/colors.tmp.regexpmeta.el 
#1772680315
git whatchanged 
#1772680387
git whatchanged 
#1772680390
git whatchanged  -p
#1772680975
ord '[]'
#1772681794
git add .
#1772681819
unset HISTIGNORE 
#1772681825
git st
#1772681883
git commit -am "$(git status --porcelain | lastcol | head -1 | xargs basename)


$(git status --porcelain | lastcol)"
#1772681887
git log
#1772681892
git commit --amend 
#1772682042
git st
#1772682552
git st
#1772682852
bat x.d/colors.el
#1772683615
git st
#1772683621
git add .
#1772683639
git st
#1772683650
git commit -a
#1772683685
git st
#1772683688
ll
#1772683692
git whatchanged 
#1772683721
emacsclient -n x.d/colors.tmp.reb.replace-regexp-pattern-optional-non-capturing-group-spaces-backslash-and-space-and-double-backslash.el
#1772684131
git st
#1772684134
git add x.d/
#1772684149
git commit -am 'x.d/deleteme.tmp*'
#1772684474
git st
#1772684480
git st
#1772684482
git st
#1772684483
git diff
#1772684529
mv git st
#1772684529
git st
#1772684545
git add x.d/colors.tmp.regexpmeta.oneliner.el 
#1772684546
git st
#1772684550
git restore x.d/colors.tmp.regexpmeta.el
#1772684550
git st
#1772684554
git commit -am x.d/colors.tmp.regexpmeta.oneliner.el 
#1772684637
bash sed_patterns.sh 
#1772684644
bash sed_patterns.sh 
#1772684681
declare -i tmpcountint=-1
#1772684691
echo "$(( tmpcounint + 1 ))"
#1772684698
echo "$(( tmpcounint ))"
#1772684704
echo "$(( tmpcounint ))"
#1772684708
echo ${tmpcountint}
#1772684715
echo $((  ${tmpcountint} ))
#1772684718
echo $((  ${tmpcountint} + 1 ))
#1772684726
declare -i tmpcountint=-4
#1772684727
echo $((  ${tmpcountint} + 1 ))
#1772684751
echo $(( tmpcounint=(${tmpcountint} + 1) ))
#1772684753
echo $(( tmpcounint=(${tmpcountint} + 1) ))
#1772684762
echo $(( tmpcounint=(${tmpcountint} + 1) ))
#1772684766
echo $((  ${tmpcountint} + 1 ))
#1772684780
echo $(( tmpcounint=(tmpcountint + 1) ))
#1772684781
echo $(( tmpcounint=(tmpcountint + 1) ))
#1772684792
echo $(( tmpcounint=(tmpcountint + 1); $tmpcountint ))
#1772684796
echo $(( tmpcounint=(tmpcountint + 1); tmpcountint ))
#1772684801
echo $(( tmpcounint=(tmpcountint + 1); tmpcountint ))
#1772685142
ord '/\\'
#1772685144
ord '/\'
#1772685184
ord '/\13src'
#1772685245
python -c '"\\n".join(list(map(hex, map(ord, ""))))'
#1772685249
ipython
#1772685127
git diff
#1772685508
cls;bash sed_patterns.sh 
#1772685709
cls;bash sed_patterns.sh 
#1772685749
cls;bash sed_patterns.sh 
#1772685853
cls;bash sed_patterns.sh 
#1772685862
cls;bash sed_patterns.sh 
#1772685886
cls;bash sed_patterns.sh 
#1772685904
cls;bash sed_patterns.sh 
#1772685913
cls;bash sed_patterns.sh 
#1772685919
cls;bash sed_patterns.sh 
#1772685931
cls;bash sed_patterns.sh 
#1772686109
cls;bash sed_patterns.sh 
#1772686118
cls;bash sed_patterns.sh 
#1772686126
cls;bash sed_patterns.sh 
#1772686145
cls;bash sed_patterns.sh 
#1772686178
cls;bash sed_patterns.sh 
#1772686274
cls;bash sed_patterns.sh 
#1772686307
cls;bash sed_patterns.sh 
#1772686431
cls;bash sed_patterns.sh 
#1772686490
git log
#1772686494
git whatchanged 
#1772686496
git q
#1772686518
bash sed_patterns.sh 
#1772686539
bash sed_patterns.sh 
#1772686546
git whatchanged -p
#1772686568
git reset --hard b6f31432038afafccd0c564e1a0aa50020c0f593
#1772686634
git whatchanged -p
#1772686653
echo  sed_patterns.sh 
#1772686662
git switch -c sed_patterns.sh
#1772686670
bash sed_patterns.sh 
#1772686685
bash sed_patterns.sh 
#1772686769
git whatchanged 
#1772686774
git q
#1772686778
git switch -
#1772686782
git merge --squash sed_patterns.sh 
#1772686789
git q
#1772686793
git br -D sed_patterns.sh 
#1772686798
git switch -c sed_patterns.sh
#1772686800
bash sed_patterns.sh 
#1772686972
help declare 
#1772686979
declare --g test=1
#1772686982
declare -g test=1
#1772687020
git add .
#1772687023
git q
#1772687025
bash sed_patterns.sh 
#1772687048
git whatchanged 
#1772687051
git whatchanged -p
#1772687054
git whatchanged 
#1772687061
git switch -
#1772687074
git log sed_patterns.sh 
#1772687083
git switch -
#1772687084
git log
#1772687087
git switch -
#1772687092
git cherry-pick 165bdaf1a6114c0c7819ed6df00f733b43a29a55
#1772687098
git br -D sed_patterns.sh 
#1772687100
git b
#1772687101
git br
#1772687108
git br -D branch/from-mu-8fce3b5/to-tabtree-
#1772687114
git switch -
#1772687133
git switch -c branch/sed_patterns.sh
#1772687137
bash sed_patterns.sh 
#1772687141
bash sed_patterns.sh 
#1772687176
git q
#1772687179
bash sed_patterns.sh 
#1772687202
bash sed_patterns.sh 
#1772687245
bash sed_patterns.sh 
#1772687252
git whatchanged 
#1772687276
ll
#1772687279
git add uv.lock 
#1772687287
git add -f uv.lock 
#1772687426
shfmt-o sed_patterns.sh 
#1772687449
shfmt-o sed_patterns.sh
#1772687458
git diff
#1772687475
git pop
#1772687481
git diff
#1772687732
bash sed_patterns.sh 
#1772687740
git whatchanged 
#1772687742
git whatchanged -p
#1772687750
git commit -a --amend -C HEAD
#1772687752
bash sed_patterns.sh 
#1772687784
git add .
#1772687786
git commit -a --amend -C HEAD
#1772687788
bash sed_patterns.sh 
#1772687828
git add .
#1772687829
git q
#1772687835
cargo run
#1772687844
ll
#1772678795
Emacs-arm64-11 -nw -Q -q
#1772687860
cd workbench/
#1772687887
cls;cargo run 
#1772687897
cls;2>cargo-run.stderr cargo run 
#1772687864
git whatchanged 
#1772687904
git br
#1772687912
git switch add-commands 
#1772687913
git log
#1772687916
git whatchanged 
#1772687941
git checkout b59b79118a2e9f314cc9c6e1771e9e0964935256
#1772687975
echo git switch -c script/add-command.sh/final-version/at-$(git log -1 --format=%h)
#1772687993
echo git switch -c script/add-command.sh/final-version/head=$(git log -1 --format=%h)
#1772687997
echo git switch -c script/add-command.sh/final-version/head/$(git log -1 --format=%h)
#1772688002
git switch -c script/add-command.sh/final-version/head-at/$(git log -1 --format=%h)
#1772688016
path canon add-command.sh | pbcopy 
#1772688020
cp /Users/gabrielfalcao/projects/work/poems.codes/tools/workbench/add-command.sh .
#1772688022
git switch -
#1772688028
git switch -
#1772688044
git br
#1772688054
git switch main
#1772688068
git switch -
#1772688088
path canon src/main.rs  src/cli/mod.rs 
#1772688113
path canon src/main.rs; path canon  src/cli 
#1772688121
(path canon src/main.rs; path canon  src/cli ) | pbcopy 
#1772688147
cp -rfv /Users/gabrielfalcao/projects/work/poems.codes/tools/workbench/src/main.rs /Users/gabrielfalcao/projects/work/poems.codes/tools/workbench/src/cli src/
#1772688156
git add add-command.sh 
#1772688159
git add src/cli/
#1772688171
git add src/main.rs 
#1772688176
git clean -f
#1772688180
bat TODO.md 
#1772688183
git diff TODO.md
#1772688187
git add TODO.md
#1772688196
git switch -
#1772688209
git dh -- src/main.rs
#1772688239
ll
#1772688245
bat add-command.sh 
#1772688254
git br
#1772688280
git switch -c script/add-command-sh/from-workbench-repo
#1772688321
git switch -
#1772688325
cargo rn
#1772688327
cargo run
#1772688336
1>commands.txt cargo run
#1772688339
2>commands.txt cargo run
#1772688344
emc commands.txt 
#1772688378
git add commands.txt 
#1772688390
git switch -
#1772688409
git mv commands.txt commands.kebab.txt 
#1772688443
git br
#1772688458
cp commands.kebab.txt commands.pascal.txt 
#1772688460
cp commands.kebab.txt commands.title.txt 
#1772688467
cp commands.kebab.txt commands.snake.txt
#1772688474
cp commands.kebab.txt commands.camel.txt
#1772688477
git add .
#1772688479
heck-string --to
#1772688503
emc commands.kebab.txt 
#1772688609
git add .
#1772688613
rm commands.*.txt
#1772688615
git add .
#1772688628
git switch -c script/gen-commands-sh
#1772688636
git commit -am gen-commands.sh 
#1772688785
declare -p cmd command
#1772689018
heck-string --to
#1772689030
heck-string --to=pascal 'list-branches'
#1772689032
heck-string --to=pascal 'list branches'
#1772689040
heck-string --to
#1772689041
heck-string --help
#1772689121
bash gen-commands.sh 
#1772689259
bat src/main.rs 
#1772689847
bash gen-commands.sh 
#1772689884
git diff src/main.rs
#1772689890
git add .
#1772689895
git dh gen-commands.sh
#1772689908
git mv gen-commands.sh gen-src-main.sh 
#1772689915
chmod a+x *.sh
#1772689923
git commit -am gen-src-main.sh 
#1772689926
./gen-src-main.sh 
#1772689930
./gen-src-main.sh  | rustfmt
#1772689946
./gen-src-main.sh  | rustfmt
#1772689954
./gen-src-main.sh  | rustfmt
#1772689960
cls;./gen-src-main.sh  | rustfmt
#1772689971
git whatchanged -p
#1772689989
mv gen-commands.sh gen-src-main.sh 
#1772689995
chmod a+x *.sh
#1772689998
git whatchanged -p
#1772690007
git dh
#1772690012
git commit -a --amend -C HEAD
#1772690031
cls;./gen-src-main.sh  | rustfmt
#1772690042
cls;./gen-src-main.sh > main-fake.rs
#1772690045
emc main-fake.rs
#1772690065
git clean -f
#1772690067
git diff
#1772690068
git whatchanged -p
#1772690072
git commit --amend -C HEAD
#1772690078
cls;./gen-src-main.sh  | rustfmt
#1772690088
cls;./gen-src-main.sh  | rustfmt > src/main.rs 
#1772690093
git dh
#1772690099
git whatchanged 
#1772690105
git commit gen-src-main.sh  --amend -C HEAD
#1772690108
git diff
#1772690150
git commit -am 'regenerates src/main.rs with gen-src-main.sh'
#1772690152
git br
#1772690160
git switch script/add-command-sh/from-workbench-repo
#1772690176
git switch -
#1772690181
git log
#1772690185
git br
#1772690229
launch_emacs_desktop 
#1772691742
git clean -f
#1772691757
ack launch_emacs_desktop  ~/.shell.d/
#1772691926
git br
#1772691937
git log
#1772691948
git br
#1772691952
git diff script/add-command.sh/final-version/head-at/b59b791 
#1772691976
bat .gitignore 
#1772691981
git diff script/add-command.sh/final-version/head-at/b59b791 
#1772691993
git log script/add-command.sh/final-version/head-at/b59b791 
#1772692005
git diff b59b79118a2e9f314cc9c6e1771e9e0964935256
#1772692009
git diff b59b79118a2e9f314cc9c6e1771e9e0964935256 HEAD
#1772692016
git diff HEAD b59b79118a2e9f314cc9c6e1771e9e0964935256 
#1772692032
git br
#1772692035
cargo run
#1772692039
git st
#1772693093
cd
#1772693096
cd godot
#1772693097
ll
#1772693109
mkdir .trash
#1772693117
mv tmp-2d-controls-2026-03-01.18-19-13/ slide-puzzle-walkthrough-from-youtube-a-o-dh-7l-ni-eb-i/ .trash/
#1772693258
ll
#1772693261
git st
#1772693271
git add ./slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI/
#1772693273
git st
#1772693280
bat 1
#1772693281
rm 1
#1772693304
1>>.gitignore echo -e '\n 
*.log
*.mp4
*.webm
*.mkv
*.g
*.gz
*.zip
'
#1772693327
vim .gitignore 
#1772693330
git st
#1772693338
git add .gitignore 
#1772693343
git st
#1772693357
git commit slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI/ -m 'init slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI


https://www.youtube.com/watch?v=aODh7LNiEbI
'
#1772693396
git st
#1772693405
git commit .gitignore -m .gitignore 
#1772693412
git ignore add
#1772693416
git st
#1772693422
vim .gitignore 
#1772693429
git st
#1772693435
git commit -am .gitignore 
#1772693436
git st
#1772693440
cd ./slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI/
#1772693441
git st
#1772693488
git diff
#1772693500
git commit -am 'set display viewport 1000x1000'
#1772693578
git diff
#1772693579
git st
#1772693581
gti add .
#1772693585
git add .
#1772693586
git st
#1772693607
git commit -am 'add Area2D and set that as  Main scene'
#1772693649
git diff
#1772693689
git commit -am 'resize CollisionShape2D to cover 100% of display'
#1772693705
git st
#1772693708
git diff
#1772693715
git commit -am 'center collision shape'
#1772693797
git diff
#1772693807
git diff
#1772693818
git diff
#1772693846
git st
#1772693861
git commit -am 'ensure Main scene (Area2D) is clickable'
#1772694053
mv sprites/ ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI-sprites
#1772694057
git st
#1772694064
cd ~/godot/
#1772694069
cd ./slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI-sprites/
#1772694070
ls
#1772694076
open tile-poc.blend
#1772694081
file tile-poc.blend.import 
#1772694082
bat tile-poc.blend.import
#1772694085
rm tile-poc.blend.import
#1772694185
pixelmator 
#1772694400
git add .
#1772694402
dua
#1772694412
git commit -am "$(basename $(pwd))"
#1772694420
ll
#1772694430
pixelmator  number-1.pxd 
#1772694453
mv ~/workbench/2026-02-19/number-1* .
#1772694454
ll
#1772694456
git add .
#1772694464
git commit -am svgs
#1772694468
bat number-1.svg 
#1772694607
bat number-1.svg 
#1772695001
git q
#1772695833
ll
#1772695836
open cube.png 
#1772696193
ll
#1772696195
git add .
#1772696196
git q
#1772697050
git add .
#1772697055
dua
#1772697060
git q
#1772697073
pushd ~/.shell.d/
#1772697080
uv add pillow
#1772697091
uv pip freeze
#1772697107
uv pip freeze > requirements-$(today ).txt
#1772697130
gstat -c '%Y %W %w %y %N' requirements.txt 
#1772697150
mv requirements.txt requirements2026-03-01.txt
#1772697155
mv requirements2026-03-01.txt requirements-2026-03-01.txt
#1772697163
uv pip freeze > requirements.txt
#1772697168
git add .
#1772697207
git add requirements*
#1772697216
git commit -am 'pip requirements'
#1772697231
ll
#1772697237
> cubes.py
#1772697299
git add cubes.py 
#1772697434
ll
#1772697440
chmod +x cubes.py
#1772697441
./cubes.py 
#1772697451
./cubes.py 
#1772697461
./cubes.py 
#1772697474
./cubes.py 
#1772697599
ll
#1772697605
exiftool cubes.png 
#1772697678
./cubes.py 
#1772697708
./cubes.py 
#1772697735
./cubes.py 
#1772697747
./cubes.py 
#1772697764
exiftool cubes_1000.png 
#1772698138
./cubes.py 
#1772698160
cls;./cubes.py 
#1772698194
ll
#1772698198
ll cubes
#1772698205
cls;./cubes.py 
#1772698246
cls;./cubes.py 
#1772698261
cls;./cubes.py 
#1772698276
cls;./cubes.py 
#1772698348
cls;./cubes.py 
#1772698417
cls;./cubes.py 
#1772698505
cls;./cubes.py 
#1772698545
cls;./cubes.py 
#1772698618
cls;./cubes.py 
#1772698735
cls;./cubes.py 
#1772698749
git clean -df
#1772698750
git q
#1772698752
./cubes.py 
#1772698770
git clean -df
#1772698773
./cubes.py 
#1772698915
./cubes.py 
#1772698952
./cubes.py 
#1772698958
ipython
#1772699007
./cubes.py 
#1772699026
./cubes.py 
#1772699031
./cubes.py 
#1772699085
./cubes.py 
#1772699110
./cubes.py 
#1772699290
./cubes.py 
#1772699322
./cubes.py 
#1772699365
./cubes.py 
#1772699378
ll cubes
#1772699384
ls -l cubes | wc -l
#1772699387
ls -l cubes 
#1772699426
git q
#1772699428
git clean -df
#1772699430
./cubes.py 
#1772699441
exiftool cubes/*png
#1772699472
git clean -df
#1772699495
./cubes.py  && exiftool cubes/*.png | grep -E 'Image.Size'
#1772699503
open cube
#1772699504
open cubes
#1772699596
git q
#1772699603
git clean -df && ./cubes.py 
#1772699625
open cubes
#1772699753
./cubes.py 
#1772699759
open cube
#1772699759
open cubes
#1772699780
git q
#1772699789
mv cubes ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI/sprites
#1772699797
git clean -f
#1772699806
./cubes.py 
#1772699813
rm -rf cubes
#1772699831
mv cubes_1000.png ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI/sprites/cubes-tiled.png
#1772699835
cd ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI
#1772699837
git add .
#1772699838
git q
#1772699851
roku-remote list
#1772699882
musgz 
#1772699914
cd $(musgz -p)
#1772699915
ll
#1772699926
cat 07ea0826020503.json.enc.gz  | gunzip  | mu
#1772699934
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq '.'
#1772699959
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq '.[] | select(.url | contains("xvideos.com")) | .url'
#1772699975
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq '.[] | select(.url != null) | select(.url | contains("xvideos.com")) | .url'
#1772699986
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq '.[] | select(.url != null) | select(.url | test("xvideos.com")) | .url'
#1772699992
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq '.[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url'
#1772700015
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url'
#1772700025
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url'
#1772700054
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' > 07ea0826020503.json.urls
#1772700076
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'https://www[.]xideos[.]com/video[.]' > 07ea0826020503.json.urls
#1772700082
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'https://www[.]xideos[.]com/video[.]' | tee 07ea0826020503.json.urls
#1772700105
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'xideos[.]com/video[.]' | tee 07ea0826020503.json.urls
#1772700112
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'https://www[.]xvideos[.]com/video[.]' | tee 07ea0826020503.json.urls
#1772700123
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'https://www[.]xvideos[.]com/video[.]' | sort | tee 07ea0826020503.json.urls 
#1772700129
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'https://www[.]xvideos[.]com/video[.]' | sort -u | tee 07ea0826020503.json.urls 
#1772700139
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E -v 'https://www[.]xvideos[.]com/video[.]' | sort -u | tee 07ea0826020503.json.nonvideo.urls 
#1772700147
cat 07ea0826020503.json.enc.gz  | gunzip  | mu | jq -r '.[].tabs[] | select(.url != null) | select(.url | test(".*xvideos.com.*")) | .url' | grep -E 'https://www[.]xvideos[.]com/video[.]' | sort -u | tee 07ea0826020503.json.video.urls 
#1772700167
wc -l 07ea0826020503.json.*.urls
#1772700173
wc -l 07ea0826020503.json*urls
#1772700179
rm 07ea0826020503.json.urls
#1772700181
wc -l 07ea0826020503.json*urls
#1772700188
cat 07ea0826020503.json.nonvideo.urls
#1772700190
cat 07ea0826020503.json.nonvideo.urls | pbcopy 
#1772700388
x
#1772700392
cd -
#1772700399
pushd $(pwd)
#1772700404
x
#1772700410
pushd $(pwd)
#1772700423
echo -e "\n$(pbpaste)\n" >> creampie.$(today).txt
#1772700442
cd xxxx/
#1772700443
pwd
#1772700444
ll
#1772700447
pwd
#1772700450
open .
#1772700486
cd 
#1772700500
cd mu
#1772700501
ll
#1772700504
vim TODO.rst 
#1772700575
git q
#1772700576
git clean -f
#1772700618
echo -e "\n$(pbpaste)\n" >> creampie.$(today).txt
#1772700674
echo -e "\n$(pbpaste)\n" >> creampie.$(today).txt
#1772700687
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700759
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700822
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700847
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700867
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700875
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700879
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700894
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700906
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700934
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700938
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700943
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700970
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772700984
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701013
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701018
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701039
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701049
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701058
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701070
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701077
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701080
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701084
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701088
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701097
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701112
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701119
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701123
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701126
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701140
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701144
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701149
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701153
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701157
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701161
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772697245
emacsclient cubes.py 
#1772701203
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701209
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701221
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701224
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701227
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701230
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701238
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701244
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701251
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701255
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701258
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701264
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701268
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701325
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701334
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701337
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701344
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701347
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701363
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701447
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701526
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701553
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701571
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701576
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701582
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701585
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701590
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701593
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701597
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701603
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701605
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701645
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701671
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701674
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701683
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701684
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701689
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701693
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701707
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701711
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701714
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701719
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701727
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701730
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701738
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701742
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701746
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701762
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701765
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701768
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701773
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701775
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701778
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701784
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701792
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701808
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701819
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701823
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701827
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701831
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701834
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701843
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701850
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701863
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701866
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701870
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701873
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701880
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701892
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701895
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701904
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701920
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701922
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701925
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701928
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701931
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701935
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701942
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701945
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701951
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701982
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701985
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701994
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772701996
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702001
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702005
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702014
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702016
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702035
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702038
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702050
echo -e "\n$(pbpaste)\n" >> eskktae-inputs.txt
#1772702051
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702064
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702072
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702076
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702082
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702093
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702104
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702117
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702124
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702126
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702134
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702137
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702142
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702148
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702157
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702160
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702166
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702169
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702174
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702177
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702183
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702187
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702191
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702194
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702197
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702206
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702211
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702214
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702221
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702230
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702249
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702265
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702276
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702279
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702287
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702289
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702311
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702314
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702319
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702323
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702327
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702331
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702334
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702341
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702345
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702352
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702370
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702374
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702387
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702390
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702394
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702397
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702404
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702410
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702419
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702423
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702439
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702443
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702449
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702452
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702460
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702465
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702467
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772702608
git add *.txt
#1772702611
git commit -m txt
#1772702625
unique-lines xxx-project-inputs.txt 
#1772702632
cat  xxx-project-inputs.txt  | unique-lines
#1772702638
cat  xxx-project-inputs.txt  | unique-lines > xxx-project-inputs.txt.uniq
#1772702641
mv xxx-project-inputs.txt.uniq xxx-project-inputs.txt
#1772702643
git diff
#1772702664
git q
#1772702668
git add urls.2026-02-24.x*
#1772702669
git q
#1772702675
bat mu-data
#1772702679
dua
#1772702686
git add workbench* TODO* todo*
#1772702689
git q
#1772702694
dua
#1772702698
ll deutsch/
#1772702709
dua
#1772702712
ll 2026/
#1772702721
dua i 2026/ deutsch/ triplox/
#1772702733
emacsclient -n .gitignore 
#1772702779
ll .ouro/
#1772702780
ll .ouro/.ouro/
#1772702784
ll .ouro/.ouro/mp4/
#1772702790
find .ouro/ -type f
#1772702795
bat .ouro/.ouro/urls-2018-04-03.txt
#1772702840
find 2026/ -type f
#1772702853
git add dua-2026-01-14-02-50-5*
#1772702854
git q
#1772702859
ll mu-data
#1772702862
ll mu-data/
#1772702866
pwd
#1772702868
ll
#1772702881
ll
#1772702893
ls
#1772702898
ll
#1772702904
ll dupes 
#1772702906
bat dupes
#1772702910
ll
#1772702918
gti add dupes 
#1772702920
git 
#1772702921
git q
#1772702923
ll
#1772702925
ll triplox/
#1772702938
open triplox/dsc02339.JPG 
#1772702943
open triplox/
#1772703090
mkdir -p  ~/workbench/$(today)/python-pillow-extract-from-pps/
#1772703093
cp -fv triplox/rainha-do-carnaval-do-rio.pps ~/workbench/$(today)/python-pillow-extract-from-pps/
#1772703104
pwd
#1772703111
git br
#1772703123
git diff 66a4795725d6af95f9958eb53ebff665986130ce
#1772703153
git diff 66a4795725d6af95f9958eb53ebff665986130ce ./mu ./src/ ./tracing-server/
#1772703165
git br
#1772703174
git checkout 66a4795725d6af95f9958eb53ebff665986130ce -- mu
#1772703176
git dh
#1772703204
git commit mu/ -m 'checkout ./mu/ files from 66a4795725d6af95f9958eb53ebff665986130ce'
#1772703212
git switch -
#1772703227
emc mu/cs/index.ts 
#1772703235
launch_emacs_desktop
#1772703342
dirs
#1772703361
pwd
#1772703362
dirs
#1772703363
cd -
#1772703365
cd -
#1772703383
wz-ls 
#1772703414
wz-ls  | jq '.[] | select(.cwd | test(".*[.]x.*"))'
#1772703431
wz-get-text 
#1772703441
wz-parse-get-text-output 
#1772703453
x
#1772703459
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772703463
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772703465
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772703479
ll
#1772703482
dua
#1772703495
echo -e "\n$(pbpaste)\n" >> xxx-project-inputs.txt
#1772703518
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703525
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703529
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703535
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703547
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703551
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703559
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703574
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703582
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703586
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703589
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703595
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703612
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703615
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703622
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703627
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703630
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703632
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703636
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703638
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703644
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703660
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703664
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703714
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703722
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703730
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703739
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703742
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703746
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703754
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703757
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703759
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703774
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703783
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703798
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703810
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703813
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703820
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703829
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703839
echo -e "\n$(pbpaste)\n" | tee -a xxx-project-inputs.txt > urls.$(today).txt
#1772703947
dirs dist
#1772703953
it checkout stable-build-8fce3b5-2026-02-14 -- build dist
#1772703958
it checkout stable-build-8fce3b5-2026-02-14 -- build 
#1772704013
#cp -rf build/ build-snapshot-$(git log -1 --format=%h )
#1772704017
cls;git br
#1772704031
echo cp -rf build/ build-snapshot-$(git log -1 --format=%h  39054da2914ad6d2a4d117f1b1fb08a71d8d57f9 )
#1772704033
cp -rf build/ build-snapshot-$(git log -1 --format=%h  39054da2914ad6d2a4d117f1b1fb08a71d8d57f9 )
#1772704036
dua build
#1772704203
ack csEachTabWithinWindow mu
#1772704050
emc mu/extension/utils.ts 
#1772704256
git diff
#1772704385
git add mu/extension/utils.ts 
#1772704450
git diff
#1772704472
git commit mu/extension/utils.ts -m 'console.debug in extension/utils'
#1772704684
yarn; yarn build
#1772704702
musgz 
#1772704720
mv build-snapshot-39054da/ ../mu-build-snapshot-39054da-$(today)/
#1772704765
roku-remote list
#1772704768
roku-remote active
#1772704770
roku-remote 
#1772704776
roku-remote live
#1772704780
roku-remote live
#1772704787
roku-remote describe
#1772704803
roku-remote send --help
#1772704813
roku-remote control --help
#1772704820
cd roku-remote/
#1772704822
ll
#1772704829
bat roku.sh 
#1772704835
bat roku-remote.py 
#1772704853
bat roku/device.go 
#1772704859
bat roku/api/actions.go 
#1772704873
emacsclient roku/api/actions.go
#1772705102
g p -r chrome -k
#1772705104
st
#1772705112
dua
#1772705121
cd roku-remote/
#1772705128
dua
#1772705154
find /Users/gabrielfalcao/projects/ -name target -not -path '*/target/**/target' 
#1772705171
find /Users/gabrielfalcao/projects/ -name target -not -path '*/target/**/target'  -not -path '*/target/*/target' 
#1772705187
cd ~/workbench/$(today )
#1772705210
for name in node_modules target; do echo #find /Users/gabrielfalcao/projects/ -name target -not -path "*/${name}/**/${name}"  -not -path "*/${name}/*/${name}" | tee ${name}-to-delete.txt
done
#1772705260
for name in node_modules target; do echo find /Users/gabrielfalcao/projects/ -name target -not -path "*/${name}/**/${name}"  -not -path "*/${name}/*/${name}" | tee ${name}-to-delete.txt; done
#1772705272
declare -a folders=(node_modules target)
#1772705279
for name in ${folders[@]}; do echo find /Users/gabrielfalcao/projects/ -name target -not -path "*/${name}/**/${name}"  -not -path "*/${name}/*/${name}" | tee ${name}-to-delete.txt; done
#1772705287
for name in ${folders[@]}; do echo find /Users/gabrielfalcao/projects/ -name "${name}" -not -path "*/${name}/**/${name}"  -not -path "*/${name}/*/${name}" | tee ${name}-to-delete.txt; done
#1772705297
for name in ${folders[@]}; do find /Users/gabrielfalcao/projects/ -name "${name}" -not -path "*/${name}/**/${name}"  -not -path "*/${name}/*/${name}" | tee ${name}-to-delete.txt; done
#1772705301
cls;for name in ${folders[@]}; do find /Users/gabrielfalcao/projects/ -name "${name}" -not -path "*/${name}/**/${name}"  -not -path "*/${name}/*/${name}" | tee ${name}-to-delete.txt; done
#1772705498
ll
#1772705504
cat node_modules-to-delete.txt target-to-delete.txt | sort -u
#1772705510
cls;cat node_modules-to-delete.txt target-to-delete.txt | sort -u | xargs dua 
#1772705524
cls;cat node_modules-to-delete.txt target-to-delete.txt | xargs rm -rf
#1772705566
find /Users/gabrielfalcao/workbench/ -type f -regextype egrep -regex '.*[.]pcap([.]gz)?'
#1772705579
find /Users/gabrielfalcao/workbench -regextype egrep -regex '.*[.]pcap([.]gz)?'
#1772705585
find /Users/gabrielfalcao/workbench -regextype egrep -regex '.*[.]pcap.*'
#1772705605
find /Users/gabrielfalcao/workbench -regextype egrep -regex '.*[.]pcap(ng)?([.]gz)?'
#1772705632
find /Users/gabrielfalcao/workbench -regextype egrep -regex '.*[.]pcap(ng)?([.]gz)?' -exec gstat  -c '%Y %W %y {}' '{}' \;
#1772705640
find /Users/gabrielfalcao/workbench -regextype egrep -regex '.*[.]pcap(ng)?([.]gz)?' -exec gstat  -c '%Y %W %y {}' '{}' \; | sort -nr
#1772705654
dua /Users/gabrielfalcao/workbench/2026-02-22/roku-remote-all-packets-*
#1772705662
cp /Users/gabrielfalcao/workbench/2026-02-22/roku-remote-all-packets-
#1772705676
cp /Users/gabrielfalcao/workbench/2026-02-22/roku-remote-all-packets-\(104\)-2026-02-22.18-43-01.1771796581.pcapng .
#1772705684
which wirefilter 
#1772705690
which Wireshark 
#1772705694
Wireshark --help
#1772705787
ll
#1772705788
bat wireshark.txt 
#1772705864
ack -i volume wireshark.txt
#1772705711
Wireshark ./roku-remote-all-packets-\(104\)-2026-02-22.18-43-01.1771796581.pcapng 
#1772706439
Wireshark  roku-remote-all-packets-\(104\)-2026-02-22.18-43-01.1771796581.pcapng 
#1772706531
st
#1772706556
cd
#1772706561
cd ./godot/
#1772706562
dua
#1772706566
dua i
#1772706683
echo -e "\n$(pbpaste)\n" > playlist-$(today).txt
#1772706695
emc playlist-2026-03-05.txt 
#1772706848
./playlist-2026-03-05.py 
#1772706885
./playlist-2026-03-05.py 
#1772707800
rm -fv tutorialz/puzzle-tutorials-moar/Godot\ 4.2\ Tutorial\ {1..13}*
#1772707819
git add play*
#1772707823
git add play*.py
#1772707825
git add play*.txt
#1772707844
pwd
#1772708649
git diff
#1772708657
git commit -am 'console.debug'
#1772708673
emc mu/bg/index.ts 
#1772709038
ack Promise.all mu
#1772709410
echo '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ' | pbcopy 
#1772709881
chrome 
#1772709901
chrome 
#1772709921
git clean -f
#1772709970
cd ~/opt/libexec/
#1772709973
git add chrome 
#1772709977
git commit chrome  -m chrome 
#1772709987
git diff
#1772709990
git q
#1772709994
yarn build
#1772710005
which yarn 
#1772710012
yarn --version
#1772710027
npm i yarn@latest
#1772710048
npm i -g yarn@latest
#1772710054
yarn --version
#1772710058
npm i -g npm@latest
#1772710068
npm i -g yarn@latest
#1772710073
yarn --version
#1772710076
yarn
#1772710086
roku-remote control
#1772710103
cd -
#1772710109
yarn build
#1772710169
ack '[.](save|append)[[:space:]\n]' mu/
#1772710176
ack '[.](save|append)[[:space:]\n]*' mu/
#1772710183
ack '[.](save|append)[[:space:]\n]*[(]' mu/
#1772710187
cls;ack '[.](save|append)[[:space:]\n]*[(]' mu/
#1772710220
ll
#1772710729
ack 'CreateTabsWithinCurrentWindowReturn' mu
#1772710755
git dh
#1772710770
git commit -am 'fix build'
#1772710773
git br
#1772710784
ll
#1772710910
cd ..
#1772710919
mv tabtree/ _mu_tabtree
#1772710925
dua mu
#1772710940
cp -rf mu tabtree
#1772710954
cp _mu_tabtree/*.sh tabtree/
#1772710956
cd tabtree/
#1772710959
git add .
#1772710999
rm -rf src/ \#.prettierrc# *.lock tracing-server/
#1772711007
ll ../mu/src/
#1772711009
ll ../mu/src/cli/
#1772711021
git add .
#1772711024
mv mu src
#1772711028
git add .
#1772711038
git commit -am 'mu => src'
#1772711040
ll
#1772711042
emc sed_patterns.sh 
#1772710120
yarn dev
#1772711068
yarn build
#1772711542
pwd
#1772711543
ll
#1772711544
git st
#1772711550
cd ../2026-03-05/
#1772711550
ll
#1772711553
git st
#1772711556
dua
#1772711570
git add -f python-pillow-extract-from-pps/
#1772711571
git st
#1772711572
dua
#1772711576
git path
#1772711577
git init
#1772711579
git st
#1772711591
git add *.txt python-pillow-extract-from-pps/
#1772711592
git st
#1772711593
git q
#1772711620
git st
#1772711629
emc src/string.rs 
#1772712400
rustup doc std::iter::Iterator
#1772712658
git st
#1772712663
git add src/cli/parameters.rs 
#1772712666
git st
#1772712682
ll
#1772712675
cargo build;cargo run;cargo test
#1772712757
cp ~/Downloads/bentz-dutkiewicz-2026-humans-40-000-y-ago-developed-a-system-of-conventional-signs.pdf ~/Documents/scientific-papers/
#1772712772
mv ~/Downloads/bentz-dutkiewicz-2026-humans-40-000-y-ago-developed-a-system-of-conventional-signs.pdf ~/workbench/$(today )
#1772712779
pushd ~/workbench/$(today )
#1772712780
git st
#1772712783
git add bentz-dutkiewicz-2026-humans-40-000-y-ago-developed-a-system-of-conventional-signs.pdf 
#1772712787
git commit -m bentz-dutkiewicz-2026-humans-40-000-y-ago-developed-a-system-of-conventional-signs.pdf 
#1772712857
pushd ~/godot/tutorialz/puzzle-tutorials-moar/
#1772712858
ll
#1772712881
vlc Making*.web
#1772712882
vlc Making*.webm
#1772713066
cd ~/godot/slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI
#1772713073
git add -f sprites/
#1772713078
git commit sprites/ -m sprites
#1772713080
git diff
#1772713323
pbpaste | rot13
#1772713324
pbpaste | rot13;echo
#1772713331
pbpaste | base64 -d
#1772713333
pbpaste | base64 -d;echo
#1772713336
pbpaste | base64 -d;echo;echo
#1772713339
echo;pbpaste | base64 -d;echo;echo
#1772713344
echo;pbpaste | rot13 | base64 -d;echo;echo
#1772713405
pbpaste| wc
#1772713407
pbpaste| wc -c
#1772713415
pbpaste| wc -c
#1772713438
ack dm0xfbgiyu7nh
#1772713444
ll sprites/
#1772713548
ack uid sprites/cube*.import
#1772713568
for name in sprites/cube*.import; do
#1772713571
for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="uid://([a-zA-Z0-9]+)"\s*$,\2,gp'); cube_number=$(sed -n -E 's/cube_([0][1-9]|[1][0-6])[.].*/\1\gp'); declare -p filename uid cube_number; done
#1772713823
for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+)")\s*$,\2,gp' "${filename}"); cube_number=$(sed -n -E 's/cube_([0][1-9]|[1][0-6])[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; done
#1772713872
for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+)")\s*$,\2,gp' "${filename}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; done
#1772713901
cls;bat sprites/cube_09.png.import ;for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+)")\s*$,\2,gp' "${filename}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; done
#1772713972
cls;bat sprites/cube_09.png.import ;for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${filename}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; done
#1772713994
cls;cat sprites/cube_09.png.import ;for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${filename}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; break; done
#1772714003
cls;grep -E 'uid' sprites/cube_09.png.import ;for filename in sprites/cube*.import; do filename=$(basename "${filename}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${filename}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; break; done
#1772714035
cls;grep -E 'uid' sprites/cube_09.png.import ;for path in sprites/cube*.import; do filename=$(basename "${path}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${path}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1\gp' <<< "${filename}"); declare -p filename uid cube_number; break; done
#1772714056
cls;grep -E 'uid' sprites/cube_09.png.import ;for path in sprites/cube*.import; do filename=$(basename "${path}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${path}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1/gp' <<< "${filename}"); declare -p filename uid cube_number; break; done
#1772714059
cls;grep -E 'uid' sprites/cube_09.png.import ;for path in sprites/cube*.import; do filename=$(basename "${path}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${path}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1/gp' <<< "${filename}"); declare -p filename uid cube_number; done
#1772714061
cls;grep -E 'uid' sprites/cube_09.png.import ;for path in sprites/cube*.import; do filename=$(basename "${path}"); uid=$(sed -n -E 's,^\s*uid="(uid://([a-zA-Z0-9]+))"\s*(.*?)$,\2,gp' "${path}"); cube_number=$(sed -n -E 's/^cube_([0-9]{1,2})[.].*/\1/gp' <<< "${filename}"); declare -p filename uid cube_number; echo; done
#1772714089
> gen-cube-tiles.sh
#1772714092
emacsclient -n gen-cube-tiles.sh
#1772714181
git add .
#1772714187
git commit gen-cube-tiles.sh  -m gen-cube-tiles.sh 
#1772714188
git dh
#1772714269
bash find-patterns.sh 
#1772714273
bash find-patterns.sh 
#1772714282
bash find-patterns.sh  sprites/
#1772714293
bash find-patterns.sh  sprites/
#1772714310
bash find-patterns.sh  sprites/
#1772714315
bash find-patterns.sh  sprites/ project.godot 
#1772714327
bash find-patterns.sh  sprites/ project.godot 
#1772714345
which -a ack
#1772714370
ack '(cmuf7l15n84lm||1_h2yge)'  sprites/
#1772714379
rg '(cmuf7l15n84lm||1_h2yge)'  sprites/
#1772714401
rg '(cmuf7l15n84lm||1_h2yge)'  sprites/ main.tscn 
#1772714407
ack '(cmuf7l15n84lm||1_h2yge)'  sprites/ main.tscn 
#1772714420
git add find-patterns.sh 
#1772714424
git commit find-patterns.sh -m find-patterns.sh 
#1772714425
git dh
#1772713101
emc main.tscn 
#1772715310
cp ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI-sprites/cube-grey-* sprites/
#1772715319
pixelmator sprites/cube-grey-orthographic.3d.png 
#1772715473
ll ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI-sprites/
#1772715480
mv ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI-sprites/cube-grey-*1000.png .
#1772715514
pixelmator cube-grey-orthographic.3d.1000.png
#1772715562
mv ../slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI-sprites/cube-grey-orthographic.3d.250.png .
#1772715573
ll
#1772715639
git add .
#1772715652
git commit -am 'lay 16 tiles out manually'
#1772718794
git add .
#1772718802
git dh -- main.tscn
#1772718815
git commit -am 'attach main script'
#1772719023
open /System/Applications/Font\ Book.app
#1772719116
# cp "/Users/gabrielfalcao/Library/Fonts/GT-America-Expanded-Black.otf" ./fonts/
#1772719120
mkdir -p ./fonts
#1772719124
cp "/Users/gabrielfalcao/Library/Fonts/GT-America-Expanded-Black.otf" ./fonts/
#1772719139
cp -fv/Users/gabrielfalcao/Library/Fonts/JetBrainsMono* ./fonts/
#1772719145
cp -fv /Users/gabrielfalcao/Library/Fonts/JetBrainsMono* ./fonts/
#1772719147
ll
#1772719150
git add fonts/
#1772719152
dua
#1772719172
cp -fv  ${HOME}/Library/Fonts/JetBrainsMono* ./fonts/
#1772719204
bat copy-fonts.sh 
#1772719206
vim copy-fonts.sh
#1772719216
git add copy-fonts.sh
#1772719218
git add .
#1772719227
git commit -am 'fonts'
#1772719240
launch_emacs_desktop
#1772719383
git add fonts/
#1772719384
git log
#1772719388
git commit --amend -C HEAD
#1772719426
/Applications/Godot.app/Contents/MacOS/Godot --help
#1772719671
cargo install gdscript-formatter
#1772719681
cls;cargo install --help
#1772719788
cd poc
#1772719788
pwd
#1772719789
st
#1772719807
cargo new --lib bash-parser
#1772719812
cd ./bash-parser
#1772719813
pwd
#1772719817
git init
#1772719820
git add .
#1772719835
cargo add tree-sitter tree-sitter-bash nom pest pest-derive
#1772719867
git submodule init
#1772719728
cargo install --git https://github.com/GDQuest/GDScript-formatter.git
#1772719885
git submodule add https://github.com/tree-sitter/tree-sitter-bash.git ./tree-sitter-bash
#1772719910
git submodule add https://github.com/Jakobeha/type-sitter.git tree-sitter
#1772719915
git add .
#1772719922
git log
#1772719925
git commit -am 'init'
#1772719981
git diff
#1772719992
gdscript-formatter --help
#1772720528
ll
#1772720530
open project.godot 
#1772720538
ps aux | grep  -i godot
#1772720548
kill -9 73748
#1772720555
open project.godot 
#1772720578
ll
#1772720849
3
#1772720888
cdmkd ./gdquest
#1772720913
echo -e "\n$(pbpaste)\n" | grep -E -i 'github.*gdquest'
#1772720926
echo -e "\n$(pbpaste)\n" | grep -E -i 'github.*gdquest' > urls.txt
#1772720951
sed -E 's/[?#].*//g' -i urls.txt 
#1772720952
bat urls.txt
#1772720965
sed -E 's/$/.git/g' urls.txt 
#1772720972
sed -E 's/\s*$/.git/g' urls.txt 
#1772720976
sed -E 's/\s*$/.git/g' -i urls.txt 
#1772720982
for url in $(grep http urls.txt ); do git clone --depth=1 "${url}"
#1772721003
for url in $(grep http urls.txt ); do git clone --depth=1 "${url}" & disown -a; done
#1772721114
cd
#1772721146
find "${HOME}" -mindepth 1 -maxdepth 1
#1772721150
find "${HOME}" -mindepth 1 -maxdepth 1 -type d
#1772721161
find "${HOME}" -mindepth 1 -maxdepth 1 -type d -not -name '.*'
#1772721261
>~/opt/libexec/list-home-paths-for-dua echo -e '#!/usr/bin/env bash' "\n\n
declare -a usual_paths=(
~/projects/ ~/godot/ ~/\*scratch\*/ ~/Kino/
)
"
#1772721304
emacsclient -n ~/opt/libexec/list-home-paths-for-dua
#1772721369
find "${HOME}" -mindepth 1 -maxdepth 1 -type d -not -name '.*' -exec basename {} \;
#1772721374
find "${HOME}" -mindepth 1 -maxdepth 1 -type d -not -name '.*' -exec basename {} \; | pbcopy 
#1772722183
list-home-paths-for-dua 
#1772722211
pushdmkd ~/workbench/$(today)
#1772722229
list-home-paths-for-dua  | xargs dua i | ansistrip | tee dua-i-to-delete.$(nowdz).txt
#1772722231
cd dua-cli/
#1772722233
git br
#1772722240
git log
#1772722245
git log feature-switch-between-ui-split-horizontally-or-vertically 
#1772722253
git log
#1772722259
git log feature-switch-between-ui-split-horizontally-or-vertically 
#1772722264
git log branch/main/from-a3a682d/to-19df299 
#1772722304
git log -3 --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar'  branch/main/from-a3a682d/to-19df299 
#1772722317
git log -3 --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar%N'  branch/main/from-a3a682d/to-19df299 
#1772722322
git log -3 --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar%n'  branch/main/from-a3a682d/to-19df299 
#1772722337
git log -3 --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar%x0a'  branch/main/from-a3a682d/to-19df299 
#1772722494
git log -3 --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar%x0a'  branch/main/from-a3a682d/to-19df299 
#1772722515
git log -3 --format='%C(#EEEEEC)commit%C(#D3D7CF) %H%C(#FFFFFF)%d%n%C(#EF2929)Author: %C(#EF2929)%aN %C(#EF2929)<%aE>%n%C(#729FCF)Date: %aD %C(#FCE94F)%ar%x0a'  branch/main/from-a3a682d/to-19df299 
#1772722628
git colorlog -3
#1772722642
declare -F 
#1772722669
(declare -F ;declare -p) | ack  'COMP'
#1772722809
help :
#1772723041
help complete
#1772723049
help complete | batman 
#1772723051
help -m complete | batman 
#1772723100
complete -p git-log
#1772723101
complete -p git
#1772723105
complete -p git_log
#1772723108
complete -p _git_log
#1772723121
complete -p git -S log
#1772723126
complete -p -S log git
#1772723138
declare -f __git_wrap__git_main
#1772723145
declare -f __git_func_wrap
#1772723149
declare -f __git_main
#1772723170
complete -p -S log git
#1772723246
pushdmkd ~/workbench/$(today)
#1772723285
>todo-man-bash-programmable-completion-to-auto-complete-git-colorlog.sh echo -e '#!/usr/bin/env bash' "\n\n
declare -gr source_man_path=\"\$(man -w bash)\"
declare -gar extensions=( org rst html opml markdown )
for extension in \${extensions[@]}; do
pandoc -f man -i \"\${source_man_path}\" -t \${extension} -o \"\$(path base \"\${source_man_path}\").\${extension}\"
done
"
#1772723525
cls; #pbpaste '\n\n
#1772723525
declare -gr source_man_path=\"\$(man -w bash)\"
#1772723525
declare -gar extensions=( org rst html opml markdown )
#1772723525
for extension in \${extensions[@]}; do pandoc -f man -i \"\${source_man_path}\" -t \${extension} -o \"\$(path base \"\${source_man_path}\").\${extension}\"
#1772723525
done
#1772723526
"
#1772723547
cls; pbcopy <<< '\n\n
declare -gr source_man_path=\"\$(man -w bash)\"
declare -gar extensions=( org rst html opml markdown )
for extension in \${extensions[@]}; do
pandoc -f man -i \"\${source_man_path}\" -t \${extension} -o \"\$(path base \"\${source_man_path}\").\${extension}\"
done
'
#1772723561
emacsclient -n todo-man-bash-programmable-completion-to-auto-complete-git-colorlog.sh 
#1772723576
git addd todo-man-bash-programmable-completion-to-auto-complete-git-colorlog.sh
#1772723578
git path
#1772723584
git add *.sh
#1772723592
> echo -e '
\n
*.log
*pid
*stdout
*stderr
\n'
#1772723639
1> .gitignore echo -e '
\n
*.log
*pid
*stdout
*stderr
\n'
#1772723644
emacsclient -n .gitignore 
#1772723652
rm echo 
#1772723659
git add .gitignore *.txt
#1772723666
git add --dry-run emacs-buffers-1772701188/
#1772723690
git q
#1772723693
git add emacs-buffers-1772701188/
#1772723695
git q
#1772723817
ack 'pandoc(\s+([-][ftio][[:space:]]+)?[^[:space:]]+\s*)+' ~/opt/libexec/ ~/workbench/
#1772723832
ll ~/.ackrc 
#1772723869
ack --no-txt 'pandoc(\s+([-][ftio][[:space:]]+)?[^[:space:]]+\s*)+' ~/opt/libexec/ ~/workbench/
#1772723875
ack --no-md --no-txt 'pandoc(\s+([-][ftio][[:space:]]+)?[^[:space:]]+\s*)+' ~/opt/libexec/ ~/workbench/
#1772723879
cls;ack --no-md --no-txt 'pandoc(\s+([-][ftio][[:space:]]+)?[^[:space:]]+\s*)+' ~/opt/libexec/ ~/workbench/
#1772723915
cls;ack --no-md --no-txt --sh 'pandoc(\s+([-][ftio][[:space:]]+)?[^[:space:]]+\s*)+' ~/opt/libexec/ ~/workbench/
#1772724066
pandocz.sh 
#1772724070
which pandocz.sh  | xargs bat
#1772724082
which pandocz.sh  | xargs emacsclient -n
#1772724162
pandocz.sh 
#1772724227
pandocz.sh 
#1772724251
pandocz.sh 
#1772724616
pushd ~/.shell.d/
#1772724637
pushd ~/.shell.d/
#1772724641
git add x.d/
#1772724649
path canon x.d/bash-completions.d/git-colorlog 
#1772724653
path canon x.d/bash-completions.d/git-colorlog  | pbcopy 
#1772724677
cd path-finder
#1772724679
st
#1772724689
list-home-paths-for-dua 
#1772724720
pushdmkd ~/workbench/$(today)
#1772724722
ll
#1772724756
declare -gi now=$(date -i +%s)
#1772724760
declare -gi now=$(date -u +%s)
#1772724863
list-home-paths-for-dua  | xargs dua | tee dua-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').ansi.txt | ansistrip > dua-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').txt 
#1772724895
declare -gi now=$(date -u +%s(
#1772724897
declare -gi now=$(date -u +%s)
#1772724900
list-home-paths-for-dua  | xargs dua i | tee dua-i-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').ansi.txt | ansistrip > dua-i-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').txt
#1772724915
list-home-paths-for-dua | xargs dua i | tee dua-i-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').ansi.txt
#1772724977
dua $(list-home-paths-for-dua) | tee dua-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').ansi.txt | ansistrip > dua-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').txt
#1772724960
dua i $(list-home-paths-for-dua) | tee dua-i-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').ansi.txt | ansistrip > dua-i-to-delete-$(date --date=@${now} '+%Y-%m-%d.%H.%M.%S.%s').txt
#1772725211
ll
#1772725219
mv dua-* ~/workbench/$(today )
#1772725224
pushd ~/workbench/$(today )
#1772725225
ll
#1772725239
bat dua-to-delete-2026-03-05.15.32.40.1772724760.txt 
#1772725253
bat dua-to-delete-2026-03-05.15.32.40.1772724760.*
#1772725256
rm dua-to-delete-2026-03-05.15.32.40.1772724760.*
#1772725263
bat dua-remove*
#1772725284
cat  dua-remove*
#1772725331
cat  dua-remove* | sed -E "s,^([^/[:space:]].*),${HOME}/\1,g"
#1772725351
cls;cat  dua-remove* | sed -E "s,^([^/[:space:]].*),${HOME}/\1,g" | xargs rm -rfv
#1772725358
cls;cat  dua-remove* | sed -E "s,^([^/[:space:]].*),${HOME}/\1,g" | xargs rm -rf
#1772725364
cls;cat  dua-remove* | sed -E "s,^([^/[:space:]].*),${HOME}/\1,g" | sudo xargs rm -rf
#1772725371
st
#1772725418
st
#1772725419
st
#1772725438
wz-wip-old 
#1772725443
wz-ls 
#1772725453
wz-ls  | jq -r '.[].pane_id'
#1772725459
wz-wip
#1772725463
ll
#1772725560
ipython
#1772725729
wz-wip
#1772725731
wz-wip-old 
#1772725738
wz-wip-old 
#1772725744
wz-wip-old 
#1772725754
bat /Users/gabrielfalcao/workbench/2026-03-05/wezterm-panes.1772725745.json
#1772725937
wz-wip-old 
#1772725982
wz-wip-old 
#1772725989
bat /Users/gabrielfalcao/workbench/2026-03-05/wezterm-wip2026-03-05/wezterm-panes.1772725984.json
#1772726017
wz-wip-old 
#1772726199
wz-wip-old 
#1772726311
wz-wip-old 
#1772726321
wz-wip-old 
#1772726358
wz-wip-old 
#1772726390
wz-wip-old 
#1772726408
ipython
#1772726597
ipython
#1772726723
wz-wip-old 
#1772726871
ipython
#1772726879
cls;ipython3
#1772727074
wz-wip-old 
#1772727099
wz-wip-old 
#1772727117
wz-wip-old 
#1772727168
wz-wip-old 
#1772727209
wz-wip-old 
#1772727245
wz-wip-old 
#1772727384
wz-wip-old 
#1772727397
bat /Users/gabrielfalcao/workbench/2026-03-05/wezterm-panes.1772727390.json
#1772727413
st
#1772727431
cd ..
#1772727440
find . -not type d -iname 'backup*'
#1772727443
find . -not -type d -iname 'backup*'
#1772727457
cd -
#1772727461
cp ./2026-03-01/backup-nothing-2026-03-01.23-16-45.1772417805/backup.sh .
#1772727467
cp -fv ~/workbench/2026-03-01/backup-nothing-2026-03-01.23-16-45.1772417805/backup.sh .
#1772727470
gi tst
#1772727487
rm -rf wezterm*
#1772727539
wz-wip-old 
#1772727586
wz-wip-old 
#1772727685
2>/dev/null wz-wip-old 
#1772727700
rm -rf wezterm-wip-2026-03-05/
#1772727703
2>/dev/null wz-wip-old &
#1772727704
disown -a
#1772727706
git add backup.sh 
#1772727713
chmod a+x backup.sh 
#1772727717
emacsclient -n backup.sh 
#1772727760
list-home-paths-for-dua 
#1772727804
st
#1772727848
ll ~/backup*
#1772727850
dua ~/backup*
#1772727853
dua i ~/backup*
#1772727866
dua i ~/state/
#1772727871
bat ~/state/on-battery.start 
#1772727882
bat ~/freeze-reports/
#1772727885
dua i ~/freeze-reports/
#1772727903
dua i ~/todo/
#1772727913
dua i ~/SEC/
#1772727923
ll ~/SEC/
#1772727943
dua i ~/Publications/ ~/Documents/ ~/Downloads/ ~/Desktop/
#1772727974
dua i ~/DaVinci/
#1772728232
st
#1772728293
git diff backup.sh
#1772728479
git diff backup.sh
#1772728494
sudo ./backup.sh 
#1772728508
sudo ./backup.sh 
#1772729270
wz-ls 
#1772729288
wz-ls  | jq -r '.[].tty_name'
#1772729316
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty
#1772729433
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty | awk '{ if ($2 ~ /^[0-9]+$/) { if (!pidmap[$2]) { pidmap[$2]=$NF; }} }' | unique-lines | xargs -Ieachpid ps aux
#1772729484
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty | awk '{ if ($2 ~ /^[0-9]+$/) { if (!pidmap[$2]) { pidmap[$2]=$NF; }} } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}' 
#1772729491
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty | awk '{ if ($2 ~ /^[0-9]+$/) { if (!pidmap[$2]) { pidmap[$2]=$NF; }} } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729507
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty | gawk 'BEGIN {delete pidmap;} { if ($2 ~ /^[0-9]+$/) { if (!pidmap[$2]) { pidmap[$2]=$NF; }} } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772728544
sudo ./backup.sh 
#1772729589
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty | gawk 'BEGIN {delete pidmap;} { if ($2 ~ /^[0-9]+$/) { if (!pidmap[$2]) { pidmap[$2]=$NF; printf("pid: %s %s\n", pid, $NF) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729612
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty lsof eachtty | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[$2]) { pidmap[$2]=$NF; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729766
wz-ls  | jq -r '.[].tty_name' | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" # |  | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729782
wz-ls  | jq -r '.[].tty_name' | xargs basename | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" # |  | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729788
wz-ls  | jq -r '.[].tty_name' | xargs basename # | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" # |  | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729797
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty # | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" # |  | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729807
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" # |  | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729896
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}" # | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729943
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "($(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772729970
lsof | head
#1772729985
wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "(^\s*COMMAND|$(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap;} { pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; printf("%s %s\n", pid, path)}}' 
#1772730055
cls;wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "(^\s*COMMAND|$(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap; delete cmdmap;} { cmd=$1; pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]; cmdmap[pid]=$1;) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; cmd=cmdmap[pid]; printf("%s %s %s\n", pid, path, cmd)}}' 
#1772730064
cls;wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "(^\s*COMMAND|$(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap; delete cmdmap;} { cmd=$1; pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]; cmdmap[pid]=$1;) { pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; cmd=cmdmap[pid]; printf("%s %s %s\n", pid, path, cmd)}}' 
#1772730100
cls;wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "(^\s*COMMAND|$(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap; delete cmdmap;} { cmd=$1; pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { cmdmap[pid]=cmd; pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; cmd=cmdmap[pid]; printf("%s %s %s\n", pid, path, cmd)}}' 
#1772730135
cls;wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "(^\s*COMMAND|$(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap; delete cmdmap;} { cmd=$1; pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { cmdmap[pid]=cmd; pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; cmd=cmdmap[pid]; printf("%s\n", path)}}' 
#1772730160
cls;wz-ls  | jq -r '.[].tty_name' | xargs -Ieachtty basename eachtty | xargs printf '%s|' | sed -E 's/[|]+\s*$//g' | echo "(^\s*COMMAND|$(cat < /dev/stdin))" | declare -- tty_regex="$(cat < /dev/stdin)"; lsof | grep -E "${tty_regex}\$" | gawk 'BEGIN {delete pidmap; delete cmdmap;} { cmd=$1; pid=$2; path=$NF; if ($2 ~ /^[0-9]+$/) { if (!pidmap[pid]) { cmdmap[pid]=cmd; pidmap[pid]=path; printf("pid: %s %s\n", pid, path) >> "/dev/stderr" } } } END { for (pid in pidmap) { path=pidmap[pid]; cmd=cmdmap[pid]; printf("%s\n", pid)}}'  | xargs -Ieachpid ps aux -p eachpid
#1772730194
wz 
#1772730206
wz set-tab-title backup.
#1772730223
shell_d_sh_prompt_command_disable 
#1772730225
wz set-tab-title backup.
#1772730233
unset PROMPT_COMMAND 
#1772730234
wz set-tab-title backup.
#1772730240
wz set-tab-title backup
#1772730261
wz set-window-title $(basename $(pwd))
#1772730584
pbpaste > buffer
#1772730586
bat buffer 
#1772730594
launch_emacs_desktop
#1772730936
git add sc*
#1772730600
cat buffer 
#1772731060
ps  aux | grep backup
#1772732131
ll
#1772732142
cd .shell.d/x.d/
#1772732146
git whatchanged -p workbench.sh
#1772732173
pushd workbench
#1772732175
pwd
#1772732194
declare -F workbench*
#1772732199
declare -F | grep workbench
#1772732206
declare -F | grep workbench | lastcol
#1772732230
pushd ~/opt/libexec/
#1772732246
ln -s $(pwd)/lastcol $(pwd)/lastc
#1772732253
ln -s $(pwd)/lastcol $(pwd)/col-last
#1772732258
ln -s $(pwd)/firstcol $(pwd)/col-first
#1772732262
popd
#1772732267
declare -F | grep workbench | lastc
#1772732274
for fn in $(declare -F | grep workbench | lastc); do mkdir -p ./src/functions/; echo -e "pub fn ${fn}() {\n\n}" > ./src/functions/${fn}.rs; done
#1772732348
git add src/functions/
#1772732354
rustfmt src/functions/*.rs
#1772732358
git diff
#1772732371
> src/functions/mod.rs
#1772732373
emc src/functions/mod.rs
#1772732394
rust-autocomplete -h
#1772732397
rust-autocomplete list
#1772732415
for file in ./src/functions/*.rs; do if [[ "${file}" =~ mod[.]rs$ ]]; then continue; fi; echo -e "\n\n//$(path base "${file}")\n\n$(rust-autocomplete list "${file}")\n\n//$(path base "${file}")\n" >> src/functions/mod.rs ; git add -f src/functions/mod.rs && git commit src/functions/mod.rs -m "functions/mod.rs: include ${file}"; done
#1772732703
st
#1772732720
ll ~/Kino/
#1772732742
st
#1772732747
cd /Volumes/nothing/
#1772732818
ll bitcoind-07e91431311c01/ ./xxx/ ./APFEL/ ./VOLUMES/ ./unknown/APFEL/ MUSIC/ 
#1772732851
dua i bitcoind-07e91431311c01/ ./xxx/ ./APFEL/ ./VOLUMES/ ./unknown/APFEL/ MUSIC/ | tee ~/workbench/2026-03-05/volumes-nothing.dua-i.ansi.txt
#1772733058
g p -r chrome -k
#1772733064
g p -r vlc -k
#1772733117
pushd ~/workbench/2026-03-05/
#1772733119
ll
#1772733132
st
#1772733144
pushd /Volumes/nothing/
#1772733159
pwd
#1772733015
dua i ./APFEL/projects/ ./APFEL/Downloads/ ./APFEL/Documents/ ./APFEL/Desktop/ ./APFEL/godot ./APFEL/JUCE/ ./APFEL/DaVinci/ ./APFEL/Movies/ ./APFEL/Music/ ./unknown/APFEL/projects/ ./unknown/APFEL/Downloads/ ./unknown/APFEL/Documents/ ./unknown/APFEL/Desktop/ | tee ~/workbench/2026-03-05/dua-i-$(today).latest.ansi.txt
#1772732698
cargo doc --open
#1772733244
g p -r chrome -k
#1772733398
sudo iotop 
#1772733555
pwd
#1772733596
wz-ls | jq '.[0] {pane_id,window_id,cwd,tty_name} '
#1772733607
wz-ls | jq '.[0] | keys' # {pane_id,window_id,cwd,tty_name} '
#1772733651
wz-ls | jq '.[] | {pane_id,window_id,tab_id,window_title,tab_title,size,workspace,cwd,tty_name} '
#1772733657
wz-ls | jq '.[] | {pane_id,window_id,tab_id,window_title,tab_title,size,workspace,cwd,tty_name,top_row} '
#1772733662
wz-ls | jq '.[0] | keys' # {pane_id,window_id,cwd,tty_name} '
#1772733678
wz-ls | jq '.[] | {pane_id,window_id,tab_id,window_title,tab_title,size,workspace,cwd,tty_name,top_row,left_col} '
#1772733690
wz-ls | jq '.[] | {pane_id,window_id,tab_id,window_title,tab_title,cwd,tty_name} '
#1772733755
ack --sh jq.*match ~/opt/libexec/ ~/workbench/
#1772733762
ack jq.*match ~/opt/libexec/ ~/workbench/
#1772733767
cls;ack jq.*match ~/opt/libexec/ ~/workbench/
#1772723210
man bash
#1772733780
jq --help | batman 
#1772733819
which -a iotop
#1772733845
emc src/cli/commands/canon/command.rs 
#1772733896
ack --rs '\bprintln\b' src/cli/commands/*/command.rs
#1772734074
cargo run
#1772734079
st
#1772733369
find ./APFEL/projects ./unknown/APFEL/projects -regextype egrep -type d -regex '.*/(node_modules|target)' -not -regex '.*/(node_modules|target)/.*/(node_modules|target)' | tee ~/workbench/2026-03-05/dev-artifacts-volumes-nothing.txt
#1772734109
pushd ~/workbench/2026-03-05/
#1772734156
find  /Volumes/nothing/APFEL/projects /Volumes/nothing/unknown/APFEL/projects -regextype egrep -type d -regex '.*/(node_modules|target)' -not -regex '.*/(node_modules|target)/.*/(node_modules|target)' | tee ~/workbench/2026-03-05/dev-artifacts-volumes-nothing.txt 
#1772734166
cls;find  /Volumes/nothing/APFEL/projects /Volumes/nothing/unknown/APFEL/projects -regextype egrep -type d -regex '.*/(node_modules|target)' -not -regex '.*/(node_modules|target)/.*/(node_modules|target)' | tee ~/workbench/2026-03-05/dev-artifacts-volumes-nothing.txt 
#1772730957
cat buffer ;echo
#1772730995
pandoc -f markdown -i $(cat buffer ) -t opml -o schizo-2026-03-05-at-17-04-54-PM-UTC.opml.xml
#1772731008
pandoc -f markdown -i ~/projects/notes/osx/schizo-2026-03-05-at-17-04-54-PM-UTC.rst2026-03-05-at-17-04-54-PM-UTC.md -t opml -o schizo-2026-03-05-at-17-04-54-PM-UTC.opml.xmlc
#1772731064
ll
#1772731069
sudo ./backup.sh 
#1772731091
emc backup.sh 
#1772731124
sudo ./backup.sh 
#1772731144
sudo ./backup.sh 
#1772734554
. ~/.shell.d/entrypoint.sh
#1772734225
list-home-paths-for-dua 
#1772734258
list-home-paths-for-dua | xargs dua i | tee ./~to-delete.ansi.txt | ansistrip > ./~to-delete.txt
#1772734270
dua i $(list-home-paths-for-dua) | tee ./~to-delete.ansi.txt | ansistrip > ./~to-delete.txt
#1772734423
ll
#1772734430
bat ./~to-delete.txt 
#1772734510
wz spawn --new-window --cwd '/Users/gabrielfalcao/*sandbox*' && wz spawn --new-window --cwd '/Users/gabrielfalcao/test-git' && wz spawn --new-window --cwd '/Users/gabrielfalcao/wat'
#1772734685
declare -- tmp_pane_id=$(wz spawn --new-window --cwd '/Users/gabrielfalcao/*sandbox*'); wz spawn --pane-id=${tmp_pane_id} --new-window --cwd '/Users/gabrielfalcao/test-git' && wz spawn --new-window --cwd '/Users/gabrielfalcao/wat'  --pane-id=${tmp_pane_id}
#1772734758
declare -a to_delete_paths=(
#1772734772
declare -a to_delete_paths=(
#1772734779
list-home-paths-for-dua 
#1772734805

#1772735015
declare -F | grep prompt_com
#1772735041
wezterm cli
#1772735161
pushd ~/.shell.d/
#1772735507
echo ${WEZTERM_PANE}}
#1772735165
git dh entrypoint.sh
#1772735548
echo ${WEZTERM_
#1772735550
echo ${WEZTERM_PANE} 
#1772735562
ll
#1772735564
bat test-git 
#1772735570
cd ..
#1772735574
rm -rf test-git/
#1772735576
pwd
#1772735577
dua
#1772735578
cd ..
#1772735580
rm ./delete
#1772735582
rm ./deleteme/
#1772735584
rm -rfv ./deleteme/
#1772735588
dua
#1772735589
cd ..
#1772735593
rm -rf ./temp/
#1772735595
dua
#1772735597
open rde_splash_fhd.jpg 
#1772735602
cd ..
#1772735604
cd -
#1772735628
gstat  -c '%Y %W %y %w %n%n%N' rde_splash_fhd.jpg 
#1772735636
gstat  -c '%Y %W %y %w

%N' rde_splash_fhd.jpg' 
#1772735644
gstat  -c '%Y %W %y %w

%N' rde_splash_fhd.jpg
#1772735665
mv rde_splash_fhd.jpg ~/workbench/archive/2025-12-03/
#1772735667
cd ..
#1772735669
rm -rf wat/
#1772735671
dua
#1772735831
cd
#1772735836
cd -
#1772735843
pushd workbench
#1772735845
dirs
#1772735846
pwd
#1772735860
> src/cli/commands/thatday/mod.rs
#1772735863
> src/cli/commands/thatday/command.rs
#1772735865
git add src/cli/commands/thatday/
#1772735876
path touch src/cli/commands/thatday/mod.rs
#1772735883
path touch --mkpath src/cli/commands/thatday/mod.rs
#1772735887
path touch --help
#1772735893
path -h
#1772735905
path mk -h
#1772735915
path mk src/cli/commands/thatday/
#1772735919
path mk -p src/cli/commands/thatday/
#1772735923
path mk -P src/cli/commands/thatday/
#1772735928
> src/cli/commands/thatday/command.rs
#1772735930
> src/cli/commands/thatday/mod.rs
#1772735932
git add src/cli/commands/thatday/
#1772735700
gstat -c '%Y %W %y 

%N'
#1772735724
find . -mindepth 1 -maxdepth 1
#1772735742
find . -mindepth 1 -maxdepth 1 -exec gstat -c '%Y %W %y 

{}' '{}' \;
#1772735750
find . -mindepth 1 -maxdepth 1 -exec gstat -c '%Y %W %y  {}' '{}' \;
#1772735774
for path in $(find . -mindepth 1 -maxdepth 1); do declare -i changed_ts=$(gstat  -c '%Y' "${path}"); declare -- thatday=$(date --date=@${changed_ts} --format="%Y-%m-%d"); declare -- workbench_thatday=$(find ~/workbench -type d -name "${thatday}" -exec path canon '{}' \;); find ~/workbench -type d -name "${thatday}" -exec path canon '{}' \;; echo "mv -fv ${path@Q} ${workbench_thatday@Q}"; done
#1772736163
for path in $(find . -mindepth 1 -maxdepth 1); do declare -i changed_ts=$(gstat  -c '%Y' "${path}"); declare -- thatday=$(date --date=@${changed_ts} +'%Y-%m-%d); declare -- workbench_thatday=$(find ~/workbench -type d -name "${thatday}" -exec path canon '{}' \;); find ~/workbench -type d -name "${thatday}" -exec path canon '{}' \;; echo "mv -fv ${path@Q} ${workbench_thatday@Q}"; done
#1772736168
for path in $(find . -mindepth 1 -maxdepth 1); do declare -i changed_ts=$(gstat  -c '%Y' "${path}"); declare -- thatday=$(date --date=@${changed_ts} +'%Y-%m-%d'); declare -- workbench_thatday=$(find ~/workbench -type d -name "${thatday}" -exec path canon '{}' \;); find ~/workbench -type d -name "${thatday}" -exec path canon '{}' \;; echo "mv -fv ${path@Q} ${workbench_thatday@Q}"; done
#1772734824
declare -a to_delete_paths=( $(list-home-paths-for-dua) )
#1772734848
for path in ${to_delete_paths[@]}; do wezterm cli spawn --pane-id=81 --cwd="${path}"; done
#1772735222
path base .
#1772735224
path base $(pwd)
#1772735227
path parent $(pwd)
#1772735265
path name $(pwd)
#1772735555
for path in ${to_delete_paths[@]}; do wezterm cli spawn --pane-id=81 --cwd="${path}"; done
#1772737067
help fg
#1772737108
bash -c 'declare -i timeout=10; declare -i secs=0;
for secs in $(seq 1 ${timeout}); do
   declare -i amt=-1;
   amt=$(( timeout - secs ))
   printf '%*s...\n' 5 ${amt} 
   sleep 1
done'
#1772737248
bash -c 'declare -i timeout=10; declare -i secs=0;
for secs in $(seq 1 ${timeout}); do
   declare -i amt=-1;
   amt=$(( timeout - secs ))
   printf '%*s...\x0a' 5 ${amt} 
   sleep 1
done'
#1772737254
bash -c 'declare -i timeout=10; declare -i secs=0;
for secs in $(seq 1 ${timeout}); do
   declare -i amt=-1;
   amt=$(( timeout - secs ))
   printf '%*s...\\x0a' 5 ${amt} 
   sleep 1
done'
#1772737361
bash -c 'set -umeTE
set +f
set -o pipefail


declare -- script_name="$(basename "${BASH_SOURCE[0]}")"
declare -- script_path="$(2>/dev/random 1>/dev/random cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -- this_script_path="${script_path}/${script_name}"

on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;




echo ${timeout}
for secs in $(seq 1 ${timeout}); do
   amt=$(( timeout - secs ))
   printf "\x1b[A\r%*s...\n" 5 ${amt} 
   sleep 1
done'
#1772737463
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;




printf "%s...\n" ${timeout}
for secs in $(seq 1 ${timeout}); do
   amt=$(( timeout - secs ))
   printf "\x1b[A\r%*s...\n" 5 ${amt} 
   sleep 1
done'
#1772737494
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%s...\n" ${timeout}
for secs in $(seq 1 ${timeout}); do
   amt=$(( timeout - secs ))
   printf "\x1b[A\r%*s...\n" 5 ${amt} 
   sleep 1
done'
#1772737511
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%s...\n" ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%*s...\n" 5 ${amt} 

done'
#1772737541
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%s...\n" ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%s...\n" ${amt} 

done'
#1772737598
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%-*s%s...\n" 5 "tmp_script" ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%-*s%s...\n" 5 'tmp_script' ${amt} 

done'
#1772737607
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%*s%s...\n" 5 "tmp_script" ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%*s%s...\n" 5 'tmp_script' ${amt} 

done'
#1772737639
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%*s%*s...\n" 20 "tmp_script" 5 ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%*s%*s...\n" 20 'tmp_script' 5 ${amt} 

done'
#1772737647
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";


on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
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

declare -i amt=-1; declare -i timeout=10; declare -i secs=0;

1>&2 echo -en "\x1b[2J\x1b[3J\x1b[H"


printf "%-*s%*s...\n" 20 "tmp_script" 5 ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%-*s%*s...\n" 20 'tmp_script' 5 ${amt} 

done'
#1772737729
bash -c 'set -umeTE
set +f
set -o pipefail
export IFS="
";
declare -i amt=-1; declare -i timeout=37; declare -i secs=0;

on_exit() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\r\nDONE\x1b[0m"
}
on_ctrlc() {
    1>&2 echo -e "\x1b[1;38;2;253;67;83m\x1b[A\rAborted with Ctrl-C at ${amt}s remaining\x1b[0m"
    exit 130
}
trap on_exit exit
trap on_ctrlc hup
trap on_ctrlc int
trap on_ctrlc bus
trap on_ctrlc segv
trap on_ctrlc sys


1>&2 echo -en "\X1b[2J\x1b[3J\x1b[H"


printf "%-*s%*s...\n" 10 "tmp_script" 5 ${timeout}
for secs in $(seq 1 ${timeout}); do
   sleep 1

   amt=$(( timeout - secs ))
   printf "\x1b[A\r%-*s%*s...\n" 10 'tmp_script' 5 ${amt} 

done'
#1772737787
git add fakedaemon.sh 
#1772738094
./fakedaemon.sh 
#1772738099
./fakedaemon.sh 
#1772738104
help stty
#1772738106
man stty
#1772738115
man stty
#1772738118
man stty
#1772738140
bashint 
#1772738182
man stty
#1772738191
stty -a
#1772738203
man stty
#1772738540
bat ~/.shell.d/.awk.d/unique_lines.gawk 
#1772738590
stty -a
#1772738592
gstty -a
#1772738598
/bin/stty -a
#1772738600
cls;/bin/stty -a
#1772738613
cls;/bin/stty -a;echo -e '\n\n'; stty -a
#1772738618
cls;/bin/stty -a;echo -e '\n\n'; stty -a;echo -e '\n\n'
#1772738661
man gstty
#1772738695
cp $(man -w gstty) .
#1772738696
cp $(man -w stty) .
#1772738707
/bin/gstty
#1772738708
/bin/stty
#1772738710
cls;/bin/stty
#1772738712
cls;/bin/stty -a
#1772738724
cls;gstty -a
#1772738727
cls;/bin/stty -a
#1772738730
cls;gstty -a
#1772738830
cls;gstty -a | pbcopy 
#1772739909
stty -a
#1772739911
gstty -a
#1772740299
cls;find /Users/gabrielfalcao/workbench/ -type f -regextype egrep -regex '.*[.]([jt]sx?)$'
#1772740319
cls;find /Users/gabrielfalcao/workbench/ -type f -regextype egrep -regex '.*[.]([jt]sx?)$' -not -regex '.*/(target|node_modules)/.*'
#1772740339
cls;find /Users/gabrielfalcao/workbench -mindepth 2 -maxdepth 4 -type f -regextype egrep -regex '.*[.]([jt]sx?)$' -not -regex '.*/(target|node_modules)/.*'
#1772740346
cls;find /Users/gabrielfalcao/workbench -mindepth 2 -maxdepth 3 -type f -regextype egrep -regex '.*[.]([jt]sx?)$' -not -regex '.*/(target|node_modules)/.*'
#1772740363
cls;find ~/workbench/archive/  /Users/gabrielfalcao/workbench -mindepth 2 -maxdepth 3 -type f -regextype egrep -regex '.*[.]([jt]sx?)$' -not -regex '.*/(target|node_modules)/.*'
#1772740888
git add *.sh *.js 
#1772740891
git commit code
#1772740898
git add .
#1772740987
git add . | sed -E 's/^[A-Z0-9]+\{1,2}([^[:space:]].*)$/\1/g'
#1772741003
git add . | sed -E 's/^[A-Z0-9]+\s{1,2}([^[:space:]].*)$/\1/g'
#1772741013
git add . | sed -E 's/^[A-Z0-9]+\s+([^[:space:]]*.*)$/\1/g'
#1772741029
git add . | sed -E 's/^[A-Z0-9]+(.*)$/\1/g'
#1772741049
git add . | sed -E 's/^[A-Z0-9]+\s{1,2}(.*)$/\1/g'
#1772741053
git add . | sed -E 's/^[A-Z0-9]+\s+(.*)$/\1/g'
#1772741066
unset HISTIGNORE 
#1772741868
echo ${IFS@Q}
#1772741961
printf $'wat %s\x27s: %S\n' PATH "$(export IFS=$':'; echo "${PATH}")"
#1772741966
printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':'; echo "${PATH}")"
#1772741982
printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && echo "${PATH}")"
#1772741987
printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && echo ${PATH})"
#1772742006
declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && echo ${PATH})";echo;declare -p IFS
#1772742045
declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '%s\t' ${PATH})";echo;declare -p IFS
#1772742059
declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' ${PATH})";echo;declare -p IFS
#1772742067
declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS
#1772742211
declare -p -a
#1772742223
declare -a
#1772742229
declare -p -a +r
#1772742243
help declare | batman
#1772742263
declare -p +r -a 
#1772742276
echo "${shell_d_load_source_queue}"
#1772742279
echo "${shell_d_load_source_queue[@]}"
#1772742286
echo "${shell_d_load_source_queue[*]}"
#1772742320
echo "$(export IFS=$':'; echo ${shell_d_load_source_queue[@]})"
#1772742326
echo "$(export IFS=$':'; echo "${shell_d_load_source_queue[@]}")"
#1772742340
(export IFS=$':'; echo "${shell_d_load_source_queue[@]}")
#1772742345
(export IFS=$':'; echo ${shell_d_load_source_queue[@]})
#1772742364
(export IFS=$':'; printf "%s%s" ${shell_d_load_source_queue[@]}) "${IFS}"
#1772742383
(export IFS=$':'; printf "%s%s" ${shell_d_load_source_queue[@]}) 
#1772742390
(export IFS=$':'; printf "%s${IFS}" ${shell_d_load_source_queue[@]}) 
#1772742398
(export IFS=$':'; echo ${shell_d_load_source_queue[@]})
#1772742401
(export IFS=$':'; echo ${shell_d_load_source_queue[*]})
#1772742406
(export IFS=$':'; echo "${shell_d_load_source_queue[*]}")
#1772742414
(export IFS=$'^'; echo "${shell_d_load_source_queue[*]}")
#1772742448
echo $(export IFS=$'^'; echo "${shell_d_load_source_queue[*]}")
#1772742456
echo $(export IFS=$'$'; echo "${shell_d_load_source_queue[*]}")
#1772742465
echo $(export IFS=$'\x24\x37'; echo "${shell_d_load_source_queue[*]}")
#1772742469
echo $(export IFS=$'\x37'; echo "${shell_d_load_source_queue[*]}")
#1772742472
echo $(export IFS=$'\x25'; echo "${shell_d_load_source_queue[*]}")
#1772742510
(export IFS=$':'; echo "${shell_d_load_source_queue[*]}")
#1772742534
declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS
#1772742585
declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS; ) )
#1772742592
echo ${tmplines[@]}
#1772742603
printf '%s\n' ${tmplines[@]}
#1772742607
cls;printf '%s\n' ${tmplines[@]}
#1772742611
cls;declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS; ) )
#1772742626
cls;declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS; ) ); echo "${tmplines[*]}"
#1772742647
cls;declare -a tmplines=( $(declare -p IFS; export IFS=$':'; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS; ) ); echo "${tmplines[*]}"
#1772742650
cls;declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "$(export IFS=$':' && printf '\t%s\n' "${PATH}")";echo;declare -p IFS; ) ); echo "${tmplines[*]}"
#1772742686
cls;declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "${PATH}") )
#1772742700
cls;declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "${PATH}") );echo "${tmplines[*]}"
#1772742894
cls;declare -a tmplines=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "${PATH}") ); echo "${tmplines[*]}"
#1772742999
cls;declare -a tmplines_after=();declare -a tmplines_before=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "${PATH}") ); echo "${tmplines_before[*]}"; tmp_lines_after=( $(export IFS=$':'; echo ${PATH}) ); echo "${tmplines_after[*]}"
#1772743016
cls;set -x;declare -a tmplines_after=();declare -a tmplines_before=( $(declare -p IFS; printf $'wat %s\x27s: %s\n' PATH "${PATH}") ); echo "${tmplines_before[*]}"; tmp_lines_after=( $(export IFS=$':'; echo ${PATH}) ); echo "${tmplines_after[*]}";set +x
#1772743172
emc test_IFS_with_echo_and_printf.sh 
#1772743955
local -i foobarnum=007
#1772743967
declare -i foobarnum=007; declare -p foobarnum
#1772744417
which -a shfmt-o  | xargs bat
#1772744428
which -a shfmt
#1772744507
shfmt --help | batman 
#1772744513
2>&1 shfmt --help | batman 
#1772745502
cd ~/.shell.d/
#1772745512
cd ~/.shell.d/
#1772745745
declare -- ps1_safe='\u@\h:\w\$ '; declare -- ps1_escaped=$'\\u@\\h:\\w\\$ '
#1772745751
unset PS1
#1772745760
bashint 
#1772745772
bashint 
#1772745890
(unset PS1 PS2 PS3 PS4; bashint < /dev/stdin )
#1772744534
2>&1 shfmt --help | batman 
#1772744582
shfmt -bn --diff  -ci --indent=4 -ln=bash "${HOME}/.shell.d/x.d/history-list-entries-2026-03-05.sh"
#1772744598
shfmt --diff -ln=bash "${HOME}/.shell.d/x.d/history-list-entries-2026-03-05.sh"
#1772744609
shfmt -bn --diff  -ci --indent=4 -ln=bash "${HOME}/.shell.d/x.d/history-list-entries-2026-03-05.sh"
#1772744617
shfmt -bn --diff  -ci --indent=2 -ln=bash "${HOME}/.shell.d/x.d/history-list-entries-2026-03-05.sh"
#1772744623
shfmt -bn  -ci --indent=2 -ln=bash "${HOME}/.shell.d/x.d/history-list-entries-2026-03-05.sh"
#1772744634
shellcheck "${HOME}/.shell.d/x.d/history-list-entries-2026-03-05.sh"
#1772744693
path canon -uf ~/.shell.d/x.d/history-list-entries-2026-03-05.sh 
#1772744699
path canon -uf ~/.shell.d/x.d/history-list-entries-2026-03-05.sh | head 
#1772744703
path canon -uf ~/.shell.d/x.d/history-list-entries-2026-03-05.sh | head | pbcopy 
#1772744716
bash --norc --noprofile -c 'source "$HOME/.shell.d/x.d/history-list-entries-2026-03-05.sh";
declare -F
'
#1772744739
bash --norc --noprofile -c '
export HISTFILE="${HOME}/.bash_history"; history -n; export HISTFILE="${HOME}/.bash_history.pid.$$"
set -umeTE; set +f; set -o pipefail; 
shell_d_sh_history_entries_suffixed_with_entry_id_and_timestamp
'
#1772745567
bashint 
#1772746518
pushd ~/.shell.d/
#1772746532
mv x.d/history-list-entries-2026-03-05.sh fn.staging.d/
#1772746541
git add rc.d/ conf.d/
#1772746610
git commit conf.d/ rc.d/ -m '~/.gitconfig and ~/.ackrc: add note of git log colored format to the former and add plain-text types to the latter'
#1772746644
#git commit fn.staging.d/ -m 'WIP: history-list-entries-2026-03-05.sh => 
#1772746649
git dh entrypoint.sh
#1772746667
git add .
#1772746766
ord NAME
#1772746774
ord NAME | awk '{ print $2 }'
#1772746789
ord NAME | awk '{ print $2 }' | xargs printf '%s + '
#1772746805
ord NAME | awk '{ print $2 }' | xargs printf '%s + ' | sed -E 's/\s*[+]\s*$//g'
#1772746806
ord NAME | awk '{ print $2 }' | xargs printf '%s + ' | sed -E 's/\s*[+]\s*$//g';echo
#1772746864
echo "$(ord NAME | awk '{ print $2 }' | xargs printf '%s + ' | sed -E 's/\s*[+]\s*$//g';echo)"
#1772746892
python -c  "print($(ord NAME | awk '{ print $2 }' | xargs printf '%s + ' | sed -E 's/\s*[+]\s*$//g';echo) )"
#1772746909
~/.shell.d/.venv/bin/python3 -c  "print( $(ord NAME | awk '{ print $2 }' | xargs printf '%s + ' | sed -E 's/\s*[+]\s*$//g';echo) )"
#1772746925
~/.shell.d/.venv/bin/python3 -c  "print( $(ord NAME | awk '{ print $2 }' | xargs printf '%s ^ ' | sed -E 's/\s*[^]\s*$//g';echo) )"
#1772746931
~/.shell.d/.venv/bin/python3 -c  "print( $(ord NAME | awk '{ print $2 }' | xargs printf '%s ^ ' | sed -E 's/\s*[\^]\s*$//g';echo) )"
#1772746944
~/.shell.d/.venv/bin/python3 -c  "print( $(ord NAME | awk '{ print $2 }' | xargs printf '%s + ' | sed -E 's/\s*[+]\s*$//g';echo) )"
#1772746997
~/.shell.d/.venv/bin/python3 -c  "values = [ $(ord NAME | awk '{ print $2 }' | xargs printf '%s, ') ];
added = reduce(sum, values, 0);
xored = reduce(operator.xor, values, 0);
added_xor_xored=added ^ xored
print(json.dumps(dict([(k, v) for k, v in locals().items() if any([prefix in k for prefix in ('reduce', 'added', 'added')])))
"
#1772747428
ipython3
#1772747991
find ~/opt/libexec -mindepth 1 -maxdepth 1 -type l
#1772747996
man find
#1772748089
man find
#1772748212
man find
#1772748283
man find
#1772748362
man find
#1772748368
man find
#1772748415
find ~/opt/libexec  -mindepth 1 -maxdepth 1 -P -not -follow -type l 
#1772748422
find -P ~/opt/libexec  -mindepth 1 -maxdepth 1 -not -follow -type l 
#1772748429
find -P ~/opt/libexec  -mindepth 1 -maxdepth 1 -type l 
#1772748456
find -P ~/opt/libexec  -mindepth 1 -maxdepth 1 -type l  -exec gstat -c '%F "{}"' '{}' \;
#1772748710
echo -- find -P ~/opt/libexec  -mindepth 1 -maxdepth 1 -type l -regextype egrep -regex ".*/(i?python|pip)(3([.]$(echo {9..15} | sed -E 's/\s+/|/g; s/^([0-9|]+)$/(\1)/g'))?)?"
#1772748736
echo -- find -P ~/opt/libexec  -mindepth 1 -maxdepth 1 -type l -regextype egrep -regex ".*/(i?python|pip)(3([.]$(echo {9..15} | sed -E 's/\s+/|/g; s/^([0-9|]+)$/(\1)?/g'))?"
#1772748739
cls;echo -- find -P ~/opt/libexec  -mindepth 1 -maxdepth 1 -type l -regextype egrep -regex ".*/(i?python|pip)(3([.]$(echo {9..15} | sed -E 's/\s+/|/g; s/^([0-9|]+)$/(\1)?/g'))?"
#1772748773
which python-upgrade-packages 
#1772748776
which python-upgrade-packages  | xargs bat
#1772749041
bash tmp-deleteme.sh 
#1772749084
bash tmp-deleteme.sh 
#1772749134
bash tmp-deleteme.sh 
#1772749168
bash tmp-deleteme.sh 
#1772749182
bash tmp-deleteme.sh 
#1772749359
ord {}
#1772749608
bash tmp-deleteme.sh 
#1772749649
ord \
#1772749651
ord \\
#1772749663
ord \\n
#1772749698
bash tmp-deleteme.sh 
#1772749723
bash tmp-deleteme.sh 
#1772749731
bash tmp-deleteme.sh 
#1772749766
bash tmp-deleteme.sh 
#1772749798
ord @
#1772749822
ord [@]
#1772749841
ord '#[@]'
#1772749860
bash tmp-deleteme.sh 
#1772749893
A
#1772749895
reset 
#1772749898
bash tmp-deleteme.sh 
#1772749910
bash tmp-deleteme.sh tmp-deleteme.py 
#1772749943
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750015
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750026
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750046
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750060
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750068
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750117
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750144
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750175
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750225
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750261
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750274
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750288
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750297
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750301
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750338
bash tmp-deleteme.sh tmp-deleteme.py 
#1772750345
bash tmp-deleteme.sh tmp-deleteme.py  > foo.sh
#1772750347
chmod +x foo.sh 
#1772750383
./tmp-deleteme.sh 
#1772750392
./tmp-deleteme.sh 
#1772750400
man gstat
#1772750423
./tmp-deleteme.sh 
#1772750503
./tmp-deleteme.sh 
#1772750514
man gstat
#1772750532
./tmp-deleteme.sh 
#1772750542
./tmp-deleteme.sh 
#1772750561
./tmp-deleteme.sh 
#1772750607
./tmp-deleteme.sh 
#1772750616
./tmp-deleteme.sh 
#1772750618
./tmp-deleteme.sh 
#1772750638
mv tmp-deleteme.sh ~/opt/libexec/shell-d-venv-disable
#1772750641
chmod a+x ~/opt/libexec/shell-d-venv-disable
#1772750644
rm foo.sh 
#1772750667
man mktemp
#1772750756
chmod a+x tmp-deleteme.sh 
#1772754275
git st
#1772754277
git stash list
#1772754283
cls;git stash --help
#1772753701
jq --version
#1772753710
brew upgrade --help
#1772753713
brew upgrade --help | bat
#1772753721
brew upgrade jq
#1772754360
man git-diff
#1772754984
cat .pid*.log
#1772756977
cd /Volumes/nothing/APFEL/projects/
#1772756989
cd -
#1772757077
pushd ~/workbench/$(today )
#1772757094
cdmkd ./volumes-nothing-projects
#1772757225
unset HISTIGNORE 
#1772757352
cd ..
#1772757358
mv volumes-nothing-projects/ volumes-nothing
#1772757361
cd volumes-nothing
#1772757408
git st
#1772757410
git add .
#1772757411
git st
#1772757416
git commit . -m find-dev-artifacts.sh 
#1772757453
git st
#1772757454
git q
#1772757457
bash find-dev-artifacts.sh 
#1772754411
unset HISTIGNORE 
#1772754416
git stash show --patch stash@{0}
#1772754572
git stash list
#1772754600
git st
#1772754607
git stash show --patch --raw stash@{0}
#1772754613
git stash show --patch stash@{0}
#1772754632
git stash show --patch --stat stash@{0}
#1772754640
echo 'git stash show --patch --stat stash@{0}' | pbcopy 
#1772755047
wz-ls 
#1772755065
wz-ls | jq ".[] | select(.pane_id == ${WEZTERM_PANE})"
#1772755081
wz-ls | jq ".[] | select(.window_id == 24)"
#1772755113
wz-ls | jq -r ".[] | select(.window_id == 24) | .pane_id"
#1772755259
wz-ls | jq -r ".[] | select(.window_id == 24) | .pane_id" | xargs -Ieach_pane wz-wip-old -g each_pane
#1772755278
wz-ls | jq -r ".[] | select(.window_id == 24) | .pane_id"
#1772755289
declare -A output_by_pane_id=()
#1772755292
for pane_id in $(wz-ls | jq -r ".[] | select(.window_id == 24) | .pane_id"); do output_by_pane_id["${pane_id}"]=$(wz-wip-old -g "${pane_id}"); done
#1772755351
for pane_id in ${!output_by_pane_id[@]}; do output="${output_by_pane_id[${pane_id}]}"
if 1>/dev/null grep -E 'sudo\s+(bash\s+)?([.]/)?backup[.]sh' <<< "${output}"; then echo "${pane_id} has it"; fi; done
#1772755482
for pane_id in ${!output_by_pane_id[@]}; do output="${output_by_pane_id[${pane_id}]}"; echo "<pane id=${pane_id}>"; echo "${output}" | grep -E 'backup[.]sh'; echo "</pane id=${pane_id}>"; done
#1772755508
for pane_id in ${!output_by_pane_id[@]}; do output="${output_by_pane_id[${pane_id}]}"; echo "<pane id=${pane_id}>"; echo "${output}"; echo "</pane id=${pane_id}>"; done
#1772758994
signal_man=$(man -w signal)
#1772758996
echo ${signal_man} 
#1772759015
signal_man_filename=$(basename "${signal_man}" )
#1772759023
echo ${signal_man} ${signal_man_filename}
#1772759030
echo ${signal_man} 
#1772759033
echo ${signal_man_filename}
#1772759072
declare -A pandoc_exts=()
#1772759082
pandoc_exts['org']='org'
#1772759090
pandoc_exts['gfm']='md'
#1772759095
pandoc_exts['commonmark']='md'
#1772759102
pandoc_exts['html']='html'
#1772759109
pandoc_exts['opml']='opml'
#1772759116
pandoc_exts['docbook']='html'
#1772759139
for kind in ${!pandoc_exts[#]}; do extension=${pandoc_exts[${kind}]}; if [ "${kind}" == "${extension" ]; then
pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}"
else
pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}"
fi
done

#1772759251
for kind in ${!pandoc_exts[@]}; do extension=${pandoc_exts[${kind}]};  echo pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}"; pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}";  done
#1772759264
cls;for kind in ${!pandoc_exts[@]}; do extension=${pandoc_exts[${kind}]};  echo pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}"; pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}";  done
#1772759270
ll
#1772759277
ll
#1772759297
cls;for kind in ${!pandoc_exts[@]}; do extension=${pandoc_exts[${kind}]};  echo pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man}.${extension}"; pandoc -f man -i "${signal_man}" -t "${kind}" -o "${signal_man_filename}.${extension}";  done
#1772759302
ll
#1772759305
bat signal.3.org 
#1772759317
bat signal.3.html 
#1772759335
man signal
#1772759339
man 1 signal
#1772759350
for page in {1..8}; do man ${page} signal; done
#1772760453
sudo ps aux
#1772760465
sudo su
#1772760502
unset HISTIGNORE 
#1772760901
sudo vim /etc/bashrc
#1772760923
sudo vim /etc/com.apple.screensharing.agent.launchd 
#1772760937
sudo vim /etc/auto_home 
#1772760948
sudo vim /etc/auto_master 
#1772760957
ll /
#1772760960
ll /home/
#1772760963
sudo vim /etc/auto_master 
#1772760970
ll /
#1772761077
ll /System/Volumes/Data/
#1772761095
ll /System/Volumes/Data/home/
#1772761105
sudo chown gabrielfalcao:wheel /System/Volumes/Data/home/
#1772761107
ll /System/Volumes/Data/home/
#1772761119
sudo chown gabrielfalcao:wheel /home
#1772761124
ll /
#1772761133
ll /System/Volumes/Data/
#1772761141
ll /System/Volumes/Data/Users/
#1772761150
ll /System/Volumes/Data/Users/Shared/
#1772761152
dua /System/Volumes/Data/Users/Shared/
#1772761155
dua /System/Volumes/Data/Users/Shared/Documents/
#1772761157
dua /System/Volumes/Data/Users/Shared/Documents/GSatPlus/
#1772754992
cd ~/workbench/$(today )
#1772760627
man 5 ssh_config
#1772760653
man 5 sudo.conf
#1772760664
man 5 sudoers
#1772760853
man 5 sudoers
#1772762244
man 5 sudoers
#1772762294
declare -p 
#1772762295
declare -p -x
#1772762303
declare -p -x | grep -E PATH
#1772762305
declare -p -x | grep -E PATH=
#1772762315
declare -p -x | gawk {
#1772762317
declare -p -x | gawk '
 if ($3 ~ PATH$) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\1",  "g", $3))
}
}
'
#1772762408
declare -p -x | gawk '
 if ($3 ~ /PATH$/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\1",  "g", $3))
}
}
'
#1772762416
declare -p -x | gawk '
 { if ($3 ~ /PATH$/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\1",  "g", $3))
}
}
'
#1772762426
declare -p -x | gawk '
 { if ($3 ~ /PATH=/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\1",  "g", $3))
}
}
'
#1772762437
declare -p -x | gawk '
 { if ($3 ~ /PATH=/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\2",  "g", $3))
}
}
'
#1772762456
declare -p -x | gawk '
 { if ($3 ~ /[A-Z_]*PATH=/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\2",  "g", $3))
}
}
'
#1772762464
declare -p | gawk '
 { if ($3 ~ /[A-Z_]*PATH=/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\2",  "g", $3))
}
}
'
#1772762467
declare -p | gawk '
 { if ($3 ~ /[A-Z_]*PATH=/) {
print(gensub(/([A-Z0-9_]+PATH)=(.*)/, "\1",  "g", $3))
}
}
'
#1772762481
declare -p | gawk '
 { if ($3 ~ /[A-Z_]*PATH=/) {
print($3)
}
 }
'
#1772762510
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z_]*PATH=/) {
print($3)
}
 }
'
#1772762531
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z]*PATH=/) {
print($3)
}
 }
'
#1772762544
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z]*PATH=/) {
delete path_info
split($3, path_info, "=")
for (key in path_info) {
printf("key '%s': %s\n", key, path_info[key])
}
}'
#1772762628
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z]*PATH=/) {
delete path_info
split($3, path_info, "=")
for (key in path_info) {
printf("key '%s': %s\n", key, path_info[key])
}'
#1772762630
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z]*PATH=/) {
delete path_info
split($3, path_info, "=")
for (key in path_info) {
printf("key '%s': %s\n", key, path_info[key])
}
}
} 
'
#1772762679
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z]*PATH=/) {
delete path_info
split($3, path_info, "=")
printf("%s:\n\t%s\n",path_info[1], path_info[2])
}
}'
#1772762692
declare -p | gawk ' BEGIN { printf("\x1b[2J\x1b[3J\x1b[H") >> "/dev/stderr" }
 { if ($3 ~ /[A-Z]*PATH=/) {
delete path_info
split($3, path_info, "=")
printf("%s:\n\t%s\n\n",path_info[1], path_info[2])
}
}'
#1772762862
cls;declare -p
#1772764051
cd sexprs/
#1772764053
st
#1772758711
pushd ~/workbench/$(today )
#1772764065
cd
#1772764070
cd -
#1772764079
cd /Volumes/nothing/
#1772764084
cd -
#1772764095
wz spawn --new-window --cwd /Volumes/nothing/
#1772757544
sudo bash find-dev-artifacts.sh 
#1772760520
export EDITOR=vim
#1772760528
sudo su
#1772766282
htop
#1772767270
git st
#1772767274
git add x.d/
#1772767277
bat signal.3.*
#1772767287
echo signal.3.*
#1772767295
echo signal.3.* | xargs -Ieachman bat eachman
#1772767309
/bin/ls signal.3.* | xargs -Ieachman bat eachman
#1772767448
git st
#1772767449
git add x.d/
#1772768602
cd regex-ast/
#1772768603
git st
#1772768604
ll
#1772768621
1>TODO.md echo -e "# TODO $(today)

parse regexp groups and generate a 'to-string/replacement' string with all backreference of subexpression numbers with correct arity, sequence and nesting

"
#1772768711
git st
#1772768712
git add .
#1772768713
git q
#1772759367
man signal
#1772768781
wc -c '((((((((((((((';echo
#1772768784
wc -c <<< '((((((((((((((';echo
#1772769057
git st
#1772769058
git add x.d/
#1772769058
git st
#1772769067
git commit x.d/ -m "x.d/signal.sh*"
#1772769069
git clean -f
#1772769070
git st
#1772769107
cat x.d/signal.sh | ./x.d/signal.sh.gawk 
#1772769141
cat x.d/signal.sh | ./x.d/signal.sh.gawk 
#1772769147
cat x.d/signal.sh | ./x.d/signal.sh.gawk 
#1772769160
cat x.d/signal.sh | ./x.d/signal.sh.gawk 
#1772769172
cat x.d/signal.sh | ./x.d/signal.sh.gawk 
#1772769209
cat x.d/signal.sh | ./x.d/signal.sh.gawk 
#1772769668
git st
#1772769674
wz-wip-old 
#1772769680
launch_emacs_desktop
#1772769685
which -a wz-wip-old  
#1772769693
which -a wz-wip-old   | xargs emc
#1772769702
wz-wip-old 
#1772769706
wz-wip-old 
#1772769716
git st
#1772769805
pushd /Volumes/nothing/APFEL/*scratch*/.cats/07e804061c1609
#1772769806
ll
#1772769810
file *
#1772769811
bat 0b4sk8d.yaml 
#1772769871
cd vm
#1772769873
st
#1772769825
popd
#1772769890
cd /Volumes/nothing/APFEL/*scratch*/NSA/gwzt-07e816361f0107.zip
#1772769893
cd /Volumes/nothing/APFEL/*scratch*/NSA/
#1772769906
unzip --help
#1772769909
man unzip # --help
#1772769954
unzip -v gwzt-07e816361f0107.zip
#1772769957
ll
#1772769960
unzip -v gwzt-07e816361f0107.zip
#1772769973
dua /Volumes/nothing/APFEL/*scratch*/NSA/gwzt-07e816361f0107.zip
#1772769988
rm /Volumes/nothing/APFEL/*scratch*/NSA/gwzt-07e816361f0107.zip
#1772770014
cd
#1772761166
ll
#1772761341
bat /private/etc/sudoers.
#1772761344
bat /private/etc/sudoers
#1772761346
sudo su-
#1772761348
sudo su -
#1772762087
sudo su -
#1772762090
sudo su 
#1772771123
ll
#1772771125
c ./volumes-nothing/
#1772771126
ll
#1772771129
cd ./volumes-nothing/
#1772771130
ll
#1772771142
pbpaste > dua-i-volumes-nothing.pbpaste.txt
#1772771155
cat dua-i-volumes-nothing.pbpaste.txt
#1772771178
cp dua-i-volumes-nothing.pbpaste.txt dua-i-volumes-nothing.pbpaste.keep.txt
#1772771181
vim dua-i-volumes-nothing.pbpaste.keep.txt
#1772771265
ipython
#1772771453
git st
#1772771454
git add .
#1772771455
git q
#1772771464
ll
#1772771470
bat set_diff_dua-i-volumes-nothing.txt
#1772771498
cp set_diff_dua-i-volumes-nothing.txt  safe-to-delete.txt
#1772771499
vim safe-to-delete.txt
#1772771573
pwd
#1772771765
while true; do df -g /Volumes/nothing; sleep 3.14; done
#1772771795
while true; do  cls; df -f /Volumes/nothing; sleep 11; done
#1772771807
while true; do  cls; df -h /Volumes/nothing; sleep 11; done
#1772771818
while true; do  cls; df -h /Volumes/nothing; df /Volumes/nothing; sleep 11; done
#1772771846
while true; do  cls; df -h /Volumes/nothing | grep -E -v Filesystem; df /Volumes/nothing | grep -E -v Filesystem; sleep 11; done 
#1772771856
while true; do  cls; df -h /Volumes/nothing; df /Volumes/nothing | grep -E -v Filesystem; sleep 11; done 
#1772771873
while true; do  cls; df -h /Volumes/nothing; df /Volumes/nothing | grep -E -v Filesystem; date -u; sleep 11; done 
#1772771879
while true; do  cls; date ; df -h /Volumes/nothing; df /Volumes/nothing | grep -E -v Filesystem; date -u; sleep 11; done 
#1772772365
wz-wip-old 
#1772771523
echo ${IFS@A}
#1772771529
for path in $(cat safe-to-delete.txt ); do rm -rf "${path}"; done
#1772771547
for path in $(cat safe-to-delete.txt ); do rm -rfv "${path}"; done  > safe-to-delete.txt.log
#1772771605
for path in $(cat safe-to-delete.txt ); do echo "# delete ${path}"; rm -rf "${path}"; done  >> safe-to-delete.txt.log
#1772771656
for path in $(cat safe-to-delete.txt ); do echo; echo "# delete ${path}"; rm -rfv "${path}"; done  >> safe-to-delete.txt.log
#1772771690
for path in $(cat safe-to-delete.txt ); do echo; echo "# delete ${path}"; rm -rf "${path}"; done  >> safe-to-delete.txt.log
#1772771701
for path in $(cat safe-to-delete.txt ); do echo; echo "# delete ${path}"; 2>&1 time rm -rf "${path}"; done  >> safe-to-delete.txt.log
#1772771740
for path in $(cat safe-to-delete.txt ); do echo; echo "# delete ${path} started: $(date -u +%s)"; 2>&1 time rm -rf "${path}";  echo "# delete ${path} finished: $(date -u +%s)"; echo;done  >> safe-to-delete.txt.log
#1772772402
vim safe-to-delete.sh
#1772772414
chmod a+x safe-to-delete.sh
#1772772415
git st
#1772772416
git add .
#1772772417
git q
#1772772423
pwd
#1772736249
cd ~/workbench/$(today)
#1772736256
which -a todo
#1772736267
mv $(which todo) ~/opt/libexec/workbench-todo
#1772736288
> relocate.~__sandbox__.sh
#1772736290
emc relocate.~__sandbox__.sh
#1772735988
ll ~/workbench/
#1772736000
cd ~/workbench/
#1772736001
cd -
#1772736004
pushd ~/workbench/
#1772736004
ll
#1772736009
mkdir archive/2025
#1772736014
mv archive/2025-* archive/2025
#1772736017
ll
#1772736032
mkdir -p archive/2026
#1772736039
mv -fv 2026-01* archive/2026/
#1772736040
ll
#1772770020
pushd ~/workbench/$(today )
#1772770029
cp /Volumes/nothing/APFEL/*scratch*/Backups/Disks/DR-05/2024-02-19/0b4sk8d.yaml.gz .
#1772770033
gunzip  0b4sk8d.yaml.gz 
#1772770035
file 0b4sk8d.yaml 
#1772770037
bat 0b4sk8d.yaml
#1772770039
rm 0b4sk8d.yaml
#1772770052
bat /Volumes/nothing/APFEL/*scratch*/Backups/Downloads/0b4sk8d.yaml
#1772770271
find /Users/gabrielfalcao/projects/ /Users/gabrielfalcao/workbench/ -type f -name .rustc_info.json -exec path parent {} \;
#1772770719
cd /Volumes/nothing/unknown/APFEL/*scratch*/Backups/Disks/DR-05/2024-02-19/
#1772770721
cd -
#1772770722
cp /Volumes/nothing/unknown/APFEL/*scratch*/Backups/Disks/DR-05/2024-02-19/0b4sk8d.yaml.gz .
#1772770725
gunzip 0b4sk8d.yaml.gz 
#1772770728
bat 0b4sk8d.yaml 
#1772770731
file *
#1772770734
rm 0b4sk8d.yaml 
#1772770743
cp /Volumes/nothing/unknown/APFEL/*scratch*/Backups/Downloads/0b4sk8d.yaml
#1772770745
cp /Volumes/nothing/unknown/APFEL/*scratch*/Backups/Downloads/0b4sk8d.yaml .
#1772770746
file *
#1772770749
bat 0b4sk8d.yaml 
#1772770753
rm 0b4sk8d.yaml
#1772770780
file /Volumes/nothing/unknown/APFEL/*scratch*/C2Fsb/C2Fsb-2024-07-01/0b4sk8d.yaml
#1772770782
bat /Volumes/nothing/unknown/APFEL/*scratch*/C2Fsb/C2Fsb-2024-07-01/0b4sk8d.yaml
#1772770864
file /Volumes/nothing/unknown/APFEL/Desktop/.2023-11-08/0b4sk8d.yaml
#1772770866
bat /Volumes/nothing/unknown/APFEL/Desktop/.2023-11-08/0b4sk8d.yaml
#1772771097
ll
#1772771101
cd ../2026-03-05/
#1772771102
ll
#1772771105
cd ./volumes-nothing/
#1772771105
ll
#1772771304
ll ./volumes-nothing/
#1772771565
st
#1772771566
st
#1772771568
st
#1772771909
st
#1772738255
man stty
#1772738263
stty -g
#1772738267
stty -g -a
#1772738272
stty -g 
#1772738274
stty -a
#1772738297
stty -a | sed -E 's/;/;\n/g'
#1772738316
stty -a | sed -E 's/\s*;\s*/;\n/g' 
#1772738397
stty -a | sed -E 's/\s*;\s*/;\n/g' | sed -z -E 's/([\n]+)(([+-]?[a-z0-9]+)[[:space:]\n]+)/\1\n\2\n'
#1772738402
stty -a | sed -E 's/\s*;\s*/;\n/g' | sed -z -E 's/([\n]+)(([+-]?[a-z0-9]+)[[:space:]\n]+)/\1\n\2\n/g'
#1772738447
stty -a | sed -E 's/\s*;\s*/;\n/g' | sed -z -E 's/([\n]+)(([+-]?[^=[:space:]]+)[[:space:]\n]+)/\1\n\2\n/g'
#1772738456
stty -a | sed -E 's/\s*;\s*/;\n/g'
#1772738468
stty -a | gawk '
BEGIN {
delete lines;
delete control_key_map;
delete key_map;
delete disabled_opts;
delete enabled_opts;
PROCINFO["@sorted_in"] = "@ind_str_asc"
}

{

#1772767456
git commit x.d/ -m signal
#1772767462
git st
#1772767549
git diff x.d/signal.sh.el
#1772767631
git st
#1772767634
git diff x.d/signal.sh.el
#1772767656
git commit x.d/signal.sh.el -m x.d/signal.sh.el
#1772767704
git commit x.d/signal.sh.el -m x.d/signal.sh.el
#1772767792
bash x.d/signal.sh
#1772733803
man jq | batman
#1772723194
help -m complete | batman 
#1772659359
man pandoc # --help
#1772697562
ipython
#1772771749
unset HISTIGNORE 
#1772771754
tail -f safe-to-delete.txt.log 
#1772772454
pushd ~/workbench/2026-03-05/
#1772772457
cd ./volumes-nothing/
#1772772457
ll
#1772772468
vim safe-to-delete.sh 
#1772772485
bash safe-to-delete.sh 
#1772772519
while true; do  cls; date ; df -h /Volumes/nothing; df /Volumes/nothing | grep -E -v Filesystem; date -u; sleep 11; done 
#1772772612
cd 
#1772772613
cd mu
#1772772629
pbpaste > mu/stop-all-pending-tabs.ts
#1772772638
pbpaste > mu/stop-all-pending-tabs.md
#1772772640
git st
#1772772643
git add .
#1772772654
git commit -am 'chrome extension api cancel pending requests'
#1772773969
vim /opt/homebrew/etc/dnsmasq.conf
#1772773981
git st
#1772774067
st
#1772774084
diskutil unmount
#1772774093
sudo diskutil unmount /Volumes/nothing\ 1/
#1772774098
st
#1772774100
df -g
#1772774101
df -h
#1772774104
ls /Volumes/
#1772774135
ls /Volumes/
#1772774136
st
#1772774137
st
#1772774156
while true; do  cls; date ; df -h /Volumes/nothing; df /Volumes/nothing | grep -E -v Filesystem; date -u; sleep 11; done 
#1772774145
ll
#1772774184
cd
#1772774186
ejecte
#1772774188
eject
#1772774192
cd
#1772774195
cd godot
#1772774200
cd
#1772774201
cd godot
#1772774202
git st
#1772774210
which -a find-vids 
#1772774212
which -a find-vids  | xargs emc
#1772774500
find . -type f -regextype egrep -regex "[.]$(video-extensions-regex)$"
#1772774545
video-extensions-regex 
#1772774559
find . -type f -regextype egrep -regex ".*$(video-extensions-regex)"
#1772774580
find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" > videos.txt
#1772774593
find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" -exec path canon '{}' \;
#1772774633
dua i $(find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" -exec path canon '{}' \; )
#1772774639
dua $(find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" -exec path canon '{}' \; )
#1772774645
st
#1772774669
dua $(find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" -exec path canon '{}' \; ) > videos.txt 
#1772774678
find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" -exec path canon '{}' \;  > videos.txt 
#1772774682
cat videos.txt 
#1772774696
emc videos.txt 
#1772776624
ll
#1772776626
./videos.sh 
#1772776689
./videos.sh 
#1772776713
./videos.sh 
#1772776720
st
#1772776724
git st
#1772776728
git add videos.*
#1772776731
git add .
#1772776732
gi tst
#1772776733
git st
#1772776745
git commit videos.* -m videos.sh
#1772776746
git st
#1772776765
d ./slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI/
#1772776766
ll
#1772776769
cd ./slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI
#1772776771
ll
#1772776771
gi tst
#1772776773
git st
#1772776775
git dh
#1772776782
git commit -am tilez
#1772776783
git st
#1772776787
cd
#1772776799
pushd ~/workbench/2026-03-05/
#1772776799
ll
#1772776802
gut st
#1772776807
cd
#1772776828
cd -
#1772776859
dua /Volumes/
#1772776860
st
#1772776862
df -h
#1772776933
cd wezterm
#1772776868
sudo dua i /Users/gabrielfalcao/ /opt/  | tee dua-i-mac-home-and-slash-opt.ansi.txt
#1772776957
git st
#1772776963
dua
#1772778267
open /Users/gabrielfalcao/Bildern/IMG_0144.mp4
#1772778284
open /Users/gabrielfalcao/Bildern/IMG_*MP4
#1772778299
open /Users/gabrielfalcao/Bildern/IMG_*mp4
#1772777507
cdmkd ./cleanup-disk
#1772777511
mv ../dua-i-mac-home-and-slash-opt.ansi.txt .
#1772777523
cp dua-i-mac-home-and-slash-opt.ansi.txt dua-i-mac-home-and-slash-opt.ansi.safe-to-delete.txt 
#1772777526
vim dua-i-mac-home-and-slash-opt.ansi.safe-to-delete.txt
#1772777620
ipython
#1772778108
bat paths_to_review.txt 
#1772778114
ipython
#1772778254
jq '.' paths_to_review.json 
#1772778257
jq '.files' paths_to_review.json 
#1772778389
jq '.files[] | ' paths_to_review.json 
#1772778393
jq '.files[] ' paths_to_review.json 
#1772778395
jq -r '.files[] ' paths_to_review.json 
#1772778420
jq -r '.files[] | test(".*macos-kext.*") ' paths_to_review.json 
#1772778431
jq -r '.files[] | select(. | test(".*macos-kext.*")) ' paths_to_review.json 
#1772778470
jq -r '.files[] | select(. | test(".*macos-kext.*")) ' paths_to_review.json | xargs -Ieachkext mv 'eachkext' /Users/gabrielfalcao/workbench/2026-03-05
#1772778484
jq -r '.files[] | select(. | test(".*macos-kext.*") | not) ' paths_to_review.json 
#1772778502
jq -r '.files[] | select(. | test(".*macos-kext.*") | not) | select(. | test("beiju")) ' paths_to_review.json 
#1772778523
jq -r '.files[] | select(. | test(".*macos-kext.*") | not) | select(. | test("beiju")) ' paths_to_review.json  | xargs -Ieachvid mv -fv 'eachvid' ../
#1772778532
jq -r '.files[] | select(. | test(".*macos-kext.*") | not) | select(. | test("beiju") | not) ' paths_to_review.json
#1772778549
open /Users/gabrielfalcao/Music/Music/Media.localized/Music/Unknown Artist/Unknown Album/feb19-5pm.aif
#1772778569
jq '.files[] | select(. | test(".*macos-kext.*") | not) | select(. | test("beiju") | not) ' paths_to_review.json
#1772778575
open "/Users/gabrielfalcao/Music/Music/Media.localized/Music/Unknown Artist/Unknown Album/feb19-5pm.aif"
#1772778580
file "/Users/gabrielfalcao/Music/Music/Media.localized/Music/Unknown Artist/Unknown Album/feb19-5pm.aif"
#1772778590
ll
#1772778592
st
#1772779764
cd
#1772779809
pushd ~/workbench/2026-03-05/
#1772779824
ll
#1772780102
cd
#1772780124
wz spawn --cwd="$HOME/*scratch*/x/"
#1772780136
wz spawn --cwd="$HOME/*scratch*/.x"
#1772780141
wz spawn --cwd="\$HOME/*scratch*/.ts"/
#1772780157
wz spawn --cwd=$HOME/\*scratch\*/.ts/
#1772780169
dua
#1772780171
open .
#1772780179
g p -r chrome -k
#1772780183
ll
#1772780211
open ~/Pictures/201{2,3,7}
#1772780245
ls
#1772780246
open .
#1772780274
open 2026-02-26/
#1772780308
cd 2026-02-26/
#1772780311
dua
#1772780318
vlc *.mp4
#1772780376
cd ../
#1772780381
rm -rf 2026-02-26/
#1772780388
dua
#1772780396
dua
#1772780407
find-vids 
#1772780494
ll
#1772780501
dua
#1772780528
mv ~/Bildern/IMG_*.mp4 .
#1772780423
find . -type f -regextype egrep -regex ".*$(video-extensions-regex)" 
#1772780428
vlc T
#1772780429
vlc Teaches\ his\ how\ to\ fuck\ her\ pussy\ \[uifpfooffdd\].mp4 
#1772780537
x
#1772780539
ll
#1772780551
cat playlist2025.2026-02-27.00-48-55.1772164135.txt 
#1772780567
cat playlist2025.2026-02-27.00-48-55.1772164135.txt | xargs vlc
#1772780605
grep 1080 playlist2025.2026-02-27.00-48-55.1772164135.txt | xargs vlc
#1772780617
grep -E '(720|1080)' playlist2025.2026-02-27.00-48-55.1772164135.txt | xargs vlc
#1772781184
cd
#1772781189
eject
#1772774836
bash videos.sh 
#1772774844
bash videos.sh 
#1772774871
bash videos.sh 
#1772774890
cd slugify-filenames
#1772774891
git st
#1772774892
cargo run
#1772774965
st
#1772776604
cargo run
#1772781327
cargo run
#1772781330
cls;cargo run
#1772781334
cargo quickcheck 
#1772781360
ack GlobExpMatcher
#1772781373
git br
#1772781379
git st
#1772781381
git dh
#1772781389
ack GlobExpMatcher
#1772781399
cargo qc
#1772781402
cargo quickcheck 
#1772781415
cargo add percent_encoding
#1772781423
git log
#1772781427
git st
#1772781429
git add .
#1772781450
git switch -c fix-slugify-filenames-keep-extension
#1772781451
git st
#1772781454
cargo run
#1772781524
cargo run
#1772781528
cargo quickcheck 
#1772781562
cargo quickcheck 
#1772781567
git q
#1772781595
cls;cargo quickcheck 
#1772781601
cargo run
#1772781665
cargo run
#1772781684
cargo run
#1772781706
cargo run
#1772781725
unset HISTIGNORE 
#1772781727
cls;cargo run
#1772773989
launch_emacs_desktop
#1772773997
which launch.rs 
#1772774011
which -a launch.rs  | xargs bat
#1772774025
which -a launch.rs  
#1772774032
which -a launch.rs  | xargs bat
#1772781760
emc mu/bg/index.ts 
#1772781896
ack --ts --js '(send|on)(Message|Response)'
#1772781900
ack --ts --js '(send|on)(Message|Response)' mu/
#1772781906
ack --ts --js '\b(send|on)(Message|Response)' mu/
#1772781932
ack --ts --js '\b(send|on|add)(Message|Response|(Event)?Listener)' mu/
#1772782254
yarn dev
#1772782550
ack --ts --js '\b(send|on|add)(Message|Response|(Event)?Listener)' mu/
#1772782574
clsack --ts --js '\b(send|on|add)(Message|Response|(Event)?Listener)' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772782576
cls;ack --ts --js '\b(send|on|add)(Message|Response|(Event)?Listener)' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772782604
cls;ack --ts --js '\b(send|on|add)(Message|Response|(Event)?Listener)' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772778604
jq '.dirs[]'
#1772778609
jq '.dirs[]' paths_to_review.json 
#1772778623
open "/Users/gabrielfalcao/Pictures/2012" "/Users/gabrielfalcao/Pictures/2017"
#1772778636
jq -r '.dirs[]' paths_to_review.json 
#1772778655
dua $(jq -r '.dirs[]' paths_to_review.json  )
#1772778353
ll
#1772776973
cd mediasoup
#1772776976
bat README.md 
#1772777843
ll
#1772777899
cat dua-i-mac-home-and-slash-opt.ansi.safe-to-delete.txt | 2>safe-to-delete.err parallel rm -rfv > tee safe-to-delete.out
#1772777922
st
#1772777905
ps aux | grep parallel
#1772777909
ps aux | grep rm
#1772777919
ps aux | grep rm\s-+[-]rf
#1772778459
pwd
#1772782845
cls;ack --ts --js '\b(send|on|add)(Message|Response|(Event)?Listener)' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772782866
cls;ack --ts --js '\badd(Event)?Listener' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772782915
cls;ack --ts --js 'on[A-Z][a-z]+[.]add(Event)?Listener' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772782933
cls;ack --ts --js 'on([A-Z][a-z]+)+[.]add(Event)?Listener' mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772782961
ack withStoredTabs
#1772783176
cls;ack --ts --js sendMessage mu/cs/ mu/pages/ mu/components/ mu/bg/ mu/*.ts
#1772783200
cls;ack --ts --js sendMessage mu/
#1772786314
git st
#1772786316
git add .
#1772786317
git dh 
#1772787759
x
#1772787760
ll
#1772787778
grep -E '(720|1080)' playlist2025.2026-02-27.00-48-55.1772164135.txt 
#1772787792
grep -E '(720|1080)' playlist2025.2026-02-27.00-48-55.1772164135.txt  | sort -u | xargs vlc
#1772787801
st
#1772787811
grep -E '(720|1080)' playlist2025.2026-02-27.00-48-55.1772164135.txt  | xargs vlc
#1772788092
cd
#1772788098
eject
#1772792061
cd
#1772792063
cd godot/./slide-puzzle-walkthrough-from-youtube-aODh7LNiEbI
#1772792064
git st
#1772792065
git q
#1772792293
git st
#1772792294
git diff
#1772792297
git whatchanged -p
#1772851136
mkpushd ~/workbench/$(today )
#1772851143
yt-dlp 'https://www.youtube.com/watch?v=-f1bHR0iiEY&pp=ygUSZ29kb3QgMmQgYW5pbWF0aW9u'
#1772851207
yt-dlp 'https://www.youtube.com/watch?v=5KBNGKYV-vU&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u'
#1772851248
yt-dlp 'https://www.youtube.com/watch?v=Xf2RduncoNU&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u'
#1772851219
yt-dlp 'https://www.youtube.com/watch?v=OR8R4wBgfUc&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u'
#1772851239
yt-dlp 'https://www.youtube.com/watch?v=KUyQzjpRsU8&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u'
#1772851277
yt-dlp 'https://www.youtube.com/watch?v=RDT5hfYWCrQ&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u'
#1772851419
yt-dlp 'https://www.youtube.com/watch?v=VOdu9tnyAwk&pp=ygUaZ29kb3QgNCB0dXRvcmlhbCAyZCB0ZXRyaXM%3D'
#1772851260
yt-dlp 'https://www.youtube.com/watch?v=KS837a-TFRc&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u0gcJCa4KAYcqIYzv'
#1772851271
yt-dlp 'https://www.youtube.com/watch?v=iElHZhOxGYA&pp=ygUqZ29kb3QgMmQgbW92ZSBwcml0ZSB3aXRoIGVhc2UgaW4gYW5pbWF0aW9u'
#1772851320
yt-dlp 'https://www.youtube.com/watch?v=E6ajmQhOeo4'
#1772851389
yt-dlp 'https://www.youtube.com/watch?v=2T2Fkzwf6FM&pp=ygUaZ29kb3QgNCB0dXRvcmlhbCAyZCB0ZXRyaXM%3D'
#1772852060
yt-dlp 'https://www.youtube.com/watch?v=a0svx-2HSj4'
#1772913649
cd workbench/
#1772913706
cp -rfv src/cli/commands/write/  src/cli/commands/enqueue
#1772913709
cp -rfv src/cli/commands/write/  src/cli/commands/task
#1772913717
cd src/cli/commands/task
#1772913722
cd -
#1772913725
git st
#1772913728
git add src/m
#1772913730
git add src/models.rs 
#1772913731
git st
#1772913733
git clean -df
#1772913753
cp -rfv src/cli/commands/bootstrap  src/cli/commands/task
#1772913764
cp -rfv src/cli/commands/bootstrap  src/cli/commands/enqueue
#1772913768
git st
#1772913771
git diff
#1772913777
git st
#1772913805
cd workbench/
#1772913810
cd src/cli/commands/task/
#1772913811
git st
#1772913817
ack -i bootstrap
#1772913832
refactors Bootstrap Task -wp .
#1772913842
refactors bootstrap task -wp .
#1772913844
git st
#1772913845
git diff
#1772913850
ack -i bootstrap
#1772913855
cd ../enqueue/
#1772913860
refactors Bootstrap Enqueue -wp .
#1772913863
refactors bootstrap enqueue -wp .
#1772913864
git st
#1772913866
git st
#1772913868
git diff
#1772913873
git st
#1772913875
git add .
#1772913876
cd ..
#1772913877
git st
#1772913878
git add .
#1772913879
cd ..
#1772913880
ls
#1772913884
emc mod.rs 
#1772913996
ack -i '\bshopt\b' 
#1772915552
git add rust-enqueue-build 
#1772914101
git st
#1772914103
git add .
#1772912796
cd slugify-filenames
#1772913540
cargo cbt --help
#1772913607
launch_emacs_desktop
#1772913645
cargo cbt --run  --docs --quiet 
#1772916191
rust-enqueue-build 
#1772916195
ll
#1772916215
rust-enqueue-build 
#1772916369
s aux | gawk '$0 ~ /rust.*build/ { }'
#1772916372
reset
#1772916392
ps aux | gawk '$0 ~ /rust.*build/ { print }'
#1772916396
ll
#1772916407
man time
#1772916497
cd tools/../
#1772916545
find tools poc wip -maxdepth 2 -type d -exec gstat '%Y %W {}' {} \;
#1772916549
find tools poc wip -maxdepth 2 -type d -exec gstat -c '%Y %W {}' {} \;
#1772916585
find tools poc wip -maxdepth 2 -type d -exec bash -c 'set -umeTE; set +f set -o pipefail;
target="$(path canon "{}")"
ts_created=$(gstat -c "%W" "${target}")
' \;
#1772916733
find tools poc wip -maxdepth 2 -type d -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -i created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -i modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
echo "${target@Q}" "created $(date --date=@${ts_created} "%Y-%m-%d")" "modified $(date --date=@${ts_modified} "%Y-%m-%d")"
' {} \;
#1772916901
find tools poc wip -maxdepth 2 -type d -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -i created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -i modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
echo "${target@Q}" "created $(date --date=@${ts_created} "%Y-%m-%d")" "modified $(date --date=@${ts_modified} "%Y-%m-%d")"
' {} \;
#1772916931
find tools poc wip -maxdepth 3 -type f -name Cargo.toml -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -i created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -i modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
echo "${target@Q}" "created $(date --date=@${ts_created} "%Y-%m-%d")" "modified $(date --date=@${ts_modified} "%Y-%m-%d")"
' {} \;
#1772916959
find tools poc wip -maxdepth 3 -type f -name Cargo.toml -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -- created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -- modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
echo "${target@Q}" "created $(date --date=@${ts_created} "%Y-%m-%d")" "modified $(date --date=@${ts_modified} "%Y-%m-%d")"
' {} \;
#1772916975
find tools poc wip -maxdepth 3 -type f -name Cargo.toml -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -- created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -- modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
echo "${target@Q}" "created $(date --date=@${ts_created} +"%Y-%m-%d")" "modified $(date --date=@${ts_modified} +"%Y-%m-%d")"
' {} \;
#1772917001
find tools poc wip -maxdepth 3 -type f -name Cargo.toml -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -- created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -- modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
#echo "${target@Q}" "created $(date --date=@${ts_created} +"%Y-%m-%d")" "modified $(date --date=@${ts_modified} +"%Y-%m-%d")"

rust-enqueue-build "${target}"
' {} \;
#1772917051
rust-enqueue-build tools/_regex-bandolier/
#1772917067
rust-enqueue-build tools/_regex-bandolier/
#1772917081
ps aux | gawk '$0 ~ /rust.*build/ { print }'
#1772917090
ps aux | gawk '$0 ~ /rust.*build/ { print }'
#1772917100
ps aux | gawk '$0 ~ /rust.*build/ { print $2 }'
#1772917144
ps aux | gawk '$0 ~ /rust.*build/ {  printf("%s : %s\n",  $2, PROCINFO["PID]) }' 
#1772917150
ps aux | gawk '$0 ~ /rust.*build/ {  printf("%s : %s\n",  $2, PROCINFO["PID"]) }' 
#1772917153
ps aux | gawk '$0 ~ /rust.*build/ {  printf("%s : %s\n",  $2, PROCINFO["pid"]) }' 
#1772917175
ps aux | gawk '$0 ~ /rust.*build/ {  if ($2 != PROCINFO["pid"]) {  print $2 } }' 
#1772917189
unset HISTIGNORE 
#1772917192
history -a
#1772917195
find tools poc wip -maxdepth 3 -type f -name Cargo.toml -exec bash -c 'set -umeTE; set +f set -o pipefail;
declare -- target="$(path canon "{}")"
declare -i ts_created=$(gstat -c "%W" "${target}")
declare -i ts_modified=$(gstat -c "%Y" "${target}")
declare -i created_year=$(date --date=@${ts_created} +%Y)
declare -- created_month=$(date --date=@${ts_created} +%m)
declare -i modified_year=$(date --date=@${ts_modified} +%Y)
declare -- modified_month=$(date --date=@${ts_modified} +%m)

if [ ${modified_year} -ne 2026 ]; then
exit
fi
if [ ${created_year} -ne 2026 ]; then
exit
fi
#echo "${target@Q}" "created $(date --date=@${ts_created} +"%Y-%m-%d")" "modified $(date --date=@${ts_modified} +"%Y-%m-%d")"

rust-enqueue-build "${target}"
' {} \;
#1772919682
st
#1772919696
cd rqbit/
#1772919721
cd ./desktop/
#1772919722
ls
#1772919729
yarn
#1772919738
npm i
#1772919748
cd 
#1772919754
cd projects/personal/
#1772919796
find . -type f -regextype egrep -name package.json -not -regex '*/node_modules/.*'
#1772919810
find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*'
#1772919829
for find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*' -exec path parent {} \[;
#1772919832
for find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*' -exec path parent {} \;
#1772919841
for find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*' -exec path parent '{}' \;
#1772919846
find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*' -exec path parent '{}' \;
#1772919868
for node_yarn_project in $(find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*' -exec path parent '{}' \;); do (cd "${node_yarn_project}" && (yarn | npm i)); done
#1772919914
for node_yarn_project in $(find . -type f -regextype egrep -name package.json -not -regex '.*/node_modules/.*' -exec path parent '{}' \;); do (cd "${node_yarn_project}" && (yarn | npm i)) & done
#1772920142
cd dns-servers/
#1772920143
ls
#1772920153
find . -name Cargo.toml
#1772920225
cd ./hickory-dns/
#1772920227
git remotes
#1772920234
git remotes | head -1 | pbcopy 
#1772920243
git br -a
#1772920257
git fetch -a
#1772920264
git tag
#1772920273
git fetch --tags 
#1772920277
git fetch --tags --all
#1772920286
git log
#1772920297
cd ..
#1772920320
find . -name Cargo.toml -exec rust-enqueue-build {} \;
#1772920326
3
#1772920498
cd regex-ast/
#1772920500
git st
#1772920931
3
#1772920943
git clone --depth=1 git@github.com:Lokathor/bytemuck.git
#1772920947
cd ./bytemuck/
#1772920953
rust-enqueue-build .
#1772921078
3
#1772921093
git clone --depth=1 git@github.com:verdaccio/website.git verdaccio-website
#1772921121
cargo cbt --help
#1772921000
3
#1772921040
git clone --depth=1 git@github.com:verdaccio/verdaccio.git && cd ./verdaccio && pnpm install
#1772921227
find-params-skip-paths 
#1772921360
find /Users/gabrielfalcao/projects -regextype egrep -type f -name Cargo.toml -exec bash -c 'set -umeTE;set +f; set -o pipefail; declare -- manifest_path="$(path canon "{}")"
#1772921391
find /Users/gabrielfalcao/projects -regextype egrep -type f -name Cargo.toml -exec bash -c 'set -umeTE;set +f; set -o pipefail; declare -- crate_path="$(path parent "{}")";
if [ -e "${crate_path}/target" ]; then
rm -rf "${crate_path}/target"
' {} \;
#1772922249
git add cargocbtallsafe 
#1772923650
cd
#1772923651
cd ./workbench/
#1772923655
cargo deps id
#1772923660
2>/dev/null cargo deps id
#1772923674
cargo deps id --help
#1772923680
cargo deps id "$(pwd)"
#1772923699
cd palette/
#1772923702
cargo deps id "$(pwd)"
#1772923706
cargo deps list "$(pwd)"
#1772923709
cargo deps list
#1772924485
cd
#1772924489
cd ~/workbench/$(today)
#1772924495
cdmkd ./tmpdeleteme
#1772924502
cargo new --lib foobar
#1772924503
cd foobar
#1772924508
cargocbtallsafe 
#1772924518
ll
#1772924616
ll
#1772924690
cargocbtallsafe 
#1772924729
cargocbtallsafe 
#1772924778
cargocbtallsafe 
#1772924781
ll
#1772923713
ll
#1772923928
cargocbtallsafe 
#1772924241
cargocbtallsafe 
#1772924244
ll
#1772924248
git st
#1772924250
git clean -f
#1772924800
bat *.log
#1772931609
cd ..
#1772931627
setmac
#1772931967
networksetup -getdnsservers Wi-Fi
#1772932482
ifconfig en0 ether
#1772932485
ifconfig en0 
#1772932504
ifconfig en0 ether | gawk '$1 ~ ether {print}'
#1772932523
ifconfig en0 ether | gawk '$1 ~ /ether/ {print}'
#1772932524
ifconfig en0 ether | gawk '$1 ~ /ether/ {print}'
#1772932536
ifconfig en0 ether | gawk '$1 ~ /ether/ {print $NF }'
#1772932660
cd ..
#1772932662
ll
#1772932663
dua
#1772932666
rm -rf tmpdeleteme/
#1772933572
git add subprocess_call.sh 
#1772920764
3
#1772920818
git clone --depth=1 https://github.com/Ogeon/palette.git && rust-enqueue-build ./palette
#1772921863
cd ./palette/
#1772923331
cargocbtallsafe 
#1772923343
cargocbtallsafe 
#1772923360
cargocbtallsafe 
#1772923371
cargocbtallsafe 
#1772923384
cargocbtallsafe 
#1772923392
cargocbtallsafe 
#1772923398
cargocbtallsafe 
#1772923410
cargocbtallsafe 
#1772923426
cargocbtallsafe 
#1772923475
cargocbtallsafe 
#1772923505
cargocbtallsafe 
#1772923537
cargocbtallsafe 
#1772923550
cargocbtallsafe 
#1772923570
cargocbtallsafe 
#1772933669
builtin tty
#1772933680
/usr/bin/tty 
#1772935165
setmac
#1772935257
setmac
#1772935280
setmac
#1772935310
setmac
#1772935342
setmac
#1772935367
setmac
#1772935380
cd 
#1772935383
cd ./godot/
#1772935384
ll
#1772935389
cls;find-vids 
#1772935392
x
#1772935394
dua
#1772935396
cd
#1772935400
cd ./godot/
#1772935400
ll
#1772935412
video-extensions-regex 
#1772935428
find . -regextype egrep -regex "$(video-extensions-regex)"
#1772935431
cd
#1772935433
cd Kino/
#1772935435
find . -regextype egrep -regex "$(video-extensions-regex)"
#1772935437
find-vids 
#1772935441
ll
#1772935464
cd
#1772935466
cd workbench/
#1772935467
ll
#1772935469
cd
#1772935471
cd ./workbench/
#1772935474
find . -regextype egrep -regex "$(video-extensions-regex)"
#1772935482
find-vids 
#1772935492
cd ./2026-03-06/
#1772935492
ll
#1772935498
dua
#1772935514
slugify-filenames 
#1772935516
git st
#1772935517
ll
#1772935537
for file in *-{webm,mkv,mp4} do
ext=$(sed -E  's/.*-([a-z]+[a-z0-9]*)$/\1/g' <<< "${file}")
#1772935600
for file in *-*; do
ext=$(sed -E  's/.*-([a-z]+[a-z0-9]*)$/\1/g' <<< "${file}")
name=$(sed -E  's/(.*)-([a-z]+[a-z0-9]*)$/\1/g' <<< "${file}"); declare -p ext name; done
#1772935649
for file in *-*; do
ext=$(sed -E  's/.*-([a-z]+[a-z0-9]*)$/\1/g' <<< "${file}")
name=$(sed -E  's/(.*)-([a-z]+[a-z0-9]*)$/\1/g' <<< "${file}"); mv -fv "${file}" "${name}.${ext}"; done
#1772935651
ll
#1772935658
mv John-Denver-Pla-cido-Domingo-Perhaps-Love-in-Studio-1981-6EEcfP0QiI.webm ~/Kino/
#1772935659
ll
#1772935669
find-vids 
#1772935676
find-vids | xargs vlc
#1772921030
npm i -g pnpm@latest
#1772921853
npm i -g pnpm@latest
#1772921465
find /Users/gabrielfalcao/projects -regextype egrep -type f -name Cargo.toml -exec bash -c 'set -umeTE;set +f; set -o pipefail; declare -- crate_path="$(path parent "{}")";
if [ -e "${crate_path}/target" ]; then
1>&2 echo -e "deleting ${crate_path}/target"
rm -rf "${crate_path}/target"
fi

' {} \;
#1772921814
find /Users/gabrielfalcao/projects -regextype egrep -type f -name Cargo.toml -exec bash -c 'set -umeTE;set +f; set -o pipefail; declare -- crate_path="$(path parent "{}")";
if [ -e "${crate_path}/target" ]; then
1>&2 echo -e "deleting ${crate_path}/target"
rm -rf "${crate_path}/target"
fi

'\;
#1772921815
find /Users/gabrielfalcao/projects -regextype egrep -type f -name Cargo.toml -exec bash -c 'set -umeTE;set +f; set -o pipefail; declare -- crate_path="$(path parent "{}")";
if [ -e "${crate_path}/target" ]; then
1>&2 echo -e "deleting ${crate_path}/target"
rm -rf "${crate_path}/target"
fi

' \;
#1772921149
dua
#1772921158
dua i | ansistrip | xargs rm -rf
#1772921819
st
#1772937067
cd slugify-filenames
#1772937068
git st
#1772937072
git clean -f
#1772937076
cargo run
#1772937079
cargo build
#1772937092
cargo test --offline
#1772937115
emc src/cli/parameters.rs 
#1772937151
ack argv_fallback_to_stdin_lines
#1772937380
rustup doc std::io
#1772937639
cargo test
#1772937682
cargo test --offline
#1772937706
cargo test --offline
#1772937712
cargo test --offline
#1772937734
cargo test --help
#1772937751
cargo quickcheck 
#1772937764
cargo check
#1772937856
cargo check
#1772937919
cargo check
#1772937946
cargo check
#1772938013
cargo check
#1772938057
ack get_input_from_stdin
#1772938073
git diff
#1772938076
git whatchanged 
#1772938097
git diff 88dd7da336643b599add47a609f79b6d9cd287f7 -- src/
#1772938144
ack get_input_from_stdin
#1772938177
sed -E 's/get_input_from_stdin/get_input_from_stdin/g' -i src/cli/string.rs 
#1772938178
git st
#1772938181
git diff
#1772938183
git add .
#1772938346
cargo t
#1772942527
cargo t
#1772942640
cargo t
#1772942685
[A
#1772942823
ack strings_to_slugify
#1772942980
ack get_stdin_lines
#1772943241
rustup doc std::option::Option
#1772943302
rustup doc std::string::String
#1772943445
setmac
#1772943455
dns-server logs
#1772943508
dns-server logs
#1772943522
setmac
#1772943554
networksetup -getdnsservers Wi-FI
#1772943557
dns-server logs
#1772943563
dns-server restart
#1772943980
sudo su
#1772943966
sudo su 
#1772943583
dns-server logs
#1772944058
ll
#1772944076
emc src/string.rs 
#1772944210
r
#1772944252
cd
#1772944255
cd workbench/
#1772944267
pushd ~/workbench/$(today)
#1772944269
mkpushd ~/workbench/$(today)
#1772944272
pwd
#1772944273
ll
#1772944277
cargo new
#1772944281
cargo new tmptest
#1772944283
cd tmptest
#1772944285
cargo run
#1772944289
emc src/main.rs 
#1772944427
cargo run
#1772944445
cargo run
#1772944458
cargo run
#1772944464
unset IFS
#1772944465
cargo run
#1772944485
cargo run
#1772944520
cargo run
#1772944528
IFS=foo
#1772944529
cargo run
#1772944532
IFS=foo cargo run
#1772944544
cd ..
#1772944547
rm -rf *
#1772944548
ll
#1772944599
rustup doc std::string::String
#1772944931
r
#1772944986
r
#1772945003
r
#1772945032
rt
#1772945426
git st
#1772945427
git add .
#1772945428
git st
#1772945440
git commit -am 'fix build'
#1772945441
cargo run
#1772945479
cargo add isterminal
#1772945490
cd ..
#1772945491
cd ..
#1772945511
ack --toml -i 'is.?terminal' tools/*/Cargo.toml
#1772945542
cd ..
#1772945544
ack --toml -i 'is.?terminal' tools/*/Cargo.toml
#1772945546
cd ..
#1772945547
ack --toml -i 'is.?terminal' tools/*/Cargo.toml
#1772945564
cd string-cli/
#1772945569
ack --toml -i 'is.?terminal'
#1772945572
cd -
#1772945573
ack --toml -i 'is.?terminal'
#1772945579
cd rmao/
#1772945580
ack --toml -i 'is.?terminal'
#1772945485
cargo add --offline isterminal
#1772945520
cargo add --offline is-terminal
#1772945588
cargo doc --open
#1772945632
cargo doc --open
#1772945675
git add .
#1772945682
git st
#1772945686
cargo run
#1772945792
cargo run
#1772945967
cargo run
#1772946012
cargo runm
#1772946014
git add .
#1772946015
gti st
#1772946016
git st
#1772946019
cargo run
#1772946031
git st
#1772946032
git add .
#1772946041
cargo run
#1772946043
cargo run a
#1772946059
cargo run a
#1772946122
cargo run
#1772946161
git st
#1772946164
git q
#1772946167
cargo run
#1772946216
cargo run
#1772946237
cargo run
#1772946242
ls | cargo run
#1772946311
ls | cargo run
#1772946353
ls | cargo run
#1772946398
ls | cargo run
#1772946544
cargo run
#1772946567
cargo run
#1772946591
cargo run
#1772946615
cargo run
#1772946622
cargo run
#1772946638
cargo run
#1772946666
cargo run
#1772946687
cargo run
#1772946724
cargo run
#1772946746
cargo run
#1772946847
cargo run
#1772946876
cargo run
#1772946880
ls | cargo run
#1772946892
ls | cargo run
#1772946895
cargo run
#1772946952
cargo run
#1772946973
cargo run
#1772947041
cargo run
#1772947062
git st
#1772947062
git q
#1772947105
cargo build 
#1772947111
ls target/debug/
#1772947118
cargo ip --force
#1772947150
install -f target/debug/slugify-filenames ~/.cargo/bin/slugify-filenames 
#1772947153
install target/debug/slugify-filenames ~/.cargo/bin/slugify-filenames 
#1772947161
install target/debug/slugify-string ~/.cargo/bin/slugify-string 
#1772947166
ll ~/.cargo/bin/slugify-*
#1772947184
git st
#1772947191
git commit -am 0.3.0
#1772947196
cargo ip --force
#1772947128
cargo ip --force --offline
#1772947208
cd
#1772947216
cd workbench/$(today )
#1772947219
ll
#1772947225
cdmkd tempdeleteme
#1772947226
pwd
#1772947252
mkdir  "a aaa bbbb" 
#1772947271
> image.mp4 a\ aaa\ bbbb/test\ file.mp3 
#1772947278
ll
#1772947282
slugify-filenames 
#1772947283
ll
#1772953435
cd ..
#1772953440
rm -rf tempdeleteme/
#1772953450
git st
#1772953455
git clean -Xdfn
#1772953465
cd slugify-filenames
#1772953466
cd -
#1772953467
git init
#1772953468
git st
#1772953470
git add .
#1772953471
git st
#1772953476
cd slugify-filenames
#1772953481
git clean -Xdfn
#1772953490
git st
#1772953712
emc tests/test_cli.rs 
#1772953832
cargo test
#1772920590
cd regex-ast/
#1772920638
cargo craft -cm -d strip-ansi-escapes -d palette -d colorsys regex-color-ansi
#1772920523
cd ../../
#1772920529
cd ./tools/
#1772920571
find . -name Cargo.toml -exec ack -i '(ansi|color|palette|pallete)' {} \;
#1772920645
cd
#1772920650
cd bufpager
#1772920659
cargo deps list
#1772920680
cargo add colorsys palette
#1772920696
cargo add colorsys  -F serde
#1772920733
cargo add palette  -F serde,rand,random,serializing,wide,find-crate,bytemuch
#1772920739
cargo add palette  -F serde,rand,random,serializing,wide,find-crate,bytemuck
#1772920160
cd sexprs/
#1772920179
find . -mindepth 1 -name Cargo.toml
#1772920181
find . -mindepth 2 -name Cargo.toml
#1772920190
find . -mindepth 2 -name Cargo.toml -exec rust-enqueue-build {} \;
#1772920342
git clone  https://github.com/hickory-dns/hickory-dns.git
#1772920483
cd
#1772920487
cd workbench/
#1772851307
yt-dlp 'https://www.youtube.com/watch?v=WrMORzl3g1U&pp=ygUUZ29kb3QgYW5pbWF0aW9uIHRyZWU%3D'
#1772851400
yt-dlp 'https://www.youtube.com/watch?v=4XxsbtvQJE0&pp=ygUaZ29kb3QgNCB0dXRvcmlhbCAyZCB0ZXRyaXM%3D'
#1772851820
yt-dlp 'https://www.youtube.com/watch?v=VOdu9tnyAwk'
#1772851847
yt-dlp 'https://www.youtube.com/watch?v=nhZ7VG_y1BE'
#1772851927
yt-dlp 'https://www.youtube.com/watch?v=Q1w02E4H-as&pp=ygUYZ29kb3QgNCBzaWduYWxzIHR1dG9yaWFs0gcJCa4KAYcqIYzv'
#1772852052
yt-dlp 'https://www.youtube.com/watch?v=EgUU3akUECc'
#1772920083
cd dns-server
#1772920085
ll
#1772920118
rust-enqueue-build 
#1772920126
ps aux  41501
#1772920132
lsof -p 41501
#1772848413
3
#1772848415
git clone --depth=1 git@github.com:shoenot/diskard.git
#1772848433
cd ./diskard/
#1772848436
cargo build
#1772848446
cargo cbt -i --run
#1772851115
st
#1772854593
yt-dlp 'https://www.youtube.com/watch?v=-6EEcfP0QiI'
#1772854602
open John\ Denver\ \&\ Plácido\ Domingo\ -\ Perhaps\ Love\ -\ in\ Studio\,\ 1981\ \[-6EEcfP0QiI\].webm 
#1772855638
yt-dlp 'https://www.youtube.com/watch?v=jq-_jiStEII'
#1772856120
yt-dlp 'https://www.youtube.com/watch?v=aK2ZEE1RbU0'
#1772848204
cd ~/workbench/2026-03-06/
#1772848204
ll
#1772848212
cdmkd ./pingu
#1772848241
git clone https://github.com/theidioticdev/penguwarpos                   # for stable release
#1772848242
cd penguwarpos
#1772848242
pip install colorama
#1772848244
pip install curses
#1772848246
pip install dearpygui
#1772848248
python kernel.py
#1772848307
ll
#1772848313
bat kernel.py 
#1772848320
cd ..
#1772848324
rm -rf penguwarpos/
#1772947200
cargo ip --force --offline
#1772966008
cd regex-ast/
#1772966051
wz-wip-old 
#1772779599
cd tools/
#1772779661
cargo craft -csm -C now -C at -C code -d totp-rs xvtotp && cd xvtotp 
#1772779741
git st
#1772779742
git q
#1772779745
cargo run
#1772851464
yt-dlp 'https://www.youtube.com/watch?v=xf17dZ099DU&list=PLDrGjPCkkytuEyXfFXz10dpDGRHmuCQhU&index=23&pp=iAQB'
#1772966012
workbench
#1772966015
cd workbench/
#1772966018
cargo run
#1772778676
cargo cbt --run
#1772778688
cargo cbt --help
#1772778693
cargo cbt --run -i
#1772779675
launch_emacs_desktop
#1772845982
dns-server wl https://mira.ethz.ch/
#1772846003
dns-server wl https://www.lumafield.com/scan-of-the-month/health-wearables
#1772846035
dns-server wl https://walzr.com/payphone-go/
#1772772505
sudo bash safe-to-delete.sh 
#1772774152
sudo bash safe-to-delete.sh 
#1772781733
git add .
#1772783521
musgz 
#1772783523
pbpaste
#1772783529
cat Cargo.lock | pbcopy 
#1772919716
rust-enqueue-build .
#1772920402
npm i -g verdaccio@latest
#1772920412
cd tabtree/
#1772920439
npm set registry http://localhost:4873/ --location $(pwd)
#1772920451
npm set registry http://localhost:4873/ --location project
#1772920455
ll
#1772920455
git st
#1772920473
verdaccio --listen 4000 --config ~./config.yaml
#1772917207
cd tabtree/
#1772917210
yarn
#1772919959
st
#1772919994
npm i -g verdachio@latest
#1772920056
setmac
#1772920072
dns-server logs
#1772915768
(echo 'test 1' && sleep 10) &
#1772915777
jobs
#1772792374
git whatchanged -p
#1772792380
git add .
#1772792382
git dh 
#1772792396
git dh 
#1772792406
git dh 
#1772792426
git dh 
#1772792446
git whatchanged -p
#1772792523
git dh
#1772822962
git st
#1772822964
git add .
#1772822965
git st
#1772822966
git dh
#1772822975
git stash 
#1772822990
git st
#1772823000
git st
#1772916441
rust-enqueue-build 
#1772916485
st
#1772917253
cd mu
#1772917260
yarn
#1772913782
git add src/functions/
#1772913787
git commit src/functions/ -m functions
#1772913788
git st
#1772913793
git add .
#1772913796
cd src/cli/commands/enqueue/
#1772779830
pushd ./cleanup-disk/
#1772779830
ll
#1772779834
cdmkd part2
#1772779836
pwd
#1772779849
sudo dua i /Users/gabrielfalcao/ /tmp /opt/ | dua-i-mac-home-and-slash-opt.ansi.txt
#1772780081
sudo dua i /Users/gabrielfalcao/ /tmp /opt/ | tee dua-i-mac-home-and-slash-opt.ansi.txt
#1772968776
cd workbench/
#1772968797
cargo run --offline
#1772968828
emc src/cli/commands/mod.rs 
#1772968877
cargo run --offline
#1772968928
declare -i foobarnum=007; declare -p foobarnum
#1772968930
cargo run --offline
#1772968977
cargo run --offline
#1772968995
cargo run --offline
#1772969005
cargo run --offline
#1772969012
cargo run --offline
#1772969016
git st
#1772969035
git log
#1772969049
git q
#1772969052
git whatchanged -p
#1772969059
git whatchanged 
#1772969071
git rebase -i fe2ad6aa7b8eef6168a07320c25b6ca756aacfbe
#1772969094
cargo run
#1772969314
cargo run
#1772969330
cargo run
#1772969333
git st
#1772969423
launch
#1772969425
launch_emacs_desktop
#1772969627
echo ${BASH_VERSINFO}
#1772969629
echo ${BASH_VERSINFO[@]}
#1772969752
bash --version
#1772969796
echo ${SHELLOPTS}
#1772969841
echo "${!}"
#1772969852
if [[ -v ! ]]; then echo pidset; else echo no pid set; fi
#1772969661
which  -a bash
#1772969666
/bin/bash --veersion
#1772969668
/bin/bash --version
#1772969673
bash --version
#1772970201
cd
#1772970204
cd .shell.d/
#1772970204
git st
#1772970206
git diff
#1772970247
git switch -c poc/shell_d_sh_ps1_prefix
#1772970253
git st
#1772970266
git commit entrypoint.sh  -m "poc: shell_d_sh_ps1_prefix"
#1772970267
git st
#1772970275
git diff HEAD
#1772970285
git switch -
#1772970286
git st
#1772970291
git dh
#1772970310
git commit -m 'WIP: fn.staging.d/subprocess_call.sh'
#1772970448
sudo su -
#1772970476
dns-server restart
#1772970483
dns-server  logs
#1772970317
git commit -am 'WIP: fn.staging.d/subprocess_call.sh'
#1772970318
git st
#1772970330
cd
#1772970333
cd regex-ast/
#1772970415
emc regex-color-ansi/Cargo.toml 
#1772970434
dns-server restart
#1772970439
dns-server logs
#1772970521
sudo reboot
#1772782542
yarn dev
#1772970573
dns-server  logs
#1772970625
sudo su 
#1772970653
setmac
#1772970656
setmac
#1772970669
dns-server  logs
#1772970695
git st
#1772970704
git q
#1772970708
cd ./opt/
#1772970708
git st
#1772970711
cd 
#1772970713
cd .shell.d/
#1772970717
launch_emacs_desktop
#1772970737
cd
#1772970738
cd regex-ast/
#1772970740
cargo test
#1772970764
3
#1772970765
ll
#1772970791
cd ./UTM/
#1772970792
ll
#1772970800
xcodebuild 
#1772970816
ll
#1772970819
dua i
#1772970846
emc QEMUHelper/QEMUHelperProtocol.h 
#1772970959
man dlfcn.h
#1772970961
man dlfcn
#1772970975
man dlsym
#1772971067
ack -i qemu
#1772971101
cls;ack -i qemu -l
#1772971225
man qemu-system-aarch64 
#1772971228
woman qemu-system-aarch64 
#1772971238
qemu-system-aarch64 --help | bat -l man
#1772971244
woman qemu-system-aarch64 
#1772971270
woman qemu-img 
#1772971296
cls;ack -i qemu -l
#1772971303
cls;ack -i qemu -l
#1772971306
ack -i qemu
#1772971324
ack pushArgv
#1772971351
emc Services/UTMSWTPM.swift 
#1772971413
ack swtpmMain
#1772971420
ack -i swtpm
#1772971430
cls;ack -i swtpm
#1772971457
cd ..
#1772971459
ls
#1772971460
ll
#1772971481
cd regex-ast/
#1772971483
cargo test
#1772971490
mkdir tests
#1772971511
> tests/test_ast.rs
#1772971514
emc tests/test_ast.rs
#1772971563
cd ..
#1772971563
ll
#1772971573
cd bufpager/
#1772971574
cargo run
#1772971578
cargo run --offline
#1772971590
emc Cargo.toml 
#1772971596
launch_emacs_desktop
#1772971600
emc Cargo.toml 
#1772971620
cargo run --offline
#1772971660
git st
#1772971663
ll xurupira/
#1772971670
git clean -f
#1772971672
git st
#1772971757
cd 
#1772971761
cd godot/
#1772971762
dua
#1772971802
d ./godot-demo-projects/plugins/addons/material_creator/
#1772971805
cd ./godot-demo-projects/plugins/addons/material_creator/
#1772971805
ll
#1772971812
cd -
#1772971813
ll
#1772971821
dua
#1772971828
cd ./godot-demo-projects/
#1772971829
ll
#1772971835
cd ./2d/
#1772971835
ll
#1772971838
dua
#1772971857
cd ./bullet_shower/
#1772971857
ll
#1772971862
open screenshots/collision.png 
#1772971867
cd ..
#1772971868
dua
#1772971926
open particles/screenshots/particles.webp 
#1772971935
open particles/project.godot 
#1772971972
ll
#1772971980
open role_playing_game/project.godot 
#1773081464
cd 
#1773081465
cd sure
#1773081647
cd couleur/
#1773081660
uv init --author-from=git --package --name couleur
#1773081667
bat requirements.txt 
#1773081672
bat development.txt 
#1773081684
cls;uv add --help
#1773081958
jq '.[0]| keys' ~/.cargo/craft-receipts.ldjson 
#1773081963
jq '.| keys' ~/.cargo/craft-receipts.ldjson 
#1773081974
jq '.[]| keys' ~/.cargo/craft-receipts.ldjson 
#1773081980
jq '[]| keys' ~/.cargo/craft-receipts.ldjson 
#1773081982
jq '[0]| keys' ~/.cargo/craft-receipts.ldjson 
#1773081988
jq '[0].| keys' ~/.cargo/craft-receipts.ldjson 
#1773081993
jq '[0][0]| keys' ~/.cargo/craft-receipts.ldjson 
#1773081997
bat ~/.cargo/craft-receipts.ldjson
#1773082004
jq '.| keys' ~/.cargo/craft-receipts.ldjson 
#1773082013
jq '.| keys | []' ~/.cargo/craft-receipts.ldjson 
#1773082016
jq '.| keys | [0]' ~/.cargo/craft-receipts.ldjson 
#1773082018
jq '.| keys | .[0]' ~/.cargo/craft-receipts.ldjson 
#1773082023
jq '.| keys | .' ~/.cargo/craft-receipts.ldjson 
#1773082026
jq '.| keys | .[]' ~/.cargo/craft-receipts.ldjson 
#1773082037
jq '.| keys' ~/.cargo/craft-receipts.ldjson 
#1773082043
jq '.dep| keys' ~/.cargo/craft-receipts.ldjson 
#1773082045
jq '.dep' ~/.cargo/craft-receipts.ldjson 
#1773082051
jq '.{name,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082055
jq '.{at,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082058
jq '.{crate,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082061
jq '{crate,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082063
jq '{name,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082068
jq '.dep| keys' ~/.cargo/craft-receipts.ldjson 
#1773082071
jq '.| keys' ~/.cargo/craft-receipts.ldjson 
#1773082077
jq '{at,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082138
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$"),dep}' ~/.cargo/craft-receipts.ldjson 
#1773082206
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | captures[] | {name,string} ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082213
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | captures | {name,string} ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082217
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | captures[0] | {name,string} ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082221
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | captures[0] ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082229
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | captures ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082237
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082259
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures[] | {name,string} ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082299
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures[] | [{name,string}]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082322
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures | [{name: [0].name,string}]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082328
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures | [{name: .name,string}]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082331
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures | [{name: name,string}]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082348
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures | [{.name: .string}]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082366
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures | \(.name): \(.string)  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082371
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures | "\(.name): \(.string)"  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082375
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures[] | "\(.name): \(.string)"  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082406
jq '{name:.at | match("^(?<parent>.*/)(?<name>[^/]+)$")  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082433
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | captures[1].string  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082438
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | captures[1]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082440
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | .captures[1]  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082470
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | {.captures[0].string, .captures[1].string  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082495
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\.(captures[0].string)  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082501
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\.(.captures[0].string)  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082511
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[0].string)  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082521
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[0].string)"  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082532
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}' ~/.cargo/craft-receipts.ldjson 
#1773082566
jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | contains("color"))' ~/.cargo/craft-receipts.ldjson 
#1773082567
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | contains("color"))' ~/.cargo/craft-receipts.ldjson 
#1773082577
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi)"))' ~/.cargo/craft-receipts.ldjson 
#1773082590
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)"))' ~/.cargo/craft-receipts.ldjson 
#1773082600
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)")) | [.]' ~/.cargo/craft-receipts.ldjson 
#1773082612
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)"))' | jq '.' ~/.cargo/craft-receipts.ldjson 
#1773082619
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)"))' | jq '[.]' ~/.cargo/craft-receipts.ldjson 
#1773082637
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)"))'' ~/.cargo/craft-receipts.ldjson 
#1773082643
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)"))' ~/.cargo/craft-receipts.ldjson 
#1773082693
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)")) | {name, dep: .dep | test("(color|ansi|pal{1,2}et{1,2}e)")}' ~/.cargo/craft-receipts.ldjson 
#1773082706
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)")) | {name, dep: .dep[] | test("(color|ansi|pal{1,2}et{1,2}e)")}' ~/.cargo/craft-receipts.ldjson 
#1773082720
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)")) | {name, dep: .dep[] | select(. | test("(color|ansi|pal{1,2}et{1,2}e)"))}' ~/.cargo/craft-receipts.ldjson 
#1773082727
cls;jq '{name:.at |                                                  match("^(?<parent>.*/)(?<name>[^/]+)$") | "\(.captures[1].string)"  ,dep}  | select(.dep[] | test("(color|ansi|pal{1,2}et{1,2}e)")) | {name, dep: .dep | select(.[] | test("(color|ansi|pal{1,2}et{1,2}e)"))}' ~/.cargo/craft-receipts.ldjson 
#1773082791
cd bufpager/
#1773082798
git st
#1773082826
cd workbench/
#1773082828
cargo run
#1773082856
cp -rfv src/cli/commands/bootstrap/ src/cli/commands/absorb
#1773082859
cp -rfv src/cli/commands/bootstrap/ src/cli/commands/add
#1773082863
cp -rfv src/cli/commands/bootstrap/ src/cli/commands/remove
#1773082881
cp -rfv src/cli/commands/bootstrap/ src/cli/commands/edit
#1773082887
git st
#1773082892
git add src/
#1773082893
git st
#1773082985
git  st
#1773083300
git st
#1773083305
cd
#1773083318
git st
#1773083336
git add -f .gitignore* .gitconfig
#1773083337
git st
#1773083390
git add git st
#1773083391
git st
#1773083393
git dh
#1773083405
git st
#1773083409
git diff
#1773083413
git add .
#1773083414
git st
#1773085629
cd cargo-features/
#1773085630
git st
#1773085696
cd cargo-deps-upgrade/
#1773085697
ls
#1773085701
git whatchanged .
#1773085706
cd ./crates_io_api/
#1773085708
git whatchanged .
#1773085712
cd ..
#1773085721
find . -name Cargo.toml
#1773085727
find . -name Cargo.toml -exec path parent {} |;
#1773085729
find . -name Cargo.toml -exec path parent {} \;
#1773085739
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c "$(declare -f cls);
cls
declare -p"; done
#1773085866
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c "$(declare -f cls);
cls
declare -p; read -p $'press enter to proceed\n' line"; done
#1773085884
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c "$(declare -f cls);
cls
declare -p | sort; read -p $'press enter to proceed\n' line"; done
#1773085921
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c "$(declare -f cls);
cls
declare -p | sort; declare -F -p | sort ; read -p $'press enter to proceed\n' line"; done
#1773085946
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls
declare -p | sort; declare -F -p | sort ; read -p $'press enter to proceed\n' line"; done
#1773085982
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls
declare -p | grep -E -i '(path)=' | sort; declare -F -p | sort ; read -p $'press enter to proceed\n' line"; done
#1773086027
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls;
echo ${path@Q}
declare -p | grep -E -i '(path)=' | sort; declare -F -p | sort ; read -p $'press enter to proceed\n' line"; done
#1773086063
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls;
echo ${path@Q}
echo
echo
declare -p | grep -E -i '(path)=' | sort; declare -F -p | sort ; echo;echo;read -p $'press enter to proceed\n' line"; done
#1773086086
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c  "$(declare -f cls);
cls;
echo ${path@Q}
echo
echo
declare -p | grep -E -i '(path)=' | sort; declare -F -p | sort ; echo;echo;read -p $'press enter to proceed\n' line"; done
#1773086154
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls;
echo ${path@Q}
echo
echo
declare -p | grep -E -i '((path)=|[cp]wd|bash)' | sort; declare -F -p | sort ; echo;echo;read -p $'press enter to proceed\n' line"; done
#1773086176
for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls;
echo ${path@Q}
echo
echo
declare -p | grep -E -i '((path)=|[cp]wd|bash|PS[0-9]+|PROMPT)' | sort; declare -F -p | sort ; echo;echo;read -p $'press enter to proceed\n' line"; done
#1773086179
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls;
echo ${path@Q}
echo
echo
declare -p | grep -E -i '((path)=|[cp]wd|bash|PS[0-9]+|PROMPT)' | sort; declare -F -p | sort ; echo;echo;read -p $'press enter to proceed\n' line"; done
#1773086197
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "$(declare -f cls);
cls;
echo ${path@Q}
echo
echo
declare -p | grep -E -i '((path)=|[cp]wd|bash|PS[0-9]+|PROMPT|SHELL)' | sort; declare -F -p | sort ; echo;echo;read -p $'press enter to proceed\n' line"; done
#1773086259
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "cd ${path@Q};
cls;echo -e '\x1b[1;38;5;220m${path}\x1b[0m\n\n';
cargo cbt -Rid -q
"; done
#1773086355
dns-server reboot
#1773086456
declare -F cls
#1773086457
declare -F clsa
#1773086646
dns-server reboot
#1773086681
dns-server reboot
#1773086693
dns-server reboot
#1773086755
dns-server reboot
#1773086768
dns-server reboot
#1773086775
dns-server reboot
#1773086828
dns-server reboot
#1773086876
dns-server reboot
#1773086886
dns-server reboot
#1773086911
dns-server reboot
#1773086928
dns-server reboot
#1773086961
dns-server reboot
#1773087174
ps aux | gawk 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087228
ps aux | gawk 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087273
ps aux | gawk 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087275
ps aux | gawk 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087281
ps aux | gawk 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087587
ps aux | gawk 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087709
ps aux | gawk -v pppid=$$ 'BEGIN{ IGNORECASE=1; } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } }'
#1773087879
cd ~/.emacs.d/
#1773087880
git st
#1773087887
git add c/
#1773087895
cls;git add --dry-run vardumps/
#1773087917
mv -f vardumps/ ~/workbench/2026-02-28/
#1773087919
ll ~/workbench/2026-02-28/
#1773087928
git st
#1773087933
git dh
#1773088075
git st
#1773088081
git add c/staging/
#1773088082
git st
#1773088083
git add .
#1773088084
git dh
#1773088099
git st
#1773088106
git dh -- c/hooks.el
#1773088110
git dh -- c/modes
#1773088111
git dh -- c/modes.el
#1773088113
git st
#1773088119
git dh -- c/{keys,hooks}.el
#1773088227
git diff c/keys.el
#1773088264
git st
#1773088294
git diff c/keys.el > c/keys.el.$(nowdz).$(git log -q --format=%h).patch
#1773088311
git diff c/keys.el > c/keys.el.$(nowdz).$(git log -1 --format=%h).patch
#1773088312
git st
#1773088316
git restore c/keys.el 
#1773088414
cd workbench/
#1773088414
git st
#1773088453
declare -a new_commands=( absorb add remove )
#1773088461
for ncmd in ${new_commands[@]}; do cmd_mod_path="$(path canon "$(git path)/src/cli/commands/${ncmd}")"; cmd_path_by_name_map["${ncmd}"]="${cmd_mod_path}"; done
#1773088783
echo "${cmd_path_by_name_map[@]@A}"
#1773088790
declare -A cmd_mod_path=()
#1773088803
cls;for ncmd in ${new_commands[@]}; do cmd_mod_path="$(path canon "$(git path)/src/cli/commands/${ncmd}")"; cmd_path_by_name_map["${ncmd}"]="${cmd_mod_path}"; done; declare -p cmd_mod_path
#1773088825
cls;for ncmd in ${new_commands[@]}; do cmd_mod_path="$(path canon "$(git path)/src/cli/commands/${ncmd}")"; cmd_path_by_name_map["${ncmd}"]="${cmd_mod_path}"; done; declare -p cmd_path_by_name_map
#1773088833
declare -A cmd_path_by_name_map=()
#1773088838
unset cmd_path_by_name_map
#1773088842
unset cmd_mod_path 
#1773088851
declare -g cmd_mod_path
#1773088860
declare -A cmd_path_by_name_map=()
#1773088869
cls;for ncmd in ${new_commands[@]}; do cmd_mod_path="$(path canon "$(git path)/src/cli/commands/${ncmd}")"; cmd_path_by_name_map["${ncmd}"]="${cmd_mod_path}"; done; declare -p cmd_path_by_name_map
#1773088346
bat c/keys.el.2026-03-09.17-31-51.1773088311.0747465.patch 
#1773088402
git st
#1773088912
for cmd_lower in ${!cmd_path_by_name_map[@]}; do cmd_snake=$(heck-string --to=snake "${cmd_lower}"); cmd_pascal=$(heck-string --to=pascal "${cmd_lower}"); cmd_upper=$(heck-string --to=shouty-snake "${cmd_lower}"); cmd_mod_path=${cmd_path_by_name_map["${cmd_lower}"]}; bash -c "cd ${cmd_mod_path@Q};

set -x
git status $(pwd);set +x;
refactors ${from_upper@Q} ${cmd_upper@Q} -wp .
refactors ${from_snake@Q} ${cmd_snake@Q} -wp .
refactors ${from_pascal@Q} ${cmd_pascal@Q} -wp .
"; done
#1773089189
git st
#1773089190
cd -
#1773089198
cd -
#1773089198
git st
#1773089202
ll
#1773089202
pwd
#1773090210
wz cli
#1773090213
wz
#1773090230
wz set-window-title "$(path canon -f .)"
#1773090241
wezterm cli set-window-title "$(path canon -f .)"
#1773090246
wezterm cli set-window-title --help # "$(path canon -f .)"
#1773090438
wezterm list
#1773090527
which jq
#1773090529
which -a jq
#1773090535
ll /usr/bin/
#1773090541
> /usr/bin/watwat
#1773090547
sudo su
#1773090550
sudo su -
#1773090559
/usr/bin/jq
#1773090619
wezterm list --format=json
#1773090623
wezterm cli list --format=json
#1773090680
wezterm cli list --format=json | jq ".[] | select(.pane_id == ${WEZTERM_PANE})"
#1773090831
which -a jq
#1773090849
hash -r
#1773090850
which -a 
#1773090852
which -a jq
#1773090860
which -a jq | unique-lines 
#1773090885
which -a jq | unique-lines; path canon /opt/homebrew/bin/jq
#1773090893
ll /opt/homebrew/Cellar/jq/
#1773090906
brew --prefix jq
#1773090918
brew --prefix jq | xargs path canon
#1773090927
cls;brew --help
#1773090932
brew help
#1773090937
man brew
#1773091041
brew --prefix jq
#1773091043
brew --cellar jq
#1773091049
ls $(brew --cellar jq)
#1773091073
brew --prefix jq | xargs path canon
#1773091084
which -a jq | unique-lines; brew --cellar jq
#1773091106
which -a jq | unique-lines; /bin/ls $(brew --cellar jq)
#1773091498
git add whiches 
#1773091114
which -a jq | unique-lines; brew --cellar jq
#1773091134
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d
#1773091169
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path join '{}' 'bin' \;
#1773091178
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path join '{}' 'bin' \; | tail -1 | xargs ls
#1773091183
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path join '{}' 'bin' \; | tail -1 | xargs ls -latrh
#1773091192
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path join '{}' 'bin' \;
#1773091209
which -a which
#1773091241
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path join '{}' 'bin/jq' \;
#1773091251
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \;
#1773091255
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; | sort 
#1773091258
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; | sort -ru
#1773091261
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; | sort -r
#1773091265
which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; | sort -u
#1773091275
(which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | sort 
#1773091331
(which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | sort  | xargs -Ieachwhich gstat -c '%Y %W eachwhich' 'eachwhich' 
#1773091347
(which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | sort  | xargs -Ieachwhich gstat -c '%Y %W %F eachwhich' 'eachwhich' 
#1773091359
(which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | xargs -Ieachwhich gstat -c '%Y %W %F eachwhich' 'eachwhich'  | sort
#1773091377
(which -a jq | unique-lines; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | xargs -Ieachwhich gstat -c '%Y %W %F eachwhich' 'eachwhich'  | sort -nr
#1773091418
(which -a jq | unique-lines | xargs -Ieachwhich path canon 'eachwhich'; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | xargs -Ieachwhich gstat -c '%Y %W %F eachwhich' 'eachwhich'  | sort -nr
#1773091428
(which -a jq | unique-lines | xargs -Ieachwhich path canon 'eachwhich'; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | xargs -Ieachwhich gstat -c '%Y %W %F eachwhich' 'eachwhich'  | sort -nur
#1773091525
setmac
#1773091534
dns-server logs
#1773091605
cd ~/opt/libexec/
#1773091605
gitnst
#1773091607
git st
#1773091610
git add video-extensions-regex 
#1773091615
git commit video-extensions-regex -m video-extensions-regex
#1773092699
pushd ~/.emacs.d/
#1773092700
git st
#1773092704
git diff c/functions.el
#1773092725
git dh -- c/functions.el
#1773092777
git dh -- c/functions.el
#1773092783
git dh -- c/functions.el
#1773093250
~/.shell.d/x.d/ansi-truecolor-tango.sh 
#1773093437
whiches 
#1773093447
whiches 
#1773091547
sudo su -
#1773091565
dns-server reboot
#1773091569
dns-server restart
#1773091574
dns-server logs
#1773088929
heck-string --to=
#1773088940
heck-string --to=pascal foo
#1773088943
heck-string --to=pascal-case foo
#1773088945
heck-string --to=pascal_case foo
#1773088948
heck-string --to=pascalcase foo
#1773087744
ps aux | gawk -v pppid="${$}" 'BEGIN{ IGNORECASE=1; PROCINFO["@sorted_in"] = "@val_str_asc"; printf("\x1b[2J\x1b[3J\x1b[H") } { if ( ( $2 != PROCINFO["pid"] ) &&  ( $2 != PROCINFO["ppid"] ) && ($NF ~ /(dnsmasq|tcpdump)/)) { print $0 } } END { delete varnames; varnames[varname_index++]="pid"; varnames[varname_index++]="ppid"; for (key in varnames) { varname=varnames[key]; value=PROCINFO[varname]; printf("PROCINFO[\x27%s\x27] => \x27%s\x27\n", varname, value) }  }'
#1773087768
psgrep 
#1773087773
psgrep  a
#1773087839
gawk -f - -o- ~/opt/libexec/psgrep 
#1773087844
gawk -f - -o- < ~/opt/libexec/psgrep 
#1773087854
gawk -f - -o- < ~/opt/libexec/psgrep 
#1773085642
bat usr-bin-uname.yaml 
#1773085645
bat usr-bin-uname.*
#1773085659
git clean 
#1773085669
git clean -f
#1773085671
git st
#1773085678
git whatchanged 
#1773085687
ll src/
#1773083435
git commit .emacs.d/tramp -m .emacs.d/tramp 
#1773083436
git st
#1773083437
git dh
#1773083466
git commit -m 'git stuff'
#1773083467
git st
#1773083479
cd git-bandolier/
#1773083481
git st
#1773083503
ll src/cli/
#1773083504
ll src/cli/commands/
#1773083513
cargo deps list
#1773094123
dns-server logs
#1773096969
(which -a jq | unique-lines | xargs -Ieachwhich path canon 'eachwhich'; find $(brew --cellar jq) -mindepth 1 -maxdepth 1 -type d -exec path canon '{}/bin/jq' \; ) | xargs -Ieachwhich gstat -c '%Y %W %F eachwhich' 'eachwhich'  | sort -nur
#1773099485
launch_emacs_desktop
#1773099529
pushd ~/.shell.d/
#1773099530
git st
#1773099535
man git-stash 
#1773099590
git path
#1773099592
dua
#1773099594
st
#1773099658
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(nowdz)__$(git log -1 --format=%h)
#1773099691
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(nowdz)__$(git log -1 --format=%h)__reason__git-stash-push--tests
#1773099709
declare -p ${!shell_d*}
#1773099714
declare -p ${!shell_d*st*}
#1773099716
cls;declare -p ${!shell_d*st*}
#1773099734
date --date=@${shell_d_started_at}
#1773099741
date
#1773099802
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%D.%s')__$(git log -1 --format=%h)__reason__git-stash-push--tests
#1773099804
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%D.%s')__$(git log -1 --format=%h)__reason__git-stash-push--tests
#1773099837
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%D.%s')
#1773099869
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M.%s')
#1773099875
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%D.%s')
#1773099887
echo cp -rfv ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%S.%s')
#1773099925
rsync --ignore-errors -aupvot ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%S.%s')/
#1773099944
rm -rfv ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%S.%s')/
#1773099959
rsync --ignore-errors -au ~/.shell.d/ ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%S.%s')/
#1773100038
cls; time tar czf ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%S.%s').tar.gz . && time zip -r ~/workbench/$(today)/backup__~__.shell.d__$(git log -1 --format=%h)__reason__git-stash-push--tests__$(gdate --date=@${shell_d_started_at} +'%Y-%m-%d.%H-%M-%S.%s').tar.gz .
#1773100097
man zip
#1773100157
ll ~/workbench/$(today)/
#1773100278
cls;
#1773100485
pushd ~/.shell.d/
#1773100485
git st
#1773100496
git diff 0000110-env.sh
#1773100509
git sh 0000110-env.sh
#1773100511
git dh 0000110-env.sh
#1773100515
cls;git dh 0000110-env.sh
#1773100717
man gawk
#1773100743
ack  'AWK(LIB)?PATH' ~/.shell.d/
#1773100778
man gawk
#1773101134
ll ~/.shell.d{/,fn.staging.d/,x.d/}
#1773101150
ack '(AWK(LIB)?PATH|ZIPOPT)' ~/.shell.d{/,fn.staging.d/,x.d/}
#1773101157
ack -i '(AWK(LIB)?PATH)' ~/.shell.d{/,fn.staging.d/,x.d/}
#1773101161
cls;ack -i '(AWK(LIB)?PATH)' ~/.shell.d{/,fn.staging.d/,x.d/}
#1773101206
mkdir -p ~/.shell.d/env.d/
#1773101209
mv -fv ~/.shell.d/x.d/awkpath.sh ~/.shell.d/env.d/awkpath.sh
#1773101220
pushd ~/.shell.d/
#1773101220
git st
#1773101224
git add env.d/
#1773101225
git st
#1773101247
mkdir .tmp-artifacts
#1773101249
git st
#1773101256
git status --porcelain | grep -E '^[?]'
#1773101288
git status --porcelain | grep -E '^[?]' | lastcol | xargs -Ieachtmp mv -fv 'eachtmp' ~/.shell.d/.tmp-artifacts/
#1773101290
git st
#1773101304
git st
#1773101373
mv .tmp-artifacts/ ~/workbench/2026-03-09/~__.shell.d____tmp-artifacts
#1773101374
git st
#1773101376
git add .
#1773101377
git st
#1773101381
git whatchanged 
#1773101390
git whatchanged -1
#1773101392
cls;git whatchanged -1
#1773100287
rm -vf ~/workbench/2026-03-09/backup__~__.shell.d__b3eb3d2__reason__git-stash-push--tests__2026-03-09.21-03-11.1773090191.tar.gz 
#1773102841
backup-git-path-to-workspace.sh 
#1773102862
backup-git-path-to-workspace.sh 
#1773101395
date
#1773101400
git st
#1773101409
git dh entrypoint.sh
#1773101415
git st
#1773102968
pushd ~/opt/libexec/
#1773102968
gt st
#1773102969
git st
#1773102972
git add backup-git-path-to-workspace.sh 
#1773102975
git commit backup-git-path-to-workspace.sh -m backup-git-path-to-workspace.sh
#1773102977
git st
#1773102981
git add .
#1773102989
git st
#1773103017
backup-git-path-to-workspace.sh 
#1773103039
backup-git-path-to-workspace.sh 
#1773103056
backup-git-path-to-workspace.sh 
#1773103161
backup-git-path-to-workspace.sh 
#1773103206
backup-git-path-to-workspace.sh 
#1773103254
backup-git-path-to-workspace.sh 
#1773103300
popd
#1773103302
git st
#1773103307
git add env.d/
#1773103307
git st
#1773103326
git restore --staged entrypoint.sh
#1773103328
git st
#1773103362
git stash push --staged -m 'awkpath'
#1773103364
git st
#1773103368
git stash list
#1773103374
git stash pop
#1773103375
git st
#1773103379
git add .
#1773103379
git st
#1773103453
cd
#1773104282
git add note-2026-03-10-at-21-50-29-PM--03.rst2026-03-10-at-00-52-29-AM-UTC.rst 
#1773103806
git st
#1773103814
git commit entrypoint.sh  -m 'fixes entrypoint.sh'
#1773106005
git log
#1773106020
git diff b3eb3d21a3af30cfc480de63440ee824a6659571 -- entrypoint.sh
#1773106225
git br
#1773106244
git dh
#1773106410
git st
#1773103388
git whatchanged 
#1773103435
git commit -am 'commit 9ad1c7163f4e803c45bd991e7055bf3d708d0695 should not have happened, so the present commit is kinda like an "apppendage"'
#1773103462
git whatchanged entrypoint.sh
#1773103476
git show 9ad1c7163f4e803c45bd991e7055bf3d708d0695
#1773106488
git st
#1773106510
git st
#1773106514
emc entrypoint.sh
#1773106542
now
#1773106966
git st
#1773106970
git diff
#1773106973
git add .
#1773106975
git st
#1773106979
git dh now-cli
#1773106991
git dh now-cli
#1773107034
git diff HEAD -- now-cli.
#1773107037
git diff HEAD -- now-cli.sh
#1773107039
git st
#1773107046
git diff HEAD -- now-cli
#1773107061
git diff HEAD -- now-cli > now-cli.$(git log -1 --format=%h).patch
#1773107066
git st
#1773107074
git add now-cli
#1773107077
git add .
#1773107078
git st
#1773107094
git checkout  HEAD -- now-cli
#1773107246
git st
#1773107419
ord '!'
#1773107736
git st
#1773107739
git add .
#1773108100
git st
#1773108102
bat now-cli.regex%21
#1773108112
bat 'now-cli.regex%21'
#1773108141
diff -u --color now-cli.regex%21 now-cli.regex
#1773108150
diff -u --color now-cli.regex%21 now-cli.regex
#1773108152
git st
#1773108154
git add .
#1773108162
rm -f 'now-cli.regex%21' 
#1773108164
git st
#1773108165
git add .
#1773108166
git st
#1773108311
git add now-cli
#1773108312
git st
#1773108319
git whatchanged now-cli
#1773108323
git st
#1773108331
git dh -- now-cli
#1773108335
now
#1773108342
echo ${TZ@Q}
#1773108349
git st
#1773108375
git switch -c now-cli-assoc-arrays-value-double-quote
#1773108376
git st
#1773108387
git commit now-cli*
#1773108418
git st
#1773108420
git switch -
#1773108423
git dh
#1773108431
git st
#1773108479
git commit backup-git-path-to-workspace.sh -m 'backup-git-path-to-workspace.sh fix source path arguments'
#1773108480
git st
#1773108487
git br
#1773108494
git merge --squash  --no-commit now-cli-assoc-arrays-value-double-quote
#1773108495
git st
#1773108503
rm -f now-cli.*
#1773108504
git st
#1773108505
git add .
#1773108505
git st
#1773108511
git commit
#1773108529
git st
#1773108532
now
#1773108558
now
#1773108646
now
#1773108659
now
#1773108679
ack '[$][{]zone[}]' now-cli 
#1773108809
now
#1773108815
echo ${TZ} 
#1773108875
git st
#1773108877
git log
#1773108879
git st
#1773108882
git diff
#1773108885
git commit
#1773108887
git add .
#1773108888
git commit
#1773108901
now
#1773108907
nowdz
#1773108909
nowf
#1773108910
nowfs
#1773108922
cls;now;nowfs;nowdz;nowd
#1773108982
now
#1773108986
echo "$(now)"
#1773109155
echo "$(now)"
#1773109168
echo "$(now)"
#1773109171
echo "$(now)";now
#1773109195
echo "$(now)";now
#1773109220
git diff
#1773109225
git stash 
#1773109227
echo "$(now)";now
#1773109233
unset TZ
#1773109234
echo "$(now)";now
#1773109289
echo "$(now)";now
#1773109295
export TZ=UTC
#1773109298
echo "$(now)";now
#1773109306
git st
#1773109357
git stash push -m "now-cli PoC/workarounds whether stdout is a tty

$(git diff HEAD -- now-cli)
"
#1773109372
git st
#1773106919
git diff entrypoint.sh
#1773106947
wz spawn --cwd="$(path canon ~/opt/libexec/)"
#1773106956
wz spawn --new-window --cwd="$(path canon ~/opt/libexec/)"
#1773109381
git st
#1773109391
git st
#1773103345
man git-stash
#1773109400
git st
#1773109402
ll
#1773109410
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "cd ${path@Q};
cls;echo -e '\x1b[1;38;5;220m${path}\x1b[0m\n\n';
cargo cbt -Rid -q
"; done
#1773109421
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "cd ${path@Q};
cls;echo -e '\x1b[1;38;5;220m${path}\x1b[0m\n\n';
cargo cbt --offline -Rid -q
"; done
#1773109444
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "cd ${path@Q};
cls;echo -e '\x1b[1;38;5;220m${path}\x1b[0m\n\n';
cargocbtallsafe
"; done
#1773109507
cls;for path in $(find . -name Cargo.toml -exec path parent {} \;); do bash -c -l "cd ${path@Q};
cls;echo -e '\x1b[1;38;5;220m${path}\x1b[0m\n\n';
cargo build --offline; cargo test --offline; 2>/dev/null cargo run --offline; cargo docs --offline
"; done
#1773106065
git st
#1773106093
git switch -c shell_d_sh_wezterm_cli_from_b3eb3d2
#1773106105
git log # a3af30cfc480de63440ee824a6659571
#1773106117
git switch -
#1773106122
git reset --hard b3eb3d21a3af30cfc480de63440ee824a6659571
#1773106129
git log -1 --format=%h
#1773106156
git merge --no-commit  --squash shell_d_sh_wezterm_cli_from_b3eb3d2 
#1773106157
git st
#1773106165
git dh 
#1773106192
git st
#1773106197
git commit
#1773102902
backup-git-path-to-workspace.sh 
#1773102938
backup-git-path-to-workspace.sh 
#1773102953
backup-git-path-to-workspace.sh 
#1773106442
cargocbtallsafe 
#1773106457
ll
#1773106458
git st
#1773106460
git clean -f
#1773106481
cargo cbt -q -i -R -d
#1773100532
git st
#1773100561
cp entrypoint.sh entrypoint.sh.$(git log -1 --format=%h).$(gstat -c '%Y' entrypoint.sh)
#1773100565
git restore entrypoint.sh 
#1773100569
git st
#1773100583
git st
#1773100585
git diff entrypoint.sh
#1773100593
git st
#1773100600
git diff 0000110-env.sh
#1773100633
cp 0000110-env.sh 0000110-env.sh.$(git log -1 --format=%h).$(gstat -c '%Y' 0000110-env.sh)
#1773100634
git st
#1773100671
git st
#1773100681
git restore 0000110-env.sh 
#1773100682
git st
#1773100684
git diff
#1773103290
backup-git-path-to-workspace.sh 
#1773081430
cd cargo-cbt
#1773081435
cargo deps list
#1773081440
cargo add cargo
#1773081446
setmac
#1773081460
cargo add cargo
#1773081703
vim requirements.txt 
#1773081706
vim development.txt 
#1773081722
uv add --dev -r development.txt 
#1773081730
dns-server logs
#1773099501
cd
#1773099502
cd .shell.d/
#1773099503
git st
#1773099507
git dh entrypoint.sh
#1773099521
git st
#1773100192
man zip
#1773100820
man compress
#1773100864
man gzip
#1773100899
man gzip
#1773100904
man 3 fts
#1773100909
man fts
#1773100929
ack '(AWK(LIB)?PATH|ZIPOPT)' 
#1773101460
man zip
#1773081258
find . -name project.godot
#1773081261
cd ..
#1773081263
find . -name project.godot
#1773081268
find . -name project.godot | sort 
#1772971676
git clean -df
#1772971676
git st
#1772971679
git clean -Xdf
#1772971682
cargo run --offline
#1772971719
cargo doc --offline --open
#1773081370
cargo cbt -i -R -d
#1773081386
cargo cbt -a -i -R -d
#1773081393
cargo cbt -a -i -R -d -A
#1773081401
cargo cbt -r -i -R -d 
#1773081472
ll
#1773081476
uv init --help
#1773081510
uv init --name sure --package --no-readme --author-from=git 
#1773081520
emc pyproject.toml 
#1773081536
uv run
#1773081545
uv run make test
#1773109517
wz-wip-old 
#1773109531
sudo shutdown  -h now
#1772970749
ls
#1772971130
emc Services/UTMProcess.m 
#1772971193
ack pushArgv
#1772971292
woman qemu-img
#1773109579
cd ~/opt/libexec/
#1773109583
git whatchanged setmac
#1773109589
git whatchanged -p setmac
#1773109617
st
#1773109619
git st
#1773109622
git checkout 4e266d2d33478c6626711e1fcb54d96a3c0616c6 -- setmac
#1773109623
git st
#1773109632
ack setmac ~/opt/ ~/.shell.d/
#1773109647
cd cargo-deps-upgrade/
#1773109668
find . -mindepth 1 -maxdepth 1 -name Cargo.toml
#1773109671
find . -mindepth 2 -maxdepth 2 -name Cargo.toml
#1773109677
find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path canon {} \;
#1773109705
find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c "set -umeTE; set +f; set -o pipefail;
declare -gr manifest_path=$(path canon '{}');
declare -gr project_path=$(path parent $'\x22\x24{manifest_path}\x22');
cd $'\x22\x24{project_path}\x22'
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
" \;
#1773109947
find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c "set -umeTE; set +f; set -o pipefail;
declare -gr manifest_path=$(path canon $'\x22\x24{@}\x22');
declare -gr project_path=$(path parent $'\x22\x24{manifest_path}\x22');
cd $'\x22\x24{project_path}\x22'
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
" '{}'  \;
#1773109953
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c "set -umeTE; set +f; set -o pipefail;
declare -gr manifest_path=$(path canon $'\x22\x24{@}\x22');
declare -gr project_path=$(path parent $'\x22\x24{manifest_path}\x22');
cd $'\x22\x24{project_path}\x22'
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
" '{}'  \;
#1773109985
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c "set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon $'\x22\x24{argv}\x22');
declare -gr project_path=$(path parent $'\x22\x24{manifest_path}\x22');
cd $'\x22\x24{project_path}\x22'
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
" '{}'  \;
#1773110043
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c "set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon $'\x22"{}"\x22');
declare -gr project_path=$(path parent $'\x22\x24{manifest_path}\x22');
cd $'\x22\x24{project_path}\x22'
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
" '{}'  \;
#1773110115
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon "${argv}");
declare -gr project_path=$(path parent "${manifest_path}");
cd "${project_path}"
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
' "{}" \;
#1773110124
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec echo bash -c 'set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon "${argv}");
declare -gr project_path=$(path parent "${manifest_path}");
cd "${project_path}"
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
' "{}" \;
#1773110137
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec echo -e bash -c 'set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon "${argv}");
declare -gr project_path=$(path parent "${manifest_path}");
cd "${project_path}"
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
\n\n' "{}" \;
#1773110164
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec echo -e bash -c 'set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon "${argv}");
declare -gr project_path=$(path parent "${manifest_path}");
cd "${project_path}"
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
fi

\n\n' "{}" \;
#1773110174
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec bash -c 'set -umeTE; set +f; set -o pipefail;
declare -gr argv="${@}"
declare -gr manifest_path=$(path canon "${argv}");
declare -gr project_path=$(path parent "${manifest_path}");
cd "${project_path}"
if cargo doc --open; then
cargo build;cargo test --offline || true
2>/dev/random cargo run --offline || true
fi

\n\n' "{}" \;
#1773110188
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path canon '{}' \;
#1773110191
cls;find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;
#1773110203
for project_path in $(find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;); do (cd "${project_path}" && bash -c 'cargo doc --open && (cargo build --offline || true; cargo test --offline || true; 2>/dev/null cargo run' ); done
#1773110318
for project_path in $(find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;); do (cd "${project_path}" && bash -c 'cargo doc --open && (cargo build --offline || true; cargo test --offline || true; 2>/dev/null cargo run )'; done
#1773110350
for project_path in $(find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;); do (cd "${project_path}" && bash -c 'cargo doc --open
cargo build --offline
cargo test --offline
2>/dev/null cargo run --offline' \;
#1773110393
for project_path in $(find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;); do (cd "${project_path}" && bash -c 'cargo build --all-features; cargo doc --all-features --open;
cargo build --offline
cargo test --offline
2>/dev/null cargo run --offline' \;
#1773110410
for project_path in $(find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;); do (cd "${project_path}" && bash -c 'cargo build --all-features; cargo doc --all-features --open;
cargo build --offline
cargo test --offline
2>/dev/null cargo run --offline' ); \;
#1773110423
for project_path in $(find . -mindepth 2 -maxdepth 2 -name Cargo.toml -exec path parent '{}' \;); do  (cd "${project_path}" && bash -c 'cargo build --all-features; cargo doc --all-features --open;
cargo build --offline
cargo test --offline
2>/dev/null cargo run --offline' ); done
#1773110556
dns-server logs
#1773110571
setmac
#1773110574
dns-server logs
#1773110699
which ddt
#1773110704
ddt --help
#1773110709
ddt
#1773110758
cd /opt/homebrew/etc/
#1773110758
git st
#1773110760
git diff
#1773110766
git commit dnsmasq.conf -m 'no-resolv'
#1773110769
git whatchanged -p dnsmasq.conf
#1773110999
dns-server  restart
#1773111051
sleep 3 && dns-server restart
#1773111150
wz get
#1773111152
wz-get
#1773111163
wz-ls 
#1773111180
wz-ls | jq ".[] | select(.pane_id == ${WEZTERM_PANE})"
#1773111200
wz-ls | jq 0r ".[] | select(.pane_id == ${WEZTERM_PANE}) | .window_id"
#1773111204
wz-ls | jq -r ".[] | select(.pane_id == ${WEZTERM_PANE}) | .window_id"
#1773111213
declare -i window_id=$(wz-ls | jq -r ".[] | select(.pane_id == ${WEZTERM_PANE}) | .window_id")
#1773111261
sleep 3 && wz set-window-title --window-id=${window_id} "stopping dns server" && if dns-server stop; then  wz set-window-title --window-id=${window_id} "dns-server stopped"; else wz set-window-title --window-id=${window_id} "error: dns-server not stopped"; fi
#1773111332
sleep 3 && wz set-window-title --window-id=${window_id} "stopping dns server" && if dns-server stop; then  wz set-window-title --window-id=${window_id} "dns-server stopped"; else wz set-window-title --window-id=${window_id} "error: dns-server not stopped"; fi
#1773111341
set -x
#1773111342
sleep 3 && wz set-window-title --window-id=${window_id} "stopping dns server" && if dns-server stop; then  wz set-window-title --window-id=${window_id} "dns-server stopped"; else wz set-window-title --window-id=${window_id} "error: dns-server not stopped"; fi
#1773111358
set +x
#1773111382
sleep 3 && wz set-window-title --window-id=${window_id} "'stopping dns server'" && if dns-server stop; then  wz set-window-title --window-id=${window_id} "'dns-server stopped'"; else wz set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773111405
sleep 3 && wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if dns-server stop; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773111429
dns-server  stop
#1773110802
man dnsmasq.conf
#1773110804
man -e dnsmasq.conf
#1773110806
man 3 dnsmasq.conf
#1773110810
man dnsmasq
#1773110994
man dnsmasq
#1773111017
man dnsmasq
#1773111514
col
#1773111515
col 2
#1773111521
psgrep 
#1773111584
which psgrep 
#1773111593
which psgrep  | xargs  gawk -o- -f
#1773111608
gawk -f - -o- < $(which psgrep)
#1773111643
gawk -f - -o- < $(which psgrep)
#1773111651
gawk -f - -o- < $(which psgrep)
#1773111652
gawk -f - -o- < $(which psgrep) | pbcopy 
#1773111673
psgrep 
#1773111679
ps aux | psgrep 
#1773111719
ps aux | psgrep 
#1773111825
ps aux | psgrep 
#1773111438
sudo su
#1773112322
sleep 3 && wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep 'dnsmasq' | xargs kill -9; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112335
wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep 'dnsmasq' | xargs kill -9; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112355
cls;wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep dnsmasq | xargs kill -9'; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112363
wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep 'dnsmasq' | xargs kill -9; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112365
cls;wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep dnsmasq | xargs kill -9'; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112505
cls;wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep dnsmasq | xargs kill -9'; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112547
cls;wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep dnsmasq | xargs kill -9'; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112570
cls; sleep 3;wezterm cli set-window-title --window-id=${window_id} "'stopping dns server'" && if sudo bash -c 'set -umeTEx; set -o pipefail; ps aux | psgrep dnsmasq | xargs kill -9'; then  wezterm cli set-window-title --window-id=${window_id} "'dns-server stopped'"; else wezterm cli set-window-title --window-id=${window_id} "'error: dns-server not stopped'"; fi
#1773112591
sudo su
#1773112609
sudo su
#1773112747
cls; networksetup 
#1773112904
cls; networksetup | bat
#1773112654
sudo su
#1773111068
sudo su -
#1773111851
ps aux | psgrep 
#1773111861
ps aux | psgrep dns
#1773112120
ps aux | psgrep dns
#1773112175
ps aux | psgrep dns
#1773112222
ps aux | psgrep dns
#1773112228
ps aux | psgrep dns server
#1773112242
ps aux | psgrep dns server
#1773112246
ps aux | psgrep dns server
#1773112256
ps aux | psgrep dns server
#1773112278
ps aux | psgrep dns server
#1773113028
declare -f cls
#1773113030
declare -f cls | pbcopy 
#1773110737
launch_emacs_desktop
#1773110615
sudo su 
#1773110581
dns-server restart;dns-server logs
#1773110609
dns-server logs
#1773113155
cd ~/opt/libexec/
#1773113156
git st
#1773113164
git whatchanged -p  --  setmac
#1773113172
git whatchanged  --  setmac
#1773113185
git checkout 17d67d1ab4e4446cd8c9128e3a2af9826f199618`-- setmac
#1773113191
git checkout 17d67d1ab4e4446cd8c9128e3a2af9826f199618-- setmac
#1773113195
git checkout 17d67d1ab4e4446cd8c9128e3a2af9826f199618 -- setmac
#1773113197
git dh -- setmac
#1773113204
setmac
#1773113252
setmac
#1773113549
mkpushd ~/workbench/$(today)
#1773113553
git init
#1773113574
mkpushd ./tree-sitter
#1773113600
echo "$(pbpaste)" > urls.txt
#1773113686
sed -n -E 's,^https://.*crates[/]([A-Za-z0-9_-]+)([^a-zA-Z0-9_-]+.*?)?$,\1/gp' urls.txt 
#1773113689
sed -n -E 's,^https://.*crates[/]([A-Za-z0-9_-]+)([^a-zA-Z0-9_-]+.*?)?$,\1,gp' urls.txt 
#1773113714
> fetch-crates.sh
#1773113763
emc fetch-crates.sh 
#1773113790
./fetch-crates.sh 
#1773113950
cargo features -h
#1773114117
bash fetch-crates.sh 
#1773114122
ll
#1773114126
ls colorloom/
#1773114197
cls;bash fetch-crates.sh 
#1773115278
cd
#1773115283
cd UTM/
#1773115285
cd ..
#1773114694
ll
#1773114704
ls tree-sitter-bash
#1773114715
jq '.| keys' tree-sitter-bash/features.https-crates-io-api-v1-crates-tree-sitter-bash.json 
#1773114724
jq '.| keys' tree-sitter-bash/tree-sitter-bash.deps.json 
#1773114728
jq '.crate| keys' tree-sitter-bash/tree-sitter-bash.deps.json 
#1773114735
jq '.crate.repository' tree-sitter-bash/tree-sitter-bash.deps.json 
#1773114747
jq '.crate | {name,repository}' tree-sitter-bash/tree-sitter-bash.deps.json 
#1773114768
find . -name '*.deps.json'
#1773114778
for info in $(find . -name '*.deps.json'); info_parent=$(path parent "${info}" )
#1773114801
for info in $(find . -name '*.deps.json');  do info_parent=$(path parent "${info}"); repo=$(jq -r '.crate | .repository' "${info}"); echo "${repo}"; done
#1773114896
for info in $(find . -name '*.deps.json');  do info_parent=$(path parent "${info}"); repo=$(jq -r '.crate | .repository' "${info}"); (cd "${info_parent}" && git clone --depth=1 "${repo}.git"; done
#1773115088
ll
#1773115090
ll rdump/
#1773115143
bash fetch-crates.sh 
#1773115184
bash fetch-crates.sh 
#1773115426
bash fetch-crates.sh 
#1773115472
git st
#1773115476
ll
#1773115482
find . -type d -mindepth 2
#1773115486
find . -type d -mindepth 2 -maxdepth 2
#1773115495
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'
#1773115508
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'| xargs -Ieachrepo rm -vrf 'eachrepo'
#1773115541
ll
#1773115554
bash fetch-crates.sh 
#1773113586
mkpushd tty-raycast-shader
#1773115721
cd ..
#1773115726
wz-get-text --help
#1773115736
wz-get-text --pane-id=11 > foo
#1773115817
wz-wip-old 11 > foo.11.out
#1773115823
wz-wip-old -g 11 > foo.11.out
#1773115851
ack -i 'user[._[:space:]-]*name' foo.11.out 
#1773115868
ack -i '(password|user([._[:space:]-]*name)?)' foo.11.out 
#1773115875
ack -i '\b(password|user([._[:space:]-]*name)?)\b' foo.11.out 
#1773115897
cls;ack -C 5 -i cloning foo.11.out
#1773115905
cls;ack -C 5 -i cloning foo.11.out
#1773115942
ls
#1773115986
ps aux | grep git
#1773115998
curl https://github.com/tree-sitter/tree-sitter-pest
#1773116002
curl -vvv https://github.com/tree-sitter/tree-sitter-pest
#1773116028
man curl
#1773116053
cls;curl -f --fail-early https://github.com/tree-sitter/tree-sitter-pest
#1773116289
ll
#1773116291
git st
#1773116305
git add tree-sitter/urls.txt tree-sitter/fetch-crates.sh tty-raycast-shader/fetch-crates.sh 
#1773116314
git st
#1773116336
git st
#1773116346
find tree-sitter -name '*.json'
#1773116353
find tree-sitter -maxdepth 3 -name '*.json'
#1773116369
find . -mindepth 2 -maxdepth 3 -name '*.json'
#1773116379
find . -mindepth 2 -maxdepth 3 -name '*.json' -exec git add -f {} \;
#1773116380
git st
#1773116398
git st
#1773116408
git st
#1773116421
git st
#1773116425
git add .gitignore 
#1773116428
git st
#1773116435
git q
#1773116442
rm tty-raycast-shader/fetch-crates.sh 
#1773116443
git add .
#1773116445
git st
#1773116454
git restore backup__~__.shell.d____2026-03-10.00-37-19.1773103039__9ad1c71____reason____git_stash_push_tests
#1773116458
git restore backup__~__opt__libexec____2026-03-10.00-37-19.1773103039__fe37134____reason____git_stash_push_tests
#1773116458
git st
#1773116469
git rm -rf --cached backup__~__opt__libexec____2026-03-10.00-37-19.1773103039__fe37134____reason____git_stash_push_tests
#1773116473
git rm -rf --cached backup__~__opt__libexec____2026-03-10.00-37-19.1773103039__fe37134____reason____git_stash_push_tests backup__~__.shell.d____2026-03-10.00-37-19.1773103039__9ad1c71____reason____git_stash_push_tests
#1773116474
git st
#1773116481
git rm -rf --cached backup__~__.shell.d____2026-03-10.00-37-19.1773103039__9ad1c71____reason____git_stash_push_tests
#1773116481
git st
#1773116497
git st
#1773116499
git add .
#1773116504
git commit -am 'logs and stuff'
#1773116505
git st
#1773115571
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'| xargs -Ieachrepo rm -vrf 'eachrepo'
#1773115573
man git-clone
#1773115718
echo ${WEZTERM_PANE}}
#1773115945
ll
#1773115948
./fetch-crates.sh 
#1773116517
ll
#1773116525
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'| xargs -Ieachrepo rm -vrf 'eachrepo'
#1773116529
ll
#1773116531
ll colorloom/
#1773116538
bash fetch-crates.sh 
#1773116738
ll
#1773116743
ll tree-sitter-pest
#1773116750
bat tree-sitter-pest/http.stderr.log 
#1773117151
find . -name '*.deps.json'
#1773117160
find . -mindepth 2 -name '*.deps.json'
#1773117162
find . -mindepth 3 -name '*.deps.json'
#1773117163
find . -mindepth 2 -name '*.deps.json'
#1773117167
find . -mindepth 2 -maxdepth 2 -name '*.deps.json'
#1773117303
jq '.crate ' colorloom/colorloom.deps.json 
#1773117308
jq '.crate.id ' colorloom/colorloom.deps.json 
#1773117316
jq '.crate.id ' */*.deps.json 
#1773117318
jq -r '.crate.id ' */*.deps.json 
#1773117371
bash fetch-crates.sh 
#1773117388
cls;bash fetch-crates.sh 
#1773117391
cls;bash fetch-crates.sh 
#1773117411
cls;bash fetch-crates.sh 
#1773117436
cls;bash fetch-crates.sh 
#1773117466
cls;bash fetch-crates.sh 
#1773117483
cls;bash fetch-crates.sh 
#1773117502
cls;bash fetch-crates.sh 
#1773117542
cls;bash fetch-crates.sh 
#1773117551
cls;bash fetch-crates.sh 
#1773117587
cls;bash fetch-crates.sh 
#1773117595
cls;bash fetch-crates.sh 
#1773117621
cls;bash fetch-crates.sh 
#1773117633
cls;bash fetch-crates.sh 
#1773117669
cls;bash fetch-crates.sh 
#1773117702
cls;bash fetch-crates.sh 
#1773117778
cls;bash fetch-crates.sh 
#1773117843
cls;bash fetch-crates.sh 
#1773117858
cls;bash fetch-crates.sh 
#1773117867
cls;bash fetch-crates.sh 
#1773118017
cls;bash fetch-crates.sh 
#1773118048
cls;bash fetch-crates.sh 
#1773118070
cls;bash fetch-crates.sh 
#1773118088
cls;bash fetch-crates.sh 
#1773118111
cls;bash fetch-crates.sh 
#1773118415
cls;bash fetch-crates.sh 
#1773118462
cls;bash fetch-crates.sh 
#1773118480
cls;bash fetch-crates.sh 
#1773118541
cls;bash fetch-crates.sh 
#1773118571
cls;bash fetch-crates.sh 
#1773118591
cls;bash fetch-crates.sh 
#1773118607
cls;bash fetch-crates.sh 
#1773118615
cls;bash fetch-crates.sh 
#1773118620
cls;bash fetch-crates.sh 
#1773118627
cls;bash fetch-crates.sh 
#1773118642
cls;bash fetch-crates.sh 
#1773118645
cls;bash fetch-crates.sh 
#1773118697
cls;bash fetch-crates.sh 
#1773118804
cls;bash fetch-crates.sh 
#1773118912
cls;bash fetch-crates.sh 
#1773118919
cls;bash fetch-crates.sh 
#1773118928
cls;bash fetch-crates.sh 
#1773118975
cls;bash fetch-crates.sh 
#1773118984
git st
#1773118985
ll
#1773118999
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'| xargs -Ieachrepo rm -vrf 'eachrepo'
#1773119004
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'
#1773119011
find .  -mindepth 2 -maxdepth 2 -name '*-repo' -type d
#1773119018
find .  -mindepth 2 -maxdepth 2 -name '.git' -type d
#1773119022
find .  -mindepth 2  -name '.git' -type d
#1773119028
find .  -mindepth 2 -maxdepth 3 -name '*-repo' -type d
#1773119033
find .  -mindepth 1 -maxdepth 5 -name '*-repo' -type d
#1773119056
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '*[_-]repo' -type d
#1773119064
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d
#1773119077
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119079
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d
#1773119082
ll
#1773119087
find .  -mindepth 2  -name '.git' -type d
#1773119090
dua
#1773119093
ll tree-sitter
#1773119122
find . -regextype egrep -regex '.*http.std(out|err)[.]log'
#1773119125
find . -regextype egrep -regex '.*http.std(out|err)[.]log' -delete
#1773119127
git st
#1773119132
git add .
#1773119135
cls;bash fetch-crates.sh 
#1773119206
cls;bash fetch-crates.sh 
#1773119228
cls;bash fetch-crates.sh 
#1773119236
cls;bash fetch-crates.sh 
#1773119279
cls;bash fetch-crates.sh 
#1773119292
cls;bash fetch-crates.sh 
#1773119370
cls;bash fetch-crates.sh 
#1773119419
cls;bash fetch-crates.sh 
#1773119427
cls;bash fetch-crates.sh 
#1773119450
cls;bash fetch-crates.sh 
#1773119476
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119483
find . -regextype egrep -regex '.*http.std(out|err)[.]log' -delete
#1773119489
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119505
which xargs
#1773119516
rm ~/.cargo/bin/xargs
#1773119519
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119532
find . -type d -mindepth 2 -maxdepth 2 -name '*-repo'| xargs -Ieachrepo rm -vrf 'eachrepo'
#1773119542
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119554
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*[_-]repo' -type d | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119558
find .  -mindepth 2  -name '.git' -type d
#1773119564
dua
#1773119605
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*([_-]repo|[.git])[/]?' | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119628
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*([_-]repo|[.git]|std(err|out).*)' | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119632
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*([_-]repo|[.git]|std(err|out).*).*' | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773119641
git st
#1773119656
git restore  .
#1773119656
git st
#1773119663
cls;bash fetch-crates.sh 
#1773119684
cls;bash fetch-crates.sh 
#1773119737
cls;bash fetch-crates.sh 
#1773119773
cls;bash fetch-crates.sh 
#1773119814
cls;bash fetch-crates.sh 
#1773119862
jq '.crate.repository' tree-sitter-pest/tree-sitter-pest.deps.json 
#1773119883
cls;bash fetch-crates.sh 
#1773119985
cls;bash fetch-crates.sh 
#1773120075
cls;bash fetch-crates.sh 
#1773120102
cls;bash fetch-crates.sh 
#1773120118
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*([_-]repo|[.git]|std(err|out).*).*' | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773120125
git st
#1773120130
git restore  .
#1773120135
git st
#1773120136
git q
#1773120139
cls;bash fetch-crates.sh 
#1773120158
cls;bash fetch-crates.sh 
#1773120301
find . -regextype egrep -regex 
#1773120307
find . -regextype egrep -regex '.*repo'
#1773120312
find . -regextype egrep -regex '.*git__repo'
#1773120316
find . -regextype egrep -regex '.*git_repo'
#1773120321
find . -regextype egrep -regex '.*git_repo' -exec ls {} \;
#1773120367
find . -regextype egrep -regex '.*git_repo' -exec bash -c -l 'set -umeTE;set -o pipefail; set +f;
set -x
cargo build --all-features;
cargo doc --all-features;
cargo test --all-features;
cargo run --all-features;
'
#1773120466
find . -regextype egrep -regex '.*git_repo' -exec bash -c -l 'set -umeTE;set -o pipefail; set +f;
set -x
cargo cbt -docs --run -q -i || true
cargo build --all-features || true;
cargo doc --all-features || true;
cargo test --all-features || true;
cargo run --all-features;
'
#1773120521
find . -regextype egrep -regex '.*git_repo' -exec bash -c -l 'set -umeTE;set -o pipefail; set +f;
set -x
cd "{}";
cargo cbt -docs --run -q -i || true
cargo build --all-features || true;
cargo doc --all-features || true;
cargo test --all-features || true;
cargo run --all-features;
' \;
#1773120536
find . -regextype egrep -regex '.*git_repo' -exec bash -c -l 'set -umeTE;set -o pipefail; set +f;
set -x
cd "{}";
exit 2; cargo cbt -docs --run -q -i || true
cargo build --all-features || true;
cargo doc --all-features || true;
cargo test --all-features || true;
cargo run --all-features;
' \;
#1773120544
find . -regextype egrep -regex '.*git_repo' -exec bash -c  'set -umeTE;set -o pipefail; set +f;
set -x
cd "{}";
exit 2; cargo cbt -docs --run -q -i || true
cargo build --all-features || true;
cargo doc --all-features || true;
cargo test --all-features || true;
cargo run --all-features;
' \;
#1773120575
find . -regextype egrep -regex '.*git_repo' -exec bash -c  'set -umeTE;set -o pipefail; set +f;
main() {
set -x
cd "{}";
cargo cbt -docs --run -q -i || true
cargo build --all-features || true;
cargo doc --all-features || true;
cargo test --all-features || true;
cargo run --all-features;
}

main &
disown -a
' \;
#1773119696
cd ls /Users/gabrielfalcao/workbench/2026-03-10/tree-sitter/pepegsitter/pepegsitter__git_repo
#1773119698
ls /Users/gabrielfalcao/workbench/2026-03-10/tree-sitter/pepegsitter/pepegsitter__git_repo
#1773119700
ll /Users/gabrielfalcao/workbench/2026-03-10/tree-sitter/pepegsitter/pepegsitter__git_repo
#1773119704
dua /Users/gabrielfalcao/workbench/2026-03-10/tree-sitter/pepegsitter/pepegsitter__git_repo
#1773119705
dua /Users/gabrielfalcao/workbench/2026-03-10/tree-sitter/pepegsitter/pepegsitter__git_repo
#1773120372
st
#1773120610
ps aux | psgrep cargo
#1773120617
ps aux | psgrep '(bash|cargo)'
#1773120632
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid ps aux eachpid
#1773120656
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid ps axo ppid,pid,args eachpid
#1773120731
ll
#1773120735
cd ./tree-sitter/
#1773120736
ls
#1773120771
emc hist.hist 
#1773120818
rm hist.hist 
#1773121296
bash each-build.sh 
#1773121372
git st
#1773121374
git add *.sh
#1773121410
path canon each-build.sh | pbcopy 
#1773121544
ll
#1773121545
ll colorloom/
#1773121548
ll colorloom/colorloom__git_repo/
#1773122158
git st
#1773122160
git add git-clone.sh 
#1773122161
git q
#1773122271
find . -name .gitmodules
#1773122278
ll ./pepegsitter/pepegsitter__git_repo/
#1773122290
bat ./pepegsitter/pepegsitter__git_repo/.gitmodules
#1773122348
./fetch-crates.sh 
#1773122361
find .  -mindepth 2 -maxdepth 3 -regextype egrep -regex '.*([_-]repo|[.git]|std(err|out).*).*' | xargs -Ieachrepo rm -rfv 'eachrepo'
#1773122368
dua
#1773122370
git st
#1773122374
git restore .
#1773122375
git st
#1773122379
git st
#1773122382
git st
#1773122384
git diff
#1773122387
git commit fetch-crates.sh -m fetch-crates.sh 
#1773122397
cls;./fetch-crates.sh 
#1773122963
st
#1773122971
df -h /
#1773122988
df -h | gawk '
BEGIN {
IGNORECASE=1;
}
'
#1773123308
cd ~/opt/libexec/
#1773123308
git st
#1773123318
git add diskstats*
#1773123319
git st
#1773123330
git commit diskstats* -m diskstats
#1773123359
df
#1773124176
diskstats
#1773124186
diskstats
#1773124192
diskstats
#1773124219
diskstats
#1773124247
diskstats
#1773124257
diskstats
#1773124630
diskstats
#1773124698
gawk -v foobar='12gb' 'BEGIN { printf("foobar=%s\n", foobar) }'
#1773124704
gawk -v foobar='12gb' 'BEGIN { 
printf("foobar=%s\n", foobar);
printf("foobar_value=%s\n", strtonum(foobar));
}
'
#1773124784
diskstats
#1773124803
diskstats
#1773124821
diskstats
#1773124852
diskstats
#1773124863
diskstats
#1773124884
diskstats
#1773124896
which -a df
#1773124904
/bin/df -h
#1773124911
/bin/df | diskstats.gawk 
#1773124921
gdf | diskstats.gawk 
#1773124923
gdf
#1773124928
cls;gdf
#1773124964
cls;gdf
#1773124970
cls;gdf | diskstats.gawk 
#1773124978
cls;gdf | diskstats.gawk 
#1773124990
cls;gdf | diskstats.gawk 
#1773125032
cls;gdf | diskstats.gawk 
#1773125048
cls;gdf | diskstats.gawk 
#1773125054
cls;gdf | diskstats.gawk 
#1773125067
cls;gdf -h | diskstats.gawk 
#1773125073
cls;gdf | diskstats.gawk 
#1773125075
cls;gdf -h | diskstats.gawk 
#1773125131
cls;gdf -h | diskstats.gawk 
#1773125225
cls;gdf -h | diskstats.gawk 
#1773125233
cls;df -h | diskstats.gawk 
#1773125235
cls;df | diskstats.gawk 
#1773125240
cls;/bin/df  | diskstats.gawk 
#1773125243
cls;/bin/df -h  | diskstats.gawk 
#1773125292
cls;/bin/df -h  | diskstats.gawk 
#1773125323
cls;/bin/df -h  | diskstats.gawk 
#1773125363
cls;/bin/df -h #  | diskstats.gawk 
#1773125445
cls;/bin/df -h  | diskstats.gawk 
#1773125451
cls;/bin/df -h  | diskstats.gawk 
#1773125461
cls;/bin/df -h  | diskstats.gawk 
#1773126001
gawk -v foobar=123 'BEGIN { printf("foobar=%s (%s)\n", foobar, typeof(foobar)); }'
#1773126017
gawk -v foobar=123 'BEGIN { printf("foobar=%s (%s)\n", strtonum(foobar), typeof(strtonum(foobar))); }'
#1773126026
gawk -v foobar=123.32 'BEGIN { printf("foobar=%s (%s)\n", strtonum(foobar), typeof(strtonum(foobar))); }'
#1773126248
/bin/df 
#1773126250
/bin/df -h
#1773126254
/bin/df 
#1773126455
df -BB
#1773126505
df -B 1024
#1773126509
df -B 100
#1773126511
df -B 1
#1773126522
gdf 
#1773126525
/bin/df 
#1773126529
/bin/df -B 1
#1773126534
/bin/df -BK
#1773126540
/bin/df --block-size G
#1773126546
man df
#1773126619
gdf -B 1
#1773126623
gdf --block-size 1
#1773126630
export BLOCK_SIZE=1
#1773126631
gdf
#1773126634
/bin/df
#1773126643
export BLOCKSIZE=1
#1773126645
/bin/df
#1773126654
export BLOCKSIZE=1024
#1773126655
/bin/df
#1773126718
unset BLOCK_SIZE 
#1773126721
/bin/df
#1773126725
gdf
#1773126979
diskstats
#1773126987
diskstats
#1773126992
diskstats
#1773127001
diskstats
#1773127011
unset BLOCKSIZE 
#1773127015
export BLOCKSIZE=512
#1773127017
diskstats
#1773127076
diskstats
#1773127082
export BLOCKSIZE=G
#1773127084
diskstats
#1773127102
diskstats
#1773127115
man gdf
#1773127184
diskstats
#1773133883
ord ';; →'
#1773133912
ll
#1773133913
git st
#1773133923
git add *.log
#1773133924
git st
#1773133972
git status --porcelain  | gawk '($1 ~ /[?]/) { print $NF }'
#1773133990
git status --porcelain  | gawk '(($1 ~ /[?]/) && ($NF ~ /[.]log$/)) { print $NF }'
#1773134001
git status --porcelain  | gawk '(($1 ~ /[?]/) && ($NF ~ /[.]log$/)) { print $NF }' | xargs -Ieachlog git add -f 'eachlog'
#1773134002
git st
#1773134006
git commit -m logs
#1773134012
git st
#1773134014
git add .
#1773134015
git st
#1773134020
git commit hackernews.tmp.js.el 
#1773134025
git commit -m hackernews.tmp.js.el 
#1773134032
git st
#1773134037
git commit -am hackernews.tmp.js.el 
#1773120667
ps aux 525
#1773120676
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid ps axo ppid,pid,args eachpid
#1773120682
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid ps aux eachpid
#1773120689
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid lsof -p eachpid
#1773120707
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid ps aux eachpid
#1773120718
ps aux | psgrep '(bash|cargo)' | xargs -Ieachpid kill -9 eachpid
#1773131473
echo "$(echo;pbpaste;echo)" > hackernews.js
#1773131474
emc hackernews.js
#1773131480
node
#1773131598
git st
#1773131600
gti add hackernews.js 
#1773131607
git st
#1773131614
git add **/*.log
#1773131617
git sst
#1773131618
git st
#1773131623
git status --porcelain 
#1773131631
git status --porcelain  | grep -E '[.]log$'
#1773131646
git status --porcelain  | grep -E '[.]log$' | lastcol | xargs -Ieachlog git add 'eachlog'
#1773131647
git st
#1773131649
git commit -m logs
#1773131650
git st
#1773131652
git add .
#1773131656
git commit -am hackernews.js 
#1773132862
node
#1773135521
emc entriees.js 
#1773135542
git t
#1773135543
git st
#1773135546
git q
#1773135652
node entriees.js 
#1773135879
node entriees.js 
#1773135951
node entriees.js 
#1773135980
node entriees.js 
#1773136040
node entriees.js 
#1773136059
node entriees.js 
#1773136120
node entriees.js 
#1773136136
node entriees.js 
#1773136191
node entriees.js 
#1773136263
node
#1773136609
node entriees.js 
#1773136817
node
#1773136899
node entriees.js 
#1773136931
node entriees.js 
#1773136966
node entriees.js 
#1773136997
node entriees.js 
#1773137026
node entriees.js 
#1773137060
node entriees.js 
#1773137309
node entriees.js 
#1773137316
node hackernews.tmp.js
#1773138556
git st
#1773138558
git add .
#1773138559
git q
#1773138579
pandoc -f html -i attr.props.html -t json attr.props.json
#1773138586
pandoc -f html -i attr.props.html -t json -o attr.props.json
#1773138588
bat attr.props.json
#1773138592
jq . attr.props.json
#1773138597
jq '.| keys' attr.props.json
#1773138602
jq '.blocks| keys' attr.props.json
#1773138606
jq '.blocks[]| keys' attr.props.json
#1773138612
jq '.blocks[]| .c' attr.props.json
#1773138618
rm attr.props.json
#1773138632
css-select-file 
#1773138635
css-select-file --help
#1773138651
css-select-file -f attr.props.html 
#1773138655
css-select-file -f attr.props.html '*'
#1773139230
cdmkd ./third_party
#1773139263
nohup git clone --quiet --depth=1 https://github.com/vorot93/node2object.git &
#1773139268
nohup git clone --quiet --depth=1 https://github.com/vorot93/node2object.git &h
#1773139701
cd
#1773139706
cd tools/
#1773139709
ll
#1773139278
du
#1773139279
dua
#1773139292
git clone --depth=1 git@github.com:tafia/quick-xml.git
#1773139371
git clone --depth=1 https://gitlab.com/xmpp-rs/xmpp-rs.git
#1773139387
ln -s ./xmpp-rs/minidom ./minidom
#1773139390
ll
#1773139403
cd ./minidom
#1773139440
cargo build; cargo run --example
#1773139773
pwd
#1773139777
cd quick-css-select/
#1773139781
cargo deps list
#1773139934
cd
#1773139936
cd xml-to-json/
#1773139957
cargo add quick-xml -F document-features,encoding,encoding_rs,escape-html,overlapped-lists,serde,serde-types,serialize
#1773139961
git st
#1773139962
git add .
#1773139964
cargo run
#1773139981
emc src/main.rs 
#1773140123
cargo run
#1773140130
cargo run
#1773140145
cargo run
#1773140156
cargo run
#1773140161
cargo run
#1773139404
cd ./quick-xml/
#1773139439
cargo build; cargo run --example
#1773140183
cp /Users/gabrielfalcao/workbench/2026-03-10/attr.props.html .
#1773140189
cargo run -- attr.props.html attr.props.json
#1773140205
cargo run -- attr.props.html attr.props.json
#1773140417
cargo run
#1773140421
cargo run -- attr.props.html attr.props.json
#1773140438
cargo doc --open
#1773140449
st
#1773140464
rm -rf target/
#1773140470
cargo doc --open
#1773143738
ll
#1773143739
git st
#1773143741
git add .
#1773143744
> test.sh
#1773143746
emc test.sh
#1773143817
mkdir tests
#1773143820
mv attr.props.html test
#1773143826
mv test tests/attr.props.html 
#1773143828
git add .
#1773143829
git st
#1773144396
bash test.sh 
#1773144420
bash test.sh 
#1773144437
bash test.sh 
#1773144461
bash test.sh 
#1773144561
bash test.sh 
#1773144568
bash test.sh 
#1773144641
bash test.sh 
#1773144653
bash test.sh 
#1773144658
bash test.sh 
#1773144715
bash test.sh 
#1773144735
bash test.sh 
#1773144761
bash test.sh 
#1773144930
bash test.sh 
#1773144958
bash test.sh 
#1773144969
bash test.sh 
#1773145018
./target/debug/xml-to-json 
#1773145030
cls;./target/debug/xml-to-json tests/attr.props.html tests/attr.props.json
#1773145037
git add .
#1773145125
./test.sh 
#1773145140
./test.sh 
#1773145155
./test.sh 
#1773145161
./test.sh 
#1773145241
./test.sh 
#1773145313
./test.sh 
#1773145332
./test.sh 
#1773145336
./test.sh 
#1773145362
./test.sh 
#1773145372
./test.sh 
#1773145379
./test.sh 
#1773145394
git st
#1773145396
git add .
#1773145400
git commit -am wip/poc
#1773140229
declare -a examples=(     custom_entities     flattened_enum     nested_readers     read_buffered     read_nodes     read_nodes_serde     read_texts )
#1773140239
for name in ${examples[@]}; do cargo run --example ${name}; done
#1773139409
cd ./node2object/
#1773139438
cargo build; cargo run --example 
#1773145407
cd
#1773145408
cd xml-to-json/
#1773145418
path canon . | head -1 | pbcopy 
#1773145421
cd -
#1773139600
cd ..
#1773139602
cd ..
#1773139611
git clone --depth=1 https://github.com/parsanol/parsanol-rs.git
#1773139624
git clone --depth=1 https://github.com/navicore/flag-rs.git
#1773139641
git clone --depth=1 https://github.com/sebastienrousseau/rlg.git
#1773140265
cd ./minidom
#1773140265
ll
#1773140272
cargo run --example
#1773140274
cargo run --example articles
#1773140278
emc examples/articles.rs 
#1773145426
cd ..
#1773145428
cd ..
#1773145446
ln -s /Users/gabrielfalcao/projects/work/poems.codes/tools/xml-to-json $(pwd)/xml-to-json
#1773145447
ll
#1773145449
git st
#1773145462
git st
#1773145467
git status --porcelain  | grep -E '[.]log$' | lastcol | xargs -Ieachlog git add 'eachlog'
#1773145723
man git
#1773145732
man git-commit
#1773145766
man git-commit
#1773145846
git st
#1773145855
workbench-commit-logs 
#1773145863
workbench-commit-logs 
#1773145870
unset TZ
#1773145871
workbench-commit-logs 
#1773145925
workbench-commit-logs 
#1773145928
git log
#1773145951
git st
#1773145965
find . -type d -name .git -exec path parent {} \;
#1773145988
find . -type d -name .git -exec dirname {} \;
#1773145995
find . -mindepth 1 -type d -name .git -exec dirname {} \;
#1773145998
find . -mindepth 2 -type d -name .git -exec dirname {} \;
#1773146011
echo >> .gitignore 
#1773146011
git st
#1773146014
git add .gitignore 
#1773146020
find . -mindepth 2 -type d -name .git -exec dirname {} \; >> .gitignore
#1773146022
git st
#1773146025
git add .gitignore 
#1773146026
git st
#1773146040
find . -type l
#1773146057
find .  -mindepth 1 -type l
#1773146086
echo -e "\n# symlinks\n" >> .gitignore 
#1773146091
find .  -mindepth 1 -type l >> .gitignore
#1773146093
git st
#1773146096
git add .gitignore 
#1773146096
git st
#1773146104
emc .gitignore 
#1773146117
git path
#1773146130
git st
#1773146131
git add .
#1773146132
git st
#1773146140
git q
#1773146141
git st
#1773146144
git st
#1773146168
git st
#1773146173
dua
#1773146179
cd ./tree-sitter/
#1773146180
dua i
#1773146192
find-dev-artifacts-rust 
#1773146204
find-dev-artifacts-rust | xargs -Ieachpath rm -rf 'eachpath'
#1773146214
dua i
#1773146237
mkdir  ../parser-generators
#1773146243
find . -mindepth 1 -maxdepth 1 -type d
#1773146280
find . -mindepth 1 -maxdepth 1 -type d -regextype egrep -not -regex '.*tree([_.-])?sitter'
#1773146286
find . -mindepth 1 -maxdepth 1 -type d -regextype egrep -not -regex '.*tree([_.-])?sitter.*'
#1773146308
find . -mindepth 1 -maxdepth 1 -type d -regextype egrep -not -regex '.*tree([_.-])?sitter.*' -exec mv -fv {} ../parser-generators/ \;
#1773146309
git st
#1773146312
cd ..
#1773146313
git st
#1773146329
git st
#1773146350
git st
#1773146352
git add .
#1773146353
git st
#1773146355
git q
#1773146358
cd ./tree-sitter/
#1773146358
ll
#1773146369
cd ./tree-sitter
#1773146369
ll
#1773146372
cd ./tree-sitter__git_repo/
#1773146372
ll
#1773146398
find . -regextype egrep -regex '.*/example[s]?'
#1773146404
find . -regextype egrep -regex '.*/example[s]?.*'
#1773146411
find . -regextype egrep -regex '.*example[s]?.*'
#1773146436
bat .github/workflows/ci.yml 
#1773146441
ll
#1773146443
bat Makefile 
#1773146444
make
#1773146455
ll
#1773146503
ll
#1773146509
cd ..
#1773146510
ll
#1773146513
cd ./tty-raycast-shader/
#1773146514
ll
#1773146655
ll
#1773147420
git st
#1773147421
git add .
#1773147422
git st
#1773147423
git q
#1773147461
cp github-urls.txt ../ascii-renderers.urls.txt
#1773147816
git st
#1773147820
git add .
#1773147821
git q
#1773147826
rm github-urls.txt 
#1773147830
git restore github-urls.txt
#1773147830
git st
#1773147846
bat github-urls.txt 
#1773147870
git st
#1773147872
git diff
#1773147874
git add .
#1773147877
git q
#1773147899
git commit --amend -m 'removes tree-sitter* and awesome-tuis from github-urls.sh'
#1773147901
git whatchanged -p
#1773148133
ll
#1773148242
man curl
#1773148609
git st
#1773148610
git add .
#1773148612
bash github-urls.sh 
#1773148639
bash github-urls.sh 
#1773148765
bash github-urls.sh 
#1773148784
bash github-urls.sh 
#1773148797
bash github-urls.sh 
#1773148817
bash github-urls.sh 
#1773148913
bash github-urls.sh 
#1773148920
bash github-urls.sh 
#1773148929
bash github-urls.sh 
#1773148935
bash github-urls.sh 
#1773148960
bash github-urls.sh 
#1773149026
ll .git
#1773149033
ll $(git path)
#1773149036
ll $(git path)/.git
#1773149050
bat $(git path)/.git/{HEAD,index}
#1773149121
git branches
#1773149123
git branche
#1773149124
git branch
#1773149131
git branch --format=%n
#1773149132
git branch --format=%N
#1773149134
git branch --format=%r
#1773139713
cd ..
#1773139723
ack --toml 'css-select'
#1773139730
cd quick-css-select/
#1773139734
cargo deps list
#1773149201
git branch --format='%(objectname)'
#1773149208
git branch --format='%(refname)'
#1773149241
git branch --format='%(refname) %(upstream)'
#1773149251
dua
#1773149268
cd ../tree-sitter/tree-sitter-bash/
#1773149139
man git-branch
#1773149147
man git-for-each-ref
#1773149194
man git-for-each-ref
#1773149316
man -w git-for-each-ref .
#1773149326
ll
#1773149335
cp $(man -w git-for-each-ref) .
#1773149355
pandoc -f man -i git-for-each-ref.1 -o git-for-each-ref.rst
#1773149356
pandoc -f man -i git-for-each-ref.1 -o git-for-each-ref.md
#1773149359
pandoc -f man -i git-for-each-ref.1 -o git-for-each-ref.html
#1773149368
bat git-for-each-ref.html
#1773149374
prettier -w git-for-each-ref.html
#1773149377
bat git-for-each-ref.html
#1773149398
bat git-for-each-ref.html
#1773149540
sed -z -n -E 's/((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*))/\4/gp' git-for-each-ref.html 
#1773149554
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),\4,gp' git-for-each-ref.html 
#1773149569
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+?(<h1>.*)),\4,gp' git-for-each-ref.html 
#1773149571
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),\4,gp' git-for-each-ref.html 
#1773149808
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),
\\0=\0\n\\1=\1\n\\2=\2\n\\3=\3\n\\4=\4\n\\5=\5\n\\6=\6\n\\7=\7\n\\8=\8\n\\9=\9\n\\n,gp' git-for-each-ref.html 
#1773149823
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),\\0=\0\n\\1=\1\n\\2=\2\n\\3=\3\n\\4=\4\n\\5=\5\n\\6=\6\n\\7=\7\n\\8=\8\n\\9=\9\n\\n,gp' git-for-each-ref.html 
#1773149831
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),\\0=\0\n\\1=\1\n\\2=\2\n\\3=\3\n\\4=\4\n\\5=\5\n\\6=\6\n\\7=\7\n\\8=\8\n,gp' git-for-each-ref.html 
#1773149860
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),\\0=\0\n\\1=\1\n\\2=\2\n\\3=\3\n\\4=\4\n\\5=\5\n\\6=\6\n,gp' git-for-each-ref.html 
#1773149891
sed-genrep-debug-groups | pbcopy 
#1773149906
sed -z -n -E 's,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),<0>\\0=\0</0>\n<1>\\1=\1</1>\n<2>\\2=\2</2>\n<3>\\3=\3</3>\n<4>\\4=\4</4>\n<5>\\5=\5</5>\n<6>\\6=\6</6>\n,gp' git-for-each-ref.html 
#1773149986
unset HISTIGNORE 
#1773150004
cls;sed -z -n -E "s,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),$(sed-genrep-debug-groups),gp" git-for-each-ref.html 
#1773150011
sed-genrep-debug-groups 
#1773150015
sed-genrep-debug-groups ;echo
#1773150034
cls;sed -z -n -E "s,((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),$(sed-genrep-debug-groups),gp" git-for-each-ref.html 
#1773150052
cls;sed -z -n -E "s,^((.*)[\n]+)([<]h1[>]FIELD\s+NAMES</h1>(.*?))([\n]+(<h1>.*)),$(sed-genrep-debug-groups),gp" git-for-each-ref.html 
#1773150352
git st
#1773150356
git add workbench-*
#1773150362
git restore sed-genrep-debug-groups 
#1773150363
git st
#1773150497
pandoc --list-output-formats
#1773150503
pandoc --list-output-formats | ack mark
#1773150074
> get-man-entries.sh
#1773150076
emc get-man-entries.sh 
#1773150151
ll
#1773150350
wezterm cli spawn --new-window --cwd ~/opt/libexec/
#1773150882
bash get-man-entries.sh 
#1773151303
git st
#1773151317
git add get-man-entries.sh
#1773151326
mkdir -p ../manpages
#1773151331
mv git-for-each-ref.* ../manpages
#1773151335
mv get-man-entries.sh ../manpages/
#1773151337
cd ..
#1773151338
git st
#1773151343
workbench-commit-logs 
#1773151344
git st
#1773151352
git add manpages/ tty-raycast-shader
#1773151353
git st
#1773151357
git add .
#1773151384
git commit -am 'manpages for git-for-each-ref and urls related to ascii renderers/shaders'
#1773151385
git st
#1773151388
cd ./manpages/
#1773151480
git st
#1773151483
cd ..
#1773151483
git st
#1773151490
mv tty-raycast-shader/get-man-entries.sh manpages/
#1773151491
git st
#1773151498
git st
#1773151499
git diff
#1773151501
git q
#1773151599
git status --show-stash 
#1773151606
cd
#1773151609
cd .shell.d/
#1773151611
git stash list
#1773151615
git status --show-stash 
#1773151648
git status --show-stash  --porcelain 
#1773151671
popd
#1773151679
pwd
#1773151681
cd ../../
#1773151724
mkpushd "$(pwd)/__sandbox__/git-status-porcelain-test-repos/"
#1773151729
> genrepos.sh
#1773151731
emc genrepos.sh
#1773152086
bash -c '
exec 2>deleteme.stderr.tmp 1>deleteme.stdout.tmp
touch foobar.{1..9}
rm -f foobar.1 &
disown -a
rm -f foobar.4 & 
disown -h $!
disown $!
rm -fv foobar.* &
disown -a
'
#1773152210
ll
#1773152220
bat deleteme.std*
#1773152328
bash -c '
exec 2>deleteme.stderr.tmp 1>&5
export BASH_XTRACEFD=5
#1773152830
man 7 mdoc
#1773152844
man 7 man
#1773152908
cls;brew help search 
#1773152971
brew search --formulae '/.*(man|find).*(utils?).*/'
#1773152991
brew search --formulae '/.*(man|find)(.*(utils?))?.*/'
#1773153008
brew search --formulae '/.*(man|find)(.*(utils?))?.*/'
#1773153029
cls;brew search --formulae '/.*(utils?)$/'
#1773153075
cls;brew search --formulae '/^[a-z][a-z0-9]+(utils?)$/'
#1773153088
cls;brew search --formulae '/^[a-z][a-z0-9]+(utils?)$/'
#1773153090
cls;brew help search 
#1773153100
cls;brew help search --format=json
#1773153111
cls;brew search --format=json
#1773153144
echo ${!HOMEBREW_*}
#1773153149
cls;declare -p ${!HOMEBREW_*}
#1773153177
cls;brew search --formulae '/^[a-z][a-z0-9]+(utils?)$/'
#1773153188
cls;brew help search --format=json
#1773153192
cls;brew help search
#1773153222
cls;brew search --closed --formulae '/^[a-z][a-z0-9]+(utils?)$/'
#1773153240
cls;brew search --pull-request --closed --formulae '/^[a-z][a-z0-9]+(utils?)$/'
#1773153251
cls;brew search --formulae '/^[a-z][a-z0-9]+(utils?)$/'
#1773153257
cls;brew search --formulae '/^[a-z][a-z0-9]+(utils?)$/' | ansistrip 
#1773153279
pwd
#1773153283
cd ../..
#1773153352
cdmkd ./brewbrew_search/brewbrew_search__formulae/
#1773153394
pbpaste | heck-string --to=kebab 
#1773153402
heck-string --to=kebab "$(pbpaste)"
#1773153407
heck-string --to=snake "$(pbpaste)"
#1773153431
set -x
#1773153436
declare -- brew_command="$(pbpaste)";set +x
#1773153449
echo ${brew_command@Q}
#1773153455
echo "${brew_command}"
#1773153477
sed -E 's/\s+/\n/g' <<< "${brew_command}"
#1773153483
declare -p IFS
#1773153495
declare -a brew_command_parts=( $(sed -E 's/\s+/\n/g' <<< "${brew_command}") )
#1773153505
declare -p brew_command_parts
#1773153530
for part in ${brew_command_parts[@]}; do if [[ "${part}" =~ ^[a-zA-Z0-9_-]+$  ]]; then 1>&2 echo; 1>&2 echo "${BASH_REMATCH[@]@Q}"; 1>&@ declare -p BASH_REMATCH; 1>&2 echo; 1>&2 echo;
heck-string --to=snake <<< "${part}"; else
heck-string --to=kebab <<< "${part}"; done
#1773153650
for part in ${brew_command_parts[@]}; do if [[ "${part}" =~ ^[a-zA-Z0-9_-]+$  ]]; then 1>&2 echo; 1>&2 echo "${BASH_REMATCH[@]@Q}"; 1>&@ declare -p BASH_REMATCH; 1>&2 echo; 1>&2 echo;
heck-string --to=snake <<< "${part}"; else
heck-string --to=kebab <<< "${part}"; fi; done
#1773153676
for part in ${brew_command_parts[@]}; do if [[ "${part}" =~ ^[a-zA-Z0-9_-]+$  ]]; then 1>&2 echo; 1>&2 echo "${BASH_REMATCH[@]@Q}"; 1>&@ declare -p BASH_REMATCH; 1>&2 echo; 1>&2 echo; heck-string --to=snake "${part}"; else heck-string --to=kebab "${part}"; fi; done
#1773153702
for part_raw in ${brew_command_parts[@]}; do  part="${part_raw//-/[-]}"; if [[ "${part}" =~ ^[a-zA-Z0-9_-]+$  ]]; then 1>&2 echo; 1>&2 echo "${BASH_REMATCH[@]@Q}"; 1>&@ declare -p BASH_REMATCH; 1>&2 echo; 1>&2 echo; heck-string --to=snake "${part}"; else heck-string --to=kebab "${part}"; fi; done
#1773153734
for part_raw in ${brew_command_parts[@]}; do  part="${part_raw//-/[_]}"; if [[ "${part}" =~ ^[a-zA-Z0-9_-]+$  ]]; then 1>&2 echo; 1>&2 echo "${BASH_REMATCH[@]@Q}"; 1>&@ declare -p BASH_REMATCH; 1>&2 echo; 1>&2 echo; heck-string --to=snake "${part}"; else heck-string --to=kebab "${part}"; fi; done
#1773153780
for part_raw in ${brew_command_parts[@]}; do  part="${part_raw//-/[_]}"; if [[ "${part}" =~ ^[a-zA-Z0-9]+$  ]]; then 1>&2 echo; 1>&2 echo "${BASH_REMATCH[@]@Q}"; 1>&@ declare -p BASH_REMATCH; 1>&2 echo; 1>&2 echo; heck-string --to=snake "${part}"; else heck-string --to=kebab "${part}"; fi; done
#1773153800
for part_raw in ${brew_command_parts[@]}; do  part="${part_raw//-/[_]}"; if [[ "${part}" =~ ^[a-zA-Z0-9]+$  ]]; then 
#1773153823
> gen_varname.sh
#1773153825
emc gen_varname.sh
#1773153834
git add .
#1773153835
git st
#1773153841
bat '@'
#1773153849
rm '@'
#1773153853
git add .
#1773153853
git st
#1773153857
git st
#1773153858
git q
#1773154111
bat ~/.emacs.d/c/staging/save-buffer-list-wip.el 
#1773154131
cls;ack save-buffer-list-wip.el ~/.emacs.d/
#1773154432
ack PS1 ~/.shell.d/entrypoint.sh
#1773154437
export PS1='\u@\h:\w\$ '
#1773154457
ps aux | psgrep wezterm
#1773154468
ps aux | psgrep '.*wezterm.*'
#1773154477
ps aux | grep -v grep | ack -i wezterm
#1773154488
ps aux | grep -v grep | ack -i 'wezterm.*send'
#1773154503
ps aux | grep -v grep | ack -i 'wezterm.*send-text' | awk '{ print $2 }'
#1773154509
kill -9 25190
#1773154544
/Applications/WezTerm.app/Contents/MacOS/wezterm-gui --help
#1773154558
/Applications/WezTerm.app/Contents/MacOS/wezterm --help
#1773154563
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm --help
#1773154574
cls() { 1>&2 echo -en '\x1b[2J\x1b[3J\x1b[H'; }
#1773154597
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm --help
#1773154612
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm record --help
#1773154618
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm --help
#1773154628
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm show-keys --help
#1773154635
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm show-keys 
#1773154639
cls;/Applications/WezTerm.app/Contents/MacOS/wezterm show-keys  --lua
#1773154655
ll ~/.wezterm.lua 
#1773154660
ls -altrh ~/.wezterm.lua 
#1773154672
ack PS1 ~/.shell.d/entrypoint.sh
#1773154678
export PS1='\u@\h:\w\$ '
#1773154683
vim ~/.bashrc.static
#1773154721
~/.shell.d/x.d/ansi-truecolor-tango.sh 
#1773154809
brew --prefix bash
#1773154812
brew --cellar bash
#1773154816
ls -latrh $(brew --cellar bash)
#1773154837
bash
#1773154839
bash --version
#1773154962
env | grep -iE '(TERM|COLOR)'
#1773155459
man 3 strftime
#1773157901
ack -i '(brew|BREW_)' ~/.shell.d/
#1773157905
ack --sh -i '(brew|BREW_)' ~/.shell.d/
#1773157926
ack --sh -i '(brew|(HOME)?BREW[A-Z_]*)' ~/.shell.d/
#1773158011
ack --sh -i '(brew|(HOME)?BREW[A-Z_]*)' ~/.shell.d/
#1773158252
env | grep -E '(COLOR|TERM)'
#1773158277
cd
#1773158283
git path;git status
#1773158317
git commit .bash* -m 'fixing up .bashrc.static'
#1773158324
git add .bash*
#1773158326
git st
#1773158335
git commit -m 'fixing up .bashrc.static et al'
#1773158336
git st
#1773158348
git dh .emacs.d/
#1773158362
git commit .emacs.d/tramp -m  .emacs.d/tramp 
#1773158364
git st
#1773158370
git dh .shell.d/entrypoint.sh
#1773158372
git dh -- .shell.d/entrypoint.sh
#1773158381
git st
#1773158391
git commit .shell.d/entrypoint.sh -m .shell.d/entrypoint.sh 
#1773158392
git st
#1773158407
git commit -am ;5u ~/opt/libexec/*'
#1773158411
git commit -am '~/opt/libexec/*'
#1773158412
git st
#1773158420
cd -
#1773158424
pwd
#1773158427
dira
#1773157383
Emacs-arm64-11 -nw ~/.shell.d/entrypoint.sh
#1773157469
Emacs-arm64-11 -nw ~/.shell.d/entrypoint.sh
#1773158631
declare -F foo
#1773158639
declare -F foo; echo $?
#1773158652
declare -F shell_d_sh_prompt_command; echo $?
#1773158665
2>/dev/null declare -F shellsss_d_sh_prompt_command; echo $?
#1773158676
2>/dev/null declare -F shell_d_sh_prompt_command; echo $?
#1773158680
1>/dev/null 2>/dev/null declare -F shell_d_sh_prompt_command; echo $?
#1773158766
help history
#1773158782
echo ${!HIST*}
#1773158789
cls;declare -p ${!HIST*}
#1773159625
ipython
#1773160213
pwd
#1773160270
echo ${COLORTERM} 
#1773160321
resetps1
#1773157689
unset HISTIGNORE
#1773157696
tput clear | xxd -p
#1773157700
tput clear | hexdump 
#1773157705
tput clear | xxd -c 1 -p
#1773157718
tput clear | xxd -c 1 -p | xargs printf '\\x%s'
#1773157726
tput clear | xxd -c 1 -p | xargs printf '\\x%s';echo
#1773157749
echo -en '\x1b\x5b\x48\x1b\x5b\x32\x4a'
#1773157757
tput clear | xxd -c 1 -p | xargs printf '\\x%s' | pbcopy 
#1773165911
ack 'gnu[.]org' /opt/homebrew/etc/dnsmasq*
#1773165939
cd ~/workbench/2026-03-10/www.gnu.org-invalid-cert
#1773165941
pwd
#1773165942
ll
#1773165942
git st
#1773165961
sudo cp /var/log/dnsmasq.log  /var/log/wifi.log .
#1773165973
sudo chown gabrielfalcao:wheel *.log
#1773165974
git st
#1773165976
git add .
#1773165977
git st
#1773165982
git status --porcelain
#1773166035
workbench-commit-logs 
#1773166037
git st
#1773166043
dua
#1773166074
sudo cp /var/log/dnsmasq.2026-03-* .
#1773166077
git st
#1773166081
sudo chown gabrielfalcao:wheel *.log
#1773166081
git st
#1773166092
git status --porcelain
#1773166123
ll
#1773166125
ls -latrh
#1773166137
mkdir  -p "./logs-2026"
#1773166141
mv dnsmasq.2026-03-* "./logs-2026"
#1773166142
git st
#1773166144
cd ./logs-2026/
#1773166146
slugify-filenames 
#1773166147
git st
#1773166149
ll
#1773166152
ls -latrh
#1773166174
mv path in users-gabrielfalcao-workbench-2026-03-10-www-gnu-org-invalid-cert-logs-2026-dnsmasq-2026-03-*
#1773166185
mv path in $(find . -type f -name '*.log')
#1773166185
do
#1773166195
for path in *.log; do echo mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166241
for path in *.log; do mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166244
git st
#1773166245
ll
#1773166250
alias ll='ls -latrh'
#1773166250
ll
#1773166257
which -a ls
#1773166260
which -a gls
#1773166270
alias ll='/opt/homebrew/Cellar/coreutils/9.5/bin/gls --color -latrh'
#1773166271
ll
#1773166285
chmod a-x *.log
#1773166294
for path in *.log.gz; do mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166298
for path in *.gz; do mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166301
git st
#1773166302
ll
#1773166319
sudo chown -R gabrielfalcal:wheel .
#1773166320
git st
#1773166321
ll
#1773166326
sudo chown -R gabrielfalcao:wheel .
#1773166327
ll
#1773166343
sudo chmod a-x *gz
#1773166344
ll
#1773166362
sudo chmod 640 *gz *log
#1773166363
ll
#1773166372
gunzip *.gz
#1773166374
ll
#1773166388
for dashy in *-log; do mv -f "${dashy}" "${dashy%%-log}.log"; done
#1773166423
ll
#1773166425
git st
#1773166433
cd ..
#1773166437
mv logs-2026/* .
#1773166438
ll
#1773166439
git st
#1773166441
rm -r logs-2026/
#1773166442
ll
#1773166447
workbench-commit-logs 
#1773166449
git st
#1773166465
pwd
#1773166613
ack gnu.org /var/log/dnsmasq.log 
#1773166620
ack gnu.org ./dnsmasq.log 
#1773167363
git st
#1773167365
git add .
#1773167433
workbench-commit-logs 
#1773167434
git st
#1773168682
git st
#1773168700
git git add *.gz
#1773168700
git st
#1773168707
workbench-commit-logs 
#1773168708
git st
#1773168724
workbench-commit-logs 
#1773168725
git st
#1773168730
git add -f ws_col_info_matches_gnu_gnu_https_https_ip_dst_209_51_188_116.pcapng.gz 
#1773168731
git t
#1773168733
workbench-commit-logs 
#1773168734
git st
#1773168778
git st
#1773168779
ll
#1773168792
mkdir -p $(now)
#1773168797
cd ./2026-03-10_18-53-12_UTC/
#1773168798
ll
#1773162532
resetps1
#1773162548
cd ~/workbench/2026-03-10/
#1773162549
git st
#1773162551
git add .
#1773162554
ll
#1773162555
ls -latrh
#1773162595
cp -rfv ../2026-03-09/www.gnu.org-invalid-cert .
#1773162602
pushd ./www.gnu.org-invalid-cert/
#1773162603
ll
#1773162604
git st
#1773162606
git add .
#1773162609
git st
#1773162618
git restored --staged
#1773162620
git restore --staged
#1773162621
git restore --staged .
#1773162622
git t
#1773162623
git st
#1773162657
find . -type f
#1773162734
workbench-commit-logs 
#1773162746
git st
#1773162753
> .init
#1773162755
git add .init
#1773162757
git st
#1773162761
git commit -m .init
#1773162765
git t
#1773162770
workbench-commit-logs 
#1773162821
workbench-commit-logs 
#1773162831
workbench-commit-logs 
#1773162841
workbench-commit-logs 
#1773162880
workbench-commit-logs 
#1773162898
workbench-commit-logs 
#1773162938
workbench-commit-logs 
#1773162943
workbench-commit-logs 
#1773162993
workbench-commit-logs 
#1773163092
workbench-commit-logs 
#1773163096
git status --porcelain
#1773163266
workbench-commit-logs 
#1773163682
workbench-commit-logs 
#1773163793
workbench-commit-logs 
#1773163801
workbench-commit-logs 
#1773163869
workbench-commit-logs 
#1773164002
workbench-commit-logs 
#1773164021
workbench-commit-logs 
#1773164046
workbench-commit-logs 
#1773164075
workbench-commit-logs 
#1773164083
workbench-commit-logs 
#1773164087
workbench-commit-logs 
#1773164094
workbench-commit-logs 
#1773164100
workbench-commit-logs 
#1773164103
workbench-commit-logs 
#1773164489
workbench-commit-logs 
#1773164708
ord /\\
#1773164764
workbench-commit-logs 
#1773164779
workbench-commit-logs 
#1773164787
workbench-commit-logs 
#1773164801
workbench-commit-logs 
#1773164806
workbench-commit-logs 
#1773164821
workbench-commit-logs 
#1773164830
workbench-commit-logs 
#1773164840
workbench-commit-logs 
#1773164861
workbench-commit-logs 
#1773164873
workbench-commit-logs 
#1773164876
workbench-commit-logs 
#1773164904
workbench-commit-logs 
#1773164908
workbench-commit-logs 
#1773164946
workbench-commit-logs 
#1773164988
workbench-commit-logs 
#1773165014
workbench-commit-logs 
#1773165036
workbench-commit-logs 
#1773165045
workbench-commit-logs 
#1773165067
workbench-commit-logs 
#1773165074
workbench-commit-logs 
#1773165080
workbench-commit-logs 
#1773165235
workbench-commit-logs 
#1773165252
workbench-commit-logs 
#1773165260
workbench-commit-logs 
#1773165275
workbench-commit-logs 
#1773165321
workbench-commit-logs 
#1773165330
workbench-commit-logs 
#1773165345
workbench-commit-logs 
#1773165355
workbench-commit-logs 
#1773165417
workbench-commit-logs 
#1773165441
workbench-commit-logs 
#1773165457
workbench-commit-logs 
#1773165465
workbench-commit-logs 
#1773165475
workbench-commit-logs 
#1773165514
workbench-commit-logs 
#1773165527
workbench-commit-logs 
#1773165530
workbench-commit-logs 
#1773165537
workbench-commit-logs 
#1773165558
workbench-commit-logs 
#1773165566
workbench-commit-logs 
#1773165598
workbench-commit-logs 
#1773165607
workbench-commit-logs 
#1773165645
workbench-commit-logs 
#1773165691
workbench-commit-logs 
#1773165818
workbench-commit-logs 
#1773165819
git st
#1773165820
git log
#1773165828
pdw
#1773165829
pwd
#1773165849
Wireshark 
#1773168530
2>wireshark.stderr.log 1>wireshark.stdout.og Wireshark  < /dev/null &
#1773168531
disown -a
#1773168551
which -a traceroute 
#1773168555
man traceroute 
#1773168595
sudo traceroute -e -i en0 209.51.188.116
#1773168627
sudo traceroute -e -i en0 209.51.188.116 | tee $(heck-string --to=snake 'traceroute -e -i en0 209.51.188.116')
#1773157689
unset HISTIGNORE
unset HISTIGNORE
#1773157696
tput clear | xxd -p
#1773157700
tput clear | hexdump 
#1773157705
tput clear | xxd -c 1 -p
#1773157718
tput clear | xxd -c 1 -p | xargs printf '\\x%s'
#1773157726
tput clear | xxd -c 1 -p | xargs printf '\\x%s';echo
#1773157749
echo -en '\x1b\x5b\x48\x1b\x5b\x32\x4a'
#1773157757
tput clear | xxd -c 1 -p | xargs printf '\\x%s' | pbcopy 
#1773165911
ack 'gnu[.]org' /opt/homebrew/etc/dnsmasq*
#1773165939
cd ~/workbench/2026-03-10/www.gnu.org-invalid-cert
#1773165941
pwd
#1773165942
ll
#1773165942
git st
#1773165961
sudo cp /var/log/dnsmasq.log  /var/log/wifi.log .
#1773165973
sudo chown gabrielfalcao:wheel *.log
#1773165974
git st
#1773165976
git add .
#1773165977
git st
#1773165982
git status --porcelain
#1773166035
workbench-commit-logs 
#1773166037
git st
#1773166043
dua
#1773166074
sudo cp /var/log/dnsmasq.2026-03-* .
#1773166077
git st
#1773166081
sudo chown gabrielfalcao:wheel *.log
#1773166081
git st
#1773166092
git status --porcelain
#1773166123
ll
#1773166125
ls -latrh
#1773166137
mkdir  -p "./logs-2026"
#1773166141
mv dnsmasq.2026-03-* "./logs-2026"
#1773166142
git st
#1773166144
cd ./logs-2026/
#1773166146
slugify-filenames 
#1773166147
git st
#1773166149
ll
#1773166152
ls -latrh
#1773166174
mv path in users-gabrielfalcao-workbench-2026-03-10-www-gnu-org-invalid-cert-logs-2026-dnsmasq-2026-03-*
#1773166185
mv path in $(find . -type f -name '*.log')
#1773166185
do
#1773166195
for path in *.log; do echo mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166241
for path in *.log; do mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166244
git st
#1773166245
ll
#1773166250
alias ll='ls -latrh'
#1773166250
ll
#1773166257
which -a ls
#1773166260
which -a gls
#1773166270
alias ll='/opt/homebrew/Cellar/coreutils/9.5/bin/gls --color -latrh'
#1773166271
ll
#1773166285
chmod a-x *.log
#1773166294
for path in *.log.gz; do mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166298
for path in *.gz; do mv -fv "${path}" "${path//*dnsmasq/dnsmasq}"; done
#1773166301
git st
#1773166302
ll
#1773166319
sudo chown -R gabrielfalcal:wheel .
#1773166320
git st
#1773166321
ll
#1773166326
sudo chown -R gabrielfalcao:wheel .
#1773166327
ll
#1773166343
sudo chmod a-x *gz
#1773166344
ll
#1773166362
sudo chmod 640 *gz *log
#1773166363
ll
#1773166372
gunzip *.gz
#1773166374
ll
#1773166388
for dashy in *-log; do mv -f "${dashy}" "${dashy%%-log}.log"; done
#1773166423
ll
#1773166425
git st
#1773166433
cd ..
#1773166437
mv logs-2026/* .
#1773166438
ll
#1773166439
git st
#1773166441
rm -r logs-2026/
#1773166442
ll
#1773166447
workbench-commit-logs 
#1773166449
git st
#1773166465
pwd
#1773166613
ack gnu.org /var/log/dnsmasq.log 
#1773166620
ack gnu.org ./dnsmasq.log 
#1773167363
git st
#1773167365
git add .
#1773167433
workbench-commit-logs 
#1773167434
git st
#1773168682
git st
#1773168700
git git add *.gz
#1773168700
git st
#1773168707
workbench-commit-logs 
#1773168708
git st
#1773168724
workbench-commit-logs 
#1773168725
git st
#1773168730
git add -f ws_col_info_matches_gnu_gnu_https_https_ip_dst_209_51_188_116.pcapng.gz 
#1773168731
git t
#1773168733
workbench-commit-logs 
#1773168734
git st
#1773168778
git st
#1773168779
ll
#1773168792
mkdir -p $(now)
#1773168797
cd ./2026-03-10_18-53-12_UTC/
#1773168798
ll
#1773171615
git st
#1773171659
git st
#1773171669
gzip -9 traceroute_e_i_en0_209_51_188_116
#1773171670
git st
#1773171674
workbench-commit-logs 
#1773171676
git add .
#1773171677
workbench-commit-logs 
#1773171679
git st
#1773171680
git st
#1773174966
cd ~/.shell.d/
#1773174967
git st
#1773174973
git add .
#1773174974
git st
#1773168859
cd ~/workbench/2026-03-10/www.gnu.org-invalid-cert/2026-03-10_18-53-12_UTC/
#1773168860
git st
#1773168861
git add .
#1773168864
ll
#1773168866
ls -latrh
#1773168870
git add -f .
#1773168872
workbench-commit-logs 
#1773168875
git st
#1773168877
cd ..
#1773168878
cd ..
#1773168880
git status
#1773168908
ll
#1773168909
ls -latrh
#1773168912
git st
#1773168916
cd ./www.gnu.org-invalid-cert/
#1773168916
ll
#1773168927
cp traceroute_e_i_en0_209_51_188_116 traceroute_e_i_en0_209_51_188_116.$(nowdz)
#1773168930
git st
#1773168934
git add -f traceroute_e_i_en0_209_51_188_116.2026-03-10.18-55-27.1773168927 
#1773168938
git commit traceroute_e_i_en0_209_51_188_116.2026-03-10.18-55-27.1773168927 -m traceroute_e_i_en0_209_51_188_116.2026-03-10.18-55-27.1773168927
#1773168939
git st
#1773171712
ps aux | psgrep 'wezterm([-]gui)?'
#1773174702
cd ..
#1773174704
git st
#1773174711
git add emacs-buffers-17731
#1773174716
git add -f emacs-buffers-17731*
#1773174717
git st
#1773174725
git commit -m emacs-buffers
#1773174726
git st
#1773174781
which -a find
#1773174791
brew --prefix find
#1773174799
brew --prefix findutils
#1773174807
brew --cellar findutils
#1773174810
ls $(brew --cellar findutils)
#1773174816
ls $(brew --prefix findutils)
#1773174820
ls $(brew --prefix findutils)/bin/
#1773174831
which gfind
#1773174994
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175165
find -regextype egrep -mindepth 2 -regex '.*[.][a-zA-Z0-9]+$'
#1773175173
find -regextype egrep -mindepth 2 -regex '.*[.][a-zA-Z0-9]+@$'
#1773175183
find -regextype egrep  -mindepth 2 -maxdepth 3 -regex '.*[.][a-zA-Z0-9]+@$'
#1773175189
find -regextype egrep  -mindepth 2 -maxdepth 3 -regex '.*[.][a-zA-Z0-9]+$'
#1773175334
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175412
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175434
find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175462
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175544
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175558
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175578
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175884
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175912
git st
#1773175930
find-regex . -type d -regex '.*/[.]git$'
#1773175970
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175971
find-regex . -type d -regex '.*/[.]git$'
#1773176065
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$'
#1773176083
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$'
#1773176099
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$' -exec path parent {} \;
#1773176132
declare -a paths_to_ignore=( $(find-regex . -type d -regex '.*/[.]git$' -exec path parent {} \;) )
#1773176154
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$' -exec path parent {} \;
#1773176192
. ~/.shell.d/fn.staging.d/find_regex.sh  ; 
#1773176230
cd ~/workbench/2026-03-10/
#1773176231
ll
#1773176232
git st
#1773176243
declare -a paths_to_ignore=()
#1773176250
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773176291
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773176303
declare -a paths_to_ignore=()
#1773176332
# paths_to_ignore=( $(find_regex . -type d -regex '.*[/][.]git$') )
#1773176337
find_regex . -type d -regex '.*[/][.]git$'
#1773176372
find_regex . -type d -regex '.*[/][.]git$' -exec path parent {} \; | sed -E "s,^$(git rev-parse --show-toplevel)/,,g"
#1773176377
find_regex . -type d -regex '.*[/][.]git$' -exec path parent {} \; | sed -E "s,^$(git rev-parse --show-toplevel)/,/,g"
#1773176388
find_regex . -type d -regex '.*[/][.]git$' -exec path parent {} \; | sed -E "s,^$(git rev-parse --show-toplevel)/,/\n,g"
#1773176394
find_regex . -type d -regex '.*[/][.]git$' -exec path parent {} \; | sed -E "s,^$(git rev-parse --show-toplevel)/,\n/,g"
#1773176406
echo -e '\n' >> .gitignore 
#1773176411
find_regex . -type d -regex '.*[/][.]git$' -exec path parent {} \; | sed -E "s,^$(git rev-parse --show-toplevel)/,\n/,g"
#1773176415
find_regex . -type d -regex '.*[/][.]git$' -exec path parent {} \; | sed -E "s,^$(git rev-parse --show-toplevel)/,\n/,g" >> .gitignore 
#1773176428
git st
#1773176432
git add .
#1773176432
git st
#1773176440
git st
#1773176447
emc .gitignore 
#1773176471
git st
#1773176472
git add .
#1773176476
workbench-commit-logs 
#1773176477
git st
#1773176508
git status --porcelain
#1773176571
workbench-commit-logs 
#1773176580
workbench-commit-logs 
#1773176592
git status --porcelain | sed -n -E 's,^([?][?]|[?][[:space:]]|[AM][[:space:]]||[[:space:]][AM])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$,\2\n,g; t success q1; :success p' 
#1773176597
git status --porcelain | sed -n -E 's,^([?][?]|[?][[:space:]]|[AM][[:space:]]||[[:space:]][AM])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$,\2\n,g; t success q1; :success p' 
#1773176602
git status --porcelain | sed -n -E 's,^([?][?]|[?][[:space:]]|[AM][[:space:]]||[[:space:]][AM])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$,\2\n,g; t success q1; :success p' ;echo $?
#1773176644
workbench-commit-logs 
#1773176657
workbench-commit-logs 
#1773176669
workbench-commit-logs 
#1773176673
set -x;
#1773176673
git status --porcelain | sed -n -E 's,^([?][?]|[?][[:space:]]|[AM][[:space:]]||[[:space:]][AM])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$,\2\n,g; t success q1; :success p';
#1773176673
set +x;
#1773176702
workbench-commit-logs | pbcopy 
#1773176703
set -x;
#1773176704
git status --porcelain | sed --debug -n -E 's,^([?][?]|[?][[:space:]]|[AM][[:space:]]||[[:space:]][AM])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$,\2\n,g; t success q1; :success p';
#1773176704
set +x;
#1773176723
workbench-commit-logs 
#1773176728
`workbench-commit-logs`
#1773176741
workbench-commit-logs
#1773176744
set +x
#1773176746
set -x;
#1773176746
git status --porcelain | sed --debug -n -E 's,^([?][?]|[?][[:space:]]|[AM][[:space:]]||[[:space:]][AM])\s+(([0-9A-Z_a-z./-]+.*?)[.](log|pem|json|gz|bz2|zip|[tj]s[x]?|txt|sh|std(out|err)([.][a-zA-Z0-9]+)?))$,\2\n,g; t success D; :success p';
#1773176746
set +x;
#1773176787
workbench-commit-logs
#1773176798
bash -c "$(workbench-commit-logs)"
#1773176821
bash -c "$(workbench-commit-logs)"
#1773176830
resetps1
#1773168859
cd ~/workbench/2026-03-10/www.gnu.org-invalid-cert/2026-03-10_18-53-12_UTC/
cd ~/workbench/2026-03-10/www.gnu.org-invalid-cert/2026-03-10_18-53-12_UTC/
#1773168860
git st
#1773168861
git add .
#1773168864
ll
#1773168866
ls -latrh
#1773168870
git add -f .
#1773168872
workbench-commit-logs 
#1773168875
git st
#1773168877
cd ..
#1773168878
cd ..
#1773168880
git status
#1773168908
ll
#1773168909
ls -latrh
#1773168912
git st
#1773168916
cd ./www.gnu.org-invalid-cert/
#1773168916
ll
#1773168927
cp traceroute_e_i_en0_209_51_188_116 traceroute_e_i_en0_209_51_188_116.$(nowdz)
#1773168930
git st
#1773168934
git add -f traceroute_e_i_en0_209_51_188_116.2026-03-10.18-55-27.1773168927 
#1773168938
git commit traceroute_e_i_en0_209_51_188_116.2026-03-10.18-55-27.1773168927 -m traceroute_e_i_en0_209_51_188_116.2026-03-10.18-55-27.1773168927
#1773168939
git st
#1773171712
ps aux | psgrep 'wezterm([-]gui)?'
#1773174702
cd ..
#1773174704
git st
#1773174711
git add emacs-buffers-17731
#1773174716
git add -f emacs-buffers-17731*
#1773174717
git st
#1773174725
git commit -m emacs-buffers
#1773174726
git st
#1773174781
which -a find
#1773174791
brew --prefix find
#1773174799
brew --prefix findutils
#1773174807
brew --cellar findutils
#1773174810
ls $(brew --cellar findutils)
#1773174816
ls $(brew --prefix findutils)
#1773174820
ls $(brew --prefix findutils)/bin/
#1773174831
which gfind
#1773174994
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175165
find -regextype egrep -mindepth 2 -regex '.*[.][a-zA-Z0-9]+$'
#1773175173
find -regextype egrep -mindepth 2 -regex '.*[.][a-zA-Z0-9]+@$'
#1773175183
find -regextype egrep  -mindepth 2 -maxdepth 3 -regex '.*[.][a-zA-Z0-9]+@$'
#1773175189
find -regextype egrep  -mindepth 2 -maxdepth 3 -regex '.*[.][a-zA-Z0-9]+$'
#1773175334
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175412
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175434
find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175462
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175544
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175558
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175578
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175884
. ~/.shell.d/fn.staging.d/find_regex.sh;                  find-regex ~/Kino/ ~/Movies/ -regex '.*[.](mkv|mp4)$'
#1773175912
git st
#1773175930
find-regex . -type d -regex '.*/[.]git$'
#1773175970
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773175971
find-regex . -type d -regex '.*/[.]git$'
#1773176065
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$'
#1773176083
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$'
#1773176099
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$' -exec path parent {} \;
#1773176132
declare -a paths_to_ignore=( $(find-regex . -type d -regex '.*/[.]git$' -exec path parent {} \;) )
#1773176154
. ~/.shell.d/fn.staging.d/find_regex.sh  ; find-regex . -type d -regex '.*/[.]git$' -exec path parent {} \;
#1773176192
. ~/.shell.d/fn.staging.d/find_regex.sh  ; 
#1773176901
. ~/.shell.d/fn.staging.d/find_regex.sh  ; 
#1773176914
echo ${SHLVL} 
#1773176922
bash -c "$(workbench-commit-logs)"
#1773177035
bash -c "$(workbench-commit-logs)"
#1773177094
workbench-commit-logs 
#1773177116
workbench-commit-logs 
#1773177127
workbench-commit-logs 
#1773177152
workbench-commit-logs 
#1773177171
bash -c "(workbench-commit-logs)"
#1773177176
bash -c "$(workbench-commit-logs)"
#1773177209
bash -c "$(workbench-commit-logs)"
#1773177233
bash -c "$(workbench-commit-logs)"
#1773177318
bash -c "$(workbench-commit-logs)"
#1773177333
bash -c "$(workbench-commit-logs)"
#1773177359
bash -c "$(workbench-commit-logs)"
#1773177378
bash -c "$(workbench-commit-logs)"
#1773177427
bash -c "$(workbench-commit-logs)"
#1773184545
man git-for-each-ref
#1773184552
man git-for-each-ref
#1773157523
which ps1
#1773157533
ps1 --env
#1773157553
cls;eval "$(ps1 --env)"
#1773186636
cd ~/opt/libexec/
#1773186637
git st
#1773186641
git restore workbench-commit-logs
#1773186643
git st
#1773186651
git st
#1773186662
git whatchanged workbench-commit-logs
#1773186665
git whatchanged -p workbench-commit-logs
#1773186712
git checkout a7cbaa043efb6d80861fe58bbc703327cbbdeea3 -- workbench-commit-logs
#1773186723
workbench-commit-logs
#1773186730
workbench-commit-logs
#1773186740
git whatchanged -p workbench-commit-logs
#1773186758
git checkout 349389839881376ce5f984fdd6765cba0fd3e08e -- workbench-commit-logs
#1773186765
workbench-commit-logs
#1773186777
workbench-commit-logs
#1773186783
workbench-commit-logs
#1773186793
workbench-commit-logs
#1773186800
workbench-commit-logs
#1773186838
workbench-commit-logs
#1773186872
workbench-commit-logs
#1773186891
workbench-commit-logs
#1773186903
workbench-commit-logs
#1773186918
workbench-commit-logs
#1773186932
cd ./opt/libexec/
#1773186936
workbench-commit-logs
#1773186946
workbench-commit-logs
#1773186961
workbench-commit-logs
#1773186970
workbench-commit-logs
#1773154203
wezterm cli
#1773154273
wezterm cli send-text --help
#1773191911
wz-wip-old 
#1773191917
workbench
#1773138698
bat attr.props.html 
#1773138748
git st
#1773138749
git q
#1773140170
pwd
#1773140171
ll
#1773140177
path canon attr.props.html | pbcopy 
#1773194672
declare -p ${!shell_d*}
#1773194686
declare -p ${!shell_d*logs} ${!shell_d*path}
#1773194695
declare -p ${!shell_d*logs*}
#1773195028
ll
#1773195032
cd ..
#1773195032
ll
#1773195036
cd ./2026-03-11/
#1773195036
ll
#1773133516
Emacs-arm64-11 -nw -Q -q 
#1773195498
cd path-finder
#1773195499
git st
#1773195500
git diff
#1773195519
emc -n  src/cli/commands/mod.rs 
#1773195705
path base --help
#1773195710
path --help
#1773196000
cargo run -- base /foo/bar.txt
#1773196725
rustup doc std::str
#1773196776
cargo run -- base /foo/bar.txt
#1773196792
cargo run -- base /foo/bar.txt
#1773196810
cargo run -- base /foo/bar.txt
#1773196840
cargo run -- base /foo/bar.txt
#1773196862
cargo run -- base /foo/bar.txt
#1773196866
cls;cargo run -- base /foo/bar.txt
#1773196904
cls;cargo run -- base /foo/bar.txt
#1773196921
cls;cargo run -- base /foo/bar.txt
#1773196938
cls;cargo run -- base /foo/bar.txt
#1773196948
cls;cargo run -- base /foo/bar.txt
#1773197008
cls;cargo run -- base /foo/bar.txt
#1773197018
cls;cargo run -- base /foo/bar.txt
#1773197037
cls;cargo run -- base /foo/bar.txt
#1773197050
cls;cargo run -- base /foo/bar.txt
#1773197063
cls;cargo run -- base /foo/bar.txt
#1773197100
cls;cargo run -- base /foo/bar.txt
#1773197114
cls;cargo run -- base /foo/bar.txt
#1773197119
cls;cargo run -- base /foo/bar.txt
#1773197145
cls;cargo run -- base /foo/bar.txt
#1773197159
cls;cargo run -- base /foo/bar.txt
#1773197169
cls;cargo run -- base /foo/bar.txt
#1773197239
cls;cargo run -- base /foo/bar.txt
#1773197277
cls;cargo run -- base /foo/bar.txt
#1773197283
cls;cargo run -- base /foo/bar.txt
#1773197365
cls;cargo run -- base /foo/bar.txt
#1773197382
cls;cargo run -- base /foo/bar.txt
#1773197392
cls;cargo run -- base /foo/bar.txt
#1773197401
cls;cargo run -- base /foo/bar.txt
#1773197413
cls;cargo run -- base --help
#1773197651
cls;cargo run -- base --help
#1773197667
cls;cargo run -- base --help
#1773197707
cls;cargo run -- base --help
#1773197776
cls;cargo run -- base --help
#1773197803
cls;cargo run -- base --help
#1773197828
cls;cargo run -- base --help
#1773197841
cls;cargo run -- base -e /foo/bar.txt
#1773197862
cls;cargo run -- base -e /foo/bar.txt
#1773197865
cls;cargo run -- base -e /foo/bar.txt
#1773197913
cls;cargo run -- base -e /foo/bar.txt
#1773197982
cls;cargo run -- base -e /foo/bar.txt
#1773197987
cls;cargo run -- base -e /foo/bar.txt
#1773197997
cls;cargo run -- base -e /foo/bar.txt
#1773198019
cls;cargo run -- base -e /foo/bar.txt
#1773198032
cls;cargo run -- base -e /foo/bar.txt
#1773198209
cls;cargo run -- base -e /foo/bar.txt
#1773198223
cls;cargo run -- base -e /foo/bar.txt
#1773198245
cls;cargo run -- base -e /foo/bar.txt
#1773198250
cls;cargo run -- base /foo/bar.txt
#1773198257
git st
#1773198259
git add .
#1773198262
cargo cfb
#1773198265
cfb
#1773198273
cargo cfb
#1773198276
cargo fb
#1773198441
git st
#1773198444
git diff
#1773198446
git add .
#1773198467
git commit -m 'deprecate --print-non-existsing'
#1773181292
cd ~/opt/libexec/
#1773181293
git st
#1773181300
rm find-regex 
#1773181474
# git diff workbench-commit-logs > workbench-commit-logs.$(git log -1 --format=%h).$(sha1sum workbench-commit-logs | gawk '{ print(substr($1, 0, 10)) } )
#1773181478
echo  workbench-commit-logs.$(git log -1 --format=%h).$(sha1sum workbench-commit-logs | gawk '{ print(substr($1, 0, 10)) } )
#1773181502
echo  workbench-commit-logs.$(git log -1 --format=%h).$(sha1sum workbench-commit-logs | gawk '{ print(substr($1, 0, 10)) } ' )
#1773181506
echo  workbench-commit-logs.$(git log -1 --format=%h).$(sha1sum workbench-commit-logs | gawk '{ print(substr($1, 0, 12)) } ' )
#1773182416
[[ "$(pwd)" =~ ^([/]?[a-zA-Z0-9_./-]+)(([/][^/]+)*([^/]*))?$ ]]; echo $?
#1773182428
# echo ${BASH_REMATCH[@]}
#1773182432
declare -p BASH_REMATCH
#1773182463
[[ "$(pwd)" =~ ^([/]?[a-zA-Z0-9_./-]+?)(([/][^/]+?)*?([^/]*?))?$ ]]; declare -p BASH_REMATCH
#1773182493
[[ "$(pwd)" =~ ^([/]?[^/]+)(.*?)$ ]]; declare -p BASH_REMATCH
#1773182511
[[ "$(pwd)" =~ ^([/]?[^/]+)(.*?)$ ]]; echo $?; declare -p BASH_REMATCH
#1773182561
[[ "$(pwd)" =~ ^(([/])?([^/]+)(.*?))$ ]]; echo $?; declare -p BASH_REMATCH
#1773182970
git add git-onesum 
#1773183032
git st
#1773183043
git-onesum  wz-get-text 
#1773183049
git onesum  wz-get-text 
#1773183063
git onesum  wz-get-text 
#1773183080
git onesum  wz-get-text 
#1773183320
git onesum  wz-get-text 
#1773183378
git onesum  wz-get-text 
#1773183449
git onesum  wz-get-text 
#1773183591
git onesum  wz-get-text 
#1773183617
git onesum  wz-get-text 
#1773183651
git onesum  wz-get-text 
#1773183670
git onesum  wz-get-text 
#1773183696
git onesum  wz-get-text 
#1773183738
git onesum  wz-get-text 
#1773183769
git onesum  wz-get-text 
#1773183809
git onesum  wz-get-text 
#1773183852
git onesum  wz-get-text 
#1773183858
git onesum  wz-get-text 
#1773183874
git onesum  wz-get-text 
#1773184037
git onesum  wz-get-text 
#1773184055
git onesum  wz-get-text 
#1773184143
git onesum  wz-get-text 
#1773184204
git onesum  wz-get-text 
#1773184215
git st
#1773184218
git onesum  wz-get-text psgrep
#1773184268
git onesum  wz-get-text psgrep
#1773184297
git onesum  wz-get-text psgrep
#1773184317
git onesum  wz-get-text psgrep
#1773184330
git onesum  wz-get-text psgrep
#1773184335
git onesum  wz-get-text psgrep
#1773184360
git onesum  wz-get-text psgrep
#1773184392
git onesum  wz-get-text psgrep
#1773184414
git onesum  wz-get-text psgrep
#1773184421
git onesum  wz-get-text psgrep
#1773184427
git onesum  wz-get-text psgrep
#1773184479
git onesum  wz-get-text psgrep
#1773184505
git branch --format='%(refname)'
#1773184510
git branch --format='%(objectname)'
#1773184522
man git-for-each-ref
#1773184581
git branch --format='%(objecttype)'
#1773184596
git branch --format='%(objecttype) %(deltabase)'
#1773184608
git branch --format='%(objecttype) %(push)'
#1773184622
git branch --format='%(objecttype) %(push) %(symref)'
#1773184643
declare -a git_branch_format_fields=()
#1773184648
declare -a git_branch_format_fields=( objecttype objectname refname push symref worktreepath 'contents:subject' 'version:refname' '*authorname' '*authoremail' )
#1773184809
for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done
#1773184865
printf '%s  ' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done)
#1773184880
declare -- git_branch_fmtstring=$(printf '%s  ' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))
#1773184888
echo ${git_branch_fmtstring}
#1773184905
git branch --format=${git_branch_fmtstring}
#1773184907
git branch --format=${git_branch_fmtstring@Q}
#1773184922
git branch --format="${git_branch_fmtstring}"
#1773184942
declare -a git_branch_format_fields=( objecttype objectname refname push symref worktreepath 'contents:subject' 'refname' '*authorname' '*authoremail' )
#1773184957
git branch --format="$(printf '%s  ' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773184965
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773184977
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done); echo)"
#1773184983
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"); echo)"
#1773184986
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773184999
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))\n"
#1773185005
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))$(echo -e '\n')"
#1773185007
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))$(echo -e '\n')"
#1773185028
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185035
declare -a git_branch_format_fields=( objecttype objectname refname push symref worktreepath 'contents:subject' 'refname' 'authorname' 'authoremail' )
#1773185035
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185184
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done; echo "name=${refname##refs/heads/}"))"
#1773185281
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done; echo "name=%(refname##refs/heads/}"))"
#1773185283
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185296
declare -a git_branch_format_fields=( objecttype objectname refname push symref worktreepath 'contents:subject' 'refname' 'authorname' 'authoremail' 'refname:lstrip:2' )
#1773185297
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185319
declare -a git_branch_format_fields=( objecttype objectname refname push symref worktreepath 'contents:subject' 'refname' 'authorname' 'authoremail' 'refname:lstrip=2' )
#1773185319
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185338
declare -a git_branch_format_fields=( objecttype objectname refname push symref worktreepath 'contents:subject' 'refname' 'authorname' 'authoremail' )
#1773185355
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done; echo "name=%(refname:lstrip=2)"))"
#1773185372
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done; echo -e "name=%(refname:lstrip=2)\n"))"
#1773185392
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185435
git branch --format="$(printf '%s\n' "name=%(refname:lstrip=2)");$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185449
git branch --format="$(printf '%s\n' "name=%(refname:lstrip=2)\n");$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185469
git branch --format="$(printf '%s\n\n' "name=%(refname:lstrip=2)");$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185485
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done; echo "name=%(refname:lstrip=2)"))"
#1773185524
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185570
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done; echo "name=%(refname:lstrip=2)"))"
#1773185607
git branch --format="$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185614
echo "name=%(refname:lstrip=2)"))"
#1773185617
echo "name=%(refname:lstrip=2)"
#1773185640
git branch --format="name=%(refname:lstrip=2)$(echo -e '\n')$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185656
git branch --format="name=%(refname:lstrip=2)$(echo -e '\\n\n')$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185662
git branch --format="name=%(refname:lstrip=2)$(echo -e '\\n\n')$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185692
git branch --format="name=%(refname:lstrip=2)$(echo -e '\\n\\\\n')$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185699
git branch --format="name=%(refname:lstrip=2)$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185715
git branch --format="name=%(refname:lstrip=2)$'\n'$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185777
git branch --format="name=%(refname:lstrip=2)$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185822
git branch --format="$(printf '%s\n' "name=%(refname:lstrip=2)" $(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
q
#1773185838
git branch --format="name=%(refname:lstrip=2)$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185857
git branch --format="$(printf '%s\n' 'name=%(refname:lstrip=2')$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185873
git branch --format="$(printf '%s\n' 'name=%(refname:lstrip=2)'$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185878
git branch --format="$(printf '%s\n' 'name=%(refname:lstrip=2)$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185903
git branch --format="$(printf '%s\n' 'name=%(refname:lstrip=2)')$(printf '%s\n' $(for val in ${git_branch_format_fields[@]}; do echo "${val}=%(${val})"; done))"
#1773185953
git st
#1773185957
gti add .
#1773185958
git st
#1773185961
git add .
#1773185961
git st
#1773185967
ll
#1773185977
git onesum  workbench-commit-logs 
#1773185994
git onesum 
#1773186000
git onesum ./workbench-commit-logs 
#1773186036
git branch --format="%(refname:lstrip=2)" 
#1773186040
git branch --format="%(refname:lstrip=2)"  HEAD
#1773186104
git branch --show-current
#1773186111
git branch  --show-current --format="%(refname:lstrip=2)"  HEAD
#1773186114
cls;git branch  --show-current --format="%(refname:lstrip=2)"  HEAD
#1773186118
git branch --show-current
#1773186183
git onesum ./workbench-commit-logs 
#1773186208
git onesum ./workbench-commit-logs 
#1773186233
git onesum ./workbench-commit-logs 
#1773186256
man git-show 
#1773186273
git show ./workbench-todo 
#1773186280
git show --format=%(objecttype) ./workbench-todo 
#1773186285
git show --format='%(objecttype)' ./workbench-todo 
#1773186289
git log --format='%(objecttype)' ./workbench-todo 
#1773186296
git for-each-ref --format='%(objecttype)' ./workbench-todo 
#1773186324
man git-describe
#1773186345
man git-rev-parse
#1773186370
man git-rev-parse
#1773186392
git st
#1773186416
git dh -- workbench-commit-logs > workbench-commit-logs.$(git onesum workbench-commit-logs)
#1773186419
ll
#1773186422
git st
#1773186424
git add .
#1773186431
git restore --staged workbench-commit-logs
#1773186432
git st
#1773186440
git restore workbench-commit-logs
#1773186463
git-onesum workbench-commit-logs
#1773186482
echo "$(git-onesum workbench-commit-logs).%(now)
#1773186485
echo "$(git-onesum workbench-commit-logs).%(now)"
#1773186490
echo "$(git-onesum workbench-commit-logs).$(now)"
#1773186492
echo "$(git-onesum workbench-commit-logs).$(nows)"
#1773186524
git st
#1773186529
git status --porcelain
#1773186558
git status --porcelain
#1773198551
musgz 
#1773198556
cd $(musgz -p)
#1773198557
ll
#1773169005
cd
#1773169015
cd ~/workbench/2026-03-10/
#1773169018
ls -latrh
#1773169046
alias ll="$(which gls) --color -latrh"
#1773169047
ll
#1773169052
cd ./tree-sitter/
#1773169053
ll
#1773169058
git clone https://github.com/tree-sitter/tree-sitter-graph.git
#1773169065
ll
#1773169069
git clone --depth=1 https://github.com/tree-sitter/tree-sitter-graph.git
#1773169080
git clone --depth=1 https://github.com/tree-sitter/tree-sitter-regex.git
#1773169086
cd ..
#1773169087
ll
#1773169092
git clone --depth=1 https://github.com/rothgar/awesome-tuis.git
#1773171599
git st
#1773186995
cd ~/opt/libexec/
#1773186999
workbench-commit-logs
#1773187028
workbench-commit-logs
#1773187037
workbench-commit-logs
#1773187084
workbench-commit-logs
#1773187099
workbench-commit-logs
#1773187105
workbench-commit-logs
#1773187110
workbench-commit-logs
#1773187143
workbench-commit-logs
#1773187169
workbench-commit-logs
#1773187193
workbench-commit-logs
#1773187216
git status --porcelain
#1773187223
git status --porcelain | gawk '{ print $NF }'
#1773187241
workbench-commit-logs
#1773187319
workbench-commit-logs
#1773187336
workbench-commit-logs
#1773187372
workbench-commit-logs
#1773187411
workbench-commit-logs
#1773187419
workbench-commit-logs
#1773187426
workbench-commit-logs
#1773187432
workbench-commit-logs
#1773187449
git st
#1773187455
git whatchanged
#1773187461
git st
#1773187464
git add .
#1773187465
git q
#1773187646
ps aux | grep wezterm
#1773187659
kill -9 25198 25267
#1773187660
ps aux | grep wezterm
#1773187687
ps axo user,pid,ppid,command | grep wezterm
#1773187714
ps axo user,pid,ppid,command | gawk       '              {


}

'
#1773187732
ps axo user,pid,ppid,command | gawk          '
              {
              

              }
'
#1773187768
ps axo user,pid,ppid,command | gawk          '
              {
              

              

              }
'
#1773187795
ps axo user,pid,ppid,command | gawk '
{

}
'
#1773187821
ps axo user,pid,ppid,command | gawk '
{
if ($0 ~ /wezterm/) { print $0 }
}
'
#1773187829
ps axo user,pid,ppid,command | gawk '
{
if ($NF ~ /wezterm/) { print $0 }
}
'
#1773187851
ps axo user,pid,ppid,command | gawk '
{
ps_axo_command=""
for (i=4;i<=NF;i++) {
ps_axo_command=sprintf("%s%s%s", ps_axo_command, $i, FS)
}
print(ps_axo_command)
}
'
#1773187934
ps axo user,pid,ppid,command | gawk '
{
ps_axo_command=""
for (i=4;i<=NF;i++) {
ps_axo_command=sprintf("%s%s%s", ps_axo_command, $i, FS)
}
if (ps_axo_command ~ /wezterm/) {
print ($)
}
}
'
#1773187952
ps axo user,pid,ppid,command | gawk '
{
ps_axo_command=""
for (i=4;i<=NF;i++) {
ps_axo_command=sprintf("%s%s%s", ps_axo_command, $i, FS)
}
if (ps_axo_command ~ /wezterm/) {
print ($0)
}
}
'
#1773187955
cls;ps axo user,pid,ppid,command | gawk '
{
ps_axo_command=""
for (i=4;i<=NF;i++) {
ps_axo_command=sprintf("%s%s%s", ps_axo_command, $i, FS)
}
if (ps_axo_command ~ /wezterm/) {
print ($0)
}
}
'
#1773188020
cls;ps axo user,pid,ppid,command | gawk '
{
ps_axo_command=""
for (i=4;i<=NF;i++) {
ps_axo_command=sprintf("%s%s%s", ps_axo_command, $i, FS)
}
if (($2 != PROC_INFO["pid"]) && (#3 != PROC_INFO["ppid"]) && (ps_axo_command ~ /wezterm/)) {
print ($0)
}
}
'
#1773188026
cls;ps axo user,pid,ppid,command | gawk '
{
ps_axo_command=""
for (i=4;i<=NF;i++) {
ps_axo_command=sprintf("%s%s%s", ps_axo_command, $i, FS)
}
if (($2 != PROC_INFO["pid"]) && ($3 != PROC_INFO["ppid"]) && (ps_axo_command ~ /wezterm/)) {
print ($0)
}
}
'
#1773181423
ipython
#1773177448
cd workbench/2026-03-10/
#1773177450
git st
#1773177456
git q
#1773177463
workbench-commit-logs 
#1773177486
workbench-commit-logs 
#1773177549
workbench-commit-logs 
#1773177757
workbench-commit-logs 
#1773177760
cls;workbench-commit-logs 
#1773177768
bash -c "$(workbench-commit-logs)"
#1773177789
cls;workbench-commit-logs 
#1773177802
cls;workbench-commit-logs 
#1773177808
cls;workbench-commit-logs 
#1773177811
bash -c "$(workbench-commit-logs)"
#1773177843
bash -c "$(workbench-commit-logs)"
#1773177852
bash -c "$(workbench-commit-logs)"
#1773177872
bash -c "$(workbench-commit-logs)"
#1773177886
bash -c "$(workbench-commit-logs)"
#1773177907
bash -c "$(workbench-commit-logs)"
#1773177929
bash -c "$(workbench-commit-logs)"
#1773177935
bash -c "$(workbench-commit-logs)"
#1773177959
bash -c "$(workbench-commit-logs)"
#1773177981
printf '\x5c'
#1773177983
printf '\x5c\n'
#1773178025
nowdz| pbcopy 
#1773178039
sed-genrep-debug-groups
#1773178043
sed-genrep-debug-groups 4
#1773178206
workbench-commit-logs 
#1773178223
workbench-commit-logs 
#1773178256
workbench-commit-logs 
#1773178277
workbench-commit-logs 
#1773178291
workbench-commit-logs 
#1773178403
workbench-commit-logs 
#1773178408
sed-genrep-debug-groups 4
#1773178418
sed-genrep-debug-groups 4
#1773178577
sed-genrep-debug-groups 4
#1773178619
sed-genrep-debug-groups 4
#1773178639
sed-genrep-debug-groups 4
#1773178663
sed-genrep-debug-groups 4
#1773178675
sed-genrep-debug-groups 4
#1773178837
sed-genrep-debug-groups 4
#1773178866
sed-genrep-debug-groups 4
#1773178941
sed-genrep-debug-groups 4
#1773178965
sed-genrep-debug-groups 4
#1773178976
sed-genrep-debug-groups 4
#1773179008
sed-genrep-debug-groups 4
#1773179014
sed-genrep-debug-groups 4
#1773179028
sed-genrep-debug-groups 4
#1773179033
sed-genrep-debug-groups 4
#1773179050
workbench-commit-logs 
#1773179072
workbench-commit-logs 
#1773179123
workbench-commit-logs 
#1773179132
workbench-commit-logs 
#1773179168
workbench-commit-logs 
#1773179199
bash -c "$(workbench-commit-logs )"
#1773179242
bash -c "$(workbench-commit-logs )"
#1773179248
bash -c "$(workbench-commit-logs )"
#1773179265
bash -c "$(workbench-commit-logs )"
#1773179278
bash -c "$(workbench-commit-logs )"
#1773179291
bash -c "$(workbench-commit-logs )"
#1773179347
bash -c "$(workbench-commit-logs )"
#1773179401
bash -c "$(workbench-commit-logs )"
#1773179407
bash -c "$(workbench-commit-logs )"
#1773179491
bash -c "$(workbench-commit-logs )"git st
#1773179491
git st
#1773179497
ll
#1773179499
ls -latrh
#1773179516
which gbin
#1773179518
which gls
#1773179525
which gls ls
#1773179552
which -a gls ls | xargs -Ieachbin path canon 'eachbin'
#1773179558
which -a gls ls | xargs -Ieachbin path canon 'eachbin' | unique-lines 
#1773179562
which -a gls ls | xargs -Ieachbin path canon 'eachbin' | head -1
#1773179576
which -a xargs
#1773179592
which -a gls ls 
#1773179615
which -a gls ls | xargs -Ieachbin gstat -c '%F eachbin' 'eachbin'
#1773179682
which -a gls ls | xargs -Ieachbin gstat -c '%F eachbin' 'eachbin' | sed -n -E 's/^(regular\s+file)\s+([a-zA-Z0-9./_-]+(.*))$/\2/gp'
#1773179691
which -a gls ls | xargs -Ieachbin gstat -c '%F eachbin' 'eachbin' | sed -n -E 's/^(regular\s+file)\s+([a-zA-Z0-9./_-]+(.*))$/\2/gp' | head -1
#1773179841
which -a gdiff diff
#1773179848
which -a gdiff diff | xargs path canon
#1773179857
which -a gdiff diff | xargs -Ieachpath path canon 'eachpath'
#1773179865
which -a gdiff diff | xargs -Ieachpath path canon 'eachpath' | head -1
#1773179873
which -a gdiff diff | xargs -Ieachpath 2>/dev/null path canon 'eachpath' | head -1
#1773180056
which -a gls ls | xargs -Ieachpath 2>/dev/null path canon 'eachpath' | xargs -Ieachpath gstat -c '%Y eachpath' 'eachpath' | sort -nur | gawk '{ result=""; for (i=2;i<NF;i++) { result=sprintf("%s%s%s", result, $i, FS);}; print(result)  }'
#1773180066
which -a gls ls | xargs -Ieachpath 2>/dev/null path canon 'eachpath' | xargs -Ieachpath gstat -c '%Y eachpath' 'eachpath' | sort -nur | gawk '{ result=""; for (i=1;i<NF;i++) { result=sprintf("%s%s%s", result, $i, FS);}; print(result)  }'
#1773180110
which -a gls ls | 2>/dev/null xargs -Ieachwhich path canon 'eachwhich' | xargs -Ieachpath gstat -c '%Y eachpath' 'eachpath' | sort -nur | gawk '{ result=""; for (i=1;i<NF;i++) { result=sprintf("%s%s%s", result, $i, FS);}; print(result)  }'
#1773180119
which -a gls ls | 2>/dev/null xargs -Ieachwhich path canon 'eachwhich' | xargs -Ieachpath gstat -c '%Y eachpath' 'eachpath' | sort -nur | gawk '{ result=""; for (i=2;i<=NF;i++) { result=sprintf("%s%s%s", result, $i, FS);}; print(result)  }'
#1773180139
which -a gls ls | 2>/dev/null xargs -Ieachwhich path canon 'eachwhich' | xargs -Ieachpath gstat -c '%Y eachpath' 'eachpath' | sort -nu | gawk '{ result=""; for (i=2;i<=NF;i++) { result=sprintf("%s%s%s", result, $i, FS);}; print(result)  }'
#1773180143
which -a gls ls | 2>/dev/null xargs -Ieachwhich path canon 'eachwhich' | xargs -Ieachpath gstat -c '%Y eachpath' 'eachpath' | sort -nu | gawk '{ result=""; for (i=2;i<=NF;i++) { result=sprintf("%s%s%s", result, $i, FS);}; print(result)  }' | head -1
#1773186599
workbench-commit-logs
#1773186616
workbench-commit-logs
#1773188099
cd ~/opt/libexec/
#1773188107
gawk -f - -o- < ps-axo-ppid.gawk 
#1773188110
gawk -f - -o- < ps-axo-ppid.gawk  | pbcopy 
#1773188114
git add ps-axo-*
#1773188115
git st
#1773188147
workbench-commit-logs
#1773188159
git t
#1773188160
git st
#1773188162
git whiches 
#1773188165
git whatchanged
#1773188183
git add -f ./ps*
#1773188184
git st
#1773188568
ps-axo-ppid '(foobar|wezterm)'
#1773188581
ps-axo-ppid '(foobar|wezterm)'
#1773188589
ps-axo-ppid.gawk 
#1773188591
ps-axo-ppid.gawk '(foobar|wezterm)'
#1773188610
ps-axo-ppid.gawk '(foobar|wezterm)'
#1773188636
ps-axo-ppid.gawk '(foobar|wezterm)'
#1773188658
ps-axo-ppid.gawk '(foobar|wezterm)'
#1773188672
ps-axo-ppid.gawk '(foobar|wezterm)'
#1773188676
ps-axo-ppid.gawk # '(foobar|wezterm)'
#1773188715
ps-axo-ppid.gawk # '(foobar|wezterm)'
#1773188737
ps-axo-ppid.gawk # '(foobar|wezterm)'
#1773188762
ps-axo-ppid.gawk # '(foobar|wezterm)'
#1773188797
ps-axo-ppid.gawk # '(foobar|wezterm)'
#1773188811
ps-axo-ppid.gawk '(foobar|wezterm)'
#1773188825
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188879
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188906
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188913
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188923
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188961
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188975
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188991
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773188998
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773189038
ps-axo-ppid.gawk '(foobar|wezterm)' foobar wezterm
#1773189042
ps-axo-ppid.gawk # '(foobar|wezterm)' foobar wezterm
#1773189049
echo | ps-axo-ppid.gawk # '(foobar|wezterm)' foobar wezterm
#1773189073
gawk -f - -o- < ps-axo-ppid.gawk  | pbcopy 
#1773189080
gawk -f - -o- < ps-axo-ppid.gawk  | pbcopy 
#1773189082
echo | ps-axo-ppid.gawk # '(foobar|wezterm)' foobar wezterm
#1773189146
echo | ps-axo-ppid.gawk # '(foobar|wezterm)' foobar wezterm
#1773189221
echo | ps-axo-ppid.gawk # '(foobar|wezterm)' foobar wezterm
#1773189233
echo | ps-axo-ppid.gawk # '(foobar|wezterm)' foobar wezterm
#1773189267
ps-axo-ppid.gawk 
#1773189275
ps-axo-ppid.gawk 
#1773189302
ps-axo-ppid.gawk 
#1773189312
ps-axo-ppid.gawk 
#1773189573
ps-axo-ppid.gawk 
#1773189582
ps-axo-ppid.gawk 
#1773189604
ps-axo-ppid.gawk 
#1773189638
ps-axo-ppid.gawk 
#1773189668
ps-axo-ppid.gawk 
#1773189685
ps-axo-ppid.gawk 
#1773189720
ps-axo-ppid.gawk 
#1773189732
ps-axo-ppid.gawk 
#1773189749
ps-axo-ppid.gawk 
#1773189755
echo | ps-axo-ppid.gawk 
#1773189760
ps-axo-ppid.gawk 
#1773189770
ps-axo-ppid.gawk 
#1773189782
ps-axo-ppid.gawk 
#1773189791
ps-axo-ppid.gawk 
#1773189797
ps-axo-ppid.gawk 
#1773189801
ps-axo-ppid.gawk 
#1773189805
ps-axo-ppid.gawk 
#1773189810
ps-axo-ppid.gawk 
#1773189817
ps-axo-ppid.gawk 
#1773189825
ps-axo-ppid.gawk 
#1773189831
ps-axo-ppid
#1773189848
ps-axo-ppid '(wezterm)'
#1773189882
ps-axo-ppid '(wezterm)'
#1773189894
ps-axo-ppid '(wezterm)'
#1773190005
ps-axo-ppid '(wezterm)'
#1773190011
ps-axo-ppid '(wezterm)'
#1773190022
ps-axo-ppid '(wezterm)'
#1773190028
ps-axo-ppid.gawk '(wezterm)'
#1773190034
ps-axo-ppid.gawk '(wezterm)'
#1773190042
ps-axo-ppid.gawk '(wezterm)'
#1773190057
ps-axo-ppid.gawk '(wezterm)'
#1773190066
ps-axo-ppid.gawk '(wezterm)'
#1773190073
ps-axo-ppid.gawk '(wezterm)'
#1773190081
ps-axo-ppid.gawk '(wezterm)'
#1773190267
ps-axo-ppid.gawk '(wezterm)'
#1773190285
ps-axo-ppid.gawk '(wezterm)'
#1773190297
ps-axo-ppid.gawk '(wezterm)'
#1773190322
ps-axo-ppid.gawk '(wezterm)'
#1773190329
ps-axo-ppid.gawk '(wezterm)'
#1773190337
ps-axo-ppid.gawk '(wezterm)'
#1773190381
ps-axo-ppid
#1773190544
ps-axo-ppid
#1773190550
ps-axo-ppid
#1773190573
ps-axo-ppid 'wezterm'
#1773190599
ps-axo-ppid 'wezterm'
#1773190624
ps-axo-ppid 'wezterm'
#1773190628
ps-axo-ppid 
#1773190638
ps aux 32825
#1773190653
ps-axo-ppid 'wezterm'
#1773190676
gawk -f - -o- < ps-axo-ppid.gawk  | pbcopy 
#1773190695
ps-axo-ppid 'wezterm'
#1773190704
ps-axo-ppid 'wezterm'
#1773190724
kill -9 9411 24402
#1773180264
cd
#1773180265
git st
#1773180277
git add -f .bash*static*
#1773180278
git st
#1773180291
git commit -m .bash.env.static
#1773180437
ack '^\s*(alias)\s+([a-zA-Z0-9_-]+[^[:space:]]*)=(.*)' ~/.shell.d/
#1773180452
ack -n '^\s*(alias)\s+([a-zA-Z0-9_-]+[^[:space:]]*)=(.*)' ~/.shell.d/
#1773180456
man ack
#1773180564
man ack
#1773180583
ack -h '^\s*(alias)\s+([a-zA-Z0-9_-]+[^[:space:]]*)=(.*)' ~/.shell.d/
#1773180590
ack --no-color -h '^\s*(alias)\s+([a-zA-Z0-9_-]+[^[:space:]]*)=(.*)' ~/.shell.d/
#1773180594
ack --no-color -h '^\s*(alias)\s+([a-zA-Z0-9_-]+[^[:space:]]*)=(.*)' ~/.shell.d/ | sort -u
#1773180632
ack pushmkd
#1773180637
ack pushmkd ~/.shell.d/
#1773180640
ack pushd ~/.shell.d/
#1773180737
git add -f .bash*static
#1773180834
git st
#1773180840
rm -f .bash.fn.static .bash.alias.static 
#1773180841
git st
#1773180844
git add .bash*
#1773180849
git add .bash*static
#1773180852
git add -f .bash*static
#1773180855
git add -f .bash*
#1773180858
git st
#1773180870
find . -mindepth 1 -maxdepth 1
#1773180874
find . -mindepth 1 -maxdepth 1 -type f
#1773180878
find . -mindepth 1 -maxdepth 1 -type f -name '.bash*'
#1773180896
find . -mindepth 1 -maxdepth 1 -type f -name '.bash*' -not -path '**/*tmp'
#1773180906
. ~/.shell.d/fn.staging.d/find_regex.sh 
#1773180937
find_regex . -mindepth 1 -maxdepth 1 -type f -name '.bash*' -not -regex '**/*(tmp|[.][0-9]+)$'
#1773180961
find_regex . -mindepth 1 -maxdepth 1 -type f -regex '[.]bash.*' -not -regex '**/*(tmp|[.][0-9]+)$'
#1773180971
find_regex . -mindepth 1 -maxdepth 1 -type f -regex '[.]bash.*' -not -regex '.*[/](tmp|[.][0-9]+)$'
#1773180974
find_regex . -mindepth 1 -maxdepth 1 -type f -regex '[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773180984
find . -mindepth 1 -maxdepth 1 -regextype egrep -type f -regex '[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773180994
find . -mindepth 1 -maxdepth 1 -regextype egrep -type f # -regex '[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181014
find . -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^[.]bash.*$' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181042
find ~/ -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181051
find ~/ -regextype egrep -mindepth 1 -maxdepth 1                                       -type f  -regex '[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181091
find ~/ -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181095
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181104
find ~/ -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181108
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' #-not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181113
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' -not -regex '.*[/](tmp|[.][0-9]+)$'
#1773181131
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' -not -regex '.*[/](tmp|[a-fA-F0-9]+)$'
#1773181139
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' -not -regex '.*(tmp|[a-fA-F0-9]+)$'
#1773181162
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' -not -regex '[^#]*(tmp|[a-fA-F0-9]+|[~])$'
#1773181218
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*' # -not -regex '[^#]*(tmp|[a-fA-F0-9]+|[~])$'
#1773181223
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*'  -regex '[^#]*(tmp|[a-fA-F0-9]+|[~])$'
#1773181236
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*'  -regex '[^#]*(tmp|[a-fA-F0-9]+|[~])$' -exec git add -f {} \;
#1773181237
git st
#1773181250
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*'  -regex '[^#]*(tmp|[a-fA-F0-9]+|[~])$' -exec git commit {} -m {} \;
#1773181263
find . -regextype egrep -mindepth 1 -maxdepth 1                                      -regextype egrep -type f  -regex '^(.*/)?[.]bash.*'  -regex '[^#]*(tmp|[a-fA-F0-9]+|[~])$' -exec git add -f {} \;
#1773181265
git st
#1773181271
git wh
#1773181274
git whatchanged
#1773181279
git st
#1773181283
git add .
#1773181287
workbench-commit-logs 
#1773181359
echo foo | sha1sum 
#1773181448
echo foo | sha1sum | gawk '{ print(substr($1, 0, 10)) }'
#1773161849
resetps1
#1773161859
cd ~/workbench/2026-03-10/
#1773161860
ll
#1773161861
git st
#1773161866
workbench-commit-logs 
#1773161868
git st
#1773161874
git add emacs-buffers-1773154147/
#1773161880
git commit emacs-buffers-1773154147/ -m emacs-buffers-1773154147/
#1773161881
gi st
#1773161882
git st
#1773161886
ls -latrh __sandbox__/
#1773161889
git add .
#1773161890
git q
#1773161893
git st
#1773162024
git status --porcelain
#1773162032
cd ./__sandbox__/git-status-porcelain-test-repos/
#1773162036
ll
#1773162040
ls -latrh
#1773162082
git st
#1773162085
git init
#1773162092
rm -rf .git
#1773162098
emc genrepos.sh 
#1773168753
git st
#1773168754
ll
#1773168756
ls -latrh
#1773160789
pwd
#1773160792
cd .shell.d/
#1773160796
resetps1
#1773160801
cd .shell.d/
#1773160804
cd ~/.shell.d/
#1773161113
ack '@sorted_in' ~/.shell.d/.awk.d/
#1773161127
unset PROMPT_COMMAND
#1773161129
ack '@sorted_in' ~/.shell.d/.awk.d/
#1773161131
which ack
#1773161139
ack 'sorted_in' ~/.shell.d/.awk.d/
#1773161156
ack '@sorted_in'  ~/opt/libexec/
#1773161164
ack -l '@sorted_in'  ~/opt/libexec/ 
#1773161189
ack -l '@sorted_in'  ~/opt/libexec/  | xargs sed -E 's/@sorted_in/sorted_in/g' 
#1773161194
ack -l '@sorted_in'  ~/opt/libexec/  | xargs sed -n -E 's/@sorted_in/sorted_in/gp' 
#1773161199
ack -l '@sorted_in'  ~/opt/libexec/  | xargs sed -E 's/@sorted_in/sorted_in/g' -i
#1773161212
ack -l '@sorted_in'  ~/.shell.d/
#1773161216
ack -l '@sorted_in'  ~/.emacs.d/
#1773161221
ack --sh -l '@sorted_in'  ~/workbench/
#1773161231
rg -l '@sorted_in'  ~/workbench/
#1773161234
rg '@sorted_in'  ~/workbench/
#1773161296
rg --recursive '@sorted_in'  ~/workbench/
#1773161302
cls;
#1773161310
unset HISTIGNORE
#1773161322
cls; rg --help | bat -l man
#1773161328
cls; rg --help | batman
#1773161338
rg --type-list
#1773161358
cls; rg --help | batman
#1773161462
rg '@sorted_in'  ~/workbench/
#1773161469
rg '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/
#1773161475
which rg
#1773161479
cls; rg --help | batman
#1773161491
cls;rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/
#1773161499
cls;rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/ | bat
#1773161510
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | bat
#1773161513
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | bat --plain
#1773161592
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | bat --plain
#1773161595
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | bat --plain
#1773161608
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | grep -E 'DEBUG[|]rg' | bat --plain
#1773161619
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | grep -E 'DEBUG[|]rgPP' | bat --plain
#1773161622
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | grep -E 'DEBUG[|]rg::' | bat --plain
#1773161680
cls; 2>&1 rg --debug '@sorted_in'  ~/workbench/ ~/opt/libexec/ ~/.shell.d/  | grep -v -E 'DEBUG[|]rg::' | bat --plain
#1773154982
bash --version
#1773154991
cd  ~/.shell.d/
#1773154992
./test.entrypoint.sh 
#1773155000
wezterm cli
#1773155018
cls() { 1>&2 echo -en '\x1b[2J\x1b[3J\x1b[H'; }
#1773155054
cls;sudo lsof | grep -i wezterm
#1773155073
lsof -p 525
#1773155095
cls;ps aux 525; ps axo ppid,pid,args 525;lsof -p 525;
#1773155125
ps aux | psgrep wezterm-gui
#1773155184
ddt 
#1773155274
ps aux | gawk '($NF ~ wezterm-gui) { print  }'
#1773155299
ps aux | gawk '($NF ~ /wezterm-gui/) { print  }'
#1773155301
cls;ps aux | gawk '($NF ~ /wezterm-gui/) { print  }'
#1773155343
cls;ps aux | gawk '($NF ~ /Applications\/WezTerm[.]app.*wezterm-gui/) { print  }'
#1773155376
cls;ps aux | gawk '{ if (($NF ~ /Applications\/WezTerm[.]app.*wezterm-gui/) && ($1 == ENVIRON["USER"])) {
print 
}
}
'
#1773155407
cls;ps aux | gawk '{ if (($NF ~ /wezterm-gui$/) && ($1 == ENVIRON["USER"])) {
print 
}
}
'
#1773155427
cls;ps aux | gawk '{ if ((NR == 1) || (($NF ~ /wezterm-gui$/) && ($1 == ENVIRON["USER"]))) {
print 
}
}
'
#1773155435
man ps
#1773155479
man ps
#1773158440
pwd
#1773158451
ps1 --env
#1773160402
resetps1
#1773157477
ps1
#1773163156
ipython
#1773155735
which -a awk
#1773155756
ps aux | /usr/bin/awk '{ if ($NF ~ /wezterm-gui$/) {print} }'
#1773155796
ps aux | /usr/bin/awk '{ if (($NF ~ /wezterm-gui$/) &&   ($1 == ENVIRON["USER"]) ) {print} }'
#1773155859
ps aux | /usr/bin/awk '{  col_pid=$2; col_user=$1; col_started=$5; if ((NR == 1) || ($NF ~ /wezterm-gui$/) &&   ($1 == ENVIRON["USER"]) ) {print} }'
#1773155869
ps aux | /usr/bin/awk '{  col_pid=$2; col_user=$1; col_started=$9; if ((NR == 1) || ($NF ~ /wezterm-gui$/) &&   ($1 == ENVIRON["USER"]) ) {print} }'
#1773155881
ps aux -o lstart | /usr/bin/awk '{  col_pid=$2; col_user=$1; col_started=$9; if ((NR == 1) || ($NF ~ /wezterm-gui$/) &&   ($1 == ENVIRON["USER"]) ) {print} }'
#1773155886
ps aux -o lstart=wat | /usr/bin/awk '{  col_pid=$2; col_user=$1; col_started=$9; if ((NR == 1) || ($NF ~ /wezterm-gui$/) &&   ($1 == ENVIRON["USER"]) ) {print} }'
#1773155905
ps aux -o lstart=wat | /usr/bin/awk '{  col_pid=$2; col_user=$1; col_started=$9; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&   ($1 == ENVIRON["USER"])) ) {print} }'
#1773155928
ps aux -o lstart=command,args,wat | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773155942
ps aux -o lstart=args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773155984
ps axo user,pid,ppid,start,lstart,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156003
ps axo user,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156033
ps -T axo user,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156036
ps axo -T user,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156040
ps axoT user,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156048
ps -T axo user,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156055
ps axo user,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156095
ps axo user,etime,time,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156098
ps axo user,etime,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm-gui$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156113
ps axo user,etime,pid,ppid,lstart=ss,args,command | /usr/bin/awk '{  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /wezterm(-gui)?$/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156133
ps axo user,etime,pid,ppid,lstart=ss,args,command | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156154
ps axo user,pid,ppid,etime,lstart=ss,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156163
ps axo user,pid,ppid,time,etime,lstart,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156185
ps axo user,pid,ppid,time,etime,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156197
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156205
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156206
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156212
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156221
(unset TS; ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }')
#1773156227
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156230
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|term)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156264
ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|.*[Cc]hrome.*)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156286
cls;ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|.*([Cc]hrome|[Hh]elium).*)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773156289
unset HISTI
#1773156292
unset HISTIGNORE
#1773156295
cls;ps axo user,pid,ppid,time=TIME,etime=ETIME,lstart=LSTART,start=START,args | /usr/bin/awk 'BEGIN {IGNORECASE=1;} {  col_pid=$2; col_user=$1; if ((NR == 1) || (($NF ~ /(wezterm-gui$|.*([Cc]hrome|[Hh]elium).*)/) &&  ($1 == ENVIRON["USER"])) ) {print} }'
#1773157271
. ~/.shell.d/entrypoint.sh
#1773157282
ack PS1 ~/.shell.d/entrypoint.sh
#1773157286
export PS1='\u@\h:\w\$ '
#1773157310
vim ~/.bashrc
#1773185230
man git-for-each-ref
#1773186058
man git-for-each-ref
#1773186062
git branch
#1773186065
man git-for-each-ref
#1773186070
man git-for-each-ref
#1773195048
bat bash.backtrace.10855.log
#1773198482
git commit -a --amend -C HEAD
#1773198485
git tag 0.0.5
#1773198510
cargo ip
#1773198826
which path
#1773198828
path canon
#1773198830
path canon .
#1773198871
ack 'print[!]'
#1773198875
ack 'println[!]'
#1773198878
git st
#1773198886
git commit -am 'print!() => println!()'
#1773198889
cargo ip]
#1773198890
cargo ip
#1773198904
git tag 0.0.6
#1773198910
path canon .
#1773198914
path canon foo/bar.sd
#1773198991
cargo run -- canon foo/bar.sd ; cargo run -- .
#1773199000
cargo run -- canon foo/bar.sd ; cargo run -- canon .
#1773199017
cargo run -- canon foo/bar.sd ; cargo run -- canon .
#1773199023
cargo run -- canon foo/bar.sd ; cargo run -- canon .
#1773199047
ggit st
#1773199059
git commit -am 'path canon: print path even when does not exist'
#1773199060
git push 
#1773199066
cargo tag 0.0.7
#1773199071
git tag 0.0.7
#1773199073
cargo ip
#1773199095
cd
#1773199097
cd .shell.d/
#1773199097
git st
#1773199299
cd 
#1773199300
git st
#1773199310
git add .
#1773199310
git t
#1773199311
git st
#1773199320
workbench-commit-logs
#1773199322
git st
#1773199503
workbench-commit-logs
#1773199519
workbench-commit-logs
#1773199533
workbench-commit-logs
#1773199536
git st
#1773199634
git st
#1773199635
workbench-commit-logs
#1773199651
workbench-commit-logs
#1773199674
workbench-commit-logs
#1773199700
workbench-commit-logs
#1773199711
workbench-commit-logs
#1773199730
workbench-commit-logs
#1773199733
workbench-commit-logs
#1773199795
workbench-commit-logs
#1773199806
workbench-commit-logs
#1773199840
workbench-commit-logs
#1773199843
git st
#1773199848
git commit .bash.fn.static -
#1773199850
git commit .bash.fn.static -m .bash.fn.static 
#1773199966
git st
#1773199971
git q
#1773199973
git st
#1773199977
workbench-commit-logs
#1773199978
git st
#1773200005
workbench-commit-logs
#1773200006
git st
#1773200016
wz-wip-old 
#1773200020
git sts
#1773200030
cd ~/workbench/2026-03-11/
#1773200030
git st
#1773200032
git init
#1773200034
git add .
#1773200036
git st
#1773200043
git rm --cached *
#1773200044
git st
#1773200048
git restore --staged .
#1773200049
git t
#1773200051
git st
#1773200052
rm -rf .git
#1773200053
git init
#1773200054
git st
#1773200057
workbench-commit-logs
#1773200062
git st
#1773200067
ll
#1773200073
workbench
#1773200175
workbench
#1773200116
workbench
#1773200256
workbench
#1773199890
ps1
#1773199892
which ps1
#1773199895
ps1 --env
#1773199899
eval "$(ps1 --env)"
#1773200405
workbench
#1773200253
wezterm cli send-text --pane-id=$(wezterm cli spawn )  "$(echo -e 'workbench\n')"
#1773200467
workbench
#1773200471
cd
#1773200472
workbench
#1773200477
cd
#1773200479
cd .shell.d/
#1773200479
git st
#1773200484
git commit -am 'fix workbench'
#1773200488
git br
#1773200494
git st
#1773200498
git st
#1773200505
wz-wip-old 
#1773198621
cd ~/workbench/2026-03-11/
#1773198622
ll
#1773198627
bat bash.34956.tracelog
#1773200445
workbench
#1773199106
git add .
#1773199120
git commit -am 'BASH_XTRACEFD=5
'
#1773199125
git switch -
#1773199130
git whatchanged 
#1773199192
git swich -c try-to-stabilize_from_b3eb3d21
#1773199198
git reset --hard b3eb3d21a3af30cfc480de63440ee824a6659571
#1773192019
cd
#1773192021
cd .shell.d/
#1773192034
git whatchanged -p entrypoint.sh
#1773192071
git show e5fa6b7f4be19eff5c9d934c0dd23eb03e3f5e6c -- entrypoint.sh
#1773192076
man git-show
#1773123007
df -h | gawk '
BEGIN {
    IGNORECASE=1;
}
() {
}

END {

}
'
#1773123046
df -h | gawk '
BEGIN {
    IGNORECASE=1;
}
($1 ~ /\/dev\/disk3s3s1/) {
filesystem=$1;
size_bytes=$2;
size=$2
used_bytes=$3;
used=$3;
avail_bytes=$4;
avail=$3;
use_percent=$5;
mountted_on=""
mounte_on=""
for (i=6;i<NF; i++) {
mounted_on=sprintf("%s%s%s", mounted_on, $i, mounted_suffix)
}

}

END {

}
'
#1773146488
emc Makefile 
#1773146497
make test
#1773149708
sed-genrep-debug-groups 
#1773149711
sed-genrep-debug-groups ;echo
#1773149718
sed-genrep-debug-groups
#1773149725
sed-genrep-debug-groups
#1773149728
sed-genrep-debug-groups
#1773149749
sed-genrep-debug-groups
#1773149757
sed-genrep-debug-groups
#1773149761
sed-genrep-debug-groups
#1773149767
sed-genrep-debug-groups
#1773149779
sed-genrep-debug-groups
#1773149786
sed-genrep-debug-groups
#1773149791
sed-genrep-debug-groups
#1773149800
sed-genrep-debug-groups
#1773149802
sed-genrep-debug-groups | pbcopy 
#1773134285
xxd -c 1 -p <<< '→'
#1773134293
xxd -c 1 -p <<< '→' | pbcopy 
#1773123301
gawk -f - -o- < ~/opt/libexec/diskstats.gawk 
#1773123303
gawk -f - -o- < ~/opt/libexec/diskstats.gawk  | pbcopy 
#1773138989
cd
#1773138990
cd tools/
#1773139845
cargo craft -cm -d 'serde_json'  -d 'serde_yaml'  -d 'toml'  -d 'quick-xml'  -d minidom -d 'url -F serde' -d html5ever -d 'scraper -F serde' xml-to-json && cd xml-to-json
#1773140414
c
#1773149276
git branch --format='%(refname) %(upstream)'
#1773149290
git branch --format='%(refname) %(upstream:remotename)'
#1773149295
git branch --format='%(refname) %n %(upstream:remotename)'
#1773127203
gawk -f - -o- < diskstats.gawk 
#1773127206
gawk -f - -o- < diskstats.gawk  | pbcopy 
#1773127255
diskstats
#1773127267
diskstats
#1773127273
diskstats
#1773127283
diskstats
#1773127289
diskstats
#1773128032
diskstats
#1773128044
gawk -f - -o- < diskstats.gawk  | pbcopy 
#1773128070
diskstats
#1773130968
css-select-http 
#1773152354
> tracy.sh
#1773126259
gdf
#1773126264
man gdf
#1773126427
df --output='source,fstype,itotal,iused,iavail,ipcent,size,used,avail,pcent,file,target'
#1773126446
man gdf
#1773152288
man bash
#1773152296
man bash
#1773152496
man bash
#1773152561
man bash
#1773152729
man bash
#1773152756
man bash > man_bash.ansi
#1773152764
mandoc
#1773152769
which -a mandoc
#1773152772
man mandoc
#1773152891
which -a man
#1773152895
man man
#1773152416
rm -fv foobar.* &
#1773152416
disown -a
#1773152446
man bash
#1773152414
cd ~/.shell.d/
#1773152415
git whatchanged 
#1773200528
cd
#1773200529
git st
