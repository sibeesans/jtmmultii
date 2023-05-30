#!/bin/bash
#######################

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
NC='\033[0m'
KN='\033[0;33m'
ORANGE='\033[0;33m'
PINK='\033[0;35m'
cd /usr/bin
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/copy47/dana/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# Order ID
rm -f /usr/bin/ver
user=$(curl https://raw.githubusercontent.com/copy47/dana/main/ip | grep $MYIP | awk '{print $3}')
echo "$user" >/usr/bin/ver
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/copy47/dana/main/ip | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# TOTAL
domain=$(cat /root/domain)
#Status certificate
#modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# // Exporting IP Address
#export IP=$( curl -s https://ipinfo.io/ip/ )
# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi
vlx=$(grep -c -E "^#### " "/etc/xray/config.json")

vmc=$(grep -c -E "^### " "/etc/xray/config.json")

ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

#trx=$(grep -c -E "^### " "/etc/xray/config.json")

#ssx=$(grep -c -E "^## " "/etc/xray/config.json")
#######PERIZINAN
# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi


MYIP=$(curl -sS ipv4.icanhazip.com)
# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
IPVPS=$(curl -s ipinfo.io/ip )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
cd /usr/bin
clear
clear
clear
echo -e ""
echo -e ""
echo -e "\E[44;1;39m ꧁࿇ SCRIPT SEDERHANA PENUH CINTA ࿇꧂ \E[0m"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       INFORMASI VPS                          \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "ISP Name            ${BLUE}•${NC} $ISP"
echo -e "Current Time        ${BLUE}•${NC} $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    ${BLUE}•${NC} $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Current Domain      ${BLUE}•${NC} $( cat /etc/xray/domain )"
echo -e "Server IP           ${BLUE}•${NC} ${IPVPS}"
echo -e "Total Amount Of Ram ${BLUE}•${NC} $tram MB"
echo -e "Used Ram            ${BLUE}•${NC} $uram MB"
echo -e "Free Ram            ${BLUE}•${NC} $fram MB"
echo -e "Clients Name        ${BLUE}•${NC} AryaNet"
echo -e "Exp Script VPS      ${BLUE}•${NC} LifeTime"
echo -e "Time Reboot VPS     ${BLUE}•${NC} 05.00"
echo -e "AutoScript          ${BLUE}•${NC} Arya Blitar"
echo -e "handpone/wa         ${BLUE}•${NC} 087721815317"
echo -e "Version             ${BLUE}•${KN} GRATIS"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       STATUS LAYANAN                        \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [ ${KN}SSH WebSocket${GREEN} : ON ${NC}]     [ ${KN}XRAY${NC} : ${status_xray} ${NC}]      [ ${KN}NGINX${GREEN} : ${status_nginx} ${NC}]"
echo -e "${BLUE}─────────────────────────────────────────────────────────────${NC}"
echo -e "${BLUE}│\033[0m ${BOLD}${YELLOW}SSH    VMESS    VLESS ${CYAN}RINDU VPN$NC"
echo -e "${BLUE}│\033[0m ${Blue} $ssh1      $vmc        $vlx  ${PINK} RINDU JANDA$NC"
echo -e "${BLUE}└────────────────────────────────────────────────────────────┘${NC}"
#echo -e ""
#echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       MENU LAYANAN                           \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${BLUE} •${NC} SSH WS/OVPN/UDP      $NC[${GREEN}11${NC}]${BLUE} • ${NC}CEK RUNNING $NC"
echo -e " [${GREEN}02${NC}]${BLUE} •${NC} VMESS/VLESS $NC         [${GREEN}12${NC}]${BLUE} • ${NC}INFO PORT INSTALL $NC"
echo -e " [${GREEN}03${NC}]${BLUE} •${NC} TROJAN-WS/GFW $NC       [${GREEN}13${NC}]${BLUE} • ${NC}INFO AUTO INSTALL $NC"
echo -e " [${GREEN}04${NC}]${BLUE} •${NC} L2TP/PPTP$NC            [${GREEN}14${NC}]${BLUE} • ${NC}REBOOT VPS $NC"
echo -e " [${GREEN}05${NC}]${BLUE} •${NC} MONITOR BANWIDTH $NC    [${GREEN}15${NC}]${BLUE} • ${NC}CEKS SPEDD $NC"
echo -e " [${GREEN}06${NC}]${BLUE} •${NC} RESTART ALL SERVICE$NC  [${GREEN}16${NC}]${BLUE} • ${NC}CHANGE BANNER $NC"
echo -e " [${GREEN}07${NC}]${BLUE} •${NC} ADD SUBDOMAIN VPS $NC   [${GREEN}17${NC}]${BLUE} • ${NC}RESTART BANNER $NC"
echo -e " [${GREEN}08${NC}]${BLUE} •${NC} RENEW CERTY2RAY $NC     [${GREEN}18${NC}]${BLUE} • ${NC}SETING AUTO BOOT $NC"
echo -e " [${GREEN}09${NC}]${BLUE} •${NC} CLEAR LOG   $NC         [${GREEN}19${NC}]${BLUE} • ${NC}UPDATE $NC"
echo -e " [${GREEN}10${NC}]${BLUE} •${NC} TENDANG USER MULTI $NC  [${GREEN}20${NC}]${BLUE} • ${NC}EXIT $NC"
echo -e " ${BLUE}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${GREEN} ༺ ${BLUE}𒆜${RED}▁ ${CYAN}▂ ${GREEN}▄ ${ORANGE}▅${PINK} ▆${GREEN} ▇ ${RED}█${BLUE}𒆜${CYAN} ༻${NC}  SCRIPT ARYA BLITAR ${BLUE}༺ ${RED}𒆜${GREEN}█ ${ORANGE}▇ ${CYAN}▆ ${RED}▅ ${GREEN}▄ ${ORANGE}▂ ${PINK}▁${BLUE}𒆜 ${CYAN}༻                   \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "\033[0;34m┌───────────────────────────────────────────────────────────┐${NC}"
echo -e "\033[0;34m│$NC Version       ${CYAN}:$NC 1.0"
echo -e "\033[0;34m│$NC User          ${CYAN}:$NC $username"
echo -e "\033[0;34m│$NC Expiry script ${CYAN}:$NC $exp [\e[32m $certificate\e[0m Hari lagi ]"
echo -e "\033[0;34m└───────────────────────────────────────────────────────────┘${NC}"
echo -e ""

read -p "Select From Options [ 1 - 20 ] : " menu
case $menu in
1)
clear
ssh
;;
2)
clear
v2raay
;;
3)
clear
trojaan
;;
4)
clear
l2tp
;;
5)
clear
banwit
;;
6)
clear
restart
;;
7)
clear
addhost
;;
8)
clear
certv2ray
;;
9)
clear
clearlog
;;
10)
tendang
;;
11)
running
;;
12)
clear
info
;;
13)
clear
about
;;
14)
clear
reboot
;;
15)
clear
speedtest
;;
16)
clear
nano /etc/issue.net
;;
17)
clear
/etc/init.d/dropbear restart
;;
18)
clear
auto-reboot
;;
19)
clear
updatemenu
;;
20)
exit
exit
;;
*)
clear
menu
;;
esac
