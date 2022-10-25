# loads nvm
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# activates nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# yarn
NODE_BINARIES="$HOME/.nvm/versions/node/$(nvm version)/bin"
YARN_PATH="$NODE_BINARIES/yarn"
export PATH="$PATH:$YARN_PATH"
unset YARN_PATH NODE_BINARIES

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

autoload -Uz compinit
compinit
