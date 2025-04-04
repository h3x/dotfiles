# Path to your oh-my-zsh installation.z
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/:$PATH"
export PATH="$HOME/dotfiles/scripts/standalone/:$PATH"
export PATH="$HOME/dotfiles/scripts/work/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

# Aliases
alias zsource="source ~/.zshrc"
alias gpush='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias dots='cd ~/dotfiles'
alias dev='cd ~/dev'
alias dcp='~/dotfiles/scripts/docker-pretty-print.sh'
alias dc='docker compose'

# alias pullall='for i in */.git; do ( echo $i; cd $i/..; git checkout develop && git pull; ); done'
alias gch='git checkout -b'
alias wip="git add . && git commit -m 'WIP' -n"
alias unwip="git reset HEAD^"

alias cvim='cd ~/.config/nvim/ && nvim .'

alias tn='tmuxifier new-session'
alias tl='tmuxifier load-session'
alias lg='lazygit'
alias sb='cd ~/sb'
alias work='ssh developer1@192.168.20.10'

alias cat='bat'
alias love="/opt/love.app/Contents/MacOS/love"

function f() {
  find ~ \( -path ~/alayadev -o -path ~/dev -o -path ~/.local -o -path ~/.config -o -path ~/DataGripProjects \) -prune -o -type f -name "$1" 2> /dev/null
}

function fixzsh() {
  cd ~
  mv .zsh_history .zsh_history_bad
  strings .zsh_history_bad > .zsh_history
  fc -R .zsh_history
  rm .zsh_history_bad
}

function pullall() {
  declare -a MAIN=(
    "api.accounting"
    "api.rating"
    "api.auth"
    "api.background-jobs"
    "api.clinical"
    "api.config"
    "api.employees"
    "api.files"
    "api.intake"
    "api.patients"
    "api.scheduler"
    "api.tasks"
    "api.users"
    "api.reporting"
    "nginx"
  )

  declare -a DEVELOP=(
    "accloud-intake-service"
    "accloud-service-holiday-groups"
    "accloud-tf-infrastructure"
    "api.auth2"
    "api.external-integrations"
    "api.labs"
    "api.logs"
    "api.maps"
    "api.notifications"
    "api.printing"
    "api.schedule-optimization"
    "api.supplies"
    "db-migrations"
    "phpapp"
    "webapp"
    )


  for i in "${MAIN[@]}"; do
    ( echo "\e[32m$i\e[0m"; cd $i/; git checkout main && git pull; )
  done 

  for i in "${DEVELOP[@]}"; do
    ( echo "\e[32m$i\e[0m"; cd $i/; git checkout develop && git pull; )
  done
}

function fetchd() {
  git stash
  BB=$(git branch | grep "*" | awk '{ print $2 }')
  git checkout develop  
  git pull
  git checkout $BB
  git merge develop
  git stash pop
}

function b36() {
    echo "base 10: $((36#$1))" 
    echo "base 36: $((10#$1))" 
}

function dce() {
  dc exec -t $1 /bin/bash -c "export TERM=vt100;exec bash"
}

function glog(){
    git log --decorate --simplify-by-decoration --oneline | grep -v "(HEAD" | head -n1 sed 's/.* (\(.*\)) .*/\1' sed 's/\(.*\), .*/\1/' sed 's/origin\///'
}

function gbranch {
        if [[ $# -eq 0 ]]
        then
                git --no-pager branch
        elif [[ $# -eq 1 ]]
        then
                git --no-pager branch | grep $1
        elif [[ $2 == '-b' ]]
        then
                git branch | grep $1 | sed -e 's/^[[:space:]]*//' | xargs git checkout
        else
                printf "Usage: gbranch\n       gbranch <ticket number>\n"
        fi
}

alias nvchad="NVIM_APPNAME=nvchad nvim"
alias lazy="NVIM_APPNAME=lazy nvim"
# alias cvim="NVIM_APPNAME=cvim nvim"

function nvims() {
  items=("default" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# Alaya
[ $USER = "developer1" ] &&
[ -f /home/developer1/dotfiles/.workrc ] && source /home/developer1/dotfiles/.workrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bindkey -s ^a "nvims\n"
export EDITOR='/usr/bin/nvim'

export SECOND_BRAIN="$HOME/sb"

# nvm use 18.15.0
nvm use 20.5.0
~/dotfiles/scripts/intro

eval "$(tmuxifier init -)"

fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf keybinds and fuzzy find
eval "$(fzf --zsh)"

# Use fd instead of fzf
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# export BAT_THEME="Catppuccin Mocha"

# Use fd for listing path candidates
# - The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --exclude .git . "$1"
}

source ~/.fzf-git.sh/fzf-git.sh

