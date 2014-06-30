# A simple password manager
# TODO:
#   - Better error handling
#     1. dependency checks (bash version)
#     2. missing files/wrong file structure
#   - Loop with Q for quit on bad input
#     1. prints usage/options

function p(){
    # trap C-c
    # multi-grep
    # empty result = exit immediately
    local OPTIND

    DIVIDER='-----'

    usage(){
        echo 'Usage: p [-h] password';
    }

    # Dependencies
    for dependency in ccrypt xclip; do
        if ! type $dependency &> /dev/null; then
            echo "Missing dependency: $dependency"
            return 1
        fi
    done

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

    # Display menu of choices
    LAST_INDEX=$((${#RESULTS[*]} - 1))
    for entry in $(seq 0 $LAST_INDEX); do
        echo -n -e "$entry:\t${RESULTS[$entry]}"
    done
    echo $DIVIDER

    # Choose
    builtin read -p "Choose entry: " -a CHOICE
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
    echo -n $LOGIN | xclip -selection primary
    echo -n $PASSWD | xclip -selection clipboard

    # Clean up
    echo -e 'Copied LOGIN and PASSWORD to primary and secondary X-selection...\n'
    builtin read -p "Press button to continue: " -n 1 -t 60
    printf "\033c"
}
#function p(){
#  # trap C-c
#  # multi-grep
#  # empty result = exit immediately
#  ccat ~/.password/db.txt.cpt | grep $1
#  builtin read -p "any button to continue: " -n 1 -t 30
#  printf "\033c"
#}
#
function padd(){
  emacs ~/.password/db.txt.cpt
}
