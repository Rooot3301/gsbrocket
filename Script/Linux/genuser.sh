#!/bin/bash

# Créer par Romain VARENE-REBUFFAT le 16/02/24 


# Vérifier si zenity est installé
if ! command -v zenity &> /dev/null; then
    echo "Zenity n'est pas installé. Installation en cours..."
    sudo apt-get update
    sudo apt-get install -y zenity
fi

# Définir une liste de prénoms et noms de famille
prenoms=("Alice" "Louis" "Léa" "Lucas" "Clara" "Gabriel" "Emma" "Mathéo" "Chloé" "Nathan" "Inès" "Enzo" "Manon" "Tom" "Lou-Anne" "Antoine" "Juliette" "Hugo" "Camille" "Baptiste")
noms=("Martin" "Durand" "Dubois" "Robert" "Dupont" "Moreau" "Bernard" "Lefebvre" "Martinez" "Garcia" "David" "Rousseau" "Petit" "Lopez" "Durand" "Chevalier" "Richard" "Martinez" "Durand" "Martin")

# Demander à l'utilisateur le nombre de générations
num_generations=$(zenity --entry --title="Générateur de noms et prénoms" --text="Entrez le nombre de générations:")

# Vérifier si l'utilisateur a annulé la boîte de dialogue
if [ -z "$num_generations" ]; then
    zenity --info --title="Information" --text="Opération annulée."
    exit 0
fi

# Nom du fichier CSV
csv_file="noms_prenoms_generes.csv"

# Générer les noms et prénoms et les écrire dans le fichier CSV avec l'en-tête
echo "Prénom,Nom" > "$csv_file"

for ((i=1; i<=$num_generations; i++)); do
    prenom=${prenoms[$((RANDOM % ${#prenoms[@]}))]}
    nom=${noms[$((RANDOM % ${#noms[@]}))]}
    echo "$prenom,$nom" >> "$csv_file"
done

zenity --info --title="Terminé" --text="Générations terminées. Les données ont été exportées dans $csv_file."





