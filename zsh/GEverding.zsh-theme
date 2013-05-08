
# Set prompt char
prompt_char() {
  if [ $UID -eq 0 ]
  then
    color="%{$fg_bold[red]%}"
  else
    color="%{$fg_bold[cyan]%}"
  fi
  echo $color'❱'
}

directory_name() {
  PROMPT_PATH=""
  if [[ `dirname ${PWD}` = / ]]; then
    PROMPT_PATH=""
  elif [[ $PWD = $HOME ]]; then
    PROMPT_PATH=""
  else
    if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
      # We're in a git repo.
      local base=$(basename $(git rev-parse --show-toplevel))
      if [[ $PWD = $(git rev-parse --show-toplevel) ]]; then
        # We're in the root.
        PROMPT_PATH=""
      else
        # We're not in the root. Display the git repo root.
        PROMPT_PATH="%{$fg_bold[magenta]%}${[$base]}%{$reset_color%}/"
      fi
    else
      #tmp_path=$(print -P %3~)
      PROMPT_PATH="${$(print -P %3~)%/*}/"
    fi
  fi

  echo "%{$fg_bold[cyan]%}${PROMPT_PATH}%{$reset_color%}%{$fg[red]%}%1~%{$reset_color%}"
}

PROMPT='$(directory_name)%{$fg_bold[blue]%} $(git_prompt_info) `prompt_char` %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ⤮"
ZSH_THEME_GIT_PROMPT_DELETED=" ⨯"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
