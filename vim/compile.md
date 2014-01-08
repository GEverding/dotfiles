# Compiling Vim/gVim for Ubuntu 12.04

## Dependencies
```
$ sudo apt-get install libncurses5-dev \
  libgnome2-dev \
  libgnomeui-dev \
  libgtk2.0-dev \
  libatk1.0-dev \
  libbonoboui2-dev \
  libcairo2-dev\
  libx11-dev\
  libxpm-dev\
  libxt-dev
```

## Install

```
$ hg clone http://code.google.com/p/vim/
$ hg update default
$ ./configure --prefix=/usr/local \
  --enable-gui=no \
  --without-x \
  --disable-nls \
  --with-tlib=ncurses \
  --enable-multibyte \
  --enable-pythoninterp \
  --with-features=huge \
  --enable-gui=gnome2 \
  --with-compiledby="GEverding <garrett.everding92@gmail.com>" \
  --enable-cscope
$ make
$ make install
```


