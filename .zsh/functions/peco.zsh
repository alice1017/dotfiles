# 
# PECO FUNCTIONS
# ================

## __check_peco_exists
##     check the peco binary exists or not
__check_peco_exists() {

    which peco > /dev/null 2>&1

    if [ ! "$?" = "0" ];then
        echo "The peco binary don't exists." 1>&2
        exit 1
    else
        return 0
    fi

}

# back
#     search a command from history by peco, and eval it
#     alias: !
back() {
    local result
    local command

    __check_peco_exists

    result="$(history -i 0 | sort --reverse | peco)"

    command="${result:25}"
    echo "$command"

    eval "$command"
    return $?
}
alias !="back"

# pd
#     move current directory to searched directory contains '.git' dir
#     func name abbreviation: project directory
pd() {

    local raw     # raw find result string
    local result  # search reuslt by peco
    local dest    # destination directory
    local command # eval command

    __check_peco_exists

    raw="$(find . -type d -name .git)"

    if [ "$raw" = "" ];then
        echo "fatal: project directory doesn't found" 1>&2
        return 1
    fi

    result="$(echo $raw | peco)"
    dest="$(dirname $result)"

    command="cd $dest"

    echo "$dest"
    eval $command
}

# fd
#     move current directory to searched directory by `find .`
#     ignored dirs: .git .sass-cache
#     func name abbreviation: find directory
fd() {

    local raw     # raw find result string
    local dest    # destination directory
    local command # eval command

    raw="$(find . -type d \
            | grep -v .git \
            | grep -v .sass-cache)"

    if [ "$raw" = "." ];then
        echo "fatal: this directory doesn't contains another dir" 1>&2
        return 1
    fi

    __check_peco_exists

    dest="$(echo $raw | sed 's/ /\n/g' | peco)"

    echo "$dest"
    command="cd $dest"
    eval $command
}
