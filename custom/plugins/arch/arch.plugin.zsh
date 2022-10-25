function load_arch_env() {
  ARCH="$(uname -p)"

  case "$ARCH" in
  "i386")
    ARCH_ALIAS="Rosetta"
    ;;
  "arm")
    ARCH_ALIAS="M1"
    ;;
  *)
    echo "unexpected architecture: ARCH=$ARCH"
    ARCH_ALIAS="???"
    ;;
  esac
}

load_arch_env

function arch:info() {
  # echo "${ARCH:u} mode ($ARCH_ALIAS)"
  echo "Running in ${ARCH:u} mode ($ARCH_ALIAS)"
}

function arch:as_intel() {
  local args=("$@")
  arch -x86_64 $@
}

function arch:to_intel() {
  arch -x86_64 sh
}
