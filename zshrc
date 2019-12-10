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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias vn='variety --next'
alias :q='exit' # I'm tired of this
alias :wq='exit' # and this too

function dcr() {
  docker-compose run --rm --service-ports $1 $2
}

function megareplace() {
  ag -rl $1 $3 | xargs sed -i -E s/$1/$2/g
}

function cubo() {
  ID=`nmcli -t --fields uuid,device connection show --active |\
      grep wlan0 |\
      awk -F ':' '{print $1}'`
  echo "Active connection UUID is $ID"
  echo "Deactivating connection..."
  nmcli connection down $ID
  echo "Reactivating connection..."
  nmcli connection up $ID
}

# aliases for quickly opening project urls
alias f-es-stg='firefox --new-tab http://k8s-staging-es-front.focobrasil.com.br'
alias f-es-prod='firefox --new-tab http://www.educacaoemfoco.sedu.es.gov.br/login'
alias f-ms-stg='firefox --new-tab http://k8s-staging-ms-front.focobrasil.com.br'
alias f-ms-prod='firefox --new-tab http://www.foconoestudante.com.br'
alias f-pa-stg='firefox --new-tab http://k8s-staging-pa-front.focobrasil.com.br'
alias f-pa-prod='firefox --new-tab http://www.focopedagogico.com.br'
alias f-pb-stg='firefox --new-tab http://k8s-staging-pb-front.focobrasil.com.br'
alias f-pb-prod='firefox --new-tab http://www.aprendizagememfoco.com.br'
alias f-pe-stg='firefox --new-tab http://k8s-staging-pe-front.focobrasil.com.br'
alias f-pe-prod='firefox --new-tab http://www.focoeducacaope.com.br/login'
alias f-pi-stg='firefox --new-tab http://k8s-staging-pi-front.focobrasil.com.br'
alias f-pi-prod='firefox --new-tab http://www.focoaprendizagempi.com.br'

# set readline mode to vim
set -o vi

# This thing is here mostly to prevent vim from hanging when I press C-s
# more info: https://unix.stackexchange.com/a/72092
stty -ixon

# Tmux on startupes
[ -z "$TMUX"  ] && { tmux attach || tmux new -s sambarilove;}

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
