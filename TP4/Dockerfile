FROM python:3.11

# Installer les dépendances Python nécessaires
RUN pip install --upgrade pip \
     pip install flask flask-mysqldb mysql-connector-python

# Créer le répertoire de travail pour l'application
WORKDIR /app

# Copier les fichiers nécessaires
COPY app_1.py /app/
COPY templates /app/templates/

# Commande de lancement de Flask
CMD ["flask", "--app", "app_1", "run", "--host=0.0.0.0", "--port=5000"]
