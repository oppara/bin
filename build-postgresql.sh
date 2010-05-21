PREFIX='/usr/local/postgresql_type/'

build() {
make distclean
./configure \
  CFLAGS=-O2 \
  --prefix=${1} \
  --with-rendezvous \
  --enable-multibyte \
  --enable-syslog \
   && make 
}

VER=`basename $PWD`
PREFIX=${PREFIX}${VER}

echo "PREFIX => ${PREFIX}"

build ${PREFIX} 

sudo mkdir -p ${PREFIX} 
# sudo makie install
