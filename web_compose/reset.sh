#!/bin/sh

#当前脚本目录
BASEPATH=$(cd `dirname $0`; pwd)
# 清除
rm -rf ${BASEPATH}/{mysql,redis,nginx,fpm}/log/*
rm -rf ${BASEPATH}/{mysql,redis}/data/*
# 权限
chmod 0777 ${BASEPATH}/{mysql,redis,nginx,fpm}/log
chmod 0777 ${BASEPATH}/{mysql,redis}/data
