#!/bin/bash

# Vérifie si un message de commit est fourni en argument
if [ -z "$1" ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

# Message de commit
COMMIT_MESSAGE="$1"

# Vérifie si on est dans un dépôt Git
if [ ! -d .git ]; then
    echo "Erreur : Ce répertoire n'est pas un dépôt Git."
    exit 1
fi

# Ajoute tous les fichiers modifiés à Git
git add .

# Vérifie si la commande git add a réussi
if [ $? -ne 0 ]; then
    echo "Erreur lors de l'ajout des fichiers."
    exit 1
fi

# Crée le commit avec le message fourni
git commit -m "$COMMIT_MESSAGE"

# Vérifie si le commit a réussi
if [ $? -ne 0 ]; then
    echo "Erreur lors de la création du commit."
    exit 1
fi

# Pousse les changements vers la branche distante
git push

# Vérifie si le push a réussi
if [ $? -eq 0 ]; then
    echo "Les changements ont été poussés avec succès."
else
    echo "Erreur lors du push des changements."
    exit 1
fi
