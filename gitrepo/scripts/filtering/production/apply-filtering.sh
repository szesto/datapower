#!/bin/bash

# apply in-place filters to datapower configurations

# an argument points to datapower build directory with
# configuration and local files

builddir=$1

set -x
dir=`dirname $0`

# domain configurations
sed -i -f $dir/update-timezone.sed $builddir/config/default.cfg
sed -i -f $dir/update-timezone.sed $builddir/config/test/test.cfg

# local directories
sed -i -f $dir/update-timezone.sed $builddir/local/hello.js
sed -i -f $dir/update-timezone.sed $builddir/local/test/hello.js
