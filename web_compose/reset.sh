#!/bin/sh

#当前脚本目录
BASEPATH=$(cd `dirname $0`; pwd)

rm -rf ${BASEPATH}/{mysql,redis,nginx,fpm}/log/*
rm -rf ${BASEPATH}/{mysql,redis}/data/*
