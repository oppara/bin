#!/bin/sh

#
# phpの切り替え
#
# pearのエイリアス設定(.zshrc or .bashrc)
# alias pear='pear -C /usr/local/php/etc/pear.conf $@'
#

PHP_LIB="/usr/local"
PHP_LINK="${PHP_LIB}/php"

PHP=`which php`
CURRENT_VERSION=`"$PHP" -v  | tr '\n' '\040' | awk '{print $2}'`


cat <<_EOF_
------------------------------------------------------------
current version php-${CURRENT_VERSION}.  choose from below...
------------------------------------------------------------
_EOF_


find_phps() {
  find $PHP_LIB -name 'php-*' -depth 1 2>/dev/null
}

sw_php() {
    echo "============================================================"
    echo "swtch to php-${1}..."
    echo "sudo ln -s ${2} ${PHP_LINK}"
    sudo rm ${PHP_LINK}
    sudo ln -s ${2} ${PHP_LINK}
    echo "restart apache"
    APACHE=`which apachectl`
    sudo ${APACHE} restart
    echo "done."
    echo "============================================================"
    $PHP -v
    echo "============================================================"
}

get_ver() {
  ver=`echo "$1" | tr '/-' '\040' | awk '{print $4}'`
}


cnt=0;
find_phps | while read line
do
  get_ver "$line"
  if [ "$ver" = "$CURRENT_VERSION" ]; then
    continue
  fi
  echo "[${cnt}] ${ver}"
  cnt=`expr $cnt + 1`
done
echo "[q] quit"


read ans


if [ "$ans" = "q" ]; then
  exit 0
fi


done=""
cnt=0;
for line in `find_phps`
do
  get_ver "$line"
  if [ "$ver" = "$CURRENT_VERSION" ]; then
    continue
  fi
  if [ "$cnt" = "$ans" ]; then
    sw_php $ver $line
    done="done"
    break
  fi
  cnt=`expr $cnt + 1`
done

if [ "$done" = "done" ]; then
  exit 0
fi


cat <<_EOF_

////////////////////////////////////////////////////////////
         nothing happens. chose undefined element.
////////////////////////////////////////////////////////////
_EOF_
exit 1
