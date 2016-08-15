#!/bin/sh

cd images

for i in `seq 1 1 500`
do
	TEXT=`printf "%04d" $i`
	FILENAME=${TEXT}.png
	convert -size 480x480 pattern:checkerboard -pointsize 40 -draw "text 100,240 '${TEXT}'" ${FILENAME}
done
