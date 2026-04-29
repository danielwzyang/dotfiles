export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="daniel"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

alias copy='xclip -selection clipboard'

bindkey '^S' undefined-key

clr() {
  # compile
  clang -std=c11 -Wall -Wextra -Wpedantic -O0 -g "$@" && \
  # run the program with stdin from whatever pipe/redirect you used
  ./a.out "$@" <&0 && \
  # delete the executable
  rm ./a.out
}

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups
setopt share_history        # sync history across sessions
