# -*-sh-*-

export TERM=xterm-256color
export PATH=/usr/local/bin:$PATH

EDITOR=/usr/bin/vim
export EDITOR

# Check for an interactive session
[ -z "$PS1" ] && return

export GREP_COLOR="1;33"

#export LANG=en_US.UTF-8
#export LANG=de_DE.UTF-8

emo(){
		emacsclient --alternate-editor="" -c $@
}

function gitg(){
		/usr/bin/gitg $* &
}

function p(){
    ccat ~/.password/db.txt.cpt | grep $1
    builtin read -p "any button to continue: " -n 1
    printf "\033c"
}

function padd(){
		emacs ~/.password/db.txt.cpt
}

remove_forcefully(){
    sleep 20
    echo 'Waiting 20 seconds to let you consider the gravity of your actions'
    echo "If you don't want to wait, you can call \"rmrf\" instead"
    rm -rf $*
}

alias b='bundle exec'
alias be='bundle exec'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias vi='vim'
alias gitg='gitg &'
alias giv='gvim -p'
alias xterm='xterm -u8'
alias diff='colordiff'
alias grep='grep --color=auto'
alias gcc='gcc -g -Wall'

# Pretty sane, but generic cursor color, if there are problems, us the simplerversion instead
# PS1="[\u \W]\$ "
PS1="\[\e[0m\e[38;5;215m\]\u@\h \[\e[1m\e[38;5;74m\]\W\[\e[0m\e[38;5;215m\] \! \[\e[38;5;255m\]$ "

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

# one-tab file listing?
set show-all-if-ambiguous on

# no duplicates in history
export HISTCONTROL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000

shopt -s histappend

# rvm stuff
if [[ -d ~/.rvm ]]; then
		[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

		PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# source Darwin specific config
kernel_version=$( uname -s )
if [[ $kernel_version =~ 'Darwin' ]]; then
		if [ -f ~/.bash_mac -o -h ~/.bash_mac ]; then
				. ~/.bash_mac
		fi
else
		if [ -f ~/.bash_linux -o -h ~/.bash_linux ]; then
				. ~/.bash_linux
		fi
fi
