#!/bin/bash

# Vérifie si un argument est fourni
if [ -z "$1" ]; then
    echo "Usage: $0 <branch-name>"
    exit 1
fi

# Nom de la branche
BRANCH_NAME=$1

# Vérifie si on est dans un dépôt Git
if [ ! -d .git ]; then
    echo "Erreur : Ce répertoire n'est pas un dépôt Git."
    exit 1
fi

# Crée la branche
git checkout -b "$BRANCH_NAME"

# Vérifie si la création a réussi
if [ $? -eq 0 ]; then
    echo "Branche '$BRANCH_NAME' créée avec succès et activée."
    
    # Pousse la branche vers le dépôt distant et configure la relation de suivi
    git push --set-upstream origin "$BRANCH_NAME"
    
    # Vérifie si le push a réussi
    if [ $? -eq 0 ]; then
        echo "Branche '$BRANCH_NAME' poussée vers le dépôt distant avec succès."
    else
        echo "Erreur lors du push de la branche '$BRANCH_NAME'."
        exit 1
    fi
else
    echo "Erreur lors de la création de la branche '$BRANCH_NAME'."
    exit 1
fi
