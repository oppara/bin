#!/bin/sh

#
# rsyncを使用した デプロイ用スクリプト
#


SRC="hoge"
DIST="moge"
EXCLUDE_FILE="exclude"


cat <<_EOF_
[u]pdate  - updete.
[m]irror  - update & delete files that don't exist on sender.
[d]ry-run - dry-run.
_EOF_

read res
case $res in
  u)
    MODE="UPDATE (from ${SRC} to ${DIST})"
    OPTS=""
  ;;
  m)
    MODE="MIRROR (UPDATE & DELETE FILES THAT DON'T EXIST ON SENDER)"
    OPTS=" --delete "
  ;;
  d)
    MODE="DRY-RUN"
    OPTS=" --dry-run  --delete "
  ;;
  *)
  echo  'Select (u|m|d|r)'
  exit 1
  ;;
esac


RSYNC=`which rsync`
OPTS=
EXCLUDE=""

if [ -e ${EXCLUDE_FILE} ] 
then 
  EXCLUDE="--exclude-from=${EXCLUDE_FILE}"
fi

echo "==== START ${MODE} ===="
${RSYNC} -apuzv ${OPTS} ${EXCLUDE} -e ssh ${SRC} ${DIST}
echo "==== END ===="
