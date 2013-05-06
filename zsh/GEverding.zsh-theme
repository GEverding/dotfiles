
# Set prompt char
prompt_char() {
  if [ $UID -eq 0 ]
  then
    color="%{$fg_bold[yellow]%}"

  else
    color="%{$fg_bold[blue]%}"
  fi
  echo $color'❱'
}

directory_name() {
  PROMPT_PATH=""

  PRESENT=`dirname ${PWD}`
  if [[ $PRESENT = / ]]; then
    PROMPT_PATH=""
  elif [[ $PWD = $HOME ]]; then
    PROMPT_PATH=""
  else
    if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
      # We're in a git repo.
      BASE=$(basename $(git rev-parse --show-toplevel))
      if [[ $PWD = $(git rev-parse --show-toplevel) ]]; then
        # We're in the root.
        PROMPT_PATH=""
      else
        # We're not in the root. Display the git repo root.
        PROMPT_PATH="%{$fg_bold[magenta]%}${BASE}%{$reset_color%}/"
      fi
    else
      PROMPT_PATH=$(print -P %3~)
      PROMPT_PATH="${PROMPT_PATH%/*}/"
    fi
  fi
  PRESENT=""

  echo "%{$fg_bold[cyan]%}$PROMPT_PATH%{$reset_color%}%{$fg[red]%}%1~%{$reset_color%}"
}

PROMPT='$(directory_name)%{$fg_bold[blue]%} $(git_prompt_info) `prompt_char` %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ⤮"
ZSH_THEME_GIT_PROMPT_DELETED=" ⨯"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
