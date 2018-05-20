#!/bin/bash

# Define variables & functions
ARROW="\x1b[33m==>\x1b[0m "

log() {
    local msg=$1
    printf "$ARROW"
    echo $msg
}

# 1. copy vimrc.local.sample
log "Copying 'vimrc.local.sample' -> '~/.vimrc.local'"
cp vimrc.local.sample ~/.vimrc.local

# 2. Clone vundlevim
log "Clone VundleVim/Vundle.vim repository to ~/.vim/bundle"
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 3. Bundle Install
log "Running vim"
echo "Please do ':BundleInstall'"
sleep 3
vim ~/.vimrc
