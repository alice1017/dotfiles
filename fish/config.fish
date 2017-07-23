set -gx EDITOR "/usr/bin/vim"
set -gx SHELL "fish"
set -gx GREP_OPTIONS "--color=auto"
set -gx TERM "xterm-256color"
set -gx LANG "ja_JP.UTF-8"

set -gx GOPATH $HOME/golang
set -gx GOROOT $HOME/golang

set -gx PATH $HOME/bin $PATH
set -gx PATH $GOROOT/bin $PATH
set -gx PATH $HOME/.anyenv/envs/ndenv/versions/6.9.2/bin $PATH

alias apt-search="apt-cache search"
alias apt-info="apt-cache show"
alias mux="tmuxinator"
alias codegrep="find . -type f -print0 | xargs -0 grep -n"

function cd
    builtin cd $argv
    ls
end
