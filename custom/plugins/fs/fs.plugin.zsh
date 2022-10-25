function is_file() {
  if [[ -f $1 ]]; then echo 1; else echo 0; fi
}

function is_dir() {
  if [[ -d $1 ]]; then echo 1; else echo 0; fi
}

function is_empty() {
  local target=$1
  if [[ -d "$target" ]] && [[ ! $(ls -A $target) ]]; then
    echo 1
  elif [[ -f "$target" ]] && [[ ! $(cat $target) ]]; then
    echo 1
  else
    echo 0
  fi
}

alias isempty="is_empty" empty="is_empty"
alias isfile="is_file"
alias isdir="is_dir"
