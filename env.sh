export PATH=export PATH=/data/toolchain/bin:$PATH

export PREFIX=/data/data/jackpal.androidterm/app_HOME/local
export CC=arm-linux-androideabi-gcc
export LD=arm-linux-androideabi-ld
export CXX=arm-linux-androideabi-c++
export AR=arm-linux-androideabi-ar
export RANLIB=arm-linux-androideabi-ranlib
export HOSTCONFIG=arm-linux-androideabi

mkdir -p archives
mkdir -p build

function android-configure() {
  ./configure --prefix $PREFIX --host $HOSTCONFIG "$@"
}
