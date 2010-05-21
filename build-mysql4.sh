PREFIX='/usr/local/mysql_type/'

build() {
make distclean
./configure \
  CFLAGS=-O2 \
  --prefix=${1} \
  --with-extra-charsets=all \
  --with-isam \
  --with-innodb \
  --with-archive-storage-engine \
  --with-csv-storage-engine \
  --with-blackhole-storage-engine \
  --with-zlib-dir=/opt/local/ \
  --without-debug \
  --without-man \
  --without-docs \
  --with-unix-socket-path=/tmp/${1}.sock
   && make 
}

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

echo "PREFIX => ${PREFIX}"
sudo mkdir -p ${PREFIX} 

build ${PREFIX} 

# sudo makie install
