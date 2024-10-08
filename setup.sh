#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
# BOT INFORMATION
date=$(date -R | cut -d " " -f -5)
export CHATID="6061644931"
export KEY="6406070059:AAFIpAWnbnnuikvxeWgz4rJwA5SrCVYe5VA"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
apt install wget -y
apt install curl -y
apt install ruby -y
gem install lolcat -y

clear
red='\e[1;31m'
green='\e[1;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain


echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 2
  echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${green}NOTES${NC} ] 1. apt update -y"  
  echo -e "[ ${green}NOTES${NC} ] 2. apt upgrade -y"
  echo -e "[ ${green}NOTES${NC} ] 3. apt dist-upgrade -y"
  echo -e "[ ${green}NOTES${NC} ] 4. reboot"
  sleep 1
  echo -e "[ ${green}NOTES${NC} ] After rebooting"
  echo -e "[ ${green}NOTES${NC} ] Then run this script again"
  echo -e "[ ${green}NOTES${NC} ] if you understand then tap enter now"
  read
else
  echo -e "[ ${green}INFO${NC} ] Oke installed"
fi

ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : "

mkdir -p /etc/cobek
mkdir -p /etc/cobek/limit
mkdir -p /etc/cobek/limit/trojan
mkdir -p /etc/cobek/limit/vless
mkdir -p /etc/cobek/limit/vmess
mkdir -p /etc/cobek/limit/ssh
mkdir -p /etc/cobek/limit/ssh/ip
mkdir -p /etc/cobek/limit/trojan/ip
mkdir -p /etc/cobek/limit/trojan/quota
mkdir -p /etc/cobek/limit/vless/ip
mkdir -p /etc/cobek/limit/vless/quota
mkdir -p /etc/cobek/limit/vmess/ip
mkdir -p /etc/cobek/limit/vmess/quota
mkdir -p /etc/cobek/trojan
mkdir -p /etc/cobek/vless
mkdir -p /etc/cobek/vmess
mkdir -p /etc/cobek/log
mkdir -p /etc/cobek/log/trojan
mkdir -p /etc/cobek/log/vless
mkdir -p /etc/cobek/log/vmess
mkdir -p /etc/cobek/log/ssh
mkdir -p /etc/cobek/cache
mkdir -p /etc/cobek/cache/trojan-tcp
mkdir -p /etc/cobek/cache/trojan-ws
mkdir -p /etc/cobek/cache/trojan-grpc
mkdir -p /etc/cobek/cache/vless-ws
mkdir -p /etc/cobek/cache/vless-grpc
mkdir -p /etc/cobek/cache/vmess-ws
mkdir -p /etc/cobek/cache/vmess-grpc
mkdir -p /etc/cobek/cache/vmess-ws-orbit
mkdir -p /etc/cobek/cache/vmess-ws-orbit1
mkdir -p /var/lib/SIJA >/dev/null 2>&1
echo "IP=" >> /var/lib/SIJA/ipvps.conf

echo ""
clear
yellow "SEBELUM MASKUIN DOMAIN WAJIB POINTING TERLEBIH DAHULU !!! "
echo " "
read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$pp" > /root/scdomain
	echo "$pp" > /etc/xray/scdomain
	echo "$pp" > /etc/xray/domain
	echo "$pp" > /etc/v2ray/domain
	echo "$pp" > /root/domain
        echo "IP=$pp" > /var/lib/SIJA/ipvps.conf
    fi
    
#install arzsource
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m           >>> Install Tools <<<        \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
sleep 5
wget -q https://raw.githubusercontent.com/tumbungbakem/scvip/main/tools.sh && chmod +x tools.sh && ./tools.sh
rm tools.sh
#install ssh-vpn
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m          >>> Install SSH WS <<<        \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
sleep 5
clear
wget https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#install ins-xray
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m            >>> Install Xray <<<         \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
sleep 5
clear
wget https://raw.githubusercontent.com/tumbungbakem/scvip/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/tumbungbakem/scvip/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
#install br
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m            >>> Install BR <<<           \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
sleep 5 
clear 
wget https://raw.githubusercontent.com/tumbungbakem/vvip/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
# // Download Data
echo -e "${GREEN}Download Data${NC}"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/clearlog.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-vless.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/running.sh"
wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/clearcache.sh"
wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-trgo.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-trial.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/tumbungbakem/scvip/main/backup/menu-backup.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/usernew.sh"
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/trial.sh"
wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/renew.sh"
wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/hapus.sh"
wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/cek.sh"
wget -q -O /usr/bin/member "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/member.sh"
wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/delete.sh"
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/autokill.sh"
wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/ceklim.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/tendang.sh"
wget -q -O /usr/bin/user-lock "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/user-lock.sh"
wget -q -O /usr/bin/user-unlock "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/user-unlock.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-set.sh"
wget -q -O /usr/bin/menu-domain "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-domain.sh"
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/add-host.sh"
wget -q -O /usr/bin/port-change "https://raw.githubusercontent.com/tumbungbakem/scvip/main/port/port-change.sh"
wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/tumbungbakem/scvip/main/xray/certv2ray.sh"
wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/menu-webmin.sh"
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/speedtest_cli.py"
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/about.sh"
wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/auto-reboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/restart.sh"
wget -q -O /usr/bin/bw "https://raw.githubusercontent.com/tumbungbakem/scvip/main/menu/bw.sh"
wget -q -O /usr/bin/genssl "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/genssl.sh"
wget -q -O /usr/bin/port-ssl "https://raw.githubusercontent.com/tumbungbakem/scvip/main/port/port-ssl.sh"
wget -q -O /usr/bin/port-ovpn "https://raw.githubusercontent.com/tumbungbakem/scvip/main/port/port-ovpn.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/xp.sh"
wget -q -O /usr/bin/acs-set "https://raw.githubusercontent.com/tumbungbakem/scvip/main/acs-set.sh"
wget -q -O /usr/bin/sshws "https://raw.githubusercontent.com/tumbungbakem/scvip/main/ssh/sshws.sh"
wget -q -O /usr/bin/updatemenu "https://raw.githubusercontent.com/tumbungbakem/scvip/main/updatemenu.sh"
cd /usr/sbin
wget -q -O /usr/bin/mesinssh "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/mesinssh.sh"
wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/cek-ssh.sh"
chmod +x *
chmod +x /usr/sbin/*
cd /usr/bin
wget -q -O /usr/bin/loop "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/loop.sh"
wget -q -O /usr/bin/matikan "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/matikan.sh"
wget -q -O /usr/bin/limit "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit.sh"
wget -q -O /usr/bin/limit-ip-ssh "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-ip-ssh.sh"
wget -q -O /usr/bin/limit-ip-trojan "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-ip-trojan.sh"
wget -q -O /usr/bin/limit-ip-vless "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-ip-vless.sh"
wget -q -O /usr/bin/limit-ip-vmess "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-ip-vmess.sh"
wget -q -O /usr/bin/limit-quota-trojan "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-quota-trojan.sh"
wget -q -O /usr/bin/limit-quota-vmess "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-quota-vmess.sh"
wget -q -O /usr/bin/limit-quota-vless "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/limit-quota-vless.sh"
wget -q -O /usr/bin/quota "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota.sh"
wget -q -O /usr/bin/quota-trojan-grpc "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-trojan-grpc.sh"
wget -q -O /usr/bin/quota-trojan-ws "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-trojan-ws.sh"
wget -q -O /usr/bin/quota-vmess-grpc "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-vmess-grpc.sh"
wget -q -O /usr/bin/quota-vmess-ws "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-vmess-ws.sh"
wget -q -O /usr/bin/quota-vless-ws "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-vless-ws.sh"
wget -q -O /usr/bin/quota-vless-grpc "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-vless-grpc.sh"
wget -q -O /usr/bin/quota-vmess-orbit "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-vmess-ws-orbit.sh"
wget -q -O /usr/bin/quota-vmess-orbit1 "https://raw.githubusercontent.com/tumbungbakem/scvip/main/limit/quota-vmess-ws-orbit1.sh"
chmod +x /usr/bin/*
cd 
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/menu
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/running
chmod +x /usr/bin/clearcache
chmod +x /usr/bin/menu-trgo
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/updatemenu
chmod +x /usr/bin/menu-trial
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/usernew
chmod +x /usr/bin/trial
chmod +x /usr/bin/renew
chmod +x /usr/bin/hapus
chmod +x /usr/bin/cek
chmod +x /usr/bin/member
chmod +x /usr/bin/delete
chmod +x /usr/bin/autokill
chmod +x /usr/bin/ceklim
chmod +x /usr/bin/tendang
chmod +x /usr/bin/user-lock
chmod +x /usr/bin/user-unlock
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/menu-domain
chmod +x /usr/bin/add-host
chmod +x /usr/bin/port-change
chmod +x /usr/bin/certv2ray
chmod +x /usr/bin/menu-webmin
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/about
chmod +x /usr/bin/auto-reboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/bw
chmod +x /usr/bin/port-ssl
chmod +x /usr/bin/port-ovpn
chmod +x /usr/bin/xp
chmod +x /usr/bin/acs-set
chmod +x /usr/bin/sshws

cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 2 * * * root /sbin/reboot
END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END

cat > /etc/cron.d/cl_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 1 * * * root /usr/bin/clearlog
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/tumbungbakem/scvip/main/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "=====================-[ BAYU & DANS TUNNEL ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH		: 22"  | tee -a log-install.txt
echo "   - SSH Websocket NTLS   : 80, 8880, 8080, 2082, 2086" | tee -a log-install.txt
echo "   - SSH Websocket TLS    : 443" | tee -a log-install.txt
echo "   - Stunnel4		: 447, 777" | tee -a log-install.txt
echo "   - Dropbear		: 109, 143" | tee -a log-install.txt
echo "   - Badvpn		: 7100-7900" | tee -a log-install.txt
echo "   - Nginx		: 81" | tee -a log-install.txt
echo "   - Vmess TLS		: 443" | tee -a log-install.txt
echo "   - Vmess None TLS	: 80, 8880, 8080, 2082, 2086" | tee -a log-install.txt
echo "   - Vless TLS		: 443" | tee -a log-install.txt
echo "   - Vless None TLS	: 80" | tee -a log-install.txt
echo "   - Trojan GRPC		: 443" | tee -a log-install.txt
echo "   - Trojan WS TLS        : 443" | tee -a log-install.txt
echo "   - Trojan WS NTLS       : 80, 8880, 8080, 2082, 2086" | tee -a log-install.txt
echo "   - Trojan Go		: 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone		: Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban		: [ON]"  | tee -a log-install.txt
echo "   - Dflate		: [ON]"  | tee -a log-install.txt
echo "   - IPtables		: [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot		: [ON]"  | tee -a log-install.txt
echo "   - IPv6			: [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On	: $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo "===============-[ Script Created By BAYU & DANS TUNNEL ]-==============="
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/limit >/dev/null 2>&1
rm /root/setup.sh >/dev/null 2>&1
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
touch /root/.system 
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e "
"
read -n 1 -s -r -p "Pencet [ Enter ] Untuk Reboot"
reboot
