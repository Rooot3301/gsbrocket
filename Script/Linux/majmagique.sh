#!/bin/bash

# Script de mise à jour de Linux by Romain VARENE fait le 16/02/2024

# Vérifier les privilèges d'administration
if [ "$EUID" -ne 0 ]; then
    echo "Ce script nécessite des privilèges d'administration. Exécutez-le avec sudo."
    exit 1
fi

# Mise à jour du système
echo "Mise à jour du système en cours..."
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Suppression des paquets obsolètes
echo "Suppression des paquets obsolètes..."
apt-get autoremove -y
apt-get autoclean

# Mise à jour du noyau
echo "Mise à jour du noyau..."
apt-get install --only-upgrade linux-generic -y

# Mise à jour des paquets Snap
echo "Mise à jour des paquets Snap..."
snap refresh

# Mise à jour des paquets Flatpak
echo "Mise à jour des paquets Flatpak..."
flatpak update -y

# Mise à jour de la liste des paquets Ruby (si Ruby est installé)
if command -v gem &> /dev/null; then
    echo "Mise à jour des paquets Ruby..."
    gem update
fi

# Mise à jour de la liste des paquets Python (si Python est installé)
if command -v pip &> /dev/null; then
    echo "Mise à jour des paquets Python..."
    pip install --upgrade pip
    pip list --outdated --format=freeze | cut -d= -f1 | xargs -n1 pip install --upgrade
fi

# Mise à jour de la liste des paquets Node.js (si Node.js est installé)
if command -v npm &> /dev/null; then
    echo "Mise à jour des paquets Node.js..."
    npm update -g
fi

echo "Mise à jour terminée."

