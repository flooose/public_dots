# -*-sh-*-

function em() {
    (/usr/bin/env emacs $* &)
}

function emn() {
    /usr/bin/env emacs -nw $*
}

function gitg(){
  /usr/bin/gitg $* &
}

source /usr/share/git/completion/git-prompt.sh

eval `dircolors -b`

export TERM=xterm

LS_OPTIONS="--color=auto"
alias ls="ls ${LS_OPTIONS}"
