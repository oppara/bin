#!/bin/sh

PREFIX='/usr/local/'
PWD=`pwd`
SO='/usr/libexec/apache2/libphp5.so'


build() {
  make distclean

  EXTENSION_DIR=${1}/lib/extensions/
  export EXTENSION_DIR

  # MACOSX_DEPLOYMENT_TARGET=10.7
  # export MACOSX_DEPLOYMENT_TARGET
  CFLAGS='-arch x86_64 -g -Os -pipe -no-cpp-precomp'
  CCFLAGS='-arch x86_64 -g -Os -pipe'
  CXXFLAGS='-arch x86_64 -g -Os -pipe'
  LDFLAGS='-arch x86_64 -bind_at_load'
  export CFLAGS CXXFLAGS LDFLAGS CCFLAGS

  EXTRA_LIBS='-lresolv'
  export EXTRA_LIBS

  ./configure \
  --prefix=${1} \
  --with-apxs2=/usr/sbin/apxs \
  --with-config-file-path=${1}/etc/ \
  --with-pear=${1}/pear \
  --enable-cli \
  --enable-mbstring \
  --enable-mbregex \
  --enable-zend-multibyte \
  --with-iconv-dir=/usr \
  --enable-sockets \
  --enable-ftp \
  --with-curl \
  --with-openssl \
  --enable-zip \
  --with-zlib \
  --enable-xml \
  --enable-dom \
  --with-xsl \
  --with-xmlrpc \
  --enable-exif \
  --with-gd \
  --with-jpeg-dir=/usr/local \
  --with-png-dir=/usr/local \
  --with-freetype-dir=/usr/local \
  --with-t1lib=/usr/local \
  --with-ttf \
  --enable-gd-native-ttf \
  --enable-gd-jis-conv \
  --with-kerberos=/usr \
  --with-mcrypt \
  --with-mysqli='/usr/local/mysql/bin/mysql_config' \
  --with-mysql='/usr/local/mysql' \
  --with-pgsql=/usr/local/postgresql \
  --enable-pdo \
  --with-pdo-mysql='/usr/local/mysql' \
  --with-pdo-pgsql=/usr/local/postgresql \
  --enable-sqlite-utf8 \
  && make all

  # # --disable-phar \


}

complete() {
    echo "\nPREFIX => ${PREFIX}"
    echo 'TYPE: sudo make install'
}

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

build ${PREFIX} && complete

