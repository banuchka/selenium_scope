#!/usr/bin/with-contenv bash

DOMAIN=$(hostname -d)
case $DOMAIN in
    'lnd' )
        NS='192.168.17.20'
    ;;
    'd4' )
        NS='192.168.17.20'
    ;;
    'd3' )
        NS='192.168.4.20'
    ;;
    'msk' )
        NS='192.168.4.20'
    ;;
    'mlan' )
        NS='10.10.123.5' 
    ;;
    'ulan' )
        NS='10.20.0.9' 
    ;;
    * )
       NS='10.10.123.5'
    ;;
esac

sed -e "s/^nameserver.*$/nameserver ${NS}/g" /etc/resolv.conf > /tmp/resolv.conf
cat /tmp/resolv.conf | grep -v options > /etc/resolv.conf
echo -e "\e[32mNameserver changed to ${NS}, because we are in ${DOMAIN}\e[0m"
