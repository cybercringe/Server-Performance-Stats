#!/bin/bash

echo "===== Server Performance Stats ====="

# CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " 100 - $8 "%, Idle: " $8 "%"}'

# Memory Usage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2{printf "Used: %dMB (%.2f%%), Free: %dMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2}'

# Disk Usage
echo -e "\nDisk Usage:"
df -h --total | grep "total" | awk '{printf "Used: %s (%s), Free: %s\n", $3, $5, $4}'

# Top 5 Processes by CPU
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo "====================================="
