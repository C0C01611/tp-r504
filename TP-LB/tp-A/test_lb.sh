#!/bin/bash

# Initialiser un compteur
count_nginx1=0
count_nginx2=0

# Boucle pour faire 500 appels à localhost sur le port 83
for i in {1..500}; do
    response=$(curl -s http://localhost:83)

    # Vérifier la réponse pour compter les occurrences de chaque serveur
    if [[ $response == *"Hello 1"* ]]; then
        ((count_nginx1++))
    elif [[ $response == *"Hello 2"* ]]; then
        ((count_nginx2++))
    fi
done

# Afficher les résultats
echo "Nombre de réponses de nginx1 (Hello 1) : $count_nginx1"
echo "Nombre de réponses de nginx2 (Hello 2) : $count_nginx2"

