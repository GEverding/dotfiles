#!/bin/sh
OHMY=.oh-my-zsh
OLD=/tmp/old

if [ ! -d $OLD ]; then
  mkdir $OLD
fi

# set up symlinks
echo "Creating sym links..."

FILES=`ls -a | grep "^\." \
  | sed \
      -e "1,2d" \
      -e "/\.git$/d" \
      -e "/\.gitmodules$/d" \
      -e "/\.gitignore$/d" \
`

for FILE in $FILES
do
  DEST=$HOME/$FILE
  if [ -e $DEST ]; then
    mv $DEST $OLD/$FILE
  fi
  ln -sf `pwd`/$FILE $HOME/$FILE
done

# install zsh config
echo "Installing zsh config..."
if [ -d $HOME/$OHMY ]; then
  mv $HOME/$OHMY $OLD/$OHMY
fi

git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/$OHMY
ln -sf `pwd`/GEverding.zsh-theme $HOME/$OHMY/themes/GEverding.zsh-theme


echo "Installing tmux powerline..."
git clone git://github.com/erikw/tmux-powerline.git $HOME/.tmux-powerline

hash pip  &> /dev/null
if [ $? -eq 1 ]; then
  echo >&2 "pip was not found.  could not install powerline"
else
  echo "Installing Vim Powerline..."
  pip install --user git+git://github.com/Lokaltog/powerline
fi

echo "Installing Patched Fonts...."
git clone https://gist.github.com/1630581.git $HOME/.fonts/ttf-dejavu-powerline
git clone git://github.com/Lokaltog/powerline-fonts.git $HOME/.fonts/powerline-fonts
fc-cache -vf ~/.fonts
echo "Finished Installing Patched Fonts"

echo "Changing shell to /bin/zsh ..."
chsh -s /usr/bin/zsh

echo "Instaling deliver..."
git clone git://github.com/gerhard/deliver.git ~/.deliver

echo "Installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "update/install plugins using Vundle"
vim +BundleInstall! +BundleClean +qall

