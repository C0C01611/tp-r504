IP_RANGE="172.16.0.0/24"

sudo nmap -T4 -p 1-65535 --open "$IP_RANGE" | \
awk '
/Nmap scan report/{if (ip) print ip "," tcp_ports "," udp_ports; ip=$(NF); tcp_ports=0; udp_ports=0}
/open/{if ($0 ~ /tcp/){tcp_ports++} else if ($0 ~ /udp/){udp_ports++}}
END{if (ip) print ip "," tcp_ports "," udp_ports}
' > scan-result_2.csv

