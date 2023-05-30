#!/bin/bash
# Color Validation
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
# ===================
clear
  # // Exporint IP AddressInformation
export IP=$( curl -sS ipinfo.io/ip )

# // Clear Data
clear
clear && clear && clear
clear;clear;clear


clear
echo -e "\e[32mloading...\e[0m"
clear
apt install p7zip-full -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
sudo apt-get remove --purge exim4 -y
apt -y install jq
apt -y install wget curl
apt install git -y

# // Setup SSH-VPN
echo -e "${green}DOWNLOADING SSH-VPN!${NC}"
sleep 3
wget -q -O /root/ssh-vpn.sh "https://raw.githubusercontent.com/Jatimpark/multi/main/uye/ssh-vpn.sh"
chmod +x /root/ssh-vpn.sh
./ssh-vpn.sh
echo -e "${green}Done!${NC}"
sleep 2
clear
# // Setup XRAY
echo -e "${green}INSTALLING XRAY${NC}"
sleep 3
wget https://raw.githubusercontent.com/Jatimpark/multi/main/uye/xray.sh && chmod +x xray.sh && screen -S xray ./xray.sh
echo -e "${green}Done!${NC}"
sleep 2
clear
# // Setup BACKUP
echo -e "${green}INSTALLING BACKUP${NC}"
sleep 3
wget https://raw.githubusercontent.com/Jatimpark/multi/main/uye/set-br.sh && chmod +x set-br.sh && screen -S set-br ./set-br.sh
echo -e "${green}Done!${NC}"
sleep 2
clear
# // Setup OHP
echo -e "${green}INSTALLING OHP${NC}"
sleep 3
wget https://raw.githubusercontent.com/Jatimpark/multi/main/uye/ohp.sh && chmod +x ohp.sh && screen -S ohp ./ohp.sh
echo -e "${green}Done!${NC}"
sleep 2
clear
systemctl start nginx > /dev/null 2>&1

# // Remove Not Used Files
rm -f /root/setup.sh > /dev/null 2>&1
rm -r /root/menu > /dev/null 2>&1
rm -r /root/menu.zip > /dev/null 2>&1
rm -r -f *.sh > /dev/null 2>&1
echo " "
echo "=================-geovpn Project-==================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "================================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
#echo "   - Wireguard               : 7070"  | tee -a log-install.txt
#echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
#echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
#echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
#echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
#echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
#echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 2095"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2087"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"   | tee -a log-install.txt
echo "   - Websocket None TLS      : 80"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP_SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP_Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP_OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2053"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : ~"  | tee -a log-install.txt
echo "   - Recode                  : Muhammad Amin" | tee -a log-install.txt
echo "   - Telegram                : T.me/sampiiiiu"  | tee -a log-install.txt
echo "   - Instagram               : @geo_gabuter"  | tee -a log-install.txt
echo "   - Whatsapp                : 082339191527"  | tee -a log-install.txt
echo "   - Facebook                : Muhammad Amin" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo "===============-[ Script Mod By Geo Project ]-==============="
echo -e ""
# // Download welcome
    echo "clear" >>.profile
    echo "neofetch --ascii_distro Anarchy" >>.profile
    echo "echo by Geo Project " >>.profile
    echo "" >>.profile
    echo "" >>.profile

# // Done
history -c
rm -f /root/.bash
rm -f /root/.bash_history
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
echo -e "${OKEY} Script Successfull Installed"
echo ""
read -p "$( echo -e "Press ${CYAN}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} For Reboot") "
reboot
