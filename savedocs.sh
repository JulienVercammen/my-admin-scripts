#!/bin/sh
cd ~
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage de l'archivage."
tar -cvf /tmp/Documents.tar Documents && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Archivée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage du chiffrement."
gpg2 -v -e -r julien@vercammen.org -o /tmp/Documents.tar.gpg /tmp/Documents.tar && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Chiffrée." && rm /tmp/Documents.tar
cd - > /dev/null
cd /tmp
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage du hachage."
shasum -a 256 Documents.tar.gpg > Documents.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Haché."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage de la signature."
gpg2 -v --armor --detach-sign -o Documents.sha256sum.sign Documents.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Signé."
cd - > /dev/null

