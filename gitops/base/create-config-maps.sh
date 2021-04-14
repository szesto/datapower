#!/bin/sh

# create config maps
# pass configuration directory as an argument
gen=$1

# make_config_map name file
make_config_map() 
{
cfg=`basename $2`
cat <<EOF
---
apiVersion: v1
kind: ConfigMap
metadata:
  annotations:
    datapower.build: meta
  name: $1
data:
  $cfg: |
EOF
# todo: check file-size: wc -c $2 | cut -f1 -d ' '
cat $2 | awk '{print "    " $0}'
}

make_config_map_binary_data() {
cfg=`basename $2`
cat <<EOF
---
apiVersion: v1
kind: ConfigMap
metadata:
  annotations:
    datapower.build: meta
  name: $1
binaryData:
EOF
# todo: check file-size: wc -c $2 | cut -f1 -d ' '
echo "  $cfg: `base64 $2`"
}

name="auto-startup-cfg"
file="$gen/config/auto-startup.cfg"
make_config_map $name $file

name="auto-user-cfg"
file="$gen/config/auto-user.cfg"
make_config_map $name $file

name="default-cfg"
file="$gen/config/default.cfg"
make_config_map $name $file

name="default-local-tgz"
file="$gen/test-local.tar.gz"
make_config_map_binary_data $name $file

name="test-cfg"
file="$gen/config/test/test.cfg"
make_config_map $name $file

name="test-local-tgz"
file="$gen/test-local.tar.gz"
make_config_map_binary_data $name $file
