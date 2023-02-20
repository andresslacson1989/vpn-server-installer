#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# My Telegram : https://t.me/bytesph2023
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
# Preparation
apt-get update && apt-get upgrade -y
update-grub && sleep 2 && apt-get update -y
apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
apt-get update
apt-get install -y bzip2 gzip coreutils screen curl unzip
apt-get update && apt upgrade -y 
update-grub && sleep 2 && apt-get update -y 
apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1 
sysctl -w net.ipv6.conf.default.disable_ipv6=1 
apt-get update 
apt-get install -y bzip2 gzip coreutils screen curl unzip
#===========================================

# Link Hosting Kalian Untuk Ssh Vpn
install="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/ssh"
# Link Hosting Kalian Untuk Sstp
installn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/sstp"
# Link Hosting Kalian Untuk Ssr
installnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
installnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
installnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/wireguard"
# Link Hosting Kalian Untuk Xray
installnnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/xray"
# Link Hosting Kalian Untuk Ipsec
installnnnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/ipsec"
# Link Hosting Kalian Untuk Backup
installnnnnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/backup"
# Link Hosting Kalian Untuk Websocket
installnnnnnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/websocket"
# Link Hosting Kalian Untuk Ohp
installnnnnnnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/ohp"
# link Hosting update
installnnnnnnnnnn="raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/update"

MYIP=$(wget -qO- ipinfo.io/ip);
#echo "Checking VPS"
#Bytes=$(curl https://raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/ipvps.txt | grep $MYIP | awk '{print $3}')
#if [ $MYIP = $MYIP ]; then
#echo -e "${NC}${GREEN}Permission Accepted...${NC}"
#else
#echo -e "${NC}${RED}Permission Denied!${NC}";
#echo -e "${NC}${LIGHT}Please Contact Admin!!"
#echo -e "${NC}${LIGHT}Telegram : https://t.me/bytesph2023"
#exit 0
#fi
clear
rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/akbarstorevpn;
#echo "IP=" >> /var/lib/akbarstorevpn/ipvps.conf
wget https://${install}/newhost.sh && chmod +x newhost.sh && ./newhost.sh
sleep 1
#install v2ray
#wget https://${installnnnnn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
wget https://${install}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
# Websocket
wget https://${installnnnnnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh
# OphvServer
#wget https://${installnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh
#Setting Backup
wget https://${installnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Update Menu
wget https://${installnnnnnnnnnn}/getupdate.sh && chmod +x getupdate.sh && ./getupdate.sh
# sslh fix
wget https://raw.githubusercontent.com/andresslacson1989/vpn-server-installer/main/sslh-fix/sslh-fix.sh && chmod +x sslh-fix.sh && ./sslh-fix.sh
#restart service
restart

rm -f /root/cf.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sslh-fix.sh
rm -f /root/getupdate.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/addhost.sh
rm -f /root/newhost.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/bytesph2023

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${install}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-BytesPH Project-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy (Off)       : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Manila (GMT +8)"  | tee -a log-install.txt
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
echo "---------------------- Script Mod By AkoSiBytes ----------------------" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
