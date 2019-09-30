# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
if [ -f '~/.tokens' ]; then source '~/.tokens'; fi

export TZ='America/Los_Angeles'

# Import tokens

_has(){
  command type "$1" > /dev/null 2>&1
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="fog"
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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=~/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
alias vim=/usr/local/bin/vim

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
alias dcp="docker-compose -f docker-compose.yml -f docker-compose.prod.yml"

# Activates NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Turns on SSH Agent for port forwarding
#ssh-add ~/.ssh/id_rsa 1> /dev/null
#ssh-add ~/.ssh/local-eng_rsa 1> /dev/null

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

function tmn {
  tmux new-session -s $(basename $(pwd))
}

bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working in command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backward
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# GOLANG
# export PATH=$PATH:/usr/local/go/bin
#export PATH=/usr/local/go/bin:$PATH
export PATH=/opt/go/bin:$PATH
export GOPATH=~/Development/go
export PATH=$PATH:$GOPATH/bin

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# OPAM configuration
if _has opam; then
  eval `opam config env`
  . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi


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

export GITHUB_TOKEN=$(cat ~/.local-docker-github.token)
alias gpa='ls ~/Development/mozlocal/apps | xargs -n1 -I{} bash -c "echo '\''--{}--'\''; cd ~/Development/mozlocal/apps/{}; git co master; git pull"'

function crunch {
  # https://www.youtube.com/watch?v=jHNBKg9xI6Q
  sh -c "$(fc -ln -1)"
}

alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'

#source ~/.silo-creds.sh

source <(kompose completion zsh)

source $HOME/.cargo/env

export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"
