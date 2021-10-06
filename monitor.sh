#! /bin/bash
varDate=$(date '+%Y/%m/%d %H:%M:%S')
loadAverage=$(top -n 1 -b | grep "load average:" | awk '{print $12 $13 $14}')
varUptime=$(uptime | awk '{print $3,$4,$5}')
varUptime=$(echo $varUptime | rev | cut -c2- | rev)
varMem=$(free -h | grep "Mem" | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7}')
varSwap=$(free -h | grep "Swap" | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7}')

echo $varDate "|" $HOSTNAME "| Uptime:"  $varUptime "| Load:" $loadAverage "|" $varMem "|" $varSwap >> /var/log/sysmonitor