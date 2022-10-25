##########################################
# Time the startup of an interactive shell
# Globals:
#   TIME_COUNT
##########################################
function timesh() {
  local shell=${1-$SHELL}
  for _ in $(seq 1 5); do
    /usr/bin/time $shell -i -c exit
  done
}

function time_plugins() {
  # Load all of the plugins that were defined in ~/.zshrc
  for plugin ($plugins); do
    local timer=$(($(gdate +%s%N)/1000000))
    if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
      source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
    elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
      source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fi
    local now=$(($(gdate +%s%N)/1000000))
    elapsed=$(($now-$timer))
    echo "$plugin: $elapsed"
  done
}
alias timeplugins="time_plugins"
alias timepl="time_plugins"

function timesh_verbose() {
  timesh
  timepl
}
alias timeshv="timesh_verbose"