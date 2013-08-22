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
  LDFLAGS='-arch x86_64 -bind_at_load -L/usr/local/opt/libtool/lib -L/usr/local/opt/openssl/lib'
  CPPFLAGS='-I/usr/local/opt/libtool/include -I/usr/local/opt/openssl/include'
  export CFLAGS CXXFLAGS LDFLAGS CCFLAGS CPPFLAGS

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
  --with-pcre-regex \
  --enable-zend-multibyte \
  --with-iconv-dir=/usr/lib \
  --enable-sockets \
  --enable-ftp \
  --with-curl \
  --with-openssl=$(brew --prefix openssl) \
  --enable-zip \
  --with-zlib \
  --enable-xml \
  --enable-dom \
  --with-xsl \
  --with-xmlrpc \
  --enable-exif \
  --with-gd \
  --with-jpeg-dir=$(brew --prefix jpeg) \
  --with-png-dir=$(brew --prefix libpng) \
  --with-freetype-dir=$(brew --prefix freetype) \
  --with-ttf \
  --enable-gd-native-ttf \
  --enable-gd-jis-conv \
  --with-mcrypt \
  --with-mysqli=$(brew --prefix mysql)/bin/mysql_config \
  --with-mysql=$(brew --prefix mysql) \
  --with-pgsql=$(brew --prefix postgresql) \
  --enable-pdo \
  --with-pdo-mysql=$(brew --prefix mysql) \
  --with-pdo-pgsql=$(brew --prefix postgresql) \
  --enable-sqlite-utf8 \
  && make all

}

complete() {
    echo "\nPREFIX => ${PREFIX}"
    echo 'TYPE: sudo make install'
}

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

build ${PREFIX} && complete

