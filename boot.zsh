# run this script once when setting up new machine

for full_path ($ZSH/templates/*(D)); do
  cp "$full_path" "$HOME/$(basename $full_path)"
done