#!/bin/bash
#
# Network Troubleshooting Script
#
# This script performs common network diagnostics

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

TARGET="${1:-google.com}"

echo "========================================"
echo "🌐 Network Diagnostics Tool"
echo "========================================"
echo "Target: $TARGET"
echo ""

# 1. Check DNS resolution
echo -e "${BLUE}[1/6] DNS Resolution${NC}"
if nslookup "$TARGET" >/dev/null 2>&1; then
    IP=$(nslookup "$TARGET" | grep -A1 "Name:" | grep "Address:" | tail -1 | awk '{print $2}')
    echo -e "${GREEN}✓ DNS resolution successful${NC}"
    echo "  Resolved IP: $IP"
else
    echo -e "${RED}✗ DNS resolution failed${NC}"
    exit 1
fi
echo ""

# 2. Check connectivity (ping)
echo -e "${BLUE}[2/6] ICMP Connectivity (ping)${NC}"
if ping -c 3 -W 2 "$TARGET" >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Host is reachable${NC}"
    avg_time=$(ping -c 3 "$TARGET" 2>/dev/null | tail -1 | awk -F'/' '{print $5}')
    echo "  Average latency: ${avg_time}ms"
else
    echo -e "${YELLOW}⚠ Ping failed (might be blocked by firewall)${NC}"
fi
echo ""

# 3. Check HTTP/HTTPS connectivity
echo -e "${BLUE}[3/6] HTTP/HTTPS Connectivity${NC}"
for protocol in http https; do
    if curl -s -o /dev/null -w "%{http_code}" --max-time 5 "${protocol}://${TARGET}" | grep -q "200\|301\|302"; then
        response_time=$(curl -s -o /dev/null -w "%{time_total}" "${protocol}://${TARGET}")
        echo -e "${GREEN}✓ ${protocol^^} is accessible${NC}"
        echo "  Response time: ${response_time}s"
    else
        echo -e "${RED}✗ ${protocol^^} is not accessible${NC}"
    fi
done
echo ""

# 4. Check open ports
echo -e "${BLUE}[4/6] Common Port Check${NC}"
for port in 80 443; do
    if timeout 2 bash -c "cat < /dev/null > /dev/tcp/${TARGET}/${port}" 2>/dev/null; then
        echo -e "${GREEN}✓ Port $port is open${NC}"
    else
        echo -e "${YELLOW}⚠ Port $port is closed or filtered${NC}"
    fi
done
echo ""

# 5. Trace route
echo -e "${BLUE}[5/6] Route Tracing (first 10 hops)${NC}"
if command -v traceroute >/dev/null 2>&1; then
    traceroute -m 10 "$TARGET" 2>/dev/null | head -n 12 || echo "Traceroute not available"
else
    echo "Traceroute not installed"
fi
echo ""

# 6. DNS details
echo -e "${BLUE}[6/6] DNS Details${NC}"
if command -v dig >/dev/null 2>&1; then
    echo "A Records:"
    dig +short "$TARGET" A | head -n 3
    echo ""
    echo "AAAA Records (IPv6):"
    dig +short "$TARGET" AAAA | head -n 3 || echo "No IPv6 records"
else
    echo "dig not installed, using nslookup"
    nslookup "$TARGET"
fi

echo ""
echo "========================================"
echo -e "${GREEN}Diagnostics complete!${NC}"
echo "========================================"
