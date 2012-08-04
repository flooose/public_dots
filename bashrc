EDITOR=/usr/bin/vim
export EDITOR
# Check for an interactive session
[ -z "$PS1" ] && return

export GREP_COLOR="1;33"

export LANG=en_US.UTF-8
#export LANG=de_DE.UTF-8

remove_forcefully(){
    sleep 20
    echo 'Waiting 20 seconds to let you consider the gravity of your actions'
    echo "If you don't want to wait, you can call \"rmrf\" instead"
    rm -rf $*
}

emo(){
		emacsclient -c $* || emacs $* &
}

function gitg(){
		/usr/bin/gitg $* &
}

function p(){
		ccat ~/.password/db.txt.cpt | grep $1
}

function padd(){
		emacs ~/.password/db.txt.cpt
}

alias b2c='cd ~/work/projects/b2c'
alias reconk='killall -SIGUSR1 conky'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias vi='vim'
alias vim='emacs -nw'
alias gitg='gitg &'
alias giv='gvim -p'
alias emass='emacs &'
alias em='emacs &'
alias eman='emacs -nw'
alias emn='emacs -nw'
alias xterm='xterm -u8'
alias more='less'
alias diff='colordiff'
alias grep='grep --color=auto'
alias gitco='git checkout'
alias gita='git add'
alias gitc='git commit'
alias gitb='git branch'
alias gitb='git merge_in'
alias gcc='gcc -g -Wall'
alias info='info --vi-keys'
alias utar='tar -xzf'
alias work='work_mode && VBoxManage startvm ubuntu10.4'
#alias sss='ssh $1 -t screen'
eval `dircolors -b`

PS1='[\u@\h \W]\$ '

#Gets the coveted history-search-backward
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\C-p":history-search-backward'
bind '"\C-n":history-search-forward'

# Let's get color into less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# mpc aliases
alias mnext='mpc next'
alias mprev='mpc prev'
alias mstop='mpc stop'
alias mpau='mpc toggle'
alias mplay='mpc play'
alias mtog='mpc toggle'
alias mcur='mpc current'
alias madd='mpc add'


#JAVA_HOME='/opt/java'
#export JAVA_HOME

# rvm-install added line:
#if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

# vim style command line editing
# uncomment this when you figure out how not to trash history-search-backward
#set -o vi

# one-tab file listing?
set show-all-if-ambiguous on

# proper ruby version
#rvm 1.8.7

# no duplicates in history
export HISTCONTROL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000

shopt -s histappend
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
