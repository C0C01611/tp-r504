#!/bin/bash

# Configuration
LOG_DIR="/var/log/debsecan"
EMAIL="votre-email@example.com"
THRESHOLD=5  # Le seuil de CVE pour alerter (par exemple, 5 vulnérabilités)
CVE_FILE="$LOG_DIR/cve_report_$(date +\%Y\%m\%d).log"  # Nom du fichier de rapport avec la date
HISTORY_FILE="$LOG_DIR/cve_history.log"  # Fichier d'historisation des résultats

# Créer le répertoire des logs si nécessaire
mkdir -p $LOG_DIR

# Effectuer la recherche des vulnérabilités avec debsecan
echo "Analyse des CVE pour Debian bookworm..."
debsecan --suite bookworm > "$CVE_FILE"

# Extraire le nombre de CVE trouvées
CVE_COUNT=$(grep -c "CVE" "$CVE_FILE")
echo "Nombre de CVE trouvées : $CVE_COUNT"

# Historisation des résultats
echo "$(date): $CVE_COUNT CVE trouvées" >> "$HISTORY_FILE"

# Vérifier si le nombre de CVE dépasse le seuil
if [ "$CVE_COUNT" -ge "$THRESHOLD" ]; then
    # Envoyer une alerte par mail
    mail -s "Alerte : Trop de CVE détectées sur Debian bookworm" $EMAIL <<EOF
Bonjour,

Une analyse des vulnérabilités a été effectuée sur Debian bookworm.

Nombre de CVE trouvées : $CVE_COUNT

Voici les détails du rapport :
$(cat "$CVE_FILE")

Cordialement,
Le système de surveillance des vulnérabilités
EOF
fi

# Fin du script
echo "Fin de l'analyse."

