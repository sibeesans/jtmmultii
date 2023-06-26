#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
MYIP=$(wget -qO- icanhazip.com);
clear
clear
clear
domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-nontls
#systemctl restart ssh-ohp
#systemctl restart dropbear-ohp
#systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "${CYAN}>> Sukses Di Buat Sayank <<"
echo -e "${BLUE}==============================${NC}"
echo -e "IP/Host       : $IP"
echo -e "Domain        : ${domain}"
echo -e "Username      : $Login"
echo -e "Password      : $Pass"
echo -e "Dropbear      : 109, 143"
echo -e "SSL/TLS       : 443, 445, 777"
echo -e "Port Squid    :$sqd"
#echo -e "OHP SSH       : 8181"
#echo -e "OHP Dropbear  : 8282"
#echo -e "OHP OpenVPN   : 8383"
echo -e "Ssh Ws SSL    : 443"
echo -e "Ssh Ws No SSL : 80"
echo -e "Ovpn Ws       : 2086"
echo -e "Port TCP      : $ovpn"
echo -e "Port UDP      : $ovpn2"
echo -e "Port SSL      : 990"
echo -e "OVPN TCP      : http://$IP:89/tcp.ovpn"
echo -e "OVPN UDP      : http://$IP:89/udp.ovpn"
echo -e "OVPN SSL      : http://$IP:89/ssl.ovpn"
echo -e "BadVpn        : 7100-7200-7300"
echo -e "Created       : $hariini"
echo -e "Expired       : $expi"
echo -e "${BLUE}=============================="
echo -e "${ORANGE}Payload Websocket TLS"
echo -e "${BLUE}=============================="
echo -e "${NC}GET wss://${domain}/ HTTP/1.1[crlf]Host: {domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${BLUE}=============================="
echo -e "${ORANGE}Payload Websocket No TLS"
echo -e "${BLUE}=============================="
echo -e "${NC}GET /cdn-cgi/trace HTTP/1.1[crlf]Host: [bug][crlf][crlf]CF-RAY / HTTP/1.1[lf]Host: ${domain}[lf]Expect: 100-continue[lf]Connection: Upgrade[lf]Upgrade: websocket[lf]User-Agent: Group-Blitar[crlf][crlf]"
#echo -e "${NC}UDP ${domain}:1-65535"
echo -e ""
echo -e "${BLUE}=============================="
echo -e "${CYAN}Script By Adit Squad"
echo -e ""
echo -e "${PURPLE}• Pilih 0 Kembali Ke menu "
#echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x
case "$x" in 
   0 | 00)
   clear
   menu
   break
   ;;
   *)
   clear
esac
