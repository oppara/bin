#!/bin/sh

#
# phpの切り替え
#

PHP=`which php`
VERSION=`$PHP -v`
MAJOR_VERSION=`$PHP -v  | tr '\n' '\040' | awk '{print $2}'|awk -F . '{print $1}'`

# ls /usr/local |grep 'php-.*'|sort

PHP_LINK="/usr/local/php"
PHP_PATH="/usr/local/php-4.4.9"

NEXT_VERSION=4
if [ $MAJOR_VERSION -eq 4 ]; then
 NEXT_VERSION=5
 PHP_PATH="/usr/local/php-5.2.13"
fi

cat <<_EOF_
------------------------------------------------------------
${VERSION}
------------------------------------------------------------
change PHP${NEXT_VERSION}? (y|n);
------------------------------------------------------------
_EOF_

read ans
case $ans in
 y|Y)
   echo "swtch php${NEXT_VERSION}..."
   sudo rm ${PHP_LINK}
   sudo ln -s ${PHP_PATH} ${PHP_LINK}
   echo "restart apache..."
   APACHE=`which apachectl`
   sudo ${APACHE} restart
   $PHP -v
   ;;
 *)
   echo  "no swtch."
   exit 0
   ;;
esac
