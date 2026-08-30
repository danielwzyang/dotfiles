export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="daniel"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

alias copy='xclip -selection clipboard'

bindkey '^S' undefined-key

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups
setopt share_history

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

