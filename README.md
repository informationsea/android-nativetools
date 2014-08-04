Patches for Android Native Tools

Prepare toolkit
===============

1. Download [Android NDK][ndk]
2. Install NDK

        sudo mkdir -p /data
        sudo chown USERNAME:GROUPNAME /data  # DO NOT FORGOT TO CHANGE
        mkdir -p /data/jackpal.androidterm/app_HOME
        cd PATH_TO/android-ndk-r10/build/tools/
        bash ./make-standalone-toolchain.sh --ndk-dir=$PWD/../.. --install-dir=/data/toolchain-arm --platform=android-9 --system=linux-x86

[ndk]: https://developer.android.com/tools/sdk/ndk/index.html

How to build?
=============

First, run `source env.sh` to set environment variables

zlib
----

    wget http://zlib.net/zlib-1.2.8.tar.gz
    tar xzf zlib-1.2.8.tar.gz
    cd zlib-1.2.8
    ./configure --prefix $PREFIX
    make
    make install

dropbear
--------

    wget https://matt.ucc.asn.au/dropbear/releases/dropbear-2014.64.tar.bz2
    cd dropbear-2014.64
    patch -p2 < PATH\_TO/dropbear-2014.64.patch
    ./configure --prefix $PREFIX --host $HOSTCONFIG --disable-syslog --disable-loginfunc --with-zlib=/data/data/jackpal.androidterm/app_HOME/local --disable-utmp --disable-utmpx --disable-wtmp --disable-wtmpx --disable-pututline --disable-pututxline --without-pam
    make
    make install

ncurses
-------

    wget http://www.ring.gr.jp/archives/GNU/ncurses/ncurses-5.9.tar.gz
    cd ncurses-5.9
    patch -p2 < PATH\_TO/ncurses-5.9.patch
    ./configure --prefix $PREFIX --host $HOSTCONFIG
    make
    make install

zsh
---

    wget http://downloads.sourceforge.net/project/zsh/zsh/5.0.5/zsh-5.0.5.tar.bz2
    cd zsh-5.0.5
    patch -p2 < PATH\_TO/zsh-5.0.5.patch
    ./configure --prefix $PREFIX --host $HOSTCONFIG
    make
    make install

