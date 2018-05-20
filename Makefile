#        __      __  _____ __
#   ____/ /___  / /_/ __(_) /__  _____
#  / __  / __ \/ __/ /_/ / / _ \/ ___/
# / /_/ / /_/ / /_/ __/ / /  __(__  )
# \__,_/\____/\__/_/ /_/_/\___/____/
#
# Copyright (c) 2018 Alice1017
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore tmux $(wildcard .??*.swp) $(wildcard .??*.swo)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

ARROW := '\x1b[33m==>\x1b[0m'

banner:
	@echo '        __      __  _____ __'
	@echo '   ____/ /___  / /_/ __(_) /__  _____'
	@echo '  / __  / __ \/ __/ /_/ / / _ \/ ___/'
	@echo ' / /_/ / /_/ / /_/ __/ / /  __(__  )'
	@echo ' \__,_/\____/\__/_/ /_/_/\___/____/'
	@echo ''
	@echo 'Copyright (c) 2018 Alice1017 All Rights Reserved'
	@echo ''

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

update: banner ## Fetch changes for dotfiles repository
	@printf $(ARROW)
	@echo ' Fetch changes in dotfiles repository'
	@git pull origin master
	@echo ''

deploy: banner  ## Create the symbolic links to home directory
	# symlink
	@printf $(ARROW)
	@echo ' Start to deploy the dotfiles to home directory'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init: banner ## Execute init shell script
	@bash init.sh

install: banner update deploy init ## Run update, deploy, init
	@exec $$SHELL

clean: banner ## Remove the symbolic links from the home directory
	@printf $(ARROW)
	@echo ' Remove the symbolic links from home directory'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	@echo ''

help: banner ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
