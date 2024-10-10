#!/bin/bash

# Arrêter les conteneurs nginx1, nginx2 et im-nginx-lb
docker stop nginx1 nginx2
docker stop $(docker ps -q --filter "ancestor=im-nginx-lb")

# Supprimer le réseau tplb
docker network rm tplb

