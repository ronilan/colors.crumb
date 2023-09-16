#!/bin/sh

tag="v0.0.1"
into=".tmp~crumb~inflate"

git clone --branch $tag --depth 1 https://github.com/liam-ilan/crumb.git $into
cd $into || exit
gcc src/*.c -Wall -lm -o crumb 
cd .. 
mv ./$into/crumb crumb
rm -rf $into
