# ----------------------------------------------------------------
# BUILT-IN STUFF
# ----------------------------------------------------------------
if zstyle -T ':omz:plugins:yarn' global-path; then
  # Skip yarn call if default global bin dir exists
  [[ -d "$HOME/.yarn/bin" ]] && bindir="$HOME/.yarn/bin" || bindir="$(yarn global bin 2>/dev/null)"

  # Add yarn bin directory to $PATH if it exists and not already in $PATH
  [[ $? -eq 0 ]] \
    && [[ -d "$bindir" ]] \
    && (( ! ${path[(Ie)$bindir]} )) \
    && path+=("$bindir")
  unset bindir
fi

alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yap="yarn add --peer"
alias yb="yarn build"
alias ycc="yarn cache clean"
alias yd="yarn dev"
alias yga="yarn global add"
alias ygls="yarn global list"
alias ygrm="yarn global remove"
alias ygu="yarn global upgrade"
alias yh="yarn help"
alias yi="yarn init"
alias yin="yarn install"
alias yln="yarn lint"
alias ylnf="yarn lint --fix"
alias yls="yarn list"
alias yout="yarn outdated"
alias yp="yarn pack"
alias yrm="yarn remove" yr="yarn remove"
alias yrun="yarn run"
alias ys="yarn serve"
alias yst="yarn start"
alias yt="yarn test"
alias ytc="yarn test --coverage"
alias yuc="yarn global upgrade && yarn cache clean"
alias yui="yarn upgrade-interactive"
alias yuil="yarn upgrade-interactive --latest"
alias yup="yarn upgrade"
alias yv="yarn version"
alias yw="yarn workspace"
alias yws="yarn workspaces"

# CUSTOM YARN HELPERS
alias yccf="yarn cache clean --force && yarn install"
alias yo="yarn outdated"
alias yu="yarn upgrade"
alias yul="yarn upgrade --latest"
alias ytw="yarn test:watch"
alias ytc="yarn typecheck"
alias yfm="yarn format"
alias yfx="yarn fix"
alias ycl="yarn clean"
alias yb="yarn build"
alias yrf="yarn refresh"

function yarn_add_with_types() {
  local pkg=$1
  shift
  local args=("$@")
  yarn add "$pkg" $@
  yarn add --dev "@types/$pkg" $@
}
alias yawt="yarn_add_with_types"

function yarn_remove_with_types() {
  local pkg=$1
  shift
  local args=("$@")
  yarn remove "$pkg" $@
  yarn remove "@types/$pkg" $@
}
alias yrwt="yarn_remove_with_types"

alias yV="yarn --version"
alias ydo="yarn dev & open http://localhost:3000"
