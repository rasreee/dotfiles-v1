source $ZSH/plugins/npm/npm.plugin.zsh

alias ni="npm install"
alias ngi="npm install -g"

alias npml="npm ls"
alias npmlg="npm -g ls"
alias npmlg0="npm -g ls --depth=0"

alias npmv="npm --version"

alias npmu="npm uninstall"
alias npmug="npm uninstall --global"

function npm_view_pkg_version() {
  local pkg=$1
  npm view $pkg version
}
alias npmvpv="npm_view_pkg_version"

alias npm_install_global_yarn="npm install -g yarn"
alias npmigy="npm_install_global_yarn"

alias npm_path="which npm"
alias npmpath="npm_path"
alias npmpt="npm_path"

alias npmcl="npm cache clean"
alias npmclf="npm cache clean --force"

alias nst="npm run start"
alias nsv="npm run serve"
alias nt="npm run test"
alias nb="npm run build"
