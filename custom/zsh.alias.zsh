alias zsh_rebuild="command rm -f $HOME/.zcompdump*(N) $_comp_dumpfile $ZSH_COMPDUMP" zrb="zsh_rebuild"
alias zsh_reload="omz reload" zr="zsh_reload"
alias zsh_edit_rc="$EDITOR $HOME/.zshrc" ez="zsh_edit_rc"
alias zsh_edit_env="$EDITOR $HOME/.zshenv" eze="zsh_edit_env"
alias rz="zsh_reload"

function run() {
  zsh $1
}
