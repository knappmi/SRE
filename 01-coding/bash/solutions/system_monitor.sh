#!/bin/bash
#
# System Health Monitor
#
# Monitors key system metrics and alerts on thresholds.
# Demonstrates: thresholds, arithmetic, alerts, and system monitoring.

set -e

# Configuration
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=85

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check CPU usage
check_cpu() {
    local cpu_usage
    
    # Get CPU usage (works on Linux)
    if [[ "$(uname)" == "Linux" ]]; then
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
        cpu_usage=${cpu_usage%.*}  # Convert to integer
    else
        # macOS alternative
        cpu_usage=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
        cpu_usage=${cpu_usage%.*}
    fi
    
    echo -n "🖥️  CPU Usage: ${cpu_usage}% "
    
    if (( cpu_usage > CPU_THRESHOLD )); then
        echo -e "${RED}[ALERT]${NC}"
        return 1
    else
        echo -e "${GREEN}[OK]${NC}"
        return 0
    fi
}

# Check memory usage
check_memory() {
    local mem_usage
    
    if [[ "$(uname)" == "Linux" ]]; then
        mem_usage=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
    else
        # macOS alternative
        mem_usage=$(ps -A -o %mem | awk '{s+=$1} END {print int(s)}')
    fi
    
    echo -n "💾 Memory Usage: ${mem_usage}% "
    
    if (( mem_usage > MEMORY_THRESHOLD )); then
        echo -e "${RED}[ALERT]${NC}"
        return 1
    else
        echo -e "${GREEN}[OK]${NC}"
        return 0
    fi
}

# Check disk usage
check_disk() {
    local disk_usage
    disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    
    echo -n "💿 Disk Usage: ${disk_usage}% "
    
    if (( disk_usage > DISK_THRESHOLD )); then
        echo -e "${RED}[ALERT]${NC}"
        return 1
    else
        echo -e "${GREEN}[OK]${NC}"
        return 0
    fi
}

# Check if critical services are running
check_services() {
    echo ""
    echo "🔍 Service Status:"
    
    # Example services to check (customize for your system)
    local services=("sshd" "cron")
    
    for service in "${services[@]}"; do
        if pgrep -x "$service" > /dev/null 2>&1 || pgrep "$service" > /dev/null 2>&1; then
            echo -e "  ${service}: ${GREEN}[RUNNING]${NC}"
        else
            echo -e "  ${service}: ${YELLOW}[NOT FOUND]${NC}"
        fi
    done
}

# Main monitoring function
main() {
    echo "========================================"
    echo "🏥 System Health Check"
    echo "========================================"
    echo ""
    echo "📊 Resource Usage:"
    
    local status=0
    
    check_cpu || status=1
    check_memory || status=1
    check_disk || status=1
    
    check_services
    
    echo ""
    echo "========================================"
    
    if [ $status -eq 0 ]; then
        echo -e "${GREEN}✓ All checks passed${NC}"
    else
        echo -e "${RED}✗ Some checks failed${NC}"
    fi
    
    echo "========================================"
    
    exit $status
}

main
