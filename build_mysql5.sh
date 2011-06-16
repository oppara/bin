#!/bin/sh

PREFIX='/usr/local/mysql_versions/'
PWD=`pwd`

build() {
make distclean
./configure \
  CFLAGS=-O2 \
  --prefix=${1} \
  --with-charset=utf8 \
  --with-extra-charsets=all \
  --with-isam \
  --with-innodb \
  --with-archive-storage-engine \
  --with-csv-storage-engine \
  --with-blackhole-storage-engine \
  --with-zlib-dir=/opt/local/ \
  --with-openssl=/opt/local/ \
  --without-debug \
  --without-man \
  --without-docs \
  --with-unix-socket-path=/tmp/${1}.sock
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
