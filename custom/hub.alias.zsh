alias hc="hub create"
alias hcp="hub create --private"

function hd() {
  local repo=${1:-$(cwd)}
  hub delete $repo
}
