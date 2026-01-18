#!/bin/bash
#
# Service Monitor Script
#
# Monitors critical services and restarts if needed

set -e

# Configuration
SERVICES=("ssh" "cron")
CHECK_INTERVAL=60
LOG_FILE="/tmp/service_monitor.log"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

check_service() {
    local service=$1
    
    # Try different service check methods
    if systemctl is-active --quiet "$service" 2>/dev/null; then
        return 0
    elif pgrep -x "$service" >/dev/null 2>&1; then
        return 0
    elif pgrep "$service" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

restart_service() {
    local service=$1
    log "${YELLOW}Attempting to restart $service...${NC}"
    
    if command -v systemctl >/dev/null 2>&1; then
        sudo systemctl restart "$service" 2>/dev/null || true
    fi
    
    sleep 2
    
    if check_service "$service"; then
        log "${GREEN}✓ $service restarted successfully${NC}"
    else
        log "${RED}✗ Failed to restart $service${NC}"
    fi
}

main() {
    log "Service monitor started"
    
    while true; do
        for service in "${SERVICES[@]}"; do
            if check_service "$service"; then
                echo -e "${GREEN}✓ $service is running${NC}"
            else
                echo -e "${RED}✗ $service is NOT running${NC}"
                log "${RED}Service $service is down${NC}"
                # Uncomment to enable auto-restart
                # restart_service "$service"
            fi
        done
        
        echo ""
        sleep "$CHECK_INTERVAL"
    done
}

# Run once if called with --once flag
if [ "${1:-}" = "--once" ]; then
    for service in "${SERVICES[@]}"; do
        if check_service "$service"; then
            echo -e "${GREEN}✓ $service is running${NC}"
        else
            echo -e "${RED}✗ $service is NOT running${NC}"
        fi
    done
else
    main
fi
