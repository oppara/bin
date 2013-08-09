#!/bin/sh

PREFIX='/usr/local/'
PWD=`pwd`
SO='/usr/libexec/apache2/libphp4.so'

build() {
  make distclean

  EXTENSION_DIR=${1}lib/extensions/
  export EXTENSION_DIR

  CFLAGS='-arch x86_64 -g -Os -pipe -no-cpp-precomp'
  CCFLAGS='-arch x86_64 -g -Os -pipe'
  CXXFLAGS='-arch x86_64 -g -Os -pipe'
  LDFLAGS='-arch x86_64 -bind_at_load -L/usr/local/opt/libtool/lib -L/usr/local/opt/openssl/lib'
  CPPFLAGS='-I/usr/local/opt/libtool/include -I/usr/local/opt/openssl/include'
  export CFLAGS CXXFLAGS LDFLAGS CCFLAGS CPPFLAGS

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
  --with-mysql=$(brew --prefix mysql) \
  --with-pgsql=$(brew --prefix postgresql) \
  --enable-zip \
  --with-bz2 \
  --with-zlib \
  --with-zlib-dir=/usr/local \
  --with-gettext=$HOME/usr \
  --with-mcrypt=$(brew --prefix mcrypt) \
  --with-xmlrpc \
  --enable-xml \
  --with-xsl \
  --with-dom \
  --with-gd \
  --with-jpeg-dir=$(brew --prefix jpeg) \
  --with-png-dir=$(brew --prefix libpng) \
  --with-freetype-dir=$(brew --prefix freetype) \
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

