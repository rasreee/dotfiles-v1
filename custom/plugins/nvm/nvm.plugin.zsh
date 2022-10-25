## ------ HELEPRS ------- ##
alias nvmui="nvm uninstall"
alias nvmi="nvm install"
alias nvmu="nvm use"
alias which_nvm="command -v nvm"

function check_yarn_compatible() {
  # check if using yarn
  if [[ -f yarn.lock ]]; then
    echo "Switching to compatible Yarn version"
    npm install -g yarn
  fi
}

function nvm_install_extended() {
  local version=${1:-stable}
  nvm install $version
  check_yarn_compatible
}
alias nvmie="nvm_install_extended"

function nvm_use_extended() {
  nvm use $version
  check_yarn_compatible
}
alias nvmue="nvm_use_extended"

alias nvmv="nvm version"

function nvm_init_rc() {
  local version=${1:-stable}
  nvm_install_extended $version
  echo "Initializing .nvmrc with version $version"
  echo "$(nvm version)" >>.nvmrc
}
alias nvminitrc="nvm_init_rc"
alias nvmirc="nvm_init_rc"

function nvm_use_or_init_rc() {
  if [[ -f .nvmrc ]]; then
    local version="$(cat .nvmrc)"
    nvm_install_extended $version
  else
    local version=$1
    echo "No .nvmrc found"
    nvm_init_rc $version
  fi
}
alias nvmuoi="nvm_use_or_init_rc"

function nvm_use_rc() {
  if [[ -f .nvmrc ]]; then
    local version="$(cat .nvmrc)"
    nvm_use_extended
  else
    echo "No .nvmrc found"
  fi
}
alias nvmurc="nvm_use_rc"
