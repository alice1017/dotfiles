# Makefile for install dotfiles
# by Alice1017

INSTALL = /bin/ln -s
UNINSTALL = /usr/bin/unlink

.PHONY: install clean

install:
	$(INSTALL) ~/dotfiles/vim/vimrc ~/.vimrc
	$(INSTALL) ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

clean:
	$(UNINSTALL) ~/.vimrc
	$(UNINSTALL) ~/.tmux.conf

