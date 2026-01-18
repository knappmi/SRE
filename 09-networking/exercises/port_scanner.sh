#!/bin/bash
#
# Port Scanner Script
#
# Scans common ports on a target host

set -e

TARGET="${1:-localhost}"
PORTS="${2:-22,80,443,3306,5432,6379,8080,9090}"

# Validate target to prevent command injection
if [[ ! "$TARGET" =~ ^[a-zA-Z0-9.-]+$ ]]; then
    echo "Error: Invalid target format"
    exit 1
fi

echo "🔍 Port Scanner"
echo "Target: $TARGET"
echo "Ports: $PORTS"
echo ""

IFS=',' read -ra PORT_ARRAY <<< "$PORTS"

for port in "${PORT_ARRAY[@]}"; do
    if timeout 1 bash -c "cat < /dev/null > /dev/tcp/${TARGET}/${port}" 2>/dev/null; then
        echo "✓ Port $port: OPEN"
    else
        echo "✗ Port $port: CLOSED"
    fi
done
