source $ZSH/plugins/git/git.plugin.zsh

gituser=$GITHUB_USER

alias gi="git init"
alias git-nuke="rm -rf **/.git(N)" gnk="git-nuke" nkgit="git-nuke"

function git-rebase-backwards() {
  depth=$1
  echo "rebasing backwards $depth commits"
  git rebase -i HEAD~$depth
}
alias grbb="git-rebase-backwards"

alias grg="git remote get-url origin" gu="grg"
alias grmca="git rm -r --cached . && git add --all"
alias grro="git remote remove origin"
alias grao="git remote add origin"

alias gs="git status"

alias gca="git commit -v -a -m"

function gcap() {
  git add --all
  git commit -v -m "$1"
  git push
}

function grs+() {
  local url=$1
  shift
  local args=("$@")
  result=$(git remote set-url --add origin "$url" $args)
  [[ $? != 0 ]] &&  echo $result && return 1
  git remote --verbose
}
function grs+push() {
  grs+ --push $@
}

function grhr() {
  local branch=${1:-$(git_current_branch)}
  local remote=$(git remote)
  grh "$remote/$branch" --hard
}

alias gfp="git fetch --prune origin"

function git-create-repo() {
  local commit_msg="first commit"
  local name="${1:-$(cwd)}"

  rm -rf **/.git(N)
  git init
  echo "# $name" >README.md
  git add .
  git commit -m "$commit_msg"
  git branch -M main

  hub create --private $name
  git push -u -f origin main
}
alias gcr="git-create-repo"

function gpof() {
  git push origin $(git_current_branch) --force
}

alias git-version="git --version" gv="git-version"

function git-flush() {
  local current_branch=$(git_current_branch)
  local rest_args=("$@")
  
  git checkout main
  git push --set-upstream --force origin "$current_branch"
  git merge "$current_branch" && git push $rest_args
  git checkout "$current_branch"
}
alias gfl="git-flush"

alias gstsh="git stash"