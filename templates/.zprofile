(($DEBUG_ZSH)) && echo "\$ .zprofile"
brew_prefix=${HOMEBREW_PREFIX:-/opt/homebrew}
eval "$($brew_prefix/bin/brew shellenv)"
unset brew_prefix
