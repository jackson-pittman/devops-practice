#!/bin/bash

echo "---------------"
echo "Total CPU Usage"
echo "---------------"

top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo "---------------"
echo "Total Memory Usage"
echo "---------------"

free -h | awk 'NR==2{printf "Used: %s / Free: %s (%.2f%%)\n", $3, $4, $3*100/$2 }'

echo "---------------"
echo "Total Disk Usage"
echo "---------------"

df -h --total | grep 'total' | awk '{print "Used: " $3 " / Free: " $4 " (" $5 " used)"}'

echo "---------------"
echo "Top 5 Processes By CPU Usage"
echo "---------------"

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo "---------------"
echo "Top 5 Processes By Memory Usage"
echo "---------------"

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
