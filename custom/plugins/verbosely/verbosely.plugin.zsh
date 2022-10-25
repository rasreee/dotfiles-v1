function verbosely() {
  local cmd=("$@")
  echo "\$ $cmd" && eval "$cmd"
}
