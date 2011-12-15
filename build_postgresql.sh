#!/bin/sh

PREFIX='/usr/local/'
PWD=`pwd`

build() {
make distclean
./configure \
  CFLAGS=-O2 \
  --prefix=${1} \
  --with-rendezvous \
  --enable-multibyte \
  --enable-syslog \
  --with-bonjour \
  --with-openssl  \
  --with-libxml \
   && make
}


VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

build ${PREFIX}

if [ -e ${PREFIX} -a -d ${PREFIX} ]
then
  sudo rm -rf ${PREFIX}
fi
sudo mkdir -p ${PREFIX}

echo "\nPREFIX => ${PREFIX}"
echo 'TYPE: sudo make install'

# /path/to/bin/postgres -D /path/to/data
    # or
# /path/to/bin/pg_ctl -D /path/to/data -l logfile start
