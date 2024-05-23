#!/bin/bash

# Source (répertoire à synchroniser)
source_dir="/mnt/partage"

# Destination (répertoire de sauvegarde)
dest_dir="/home/romain/backup/partage"

# Options rsync
options="-av"

# Exécuter la commande rsync
rsync $options "$source_dir" "$dest_dir"

# Afficher le message de fin
echo "Synchronisation terminée."
