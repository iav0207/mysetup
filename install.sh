#!/usr/bin/bash

set -e

repo_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rhome=$repo_root/replica/home

main() {
    install_omz
    link_home_files
    install_nerd_font
    if macos; then brew install $brew_pkgs; fi
    install_tmux_plugin_mgr
    install_iterm2_cfg
}

brew_pkgs=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    ripgrep
    nvim
    lazygit
    tmux
    kotlin
    delve # this is here jsut for a debugging example
    wget
    eza # community-maintained fork of exa
    bat
    p7zip # 7z
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
    for d in $(find $rhome/dot/config/ -type d -maxdepth 1 -mindepth 1); do
        link ~/.config/$(basename $d) $d
    done
    link ~/.tmux $rhome/dot/tmux
}

link() {
    from=$1 to=$2
    if [ -e $from ]; then
        log_and_do "rm -rf ${from}.bak && mv -f $from ${from}.bak"
    fi
    log_and_do ln -sf $to $from
}

install_nerd_font() {
    if macos; then
        brew tap homebrew/cask-fonts
        fonts=(
            font-droid-sans-mono-nerd-font
            font-fira-code-nerd-font
            font-geist-mono-nerd-font
            font-inconsolata-nerd-font
            font-ubuntu-mono-nerd-font
        )
        brew install $fonts
    else
        curl -sS https://webi.sh/nerdfont | sh
    fi
}

function macos() { [[ "$(uname -a)" =~ Darwin ]]; }

install_tmux_plugin_mgr() {
    mkdir -p $rhome/dot/tmux/plugins
    [[ -e ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_iterm2_cfg() {
    cfg_fname=com.googlecode.iterm2.plist
    native_cfg_location=$HOME/Library/Preferences/$cfg_fname
    repo_cfg_location=$rhome/dot/config/iterm2/$cfg_fname
    mkdir -p $(dirname $native_cfg_location)
    link $native_cfg_location $repo_cfg_location
}

log_and_do() {
    cmd="$@"
    echo $ $cmd
    eval $cmd
}

main

