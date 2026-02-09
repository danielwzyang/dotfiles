export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias py='python'

bindkey '^S' undefined-key

clr() {
  # compile
  clang -std=c11 -Wall -Wextra -Wpedantic -O0 -g "$@" && \
  # run the program with stdin from whatever pipe/redirect you used
  ./a.out "$@" <&0 && \
  # delete the executable
  rm ./a.out
}

