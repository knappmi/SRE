#!/bin/bash
#
# Log Analyzer Script
#
# Analyzes system logs for errors and warnings

set -e

LOG_FILE="${1:-/var/log/syslog}"
LINES="${2:-100}"

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "========================================"
echo "📊 Log Analysis Tool"
echo "========================================"
echo "Log file: $LOG_FILE"
echo "Lines to analyze: $LINES"
echo ""

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    # Try alternative log locations
    for alt_log in /var/log/messages /var/log/system.log; do
        if [ -f "$alt_log" ]; then
            LOG_FILE="$alt_log"
            echo "Using alternative log: $LOG_FILE"
            break
        fi
    done
    
    if [ ! -f "$LOG_FILE" ]; then
        echo "Error: Log file not found. Creating sample data..."
        LOG_FILE="/tmp/sample.log"
        cat > "$LOG_FILE" << 'EOF'
2024-01-18 10:00:01 INFO: System started successfully
2024-01-18 10:00:15 WARNING: High memory usage detected
2024-01-18 10:01:23 ERROR: Failed to connect to database
2024-01-18 10:02:45 INFO: Connection restored
2024-01-18 10:05:12 ERROR: Disk space low on /var
2024-01-18 10:10:00 WARNING: Service restart required
EOF
        echo "Created sample log at $LOG_FILE"
        echo ""
    fi
fi

# Error count
echo -e "${RED}Error Count:${NC}"
error_count=$(tail -n "$LINES" "$LOG_FILE" | grep -ci "error" || echo "0")
echo "  Total errors: $error_count"
echo ""

# Warning count
echo -e "${YELLOW}Warning Count:${NC}"
warning_count=$(tail -n "$LINES" "$LOG_FILE" | grep -ci "warning" || echo "0")
echo "  Total warnings: $warning_count"
echo ""

# Recent errors
if [ "$error_count" -gt 0 ]; then
    echo -e "${RED}Recent Errors (last 5):${NC}"
    tail -n "$LINES" "$LOG_FILE" | grep -i "error" | tail -5
    echo ""
fi

# Recent warnings
if [ "$warning_count" -gt 0 ]; then
    echo -e "${YELLOW}Recent Warnings (last 5):${NC}"
    tail -n "$LINES" "$LOG_FILE" | grep -i "warning" | tail -5
    echo ""
fi

# Most common error messages
echo -e "${RED}Most Common Error Patterns:${NC}"
tail -n "$LINES" "$LOG_FILE" | grep -i "error" | awk '{for(i=4;i<=NF;i++) printf "%s ", $i; print ""}' | sort | uniq -c | sort -rn | head -5
echo ""

echo "========================================"
echo -e "${GREEN}Analysis complete!${NC}"
echo "========================================"
