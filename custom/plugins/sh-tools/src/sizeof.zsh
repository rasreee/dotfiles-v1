function sizeof_file() {
  zmodload zsh/stat
  stat +size $1
}
alias sizeoff="sizeof_file"

function sizeof_dir() {
  du -sh $1
}
alias sizeofd="sizeof_dir"
