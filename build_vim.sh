#!/bin/sh

PREFIX="${HOME}/local"
SRC="${HOME}/src/vim"

ORG_LANG=`echo $LANG`
export LANG=C

if [ -e ${SRC} ]; then
  cd ${SRC}
  hg pull -u
else
  hg clone https://vim.googlecode.com/hg ${SRC}
  cd ${SRC}
fi

./configure --prefix=${PREFIX} \
--with-features=huge \
--disable-selinux \
--disable-gui \
--with-tlib=ncurses \
--enable-rubyinterp \
--without-x

make clean

make && cat<<EOT
------------------------------
done.
todo: make install
EOT

# make install

export LANG="${ORG_LANG}"


