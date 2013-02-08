# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="GEverding"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ll="ls -alhF --group-directories-first"
alias la="ls -A"
alias l="ls -CF --group-directories-first"
alias tmux="tmux -2"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, npm)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# tmux stuff
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PLATFORM="linux"

#USE_PATCHED_FONT=false
# Customize to your needs...
PATH=$PATH:$HOME/local/bin:$HOME/.cabal/bin:$HOME/bin:$HOME/.local/bin:$HOME/.deliver/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
