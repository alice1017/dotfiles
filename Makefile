#      __  ___      __        _____ __
#     /  |/  /___ _/ /_____  / __(_) /__
#    / /|_/ / __ `/ //_/ _ \/ /_/ / / _ \
#   / /  / / /_/ / ,< /  __/ __/ / /  __/
#  /_/  /_/\__,_/_/|_|\___/_/ /_/_/\___/
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
	@echo '     __  ___      __        _____ __    '
	@echo '    /  |/  /___ _/ /_____  / __(_) /__  '
	@echo '   / /|_/ / __ `/ //_/ _ \/ /_/ / / _ \ '
	@echo '  / /  / / /_/ / ,< /  __/ __/ / /  __/ '
	@echo ' /_/  /_/\__,_/_/|_|\___/_/ /_/_/\___/  '
	@echo ''
	@echo 'Copyright (c) 2018 Alice1017 All Rights Reserved'
	@echo ''

update: banner ## Fetch changes for dotfiles repository
	@printf $(ARROW)
	@echo ' Fetch changes in dotfiles repository'
	git pull origin master

deploy: banner  ## Create the symbolic links to home directory
	@printf $(ARROW)
	@echo ' Start to deploy the dotfiles to home directory'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

install: banner update deploy ## Run `make deploy` after `make update`
	@exec $$SHELL

clean: banner ## Remove the symbolic links from the home directory
	@printf $(ARROW)
	@echo ' Remove the symbolic links from home directory'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

help: banner ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
