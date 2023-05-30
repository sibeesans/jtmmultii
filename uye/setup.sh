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
#systemctl start nginx > /dev/null 2>&1


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
echo ""
