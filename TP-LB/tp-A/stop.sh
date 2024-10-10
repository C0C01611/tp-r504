#!/bin/bash

# Arrêter les conteneurs nginx1 et nginx2, s'ils sont en cours d'exécution
if [ "$(docker ps -q -f name=nginx1)" ]; then
    docker stop nginx1
fi

if [ "$(docker ps -q -f name=nginx2)" ]; then
    docker stop nginx2
fi

# Arrêter le conteneur basé sur im-nginx-lb, s'il est en cours d'exécution
if [ "$(docker ps -q --filter "ancestor=im-nginx-lb")" ]; then
    docker stop $(docker ps -q --filter "ancestor=im-nginx-lb")
fi

# Supprimer le réseau tplb, s'il existe
if [ "$(docker network ls -q --filter name=tplb)" ]; then
    docker network rm tplb
fi

