#!/bin/bash

# (a) Créer un réseau interne nommé tplb
docker network create tplb

# (b) Construire l’image basée sur le Dockerfile ci-dessus en la nommant im-nginx-lb
docker build -t im-nginx-lb .

# (c) Créer deux sous-dossiers shared1 et shared2
mkdir -p shared1 shared2

# (d) Y placer deux fichiers index.html
echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

# (e) Lancer deux conteneurs basés sur l’image nginx
docker run -d --name nginx1 --rm --network tplb -p 81:80 -v "$(pwd)/shared1:/usr/share/nginx/html" nginx
docker run -d --name nginx2 --rm --network tplb -p 82:80 -v "$(pwd)/shared2:/usr/share/nginx/html" nginx

# (f) Lancer un conteneur basé sur l’image im-nginx-lb
docker run -d --rm --network tplb -p 83:80 im-nginx-lb

