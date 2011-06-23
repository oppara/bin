#!/usr/bin/env perl
use strict;
use warnings;

# ファイルの文字数をカウントする
# @see http://www.din.or.jp/~ohzaki/perl.htm#JP_Split

use utf8;
use Encode;

if ($#ARGV < 0 ) {
    print <<EOF;
Usage:
    $0 file [(shiftjis|eucjp|utf8)]

default shiftjis
EOF
    exit(0);
}

my $file = $ARGV[0] || './mail.txt';
my $enc  = $ARGV[1] || 'shiftjis';
my $body = '';

my $ascii      = '[\x00-\x7F]';
my $twoBytes   = '[\x8E\xA1-\xFE][\xA1-\xFE]';
my $threeBytes = '\x8F[\xA1-\xFE][\xA1-\xFE]';

open my $fh, "<", $file or die "$file : $!";
while ( <$fh> ) {
    my $line = $_;
    $line =~ s/\x0D?\x0A?$//;
    my $utf8 = decode( $enc, $line );
    $body .= encode( 'eucjp', $utf8 );
}

my @ascii     = $body =~ /$ascii/og;
my @non_ascii = $body =~ /$twoBytes|$threeBytes/og;

my $cnt_ascii     = scalar @ascii;
my $half = $cnt_ascii /2;
my $cnt_non_ascii = scalar @non_ascii;
print '--------------------------------', "\n";
printf( "ascii:     %d(%d)\n", $cnt_ascii, $half );
printf( "non ascii: %d\n", $cnt_non_ascii );
print '--------------------------------', "\n";
printf( "total:     %d(%d)\n", $cnt_ascii + $cnt_non_ascii, $half + $cnt_non_ascii );
