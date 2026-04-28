autoload -U colors && colors

# taken from bureau basically
_git_prompt() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  ref=$(command git symbolic-ref HEAD 2>/dev/null) || \
  ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
  local branch="${ref#refs/heads/}"
  [[ -n $(command git status --porcelain 2>/dev/null) ]] && branch="${branch}*"
  echo " [${branch}]"
}

# cyan user
_user="%{$fg_bold[cyan]%}%n%{$reset_color%}"
# white hostname
_host="%{$fg_bold[white]%}@%m%{$reset_color%}"
# white path truncated to two with ../
_path="%{$fg_bold[green]%}%(4~|../%2~|%~)%{$reset_color%}"

# use command substitution
setopt prompt_subst
# if exit code is not zero, print it
# after that just print normal stuff
PROMPT='%(?..%{$fg_bold[red]%}%? %{$reset_color%})${_user}${_host} ${_path}$(_git_prompt) $ '
# put a :( at the end of line if error
RPROMPT='%(?..%{$fg_bold[red]%}:(%{$reset_color%})'
