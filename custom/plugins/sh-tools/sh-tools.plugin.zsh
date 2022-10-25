SH_TOOLS=${0:a:h}
for file in ${SH_TOOLS}/src/*.zsh(N); do
  source $file
done
