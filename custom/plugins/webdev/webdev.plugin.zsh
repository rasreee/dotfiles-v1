export ZSH_CUSTOM_PLUGINS="$ZSH_CUSTOM/plugins"
export CUSTOM_PLUGINS="$ZSH_CUSTOM_PLUGINS"
export WEBDEV="$ZSH_CUSTOM_PLUGINS/webdev"

node_lockfiles=(
  package-lock.json
  yarn.lock
  pnpm-lock.yaml
)

function find_file() {
  local root=${1:-$PWD}
  local name=$2
  shift; shift
  find "$root"/*(N) -name $name -type f $@
}

function find_dir() {
  local root=${1:-$PWD}
  local name=$2
  shift; shift
  find "$root"/*(N) -name $name -type d $@
}

function find_node_lock() {
  local root=${1:-$PWD}
  for file ($node_lockfiles); do
    find_file $root $file -not -path '*/node_modules/*'
  done
}

function nuke_node_lock() {
  local root=${1:-$PWD}
  for file ($node_lockfiles); do
    find_file $root $file -exec rm -f {} +
  done
}

function find_node_modules() {
  local root=${1:-$PWD}
  local cmd="find_dir ${1:-$PWD} 'node_modules' -prune"
  [[ $# -gt 0  ]] && shift && cmd+=" $@"
  eval "$cmd $rest_args"
}

function nuke_node_modules() {
  find_node_modules ${1:-$PWD} -exec rm -rf {} +
}


alias fdnodel="find_node_lock"
alias fdnodem="find_node_modules"


alias nknl="nuke_node_lock"
alias nknm="nuke_node_modules"
alias nkn="nknm && nknl"
alias nkts="nk *.tsbuildinfo"
alias nkbuild="nkm dist build .next .turbo tsconfig.tsbuildinfo"
alias nkout="nknm && nklog && nkbuild && nkts && nk coverage && nkdsstore" nko="nkout"

alias ytt="yarn test:types"
alias ytc="yarn typecheck || yarn type-check"
alias yf="yarn fix"
alias yq="yarn quality-check"
alias yrb="yarn rebuild"
alias yrf="yarn refresh"
alias yri="yarn reinstall"