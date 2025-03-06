#!/bin/bash

# Programmer l'exécution de rech.sh tous les jours à 02h30
(crontab -l 2>/dev/null; echo "30 2 * * * /path/to/rech.sh") | crontab -

