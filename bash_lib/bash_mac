# -*-sh-*-

alias makepasswd="pwgen -s 15"

retag() {
    /usr/local/Cellar/ctags/5.8/bin/ctags -Re -h rb,js --exclude .* $*
}

vm(){
    case $1 in
        'start' )
            VBoxManage startvm epic_localvm --type headless
            ;;
        'stop' )
            VBoxManage controlvm epic_localvm poweroff
            ;;
        'restart' )
            vm stop && vm start
            ;;
        'login' )
            ssh epic-localvm
            ;;
        * )
            echo 'Usage vm start|stop|restart|login'
            ;;
    esac
}

# brew install sbins
export PATH=/usr/local/sbin:$PATH

# Necessary for Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR=emacs

source /usr/local/git/contrib/completion/git-completion.bash

no_color='\[\e[0m\]'
flooose_brown='\[\033[38;5;215m\]'
flooose_blue='\[\e[38;5;74m\]'
flooose_red='\[\e[38;5;160m\]'
git_prompt='$(__git_ps1 "(%s)")'

export CLICOLOR=1

# PS1='\[\e[0m\e[38;5;215m\]\u \[\e[1m\e[38;5;74m\]\W\[\e[1m\e[38;5;160m\]$(__git_ps1 " (%s)") \[\e[38;5;215m\]\! \[\e[0m\]\$ '
PS1="$flooose_brown\u $flooose_blue\W $flooose_red$git_prompt $flooose_brown\!$no_color \$ "
