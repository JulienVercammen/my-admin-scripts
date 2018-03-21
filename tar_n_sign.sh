#!/bin/sh

if [ "$1" == "" ]
then
echo "usage $0 PROJECT_NAME"
exit 1
else
PROJECT_NAME=$1
fi

cd ~/Dev/${PROJECT_NAME}
tar -cvf ~/Dev/${PROJECT_NAME}.tar .
cd -
cd ~/Dev
bzip2 -v -9 ${PROJECT_NAME}.tar
shasum -a 256 ${PROJECT_NAME}.tar.bz2 > ${PROJECT_NAME}.sha256sum
gpg2 -v --armor --detach-sign --output ${PROJECT_NAME}.sha256sum.sign ${PROJECT_NAME}.sha256sum
cd -
