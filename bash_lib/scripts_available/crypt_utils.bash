function p(){
  ccat ~/.password/db.txt.cpt | grep $1
  builtin read -p "any button to continue: " -n 1 -t 30
  printf "\033c"
}

function padd(){
  emacs ~/.password/db.txt.cpt
}
