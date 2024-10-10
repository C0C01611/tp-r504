#!/bin/bash

# Initialiser les compteurs
count_nginx1=0
count_nginx2=0
total_requests=500

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

# Calculer les pourcentages
percent_nginx1=$(echo "scale=2; ($count_nginx1 / $total_requests) * 100" | bc)
percent_nginx2=$(echo "scale=2; ($count_nginx2 / $total_requests) * 100" | bc)

# Afficher les résultats
echo "Nombre de réponses de nginx1 (Hello 1) : $count_nginx1"
echo "Nombre de réponses de nginx2 (Hello 2) : $count_nginx2"
echo "Pourcentage de réponses de nginx1 : $percent_nginx1%"
echo "Pourcentage de réponses de nginx2 : $percent_nginx2%"

# Vérifier la répartition 50/50
if [[ $(echo "$percent_nginx1 == 50" | bc) -eq 1 ]]; then 
    echo "La répartition est de 50/50."
else
    echo "La répartition est de ." $percent_nginx1 "/" $percent_nginx2
fi

