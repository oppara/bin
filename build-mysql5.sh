PREFIX='/usr/local/mysql_type/'

build() {
make distclean
./configure \
  CFLAGS=-O2 \
  --prefix=${1} \
  --with-charset=utf8 \
  --with-extra-charsets=all \
  --with-isam \
  --with-innodb \
  --with-archive-storage-engine \
  --with-csv-storage-engine \
  --with-blackhole-storage-engine \
  --with-zlib-dir=/opt/local/ \
  --with-openssl=/opt/local/ \
  --without-debug \
  --without-man \
  --without-docs \
  --without-bench \
   && make 
}

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

echo "PREFIX => ${PREFIX}"

build ${PREFIX} 

sudo mkdir -p ${PREFIX} 
# sudo makie install
