# -*-sh-*-

export TERM=xterm-256color
export EDITOR=emacs
export GREP_COLOR="1;33"

## Why do we care about this??
# Check for an interactive session
[ -z "$PS1" ] && return

for f in ~/.dots/public_dots/bash_lib/*; do
  source $f
done

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

# no duplicates in history
export HISTCONTROL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000

shopt -s histappend

# rvm stuff
if [[ -d ~/.rvm ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
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
