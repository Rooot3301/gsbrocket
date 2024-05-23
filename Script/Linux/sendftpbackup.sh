#!/bin/bash

# Variables
DATE=$(date +%Y%m%d%H%M%S)
COMPRESSED_FILE="/home/romain/backup_$DATE.zip"
FTP_SERVER="192.168.0.194"
FTP_USER="backup"
FTP_PASS="backup"

# Vérification si le fichier compressé existe
if [ ! -f "$COMPRESSED_FILE" ]; then
    echo "Le fichier compressé $COMPRESSED_FILE n'existe pas."
    exit 1
fi

# Connexion FTP et envoi du fichier compressé
echo "Connexion FTP et envoi du fichier compressé..."
ftp -inv $FTP_SERVER <<EOF
user $FTP_USER $FTP_PASS
put "$COMPRESSED_FILE"
bye
EOF

echo "Script terminé avec succès."





