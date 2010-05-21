buildphp() {
PREFIX=/usr/local/php_type/$1
make distclean
EXTENSION_DIR=${PREFIX}/lib/extensions/
export EXTENSION_DIR

./configure \
  --prefix=${PREFIX} \
  --with-apxs2=/usr/sbin/apxs \
  --with-config-file-path=${PREFIX}/etc/ \
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
  --with-mysql='/usr/local/mysql' \
  --with-mysqli='/usr/local/mysql/bin/mysql_config' \
  --enable-pdo \
  --with-pdo-mysql='/usr/local/mysql' \
  --with-pgsql=/usr/local/pgsql \
  --enable-sqlite-utf8 \
  --enable-exif \
  --with-gd \
  --with-jpeg-dir='/opt/local' \
  --with-png-dir='/opt/local' \
  --with-freetype \
  --with-freetype-dir='/opt/local' \
  --with-ttf \
  --enable-gd-native-ttf \
  --enable-gd-jis-conv \
  --with-gettext='/opt/local' \
  --with-xpm-dir \
  --enable-xml \
  --enable-dom \
  --with-xmlreader \
    --with-xmlwriter \
    --with-xmlrpc \
    --with-xsl \
    --with-expat-dir='/opt/local' \
    --with-zlib \
    --with-zlib-dir='/opt/local' \
    --with-bz2 \
    --with-soap \
    --with-mcrypt='/usr/local' \
   && make all
}
PHPVER=`basename $PWD`
buildphp ${PHPVER}

