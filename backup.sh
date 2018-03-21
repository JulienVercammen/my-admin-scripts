#!/bin/sh

LOGFILE=log/backup_`date "+%Y%m%d"`.log

(
echo "`date "+%Y-%m-%d %H:%M:%S"`   Démarrage du script $0."
cd ~
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage de l'archivage." 
tar -cf /tmp/Documents.tar Documents && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Archivée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage du chiffrement." 
gpg2 -v -e -r julien@vercammen.org -o /tmp/Documents.tar.gpg /tmp/Documents.tar && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Chiffrée." && rm /tmp/Documents.tar
cd - > /dev/null
cd /tmp
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage du hachage."
shasum -a 256 Documents.tar.gpg > Documents.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Haché."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Démarrage de la signature."
gpg2 -v --armor --detach-sign -o Documents.sha256sum.sign Documents.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Signé."
cd - > /dev/null
cd ~/Pictures
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Démarrage de l'archivage." 
tar -cf /tmp/FotosAtrevidas.tar Fotos\ Atrevidas && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Archivée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Démarrage du chiffrement." 
gpg2 -v -e -r julien@vercammen.org -o /tmp/FotosAtrevidas.tar.gpg /tmp/FotosAtrevidas.tar && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Chiffrée." && rm /tmp/FotosAtrevidas.tar
cd - > /dev/null
cd /tmp
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Démarrage du hachage."
shasum -a 256 FotosAtrevidas.tar.gpg > FotosAtrevidas.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Haché."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Démarrage de la signature."
gpg2 -v --armor --detach-sign -o FotosAtrevidas.sha256sum.sign FotosAtrevidas.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Signé."
cd - > /dev/null
cd ~/Pictures
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage de l'archivage." 
tar -cf /tmp/PhotothequeJulien.tar Bibliothèque\ Photos.photoslibrary && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Archivée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage du chiffrement." 
gpg2 -v -e -r julien@vercammen.org -o /tmp/PhotothequeJulien.tar.gpg /tmp/PhotothequeJulien.tar && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Chiffrée." && rm /tmp/PhotothequeJulien.tar
cd - > /dev/null
cd /tmp
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage du hachage."
shasum -a 256 PhotothequeJulien.tar.gpg > PhotothequeJulien.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Haché."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage de la signature."
gpg2 -v --armor --detach-sign -o PhotothequeJulien.sha256sum.sign PhotothequeJulien.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Signé."
cd - > /dev/null
cd ~/Music
echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Démarrage de l'archivage." 
tar -cf /tmp/MediathequeJulien.tar iTunes && echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Archivée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Démarrage du chiffrement." 
gpg2 -v -e -r julien@vercammen.org -o /tmp/MediathequeJulien.tar.gpg /tmp/MediathequeJulien.tar && echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Chiffrée." && rm /tmp/MediathequeJulien.tar
cd - > /dev/null
cd /tmp
echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Démarrage du hachage."
shasum -a 256 MediathequeJulien.tar.gpg > MediathequeJulien.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Haché."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Démarrage de la signature."
gpg2 -v --armor --detach-sign -o MediathequeJulien.sha256sum.sign MediathequeJulien.sha256sum && echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Signé."
cd - > /dev/null
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Démarrage de la copie."
cp -fpv /tmp/Documents.* /Volumes/Backup/ && echo "`date "+%Y-%m-%d %H:%M:%S"`   Documents : Copie terminée." && rm -v /tmp/Documents.*
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage de la copie."
cp -fpv /tmp/FotosAtrevidas.* /Volumes/Backup/ && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Copie terminée." && rm -v /tmp/FotosAtrevidas.*
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage de la copie."
cp -fpv /tmp/PhotothequeJulien.* /Volumes/Backup/ && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Copie terminée." && rm /tmp/PhotothequeJulien.*
echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Démarrage de la copie."
cp -fpv /tmp/MediathequeJulien.* /Volumes/Backup/ && echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Copie terminée." && rm /tmp/MediathequeJulien.*
echo "`date "+%Y-%m-%d %H:%M:%S"`   Fin du script $0."
) >> $LOGFILE 2>&1
