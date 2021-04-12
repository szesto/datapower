#!/bin/bash

set -x

# tar local directories of all domains
# todo: tar should be non-recursive

# agrument is build dir, eg ./build/datapower
bdir=$1

# default domain
tar czvf $bdir/default-local.tgz -C $bdir/local .

# test domain
tar czvf $bdir/test-local.tgz -C $bdir/local/test .
