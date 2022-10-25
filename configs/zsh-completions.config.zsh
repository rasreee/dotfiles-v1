# For zsh-completions plugin

# Include the directory in your $fpath by adding the following line before
# source "$ZSH/oh-my-zsh.sh"
ZSH_COMPLETIONS=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=$ZSH_COMPLETIONS
