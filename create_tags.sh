#!/bin/sh
set -eu

#  tagを生成する
#
# http://at-grandpa.hatenablog.jp/entry/2015/10/28/224920
#

if [ $# -gt 0 ]; then
    target=$1
else
    target=$(pwd)
fi

make -f ${HOME}/bin/create_tags/Makefile TARGET_PATH=$target
