#!/bin/sh

sha="9e5bdf26a608ab1c6f3bc5afc7b8daf17afde153"

git clone https://github.com/liam-ilan/crumb.git ~~temp 
cd ~~temp || exit
git reset --hard $sha
gcc src/*.c -Wall -lm -o crumb 
cd .. 
mv ./~~temp/crumb crumb && rm -rf ~~temp
