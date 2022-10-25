function greet() {
  local greeting=${GREETING:-"👋 HELLO WORLD 👋"} && echo "$greeting"
}
