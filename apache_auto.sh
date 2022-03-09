#!/bin/bash
if [ `whoami` != 'root' ]
  then
      echo "You must be root."
    else
       apt install apache2 -y;
       systemctl start nftables.service;
       nft add rule inet filter input tcp dport {80, 443} ct state new,established counter accept;
       hostname --all-ip-addresses | awk '{print $1}'
       systemctl start apache2
    exit
fi
