#!/bin/sh

LOGFILE=backup_`date "+%Y%m%d"`.log

(
echo "`date "+%Y-%m-%d %H:%M:%S"`   Démarrage du script $0."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Démarrage de la copie."
cp -fp /tmp/FotosAtrevidas.tar.gpg /Volumes/Backup/FotosAtrevidas.tar.gpg && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque culturelle : Copie terminée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Démarrage de la copie."
cp -fp /tmp/PhotothequeJulien.tar.gpg /Volumes/Backup/PhotothequeJulien.tar.gpg && echo "`date "+%Y-%m-%d %H:%M:%S"`   Photothèque : Copie terminée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Démarrage de la copie."
cp -fp /tmp/MediathequeJulien.tar.gpg /Volumes/Backup/MediathequeJulien.tar.gpg && echo "`date "+%Y-%m-%d %H:%M:%S"`   Médiathèque : Copie terminée."
echo "`date "+%Y-%m-%d %H:%M:%S"`   Fin du script $0."
) >> $LOGFILE 2>&1
