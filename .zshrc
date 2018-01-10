# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
if [ -f '~/.tokens' ]; then source '~/.tokens'; fi

# Import tokens

_has(){
  command type "$1" > /dev/null 2>&1
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="snow"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow git-flow-completion)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:~/bin

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Docker aliases
alias dc="docker-compose"
alias db="docker build"

# Activates NVM
source ~/.nvm/nvm.sh

# Default Vagrant VMWare Fusion settings
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

# Turns on SSH Agent for port forwarding
ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/local-eng_rsa
ssh-add ~/.ssh/meerkey.dat

# Vim Mode settings for ZSH
# http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
export KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working in command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backward
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# Add Chef executables to path
export PATH=$PATH:/Users/davidpierce/.chefdk/gem/ruby/2.1.0/bin

# OpenStack
source ~/.openstack.conf

# GOLANG
# export PATH=$PATH:/usr/local/go/bin
export PATH=/Users/davidpierce/go-install/go/bin:$PATH
export GOPATH=/Users/davidpierce/Development/go
export PATH=$PATH:$GOPATH/bin

# added by travis gem
[ -f /Users/davidpierce/.travis/travis.sh ] && source /Users/davidpierce/.travis/travis.sh

# OPAM configuration
eval `opam config env`
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Android stuff, I guess...
export ANDROID_HOME=/usr/local/opt/android-sdk

# Nim
export PATH=$PATH:/opt/nim/nim-0.12.0/bin
export PATH=$PATH:$HOME/.nimble/bin

# Random sample a file
shuf() { awk 'BEGIN {srand(); OFMT="%.17f"} {print rand(), $0}' "$@" | sort -k1,1n | cut -d ' ' -f2-; }

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then source '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then source '~/google-cloud-sdk/completion.zsh.inc'; fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf + ag config
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
    --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
    --color info:108,prompt:109
    '
fi
