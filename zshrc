export ZSH="/root/.oh-my-zsh"

ZSH_THEME="lambda-mod"

export LAMBDA_MOD_N_DIR_LEVELS=10

plugins=(
  git
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

alias c="clear"
alias x="exit"

alias dbt="docker build -t"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"

alias gi="git init"
alias gc="git checkout"
alias gm="git merge"
alias gs="git status"

alias ..="cd .."
