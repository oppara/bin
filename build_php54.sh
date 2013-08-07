#!/bin/sh

PREFIX='/usr/local/'
PWD=`pwd`
SO='/usr/libexec/apache2/libphp5.so'


build() {
  make distclean

  EXTENSION_DIR=${1}/lib/extensions/
  export EXTENSION_DIR
  export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

  CFLAGS='-arch x86_64 -g -Os -pipe -no-cpp-precomp'
  CCFLAGS='-arch x86_64 -g -Os -pipe'
  CXXFLAGS='-arch x86_64 -g -Os -pipe'
  LDFLAGS='-arch x86_64 -bind_at_load -L/usr/local/opt/libtool/lib -L/usr/local/opt/libiconv/lib -L/usr/local/opt/openssl/lib'
  CPPFLAGS='-I/usr/local/opt/libtool/include -I/usr/local/opt/libiconv/include -I/usr/local/opt/openssl/include'
  export CFLAGS CXXFLAGS LDFLAGS CCFLAGS CPPFLAGS

  EXTRA_LIBS='-lresolv'
  export EXTRA_LIBS

  ./configure \
  --prefix=${1} \
  --with-apxs2=/usr/sbin/apxs \
  --with-config-file-path=${1}/etc/ \
  --with-pear=${1}/pear \
  && make all
}

  # --enable-mbstring \
  # --with-pcre-regex \
  # --with-iconv-dir=$(brew --prefix libiconv) \
  # --with-gettext=/usr/local \
  # --enable-pdo \
  # --with-pdo-pgsql=/usr/local/postgresql \
  # --with-pgsql=/usr/local/postgresql \
  # --enable-sqlite-utf8 \
  # --with-pdo-mysql=/usr/local/mysql \
  # --with-mysqli=/usr/local/mysql/bin/mysql_config \
  # --with-mysql=/usr/local/mysql \
  # --enable-sockets \
  # --enable-ftp \
  # --with-curl \

  # --with-openssl=$(brew --prefix openssl) \

  # --enable-exif \
  # --with-gd \
  # --with-jpeg-dir=/usr/local \
  # --with-png-dir=/usr/local \
  # --with-freetype-dir=/usr/local \
  # --with-t1lib=/usr/local \
  # --enable-gd-native-ttf \
  # --enable-gd-jis-conv \
  # --enable-zip \
  # --with-zlib \
  # --enable-xml \
  # --enable-dom \
  # --with-xmlrpc \
  # --with-xsl \

  # --with-mcrypt \
  # --enable-pcntl \
  # --enable-intl \

  # --with-libxml-dir=$(brew --prefix libxml2) \
  # --with-kerberos=/usr \
  # --with-icu-dir=$(brew --prefix icu4c) \

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

build ${PREFIX}

# if [ -e ${PREFIX} -a -d ${PREFIX} ]
# then
  # sudo rm -rf ${PREFIX}
# fi
# sudo mkdir -p ${PREFIX}

# if [ -e ${SO} ]
# then
  # sudo mv ${SO} '${PREFIX}/etc/.'
# fi

echo "\nPREFIX => ${PREFIX}"
echo 'TYPE: sudo make install'
