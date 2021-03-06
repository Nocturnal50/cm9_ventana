#!/bin/sh

DEVICE=/system
BASE=../../../vendor/dell/streak7/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
		mkdir -p $BASE/$DIR
    fi
adb pull $DEVICE/$FILE $BASE/$FILE
#cp -v $HOME/streak7/f/system/$FILE $BASE/$FILE
done

./setup-makefiles.sh

