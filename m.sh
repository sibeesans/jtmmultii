#!/bin/bash

### Color
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
RED="\033[31m"
FONT="\033[0m"
red='\e[1;31m'
echo -e ""

# ==========================================
MYIP=$(wget -qO- icanhazip.com);
clear
clear
clear

### System Information
TANGGAL=$(date '+%Y-%m-%d')
TIMES="10"
NAMES=$(whoami)
IMP="wget -q -O"    
CHATID="5491480146"
LOCAL_DATE="/usr/bin/"
MYIP=$(wget -qO- ipinfo.io/ip)
ISP=$(wget -qO- ipinfo.io/org)
CITY=$(curl -s ipinfo.io/city)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
#KEY="6042674179:AAE_8Jd3b4KIhiLDy1zJ1YhVgFz1q_SQjZI"
#URL="https://api.telegram.org/bot$KEY/sendMessage"
REPO="https://raw.githubusercontent.com/Jatimpark/multi/main/"
#CDNF="https://raw.githubusercontent.com/Jatimpark/multi/main"
#APT="apt-get -y install "
domain=$(cat /root/domain)
start=$(date +%s)
secs_to_human() {
    echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
### Status
function print_ok() {
    echo -e "${OK} ${BLUE} $1 ${FONT}"
}
function print_install() {
	echo -e "${YELLOW} ============================================ ${FONT}"
    echo -e "${YELLOW} # $1 ${FONT}"
	echo -e "${YELLOW} ============================================ ${FONT}"
    sleep 1
}

function print_error() {
    echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}

function print_success() {
    if [[ 0 -eq $? ]]; then
		echo -e "${Green} ============================================ ${FONT}"
        echo -e "${Green} # $1 berhasil dipasang"
		echo -e "${Green} ============================================ ${FONT}"
        sleep 2
    fi
}

### Cek root
function is_root() {
    if [[ 0 == "$UID" ]]; then
        print_ok "Root user Start installation process"
    else
        print_error "The current user is not the root user, please switch to the root user and run the script again"
    fi

}

### Pasang SlowDNS
function install_slowdns(){
    print_install "Memasang modul SlowDNS Server"
    wget -q -O /tmp/nameserver "${REPO}slowdns/nameserver" >/dev/null 2>&1
    chmod +x /tmp/nameserver
    bash /tmp/nameserver | tee /root/install.log
    print_success "SlowDNS"
}

    cat >/root/.profile <<EOF
# ~/.profile: executed by Bourne-compatible login shells.

cat >/etc/cron.d/xp_all <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/30 23 * * * root /usr/bin/xp
EOF

chmod 644 /root/.profile

cat >/etc/cron.d/daily_reboot <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /sbin/reboot
EOF

echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
echo "*/1 * * * * root echo -n > /var/log/xray/access.log" >>/etc/cron.d/log.xray
service cron restart
cat >/home/daily_reboot <<EOF
5
EOF

cat >/etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
EOF

echo "/bin/false" >>/etc/shells
echo "/usr/sbin/nologin" >>/etc/shells
cat >/etc/rc.local <<EOF
#!/bin/sh -e
# rc.local
# By default this script does n

### Tambahan
function tambahan(){


chgrp mail /etc/msmtprc
chown 0600 /etc/msmtprc
touch /var/log/msmtp.log
chown syslog:adm /var/log/msmtp.log
chmod 660 /var/log/msmtp.log
ln -s /usr/bin/msmtp /usr/sbin/sendmail >/dev/null 2>&1
ln -s /usr/bin/msmtp /usr/bin/sendmail >/dev/null 2>&1
ln -s /usr/bin/msmtp /usr/lib/sendmail >/dev/null 2>&1
print_ok "Selesai pemasangan modul tambahan"
}


########## SETUP FROM HERE ##########
          # ORIGINAL SCRIPT #
#####################################
echo "INSTALLING SCRIPT..."

touch /root/.install.log
cat >/root/tmp <<-END
#!/bin/bash
#vps
### Geostoretunnel $TANGGAL $MYIP
END
####

function install_all() {
    base_package
    # dir_xray
    # add_domain
    pasang_ssl 
    install_slowdns >> /root/install.log

}

function finish(){
    TEXT="
<u>INFORMATION VPS INSTALL SC</u>
<code>TIME      : </code><code>${TIME}</code>
<code>IPVPS     : </code><code>${MYIP}</code>
<code>DOMAIN    : </code><code>${domain}</code>
<code>ISP       : </code><code>${ISP}</code>
<code>LOKASI    : </code><code>${CITY}</code>
<code>USER      : </code><code>${NAMES}</code>
<code>RAM       : </code><code>${RAMMS}MB</code>
<code>LINUX     : </code><code>${OS}</code>
"
    #curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
    #c#p /etc/openvpn/*.ovpn /var/www/html/
    # sed -i "s/xxx/${domain}/g" /var/www/html/index.html
    #sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
    #sed -i "s/xxx/${MYIP}/g" /etc/squid/squid.conf
   # chown -R www-data:www-data /etc/msmtprc



}
cd /tmp

#rm ~/.bash_history
sleep 10