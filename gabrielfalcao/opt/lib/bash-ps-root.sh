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
