#!/usr/bin/bash

set -e

repo_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rhome=$repo_root/replica/home

main() {
    link_home_files
    brew install nvim
    install_nerd_font
}

link_home_files() {
    for f in $(find $rhome/dot -type f -maxdepth 1); do
        link ~/.$(basename $f) $f
    done
    link ~/.config/nvim $rhome/dot/config/nvim
}

link() {
    from=$1 to=$2
    if [ -e $from ]; then
        log_and_do "rm -rf ${from}.bak && mv -f $from ${from}.bak"
    fi
    ln -sf $to $from
}

install_nerd_font() { curl -sS https://webi.sh/nerdfont | sh; }

log_and_do() {
    cmd="$@"
    echo $ $cmd
    eval $cmd
}

main

