#!/usr/bin/bash

repo_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rhome=$repo_root/replica/home

main() {
    link_home_files
}

link_home_files() {
    for f in $(find $rhome/dot -type f -maxdepth 1); do
        target_location=~/.$(basename $f)
        if [ -f $target_location ]; then log_and_do mv $target_location ${target_location}.bak; fi
        ln -s $f $target_location
    done
}

log_and_do() {
    cmd="$@"
    echo $ $cmd
    eval $cmd
}

main

