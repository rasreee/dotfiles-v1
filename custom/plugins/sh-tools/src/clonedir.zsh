function clonedir() {
  rsync -a "$1/" "$2/"
}
alias cld="clonedir"
