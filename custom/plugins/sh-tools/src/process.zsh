function ls_port() {
  lsof -i ":$1"
}
alias lsport="ls_port"
