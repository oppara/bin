#!/bin/sh
set -eu

# Mitzyuki's Blog :: QuickLook と日本語
# https://blog.bsdhack.org/index.cgi/Mac/20081029.htm

xattr -w com.apple.TextEnvoding "SHIFT_JIS;2561" $1


# ASCII	MACINTOSH;0
# EUC-JP	EUC-JP;2361
# MS漢字コード	SHIFT_JIS;2561
# JIS	ISO-2022-JP;2080
# UTF-8	UTF-8;134217984
