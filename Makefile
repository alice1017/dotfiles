# Makefile for install dotfiles
# by Alice1017

TARGET = ~
SOURCE = ~/dotfiles
INSTALL = /bin/ln -s
UNINSTALL = /usr/bin/unlink

.PHONY: install clean

install:
	$(INSTALL) $(SOURCE)/vim/vimrc $(TARGET)/.vimrc
	$(INSTALL) $(SOURCE)/tmux/tmux.conf $(TARGET)/.tmux.conf
	$(INSTALL) $(SOURCE)/git/gitconfig $(TARGET)/.gitconfig
	$(INSTALL) $(SOURCE)/fish/config.fish $(TARGET)/.config/config.fish

clean:
	$(UNINSTALL) $(TARGET)/.vimrc
	$(UNINSTALL) $(TARGET)/.tmux.conf
	$(UNINSTALL) $(TARGET)/.gitconfig
	$(UNINSTALL) $(TARGET)/.config/config.fish

