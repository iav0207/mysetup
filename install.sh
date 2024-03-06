#!/usr/bin/bash

set -e

repo_root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rhome=$repo_root/replica/home

main() {
    install_omz
    link_home_files
    install_nerd_fonts
    if macos
        then brew install ${brew_pkgs[@]}
        else
            sudo apt install ${apt_pkgs[@]}
            linux_install_neovim
            linux_install_lazygit
    fi
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

apt_pkgs=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    ripgrep
    tmux
    exa
    bat
    p7zip
    python3.11-venv # for some nvim language servers
)

install_omz() {
    if [ ! -e ~/.oh-my-zsh ]; then
        omz_install_script=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
        sh -c "$(curl -fsSL $"{omz_install_script}")"
    fi
    local zcustom=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
    local plugins=(zsh-autosuggestions zsh-syntax-highlighting)
    if ! macos; then
        for plugin in ${plugins[@]}; do
            local pdir=$zcustom/plugins/$plugin
            [ -e $pdir ] || git clone https://github.com/zsh-users/$plugin $pdir
        done
    fi
}

link_home_files() {
    for f in $(find $rhome/dot -maxdepth 1 -type f); do
        link ~/.$(basename $f) $f
    done
    for d in $(find $rhome/dot/config/ -maxdepth 1 -mindepth 1 -type d); do
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

install_nerd_fonts() {
    if macos; then
        brew tap homebrew/cask-fonts
        fonts=(
            font-droid-sans-mono-nerd-font
            font-fira-code-nerd-font
            font-geist-mono-nerd-font
            font-inconsolata-nerd-font
            font-ubuntu-mono-nerd-font
        )
        brew install ${fonts[@]}
    else
        curl -sS https://webi.sh/nerdfont | sh
    fi
}

function macos() { [[ "$(uname -a)" =~ Darwin ]]; }

install_tmux_plugin_mgr() {
    mkdir -p $rhome/dot/tmux/plugins/tpm
    if emptydir ~/.tmux/plugins/tpm; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;
    fi
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
}

function emptydir() { [[ -z "$(ls -A $1)" ]]; }

install_iterm2_cfg() {
    cfg_fname=com.googlecode.iterm2.plist
    native_cfg_location=$HOME/Library/Preferences/$cfg_fname
    repo_cfg_location=$rhome/dot/config/iterm2/$cfg_fname
    mkdir -p $(dirname $native_cfg_location)
    link $native_cfg_location $repo_cfg_location
}

linux_install_lazygit() { # https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin && echo 'Installed lazygit.'
}

linux_install_neovim() { # https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
}

log_and_do() {
    cmd="$@"
    echo $ $cmd
    eval $cmd
}

main

