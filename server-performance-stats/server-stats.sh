#!/bin/bash

echo "---------------"
echo "Total CPU Usage"
echo "---------------"


top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

