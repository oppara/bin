#!/bin/sh

PREFIX='/usr/local/'
PWD=`pwd`
SO='/usr/libexec/apache2/libphp4.so'

build() {
  make distclean

  EXTENSION_DIR=${1}lib/extensions/
  export EXTENSION_DIR

  CFLAGS=-I/opt/local/include  LDFLAGS="-L/opt/local/lib"
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
  --with-config-file-path=${1}/etc \
  --with-pear=${1}/pear \
  --enable-cli \
  --enable-force-cgi-redirect \
  --enable-mbstring \
  --enable-mbregex \
  --enable-zend-multibyte \
  --enable-memory-limit \
  --with-iconv-dir=/usr \
  --enable-sockets \
  --enable-ftp \
  --with-curl \
  --enable-exif \
  --with-mysql=/usr/local/mysql \
  --with-pgsql=/usr/local/postgresql \
  --enable-zip \
  --with-bz2 \
  --with-zlib \
  --with-zlib-dir=/usr/local \
  --with-gettext=/usr/local \
  --with-mcrypt=/usr/local \
  --with-xmlrpc \
  --enable-xml \
  --with-xsl \
  --with-dom \
  --with-gd \
  --with-jpeg-dir=/usr/local \
  --with-png-dir=/usr/local \
  --with-freetype-dir=/usr/local \
  --with-t1lib=/usr/local \
  --enable-gd-native-ttf \
  --enable-gd-jis-conv \
  --with-ttf \
  && make all

}

complete() {
    echo "\nPREFIX => ${PREFIX}"
    echo 'TYPE: sudo make install'
}

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

build ${PREFIX} && complete

