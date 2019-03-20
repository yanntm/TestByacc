#! /bin/bash

set -x


# an IDIR = install folder
if [ ! -d usr/local ]; 
then
	mkdir usr
	cd usr
	mkdir local
	cd ..
fi

export IDIR=$(pwd)/usr/local/
export PATH=$IDIR/bin:$PATH


if [ ! -f $IDIR/bin/byacc ];
then
    wget --progress=dot:mega https://invisible-island.net/datafiles/release/byacc.tar.gz
    tar xzf byacc.tar.gz
    rm -f byacc.tar.gz
    cd byacc*
    ./configure --prefix=$IDIR
    make
    make install
    cp $IDIR/bin/yacc $IDIR/bin/byacc
    cd ..
fi

