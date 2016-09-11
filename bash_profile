source ~/.bashrc

# PATH="/bin:/usr/bin:/usr/lib:/sbin:/usr/sbin:/home/chris/bin:/home/chris/lib:/usr/share/eclipse:/opt/kde/bin:/usr/bin/perlbin/site:/usr/bin/perlbin/vendor:/usr/bin/perlbin/core:/opt/qt/bin:/usr/include:/usr/local/include:/opt/ruby1.8/bin:/usr/local/bin:$PATH"

export PATH
export BROWSER=`which chromium`

export LC_CTYPE=de_DE.utf8
export LC_COLLATE="C"
export LANG=en_US.UTF-8
#export LANG=de_DE.UTF-8
#export LC_ALL=de_DE.UTF-8
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/chris/.sdkman"
[[ -s "/home/chris/.sdkman/bin/sdkman-init.sh" ]] && source "/home/chris/.sdkman/bin/sdkman-init.sh"
