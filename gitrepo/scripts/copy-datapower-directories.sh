#/bin/bash

set -x

# argument is build dir, eg ./build/datapower
builddir=$1

mkdir -p $builddir

cp -r ./config $builddir
cp -r ./local $builddir
