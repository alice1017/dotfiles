#!/bin/bash

# Define functions & variables
log() {
    local msg=$1
    printf "\x1b[33m==>\x1b[0m "
    echo $msg
}

check_exit_code() {
    local exit_code=$1
    local failure="\033[1;31m[ FAILURE ] Dotfile initialization was failed\033[0m\n"

    [ "$exit_code" = "0" ] && {
        return 0
    } || {
        printf "$failure"
        exit 1
    }
}

has() {
    which "$1" >/dev/null 2>&1
    return $?
}

get_make() {
    if has "make";then
        echo "make"
        return 0
    else
        # if mac -> gmake
        if has "gmake";then
            echo "gmake"
            return 0
        fi
    fi
}

MAKE=$(get_make)
CLONE="git clone"
SUCCESS="\033[1;34m[ SUCCESS ] Dotfile initialization was successful\033[0m\n"

# 1. copy vimrc.local.sample
log "Copy 'vimrc.local.sample' -> '~/.vimrc.local'"
cp vimrc.local.sample ~/.vimrc.local
check_exit_code $?

# 2. Clone vundlevim
log "Clone VundleVim/Vundle.vim repository to ~/.vim/bundle"
mkdir -p ~/.vim/bundle
$CLONE https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
check_exit_code $?

# 3. Bundle Install
log "Run vim, Please exec ':BundleInstall' in vim"
sleep 3
vim ~/.vimrc
check_exit_code $?

# 4. vimproc make
log "Make vimproc runtime"
cd ~/.vim/bundle/vimproc/
$MAKE
check_exit_code $?

# last: print success msg
printf "$SUCCESS"
