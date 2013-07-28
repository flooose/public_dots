# -*-sh-*-

function em() {
    (/usr/bin/emacsclient -c $1 &)
}

function emn() {
    /usr/bin/emacsclient -nw $1
}

function gitg(){
  /usr/bin/gitg $* &
}

for file in `ls /etc/bash-completion.d/`; do
  source file
done

eval `dircolors -b`

export TERM=xterm-256color

LS_OPTIONS="--color=auto"
alias ls="ls ${LS_OPTIONS}"