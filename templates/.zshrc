_source() {
  local file="$1"
  (( $DEBUG_ZSH )) && echo "\$ $(basename $file)"
  source "$file"
}

for file ($ZSH/configs/*.zsh); do
  _source $file
done

# OMZ
_source $ZSH/oh-my-zsh.sh

# Post OMZ
_source $ZSH/post-omz.zsh