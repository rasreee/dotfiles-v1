export DEBUG_ZSH=0
(($DEBUG_ZSH)) && echo "\$ ~/.zshenv"

export DOTFILES="$HOME/.dotfiles"

export ZSH="$DOTFILES"
export ZSH_CUSTOM="$ZSH/custom"
export CUSTOM_PLUGINS="$ZSH_CUSTOM/plugins"
export ZSH_TEMPLATES="$ZSH/templates"
export ZSH_THEME="robbyrussell"

export EDITOR=code

export CONFIGS="$HOME/.config"
source $CONFIGS/github.env.sh
