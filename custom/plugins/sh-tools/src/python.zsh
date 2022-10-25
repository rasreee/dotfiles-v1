function python_init_venv() {
  local venv_dirname=${1:-venv}
  python -m venv "$venv_dirname"
}
alias pyiv="python_init_venv"

function python_activate_venv() {
  local venv_dirname=${1:-venv}
  source ./${venv_dirname}/bin/activate
}
alias pyav="python_activate_venv"

alias python_init_and_active_venv="python_init_venv && python_activate_venv"
alias pyiav="python_init_and_active_venv"

alias flask_debug="FLASK_DEBUG=1 flask run"
alias fld="flask_debug"
