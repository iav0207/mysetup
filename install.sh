#!/usr/bin/bash

set -e

repo_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rhome=$repo_root/replica/home

main() {
    install_omz
    link_home_files
    install_nerd_font
    brew install $brew_pkgs
    install_tmux_plugin_mgr
}

brew_pkgs=(
    zsh-syntax-highlighting
    nvim
    lazygit
    tmux
    delve # this is here jsut for a debugging example
)

install_omz() {
    if [ ! -e ~/.oh-my-zsh ]; then
        omz_install_script=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
        sh -c "$(curl -fsSL $"{omz_install_script}")"
    fi
}

link_home_files() {
    for f in $(find $rhome/dot -type f -maxdepth 1); do
        link ~/.$(basename $f) $f
    done
    link ~/.config/nvim $rhome/dot/config/nvim
    link ~/.config/tmux $rhome/dot/config/tmux
    link ~/.tmux $rhome/dot/tmux
}

link() {
    from=$1 to=$2
    if [ -e $from ]; then
        log_and_do "rm -rf ${from}.bak && mv -f $from ${from}.bak"
    fi
    ln -sf $to $from
}

install_nerd_font() {
    if macos; then
        brew tap homebrew/cask-fonts
        brew install font-inconsolata
    else
        curl -sS https://webi.sh/nerdfont | sh
    fi
}

function macos() { [[ "$(uname -a)" =~ Darwin ]]; }

install_tmux_plugin_mgr() {
    mkdir -p $rhome/dot/tmux/plugins
    [[ -e ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

log_and_do() {
    cmd="$@"
    echo $ $cmd
    eval $cmd
}

main

