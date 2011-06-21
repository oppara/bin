#!/bin/sh

#
# phpの切り替え
#

PHP=`which php`
VERSION=`$PHP -v  | tr '\n' '\040' | awk '{print $2}'`
VERSION=`$PHP -v`
MAJOR_VERSION=`$PHP -v  | tr '\n' '\040' | awk '{print $2}'|awk -F . '{print $1}'`

PHP_LINK="/usr/local/php"
PHP_4="/usr/local/php-4.4.9"
PHP_52="/usr/local/php-5.2.6"
PHP_53="/usr/local/php-5.3.5"

NEXT_VERSION=4
if [ $MAJOR_VERSION -eq 4 ]; then
  NEXT_VERSION=5
  PHP_PATH=$PHP_52
fi


if [ $NEXT_VERSION -eq 4 ]; then
cat <<_EOF_
------------------------------------------------------------
${VERSION}
------------------------------------------------------------
change PHP${NEXT_VERSION}? (y|n);
------------------------------------------------------------
_EOF_
else
cat <<_EOF_
------------------------------------------------------------
${VERSION}
------------------------------------------------------------
change PHP${NEXT_VERSION}
[2] php-5.2.6
[3] php-5.3.5
------------------------------------------------------------
_EOF_
fi

sw_php()
{
    echo "swtch php${1}..."
    sudo rm ${PHP_LINK}
    sudo ln -s ${2} ${PHP_LINK}
    echo "restart apache..."
    APACHE=`which apachectl`
    sudo ${APACHE} restart
    echo "============================================================"
    $PHP -v
    echo "============================================================"
}

read ans
case $ans in
  y|Y)
    sw_php ${NEXT_VERSION} ${PHP_4}
    ;;
  2)
    sw_php ${NEXT_VERSION} ${PHP_52}
    ;;
  3)
    sw_php ${NEXT_VERSION} ${PHP_53}
    ;;
  *)
    echo  "no swtch."
    exit 0
    ;;
esac
