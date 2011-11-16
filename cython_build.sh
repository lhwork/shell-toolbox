#!/bin/bash

find_list=`find $1 -name "*.py"|grep -v "__init__*"`
inc=`python-config --includes`
cpython=`which cython`

function build_file(){
    for file in $find_list
    do
        if [ -d $1"/"$file ];then
            build_file $1"/"$file
        else
            echo $file
            base=${file%.*}
            $cpython $file
            gcc -shared -pthread -fPIC -fwrapv -DNDEBUG -O3 -Wall -fno-strict-aliasing -Wstrict-prototypes $inc -o $base.so $base.c
        fi
    done
}

build_file
    
