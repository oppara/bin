#!/bin/sh

PREFIX="${HOME}/local"
BRANCH="vim73"
SRC="${HOME}/src/vim"

ORG_LANG=`echo $LANG`
export LANG=C

if [ -e ${SRC} ]; then
  rm -rf ${SRC}
fi

hg clone https://vim.googlecode.com/hg ${SRC}

cd ${SRC}

hg update $BRANCH
hg pull

./configure --prefix=${PREFIX} \
--with-features=big \
--enable-multibyte \
--enable-xim \
--enable-fontset \
--enable-rubyinterp \
--disable-selinux \
--disable-gui \
--without-x

make clean
make
# make install

export LANG="${ORG_LANG}"

cat<<EOT
------------------------------
done.
make install
EOT

