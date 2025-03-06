IP_RANGE="172.16.0.0/24"

sudo nmap -T4 -O -p 1-65535 --open "$IP_RANGE" | \
awk '
/Nmap scan report/ {
    if (ip) print ip "," tcp_ports "," udp_ports "," kernel_version;
    ip=$(NF);
    tcp_ports=0;
    udp_ports=0;
    kernel_version="N/A"
}
/open/ {
    if ($0 ~ /tcp/) { tcp_ports++ }
    else if ($0 ~ /udp/) { udp_ports++ }
}
/Linux/ {
    kernel_version=$0
}
END {
    if (ip) print ip "," tcp_ports "," udp_ports "," kernel_version
}
' > scan-result_3.csv

