#!/bin/bash
#
# System Information Script
#
# Displays comprehensive system information

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "========================================"
echo "🖥️  System Information Report"
echo "========================================"
echo ""

# System info
echo -e "${BLUE}System Information:${NC}"
echo "  Hostname: $(hostname)"
echo "  OS: $(uname -s)"
echo "  Kernel: $(uname -r)"
echo "  Architecture: $(uname -m)"
echo "  Uptime: $(uptime -p 2>/dev/null || uptime)"
echo ""

# CPU info
echo -e "${BLUE}CPU Information:${NC}"
if [ -f /proc/cpuinfo ]; then
    cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)
    cpu_cores=$(grep -c "^processor" /proc/cpuinfo)
    echo "  Model: $cpu_model"
    echo "  Cores: $cpu_cores"
else
    echo "  CPU info not available"
fi
echo ""

# Memory info
echo -e "${BLUE}Memory Information:${NC}"
if command -v free >/dev/null 2>&1; then
    free -h | grep -E "Mem|Swap" | awk '{printf "  %-8s Total: %-8s Used: %-8s Free: %-8s\n", $1, $2, $3, $4}'
else
    echo "  Memory info not available"
fi
echo ""

# Disk info
echo -e "${BLUE}Disk Usage:${NC}"
df -h | grep -E "^/dev" | awk '{printf "  %-20s %-8s %-8s %-8s %s\n", $1, $2, $3, $4, $5}'
echo ""

# Network info
echo -e "${BLUE}Network Interfaces:${NC}"
if command -v ip >/dev/null 2>&1; then
    ip -brief addr | awk '{printf "  %-15s %s\n", $1, $3}'
else
    ifconfig | grep -E "^[a-z]|inet " | head -10
fi
echo ""

# Load average
echo -e "${BLUE}Load Average:${NC}"
uptime | awk -F'load average:' '{print "  " $2}'
echo ""

# Top processes
echo -e "${BLUE}Top 5 Processes by CPU:${NC}"
ps aux --sort=-%cpu | head -6 | tail -5 | awk '{printf "  %-20s %5s%% %s\n", $11, $3, $2}'
echo ""

# Top processes by memory
echo -e "${BLUE}Top 5 Processes by Memory:${NC}"
ps aux --sort=-%mem | head -6 | tail -5 | awk '{printf "  %-20s %5s%% %s\n", $11, $4, $2}'
echo ""

echo "========================================"
echo -e "${GREEN}Report complete!${NC}"
echo "========================================"
