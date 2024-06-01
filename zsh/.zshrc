export PATH=$HOME/bin:$HOME/go/bin:/opt/homebrew/bin:/usr/local/bin:$PATH

source /opt/homebrew/opt/zinit/zinit.zsh

zi load zdharma-continuum/history-search-multi-word
zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-completions
zi light Aloxaf/fzf-tab

# Add in snippets
# zinit snippet OMZP::git
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::command-not-found

# plugins=(git docker docker-compose fzf golang history kubectl terraform gcloud gh fzf-tab)
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -Uz compinit
compinit

# zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup


export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH=~/nvim-osx64/bin/:$PATH
export PATH=~/Applications/:$PATH
export PATH=~/go/bin/:$PATH
export PATH=~/bin/:$PATH
export PATH=~/.cargo/bin:/$PATH
export CLOUDSDK_PYTHON=python3
export PATH=/usr/local/opt/libpq/bin/:$PATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;

source ~/.zshenv

source ~/.aliases
# ssh aliases
[[ ! -f ~/.aliases_ssh.zsh ]] || source ~/.aliases_ssh.zsh

function kubesh() { kubectl exec -ti $@ -- sh; }
function kubebash() { kubectl exec -ti $@ -- bash; }
# source <(kubectl completion zsh)

DEFAULT_USER="balazs"

# gists
eval "$(gh completion -s zsh)"
fpath=($fpath ~/.zsh/completion)

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/balazs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/balazs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/balazs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/balazs/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# export PATH="/usr/local/opt/openjdk/bin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="/opt/homebrew/opt/java/bin/:$PATH"
export JAVA_HOME="/opt/homebrew/opt/java/"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Users/balazs/.micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/balazs/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/balazs/micromamba/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/balazs/micromamba/etc/profile.d/conda.sh" ]; then
        . "/Users/balazs/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/Users/balazs/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Created by `pipx` on 2023-12-06 17:04:11
export PATH="$PATH:/Users/balazs/Library/Python/3.9/bin"

# Created by `pipx` on 2023-12-06 17:04:15
export PATH="$PATH:/Users/balazs/.local/bin"

# eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/posh.toml)"
eval "$(gh copilot alias -- zsh)"
eval "$(zoxide init --cmd cd zsh)"
export PATH="/opt/homebrew/opt/awscli@1/bin:$PATH"
