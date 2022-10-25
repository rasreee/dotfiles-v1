alias sortbysize_dir="du -hsc */(D) | sort -nr"

alias sortbysize_file="find ./* -type f -maxdepth 0 -exec stat -f '%z %N' {} + | sort -nr"

function sortbysize() {
  zmodload zsh/stat
  stat -Ln +size -- *
}
