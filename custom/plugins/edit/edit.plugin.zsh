alias editor="$EDITOR"

# TODO: add validate path exists
function edit() {
  local pathname=${1:-.}
  if [[ -d $pathname ]]; then
    cd $pathname
    editor .
  else
    editor $pathname
  fi
}
alias e=edit
