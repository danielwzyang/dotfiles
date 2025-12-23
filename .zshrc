export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

bindkey '^S' undefined-key

alias clangc='clang -std=c11 -Wall -Wextra -Wpedantic -O0 -g'
