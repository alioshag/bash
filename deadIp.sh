#!/bin/bash
#description: output failed ip addresses from a pre define array
#author: ALiG 06/23/15
#version 1.0
#

#declare an array
declare -a IPHOST=("127.0.0.1" 
                   "128.0.0.1" 
                   "88.110.215.13" 
                   "88.110.215.20" 
                   "88.110.215.145" 
                   "88.110.224.151" 
                   "88.110.224.152"
                   "88.110.224.155"
                   "88.110.224.156"
                   "88.110.224.161"
                   "88.110.224.162"
                   "88.110.224.167"
                   "88.110.224.168")

#sudo ping -c 3 -w 3 128.0.0.1 &> /dev/null
#IPHOST_alive=$?

VERSION=1.0

function check_tcp_ip_host {
    for i in "${IPHOST[@]}"; do

      (ping -c 1 -w 3 $i) &> /dev/null
      alive=$?
#      echo $i " - " $alive
      
      if [ $alive -gt 0 ]; then
          echo $i  " problem"
      fi;
    done  
}



case $1 in
      -h|--help)
               echo "Usage: deadIp [OPTION]"
               echo "Shows the IP addresses that do not respond to the ping command."
               echo ""
               echo "Options:"
               echo "-h, --help: this help"
               echo "v, --version: shows program version"
               exit
               ;;
      -v|--version)
               echo "deadIp version " $VERSION
               echo "Written by ALiG"
               exit
               ;;
               
esac

#echo "Message = " $Message

check_tcp_ip_host

exit 0
