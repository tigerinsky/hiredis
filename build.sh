#!/bin/bash

base_dir=`pwd`
tmp_dir=$base_dir/tmp

rm -rf $tmp_dir 
mkdir -p $tmp_dir
git clone -b v0.12.1 https://github.com/redis/hiredis.git $tmp_dir  
if [ $? -ne 0 ]
then
    echo -e "\033[31m hiredis: download from git error \033[0m"
    exit 1
fi

cd $tmp_dir
make
if [ $? -ne 0 ]
then
    echo -e "\033[31m hiredis: make error \033[0m"
    exit 1
fi
mkdir -p ${base_dir}/include ${base_dir}/lib
cp *.h ${base_dir}/include 
cp *.a ${base_dir}/lib
rm -rf $tmp_dir


