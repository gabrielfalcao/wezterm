script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash-wip

emc --boot
pmset -a acwake 0
pmset -a destroyfvkeyonstandby 1
pmset -a hibernatemode 25
pmset -a lidwake 1
pmset -a ring 1
pmset -a womp 0
unset $(set | grep -v '^\(_\|[A-Z]\|\W\)' | cut -d= -f1 | firstcol | xargs)
set +m
cd /System/
# unregulated-artificial-intelligence &
# disown -h
# llm &
# disown -h
declare -a gp_patterns_arr=(
    "AMPDeviceDiscoveryAgent"
    "coreduetd"
    "contextst"
    "linkd"
    "MTLCompiler"
    "audioaccessoryd"
    "remotepairingd"
    "chrome_crashpad"
    "contentlinkingd"
    "com[.]apple[.]siri"
    "corekdld"
    "escrowsecurity"
    "imagethumbnailextension"
    "localizationswitcherd"
    "mlhostd"
    "newstoday"
    "stockskit"
    "weather"
    "corespeech"
    "mdworker"
    "NewsTag"
    "cloudd"
    "identityservicesd"
    "locationd"
    "familycircled"
    "tipsd"
    "airportd"
    "netbiosd"
    "sharingd"
    "ocspd"
    "parsecd"
    "mount_url"
    "rtcreportingd"
    "SpotLight"
    "StocksWidget"
    "AMPLibraryAgent"
    "ANECompilerService"
    "AirPlayUIAgent"
    "AppSSOAgent"
    "AppleSpell"
    "BiomeAgent"
    "BiomeAgentAgent"
    "CallHistoryPluginHelper"
    "ContextStoreAgent"
    "ContinuityCaptureAgent"
    "GSSCred"
    "MTLAssetUpgraderD"
    "OSDUIHelper"
    "PodcastContentService"
    "QuickLookUIService"
    "SafariLaunchAgent"
    "ScreenTimeAgent"
    "Spotlight"
    "UsageTracking"
    "Widget"
    "XprotectService"
    "[Tt]ime"
    "accountsd"
    "airplay"
    "amsengagementd"
    "askpermissiond"
    "audioclocksyncd"
    "audit"
    "avatarsd"
    "axassetsd"
    "backup-helper"
    "backupd"
    "betaenrollmentd"
    "biomed"
    "bluetoothd"
    "bluetoothuserd"
    "callhis"
    "callser"
    "chrome_crashpad_handlerAgent"
    "cloudd"
    "cloudpair"
    "cloudphotod"
    "com.apple.audio."
    "commerce"
    "contextstored"
    "coreduetd"
    "countryd"
    "ctkahp"
    "deleted"
    "deleted_helper"
    "diskarbitrationd"
    "dprivacyd"
    "extension"
    "financed"
    "find"
    "iCloudNotificationAgent"
    "icdd"
    "installd"
    "intelligenceplatformd"
    "knowledge"
    "knowledgeconstructiond"
    "linkd"
    "mDNSResponder"
    "mds_stores"
    "mediaanalysis"
    "mobileassetd"
    "nearbyd"
    "nfcd"
    "notifyd"
    "opendirectory"
    "pboard"
    "photolibraryd"
    "plugin"
    "promotedcontentd"
    "rapportd"
    "replay"
    "sandboxd"
    "scdaemon"
    "searchpartyd"
    "sharedfilelistd"
    "sharingd"
    "siriinferenced"
    "sociallayer"
    "softwareupdated"
    "studentd"
    "swcd"
    "symptomsd"
    "sysmond"
    "thermalmonitord"
    "translation"
    "triald"
    "watchdogd"
    "wifianalytics"
    "osanalytics"
    "agent"
    "control.*cnter"
    "[Cc]hrome.*[Hh]elper"
    "CarbonComponent"
    "Scanner"
    "CaptureAgent"
    "extensionkitservice"
    "iconservices"
)
gp_to_kill="($(sed 's/\(\s\|\n\)\+/|/g' <<< "${gp_patterns_arr[@]}"))"
# 1>&2 echo -e "${gp_to_kill@A}"
echo "g p -r ${gp_to_kill@Q} -k" > ~/gptokill.sh
find ~/.emacs.d/ -type f -name '*.elc' -exec rm -f {} \; &
disown -a

# g p -r "${gp_to_kill}" -k &
# disown -h
# sudo g p -q -S 9 -r "${gp_to_kill}" -k &
# disown -h

# if ! 1>/dev/null 2>/dev/null g p -q -r dequbit; then
#     g p -q -r coreaudio -k -S 9
# fi
# sudo rm -rf /Users/gabrielfalcao/Library/Containers/com.apple.geod &
# disown -h
# sudo rm -rf /Users/gabrielfalcao/Library/Containers/com.apple.mediaanalysisd &
# disown -h
# 2>/dev/null 1>/dev/null find "/Users/gabrielfalcao/Music" -type f -exec chmod -v g-rwx,o-rwx {} \; &
# disown -h
mdutil -d "/Volumes/Macintosh HD/" &
disown -h
mdutil -d "/Users/gabrielfalcao/" &
disown -h
mdutil -d "/" &
disown -h
mdutil -i off &
disown -h
find /Users/gabrielfalcao/Library/Logs/DiagnosticReports/ -type f -name '*chrome*' -exec rm -f {} \; &
disown -h
/Users/gabrielfalcao/.cargo/bin/ct &
disown -h
find /Users/gabrielfalcao -type d -name .TemporaryItems -exec rm -frv {} \; &
disown -h
# find "/Users/gabrielfalcao/Pictures" -type f -exec chmod -v g-rwx,o-rwx {} \; &
# disown -h
# find "/Users/gabrielfalcao/Movies" -type f -exec chmod -v g-rwx,o-rwx {} \; &
# disown -h
# find "/Users/gabrielfalcao/Documents" -type f -exec chmod -v g-rwx,o-rwx {} \; &
# disown -h
# find "/Users/gabrielfalcao/Downloads" -type f -exec chmod -v g-rwx,o-rwx {} \; &
# disown -h
# find "/Users/gabrielfalcao/Desktop" -type f -exec chmod -v g-rwx,o-rwx {} \; &
# disown -h

# sh -c 'cd "/Users/gabrielfalcao/Library/Application Support/Google/Chrome/Default" && rm -rf GPUCache DawnWebGPUCache DawnGraphiteCache CRXTelemetry Service' &
# disown -h
# # rm -rf "/Users/gabrielfalcao/.bash_sessions/" "/Users/gabrielfalcao/.bash_history" "/Users/gabrielfalcao/.history" &
# # disown -h


defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES &
disown -h

sudo sh -c 'for src in /Users/gabrielfalcao/.*~; do
    rm -fv "${src}"
done;' &
disown -h

sudo sh -c 'cd /Users/gabrielfalcao && for src in .bash_sessions .ipython/; do
    rm -rvf "${src}"
done;' &
disown -h

# sudo rm -rf $(mktemp -d)/../* &
# disown -h
# # rm -vf "/Users/gabrielfalcao/Library/Application Support/iTerm2/*.socket*"; &
# # disown -h
# # rm -rvf "/Users/gabrielfalcao/Library/Application Support/iTerm2/SavedState/"; &
# # disown -h
rm -rf ~/Library/Preferences/hardhat-nodejs/ ~/Library/Preferences/nextjs-nodejs/ ~/Library/Preferences/create-next-app-nodejs/ &
disown -h
rm -rf ~/.python_history ~/.lesshst ~/.node_repl_history ~/.bitwarden-ssh-agent.sock ~/.bash_sessions &
disown -h
sudo chmod -R gabrielfalcao $HOME &
disown -h
mdutil -a -i off &
disown -h
mdutil -d &
disown -h
mdutil -a -i off &
disown -h
# pf-manager -i &
# disown -h
# 1>/dev/random 2>/dev/random bash -c '1>/dev/random 2>/dev/random entropy &
# disown -h'
# 1>/dev/random 2>/dev/random bash -c '1>/dev/random 2>/dev/random $HOME/opt/lib/adda.sh &
# disown -h'
# # sudo pmset -a boot
adm turn-off -viu &
disown -h
cdb fix &
disown -h
# #export XPC_FLAGS=0x0
# #export XPC_SERVICE_NAME=0

2>/dev/random 1>/dev/random sh -c 'rm -fv ~/Library/LaunchAgents/com.google.GoogleUpdater.wake.plist &
disown -h
rm -fv ~/Library/LaunchAgents/com.google.keystone.agent.plist &
disown -h
rm -fv ~/Library/LaunchAgents/com.google.keystone.xpcservice.plist &
disown -h
rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/Extensions/nmmhkkegccagdldgiimedpiccmgmieda &
disown -h'

2>/dev/random 1>/dev/random sh -c 'rm -rfv ~/Library/Caches/Yarn/ &
disown -h'
rm -f ~/.bitwarden-ssh-agent.sock
2>/dev/random 1>/dev/random sh -c 'rm -rfv ~/.Trash/ &
disown -h'

sudo rm -rf /Users/gabrielfalcao/Library/Containers/com.apple.geod &
disown -h
sudo rm -rf /Users/gabrielfalcao/Library/Containers/com.apple.mediaanalysisd &
disown -h

sudo sh -c 'for src in /Users/gabrielfalcao/.*~; do
    rm -fv "${src}"
done;' &
disown -h

sudo sh -c 'cd /Users/gabrielfalcao && for src in .bash_sessions .ipython/; do
    rm -rvf "${src}"
done;' &
disown -h

sudo rm -rf $(mktemp -d)/../* &
disown -h
sudo chmod -R gabrielfalcao $HOME &
disown -h
rm -f /Users/gabrielfalcao/.bitwarden-ssh-agent.sock
setmac

# sudo g p -q -r naturallangu -k &
# disown -h
#
# sudo find $HOME -type f -exec chown $USER {} \; &
# disown -h
