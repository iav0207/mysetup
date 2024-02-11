#!/usr/bin/bash

repo_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rhome=$repo_root/replica/home

main() {
    link_home_files
}

link_home_files() {
    for f in $(find $rhome/dot -type f -maxdepth 1); do
        link_path=~/.$(basename $f)
	link $link_path $f
    done
    link ~/.config/nvim $rhome/dot/config/nvim
}

link() {
    from=$1 to=$2
    if [ -e $from ]; then log_and_do mv $from ${from}.bak; fi
    ln -sf $to $from
}

log_and_do() {
    cmd="$@"
    echo $ $cmd
    eval $cmd
}

main

