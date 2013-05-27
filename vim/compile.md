# Compiling Vim/gVim for Ubuntu 12.04

## Requirements
* libncurses5-dev


## Install
```
$ ./configure --prefix=/usr/local \
  --enable-gui=no \
  --without-x \
  --disable-nls \
  --with-tlib=ncurses \
  --enable-multibyte \
  --enable-pythoninterp \
  --with-mac-arch-x86_64 \
  --with-feature=huge \
  --enable-gui=gnome2 \
  --with-compiledby="GEverding <garrett.everding92@gmail.com>"
  --enable-cscope
$ make
$ sudo make install
```


