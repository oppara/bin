buildphp() {
PREFIX=/usr/local/php_type/$1

make distclean
EXTENSION_DIR=${PREFIX}lib/extensions/
export EXTENSION_DIR

./configure \
  --prefix=${PREFIX} \
  --with-apxs2=/usr/sbin/apxs \
  --with-config-file-path=${PREFIX}/etc \
  --with-pear=${PREFIX}/pear \
  --enable-cli \
  --enable-force-cgi-redirect \
  --enable-mbstring \
  --enable-mbregex \
  --enable-zend-multibyte \
  --enable-memory-limit \
  --enable-sockets \
  --enable-ftp \
  --with-curl \
  --with-iconv=/opt/local \
  --with-mysql=/usr/local/mysql \
  --with-pgsql=/usr/local/pgsql \
  --with-xpm-dir \
  --enable-xml \
  --with-xsl \
  --with-dom \
  --with-xmlrpc \
  --with-expat-dir=/opt/local/ \
  --with-zlib \
  --with-bz2 \
  --with-gettext=/opt/local/ \
  --enable-exif \
  --with-gd='/opt/local/' \
  --with-freetype \
  --with-ttf \
  --with-jpeg-dir='/opt/local/' \
  --with-png-dir='/opt/local/' \
  --enable-gd-native-ttf \
  --enable-gd-jis-conv \
  --with-freetype-dir='/opt/local/' \
  --with-mcrypt='/usr/local' \
   && make all
}
PHPVER=`basename $PWD`

buildphp ${PHPVER} 
