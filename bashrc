# -*-sh-*-

export TERM=xterm
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
PS1="\[\e[35m\]\t \[\e[36m\]\W\[\e[35m\] \!\[\e[0m\] \[\e[38;5;255m\]\[\e[1m\]\[\e[38;5;160m\]\$(__git_ps1 \"(%s) \")\[\e[36m\]\[\e[1;32m\]\$\[\e[0m\] "

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

alias vim=emacs
alias vi=emacs

# Setup android development
export PATH=$PATH:~/android/platform-tools:~/android/tools
export ANDROID_HOME=~/android

export NVM_DIR="/home/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/chris/.sdkman"
[[ -s "/home/chris/.sdkman/bin/sdkman-init.sh" ]] && source "/home/chris/.sdkman/bin/sdkman-init.sh"

# Make less display utf-8 characters. This assumes that LANG and co. are properly set
export LESSCHARSET=UTF-8
