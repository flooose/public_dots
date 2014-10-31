# Copyright (c) 2014, christopher floess
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# A simple password manager for bash. Simply source this file and
# you're ready to query your passwords database in
# ~/.password/db.txt.cpt
#
# TODO:
#   - Better error handling
#     1. dependency checks (bash version)
#     2. missing files/wrong file structure
#   - Loop with Q for quit on bad input
#     1. prints usage/options
#   - multi-grep
#   - login gets copied wrong when there are spaces in domain
#   - implement padd better

function p(){
    local CHOICE CLIPBOARD_COMMAND RESULTS SPACIFIED_CHOICE PASSWD LOGIN
    # Necessary to make the function use options passed to it instead
    # of those of the shell in which it was invoked
    local OPTIND
    local DIVIDER='-----'

    if ! uname -a | grep -qi linux;
    then # mac os
        CLIPBOARD_COMMAND=pbcopy
    else # regular xorg
        CLIPBOARD_COMMAND=xclip
    fi

    usage(){
        echo 'Usage: p [-h] password';
    }

    display_and_read_choice(){
        # Display menu of choices
        local LAST_INDEX=$((${#RESULTS[*]} - 1))
        for entry in $(seq 0 $LAST_INDEX); do
            local LINE=$(echo ${RESULTS[$entry]} | sed -e 's/\(.*|\).*$/\1|********/')
            echo -n -e "$entry:\t$LINE\n"
        done
        echo $DIVIDER

        # Choose
        builtin read -p "Choose entry: " -a CHOICE
    }

    # Dependencies
    for dependency in ccrypt $CLIPBOARD_COMMAND; do
        if ! type $dependency &> /dev/null;
        then
            echo "Missing dependency: $dependency"
            return 1
        fi
    done

    if ! [ -f ~/.password/db.txt.cpt ];
    then
        echo "Expected to find ~/.password/db.txt.cpt"
        echo <<EOF
This can be achieved by running:
$ touch ~/.password/db.txt
$ ccrypt ~/.password/db.txt
EOF
        return 1
    fi


    getopts h help
    if [ $help = 'h' -o $# -eq 0 ]; then
        usage
        return 0
    fi

    # Search for matches
    mapfile RESULTS < <(ccat ~/.password/db.txt.cpt | grep $1)
    if [ 0 -eq ${#RESULTS[*]} ]; then
        echo "$1: no such password entry"
        return 1
    fi
    echo $DIVIDER

    display_and_read_choice RESULTS
    if [ $CHOICE -gt ${#RESULTS[*]} ]; then
        echo "Invalid choice"
        return 1
    fi
    echo $DIVIDER

    # Copy to clipboard
    SPACIFIED_CHOICE=$(echo ${RESULTS[${CHOICE[0]}]} | tr -t '|' ' ')
    builtin read -a FIELDS < <(echo $SPACIFIED_CHOICE)
    LOGIN=${FIELDS[1]}
    PASSWD=${FIELDS[-1]}
    echo -n $LOGIN | $CLIPBOARD_COMMAND -selection primary
    echo -n $PASSWD | $CLIPBOARD_COMMAND -selection clipboard

    # Clean up
    echo -e 'Copied LOGIN and PASSWORD to primary and secondary X-selection...\n'
}

function padd(){
    $EDITOR ~/.password/db.txt.cpt
}
