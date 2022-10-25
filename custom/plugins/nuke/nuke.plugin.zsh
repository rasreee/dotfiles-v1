function nuke() {
  local target="$1"
  for location (**/$target); do
    rm -rf $location
  done
}

function nukemany() {
  for target ("$@"); do
    nuke $target
  done
}

alias nk=nuke