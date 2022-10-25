alias fdn="find . -name"

function fd() {
  local pattern="$1"
  shift
  find ./* -name $pattern $@
}

function fdfile() {
  local pattern="$1"
  find ./* -name $pattern -type f
}
alias fdf="fdfile"

function fddir() {
  local pattern="$1"
  find ./* -name $pattern -type d
}
alias fdd="fddir"

function fdext() {
  local extension="$1"
  ls -d -- **/*.$extension
}
alias fde="fdext"

function fdmany() {
  local final_cmd="find *(D) \("
  local index=0

  for var in $@; do
    local prefix=""
    if [[ $index > 0 ]]; then
      prefix=" -o"
    fi
    final_cmd+="$prefix -name $var"
    index+=1
  done

  final_cmd+=" \) -prune"
  eval $final_cmd
}
alias fda="fdmany"
