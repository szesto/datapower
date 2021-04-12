#!/bin/bash

set -x

# run this script from parent directory:
# ./scripts/build-production-config /build/[production]/datapower

# an agrument is build directory, eg ./build/[production]/datapower

builddir=$1
dir=`dirname $0`

# copy datapower directories
$dir/copy-datapower-directories.sh $builddir

# apply filtering
$dir/filtering/production/apply-filtering.sh $builddir

# tar local directories
$dir/tar-local-directories.sh $builddir
