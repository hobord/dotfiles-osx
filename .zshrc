# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/balazs/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose fzf golang history kubectl terraform gcloud)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=~/Applications/:$PATH
export PATH=~/go/bin/:$PATH
export PATH=~/.cargo/bin:/$PATH
export PATH=/usr/local/opt/libpq/bin/:$PATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;

alias ll='ls -G -l'
alias ta='tmux attach -d -t'
alias tma='tmux a'
alias vim='nvim'
alias vims='nvim -S Session.vim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
#complete -F __start_config config 
alias lzg='lazygit'
alias gui='gitui'

alias k='kubectl'
alias d='docker'
alias dc="docker-compose"
alias drmi="docker rmi \$(docker images | grep \"<none>\" | awk '{print \$3}')"
alias drm="docker rm \$(docker ps -a|grep Exited| awk '{print \$1}')" 
alias dps='docker ps --format "table {{.ID}} {{.Status}} {{.Names}}"'

alias node='docker run -it --rm -w=/workspace -v $(pwd):/workspace node bash'
alias node12='docker run -it --rm -w=/workspace -v $(pwd):/workspace node:12 bash'
alias node10='docker run -it --rm -w=/workspace -v $(pwd):/workspace node:10 bash'
alias golang='docker run -it --rm -w=/workspace -v $(pwd):/workspace -v ~/.vimrc:/home/gropher/.vimrc hobord/golang-dev:vim'
alias mysql='docker run -it --rm -w=/workspace -v $(pwd):/workspace mysql:5.7 bash'
alias rust='docker run -it --rm -w=/workspace -v $(pwd):/workspace rust bash'
alias composer="php /usr/local/bin/composer.phar"

function kubesh() { kubectl exec -ti $@ -- sh; }
function kubebash() { kubectl exec -ti $@ -- bash; }
alias ksetns="kubectl config set-context --current --namespace"
source <(kubectl completion zsh)
complete -F __start_kubectl k

alias gc='gcloud'

setopt complete_aliases

DEFAULT_USER="balazs"

# gists
eval "$(gh completion -s zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias vscode="/Applications/Visual\ Studio\ Code.app/contents/Resources/app/bin/code"

export CLOUDSDK_PYTHON=python2.7
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/balazs/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/balazs/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/balazs/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/balazs/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# ssh aliases
[[ ! -f ~/.aliases_ssh.zsh ]] || source ~/.aliases_ssh.zsh

