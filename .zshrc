# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump macos tmux)

source $ZSH/oh-my-zsh.sh
source ~/.profile
source "/opt/homebrew/opt/asdf/libexec/asdf.sh"

# PATH configuration
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.asdf/shims
export PATH=$PATH:/Applications/极空间.app/Contents/Resources/app.asar.unpacked/bin/platform-tools
export PATH=$PATH:$BUN_INSTALL/bin
export PATH=$PATH:/opt/homebrew/opt/mysql-client@8.4/bin
export PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin
export PATH=$PATH:~/.opencode/bin

# Aliases
alias k=kubectl
alias proxy='export all_proxy=http://127.0.0.1:7890'
alias unproxy='unset all_proxy'
alias gits='git status'
alias gitm='git commit --amend --no-edit'
alias gitaa='git add .'
alias gita='git add -p'
alias gitp='git push origin'
alias code='code .'
alias pip='python -m pip'
alias km='kubecm s'
alias ks='k9s'
alias argon='argo --instanceid=kraken -n'

# Functions
function ag(){
    argo get $1 -n argo-luci --instanceid=kraken
}

function agl(){
    argo list -n argo-luci --instanceid=kraken
}

function age(){
    k exec -it $1 -n argo-luci -- /bin/bash
}

function db(){
    zsh ~/workspace/demo-py/scripts/db/db-prod.sh $1
}

function klonw(){
    kubectl wait --for=condition=ready pod/$2 --timeout=300s -n $1
    klon $1 $2
}

function sqlc(){
    cat $1| tr '\n' ' ' | tr -s ' '
}

# Environment variables
export GOOGLE_CLOUD_PROJECT="hallowed-moment-464105-f5"
export SCRCPY_SERVER_PATH=/Applications/极空间.app/Contents/Resources/app.asar.unpacked/bin/platform-tools/scrcpy-server
export JAVA_HOME="~/Library/Java/JavaVirtualMachines/jdk1.8.0_401.jdk/Contents/Home"
export HF_ENDPOINT=https://hf-mirror.com
export API_TIMEOUT_MS=600000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
