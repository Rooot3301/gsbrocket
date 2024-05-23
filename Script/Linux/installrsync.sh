#!/bin/bash

# Vérifie si l'utilisateur a les privilèges root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 
   exit 1
fi

# Met à jour les paquets et installe rsync
echo "Mise à jour des paquets..."
sudo apt-get update -y

echo "Installation de rsync..."
sudo apt-get install -y rsync

# Vérifie si l'installation a réussi
if command -v rsync &> /dev/null; then
    echo "rsync a été installé avec succès"
    echo "Version de rsync installée :"
    rsync --version
else
    echo "L'installation de rsync a échoué"
    exit 1
fi

echo "Script d'installation terminé."


