# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bureau"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  nvm
  tmux
)

source $ZSH/oh-my-zsh.sh

# Set editor
export EDITOR=vim

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias vn='variety --next'
alias :q='exit' # I'm tired of this
alias :wq='exit' # and this too
alias watchcpu='watch -n1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'

function dcr() {
  docker-compose run --rm --service-ports $1 $2
}

function megareplace() {
  ag -rl $1 $3 | xargs sed -i -E s/$1/$2/g
}

function focoapi_reset() {
rails db:drop db:create db:migrate
RAILS_ENV=test rails db:drop db:create db:migrate
DB=warehouse rails db:create db:schema:load
rails authorization:create_service authorization:create_feature_resources
rails sample_data:load_all
rails db:seed
rails tct:refresh_views views_refresh
}

# set readline mode to vim
set -o vi

# This thing is here mostly to prevent vim from hanging when I press C-s
# more info: https://unix.stackexchange.com/a/72092
stty -ixon

# Tmux on startupes
[ -z "$TMUX"  ] && { tmux attach || tmux new -s sambarilove;}

# Load NVM

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

