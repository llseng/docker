#!/bin/sh

curPath=$(cd `dirname $0`; pwd)
Dockerfile=$curPath'/Dockerfile'

if [[ -f $Dockerfile ]]; then
    sed -i "s|ARG CURPATH.\+|ARG CURPATH=$curPath|" $Dockerfile
else
    echo 'Dockerfile not exist'
fi
