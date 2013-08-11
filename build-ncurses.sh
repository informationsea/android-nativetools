#!/bin/sh

source env.sh

pushd archives
curl -O http://ring.tains.tohoku.ac.jp/archives/GNU/ncurses/ncurses-5.9.tar.gz
popd

pushd build
tar xzf ../archives/ncurses-5.9.tar.gz
pushd ncurses-5.9
patch -p2 < ../../patches/ncurses-5.9.patch
./configure --prefix $PREFIX --host $HOST --with-shared 
make
make install
popd
popd
