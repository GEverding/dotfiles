#!/bin/bash

OHMY=.oh-my-zsh
OLD=/tmp/old
DOTFILES="`pwd`"

set -e

echo ''


info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

create_bkp()
{
  info "Creating Backup Directory $OLD"
  if [ ! -d $OLD ]; then
    mkdir -p $OLD
  fi
  success "Backup Directory Created"
}


link_files () {
  ln -sf $1 $2
  success "linked $1 to $2"
}

git_clone () {
  git clone $1 $2
  success "cloned $1 to $2"
}


install_dotfiles () {
  info 'installing dotfiles...'

  overwrite_all=false
  backup_all=false
  skip_all=false
  for source in `find $DOTFILES -maxdepth 2 -name \*.symlnk`
  do


    dest="$HOME/.`basename \"${source%.*}\"`"
    info "$dest"

    if [ -f $dest ] || [ -d $dest ]
    then

      overwrite=false
      backup=false
      skip=false

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
      then
        rm -rf $dest
        success "removed $dest"
      fi

      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
      then
        mv $dest $OLD
        success "moved $dest to $OLD"
      fi

      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
      then
        link_files $source $dest
      else
        success "skipped $source"
      fi

    else
      link_files $source $dest
    fi

  done
}

install_ohmy()
{
  # install zsh config
  info "Installing zsh config..."
  if [ -d $HOME/$OHMY ] || [ -f $HOME/$OHMY ]; then
    rm -rf $HOME/$OHMY
  fi
  git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/$OHMY
  link_files $DOTFILES/zsh/GEverding.zsh-theme $HOME/$OHMY/themes/GEverding.zsh-theme

  info "Changing shell to /bin/zsh"
  chsh -s /usr/bin/zsh
}

install_powerline()
{
  info "Installing tmux Powerline"

  if [ -d $HOME/.tmux-powerline ] || [ -f $HOME/.tmux-powerline ]; then
    rm -fr $HOME/.tmux-powerline
  fi
  git clone git://github.com/erikw/tmux-powerline.git $HOME/.tmux-powerline
  link_files $DOTFILES/tmux/geverding-tmux.sh $HOME/.tmux-powerline/themes/geverding-tmux.sh

  hash pip  &> /dev/null
  if [ $? -eq 1 ]; then
    info "pip was not found.  Attempting to install"
    sudo apt-get -y install python-pip
  fi

  hash pip  &> /dev/null
  if [ $? -eq 1 ]; then
    info "pip was not found"
    sudo apt-get install python-pip
  else
    info "Installing Vim Powerline"
    pip install --user git+git://github.com/Lokaltog/powerline
  fi
}

setup_fonts()
{
  info "Preparing to Install Fonts"

  if [ -d $HOME/.fonts ] || [ -f $HOME/.fonts ]; then
    mv $HOME/.fonts $OLD/.fonts
  fi

  info "Installing Patched Fonts"
  #git_clone https://gist.github.com/1630581.git $HOME/.fonts/ttf-dejavu-powerline
  git_clone git://github.com/Lokaltog/powerline-fonts.git $HOME/.fonts/powerline-fonts
  fc-cache -vf ~/.fonts
  success "Finished Installing Patched Fonts"
}

setup_vim()
{
  info "Setting up vim"
  if [ -d $HOME/.vim ] || [ -f $HOME/.vim ]; then
    mv $HOME/.vim $OLD/.vim
  fi

  link_files $DOTFILES/vim/vim $HOME/.vim

  info "Installing Vundle"
  git_clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
  success "Vundle Installed"

  info "Installing vim plugins"
  vim +BundleInstall! +BundleClean +qall
  success "Vim Plugins Finshed Installing"

  success "Vim Setup Complete"
}



create_bkp
install_ohmy
install_dotfiles
install_powerline
setup_fonts
setup_vim

