#!/bin/bash

find $1 -name "*.c"|xargs rm -rf
find $1 -name "*.py"|grep -v "__init__*"|grep -v "manage*"|xargs rm -rf

