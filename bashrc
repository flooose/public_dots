# -*-sh-*-

export TERM=xterm-256color
export EDITOR=emacs
export GREP_COLOR="1;33"

## Why do we care about this??
# Check for an interactive session
[ -z "$PS1" ] && return

for f in ~/.dots/public_dots/bash_lib/scripts_enabled/*; do
  source $f
done


# \[\033 is the same as \[\e
# All escape sequences must be enclosed in "\[\e[" and "]"
#
# Pretty sane, but generic cursor color, if there are problems, us the simplerversion instead
# PS1="[\u \W]\$ "
#PS1="\[\e[0m\e[38;5;215m\]\u@\h \[\e[1m\e[38;5;74m\]\W\[\e[0m\e[38;5;215m\] \! \[\e[38;5;255m\]\e[0m$ "
if [ $DISPLAY ]; then
    PS1="\[\e[38;5;215m\]\u \t \[\e[38;5;74m\]\W\[\e[38;5;215m\]\[\e[1;32m\] \!\[\e[0m\] \[\e[38;5;255m\]\[\e[1m\]\[\e[38;5;160m\]\$(__git_ps1 \"(%s) \")\[\e[0m\]\[\e[1;32m\]\$\[\e[0m\] "
else
    PS1='\[\e[35m\]\u \t \[\e[36m\]\W\[\e[35m\] \! \[\e[36m\]\[\e[1;32m\]$\[\e[0m\] '
fi

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

# no duplicates in history
export HISTCONTROL=erasedups
export HISTFILESIZE=10000
export HISTSIZE=10000

shopt -s histappend

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=node_modules/.bin:~/bin:$PATH
