#!/bin/sh

source env.sh

PROGNAME=wget-1.9.1.tar.gz

pushd archives
curl -O http://ring.tains.tohoku.ac.jp/archives/GNU/wget/$PROGNAME
popd

pushd build
tar xzf ../archives/$PROGNAME
pushd `basename $PROGNAME .tar.gz`
patch -p2 < ../../patches/`basename $PROGNAME .tar.gz`.patch
./configure --prefix $PREFIX --host $HOST
make
make install
popd
popd
