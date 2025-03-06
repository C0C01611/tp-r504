IP_RANGE="172.16.0.0/24"

sudo nmap -T4 "$IP_RANGE" | \
awk '
/Nmap scan report/{if (ip) print ip "," ports; ip=$(NF); ports=0} 
/open/{ports++} 
END{if (ip) print ip "," ports}
' > scan-result_1.csv

