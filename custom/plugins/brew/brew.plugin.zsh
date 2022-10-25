if [[ $ARCH = "i386" ]]; then
  HOMEBREW_PREFIX="/usr/local/homebrew"
else
  HOMEBREW_PREFIX="/opt/homebrew"
fi
BREW_LOCATION="$HOMEBREW_PREFIX/bin/brew"

if [[ -z "$HOMEBREW_PREFIX" ]]; then
  if [[ -z $BREW_LOCATION ]]; then
    eval "$(brew shellenv)"
  else
    eval "$("$BREW_LOCATION" shellenv)"
  fi
fi

alias brew=$BREW_LOCATION

unset BREW_LOCATION

if (( ! ${fpath[(I)"$HOMEBREW_PREFIX"/share/zsh/site-functions]} )); then
  (( $DEBUG_ZSH )) && echo "homebrew missing from FPATH"
  # fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
  FPATH=$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH
fi

alias bi='brew install'
alias bb="brew bundle"
alias bbi="brew bundle install"
alias bbc="brew bundle check"
alias bbd="brew bundle dump"
alias bbdf="brew bundle dump --force"
alias bbl="brew bundle list"
alias bcla="brew cleanup --prune=all"
alias bcubc='brew upgrade --cask && brew cleanup'
alias bcubo='brew update && brew outdated --cask'
alias bd="brew doctor"
alias bl="brew list"
alias brewp='brew pin'
alias brewsp='brew list --pinned'
alias bubc='brew upgrade && brew cleanup'
alias bubo='brew update && brew outdated'
alias bubu='bubo && bubc'
alias buf='brew upgrade --formula'
alias bri="brew reinstall"

function brews() {
  local formulae="$(brew leaves | xargs brew deps --installed --for-each)"
  local casks="$(brew list --cask)"

  local blue="$(tput setaf 4)"
  local bold="$(tput bold)"
  local off="$(tput sgr0)"

  echo "${blue}==>${off} ${bold}Formulae${off}"
  echo "${formulae}" | sed "s/^\(.*\):\(.*\)$/\1${blue}\2${off}/"
  echo "\n${blue}==>${off} ${bold}Casks${off}\n${casks}"
}
