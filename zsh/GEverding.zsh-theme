
# Set prompt char
prompt_char() {
  if [ $UID -eq 0 ]
  then
    color="%{$fg_bold[red]%}"
  else
    color="%{$fg_bold[cyan]%}"
  fi
  git=$(git_prompt_info)
  if [ ${#git} != 0 ]; then
    echo $color' ❱'
  else
    echo $color'❱'
  fi
}

directory_name() {
  PROMPT_PATH=""
  if [[ `dirname ${PWD}` = / ]]; then
    PROMPT_PATH=""
  elif [[ $PWD = $HOME ]]; then
    PROMPT_PATH=""
  else
    PROMPT_PATH="${$(print -P %2~)%/*}/"
  fi
  echo "%{$fg_bold[cyan]%}${PROMPT_PATH}%{$reset_color%}%{$fg_bold[yellow]%}%1~%{$reset_color%}"
}

PROMPT='%{$fg_bold[green]%}%m: $(directory_name)%{$fg_bold[blue]%} $(git_prompt_info)$(prompt_char) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ⤮"
ZSH_THEME_GIT_PROMPT_DELETED=" ⨯"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
