#!/bin/bash
#
# Network Diagnostics Tool (Exercise)
#
# OBJECTIVE:
# Build a comprehensive network troubleshooting script
#
# REQUIREMENTS:
# 1. Accept target hostname/domain as argument (default: google.com)
# 2. Perform these diagnostic checks:
#    - DNS resolution (nslookup or dig)
#    - ICMP ping (connectivity and latency)
#    - HTTP/HTTPS connectivity (curl)
#    - Port scanning (ports 80, 443)
#    - Route tracing (traceroute, first 10 hops)
#    - DNS details (A and AAAA records)
# 3. Use colored output (blue=section headers, green=success, red=failure, yellow=warning)
# 4. Display results in organized sections with clear status indicators
# 5. Handle missing tools gracefully (check with 'command -v')
#
# HINTS:
# - Use 'nslookup' or 'dig' for DNS
# - Use 'ping -c 3' for connectivity
# - Use 'curl -s -o /dev/null -w "%{http_code}"' for HTTP checks
# - Use 'timeout' with '/dev/tcp' for port checks
# - Use 'traceroute -m 10' to limit hops
# - Check tool availability: command -v tool >/dev/null 2>&1
#
# TODO: Implement the script below

# TODO: Define color variables


# TODO: Get target from argument (default: google.com)


# TODO: Display header


# TODO: Section 1: DNS Resolution
# Use nslookup to resolve target
# Extract and display IP address


# TODO: Section 2: ICMP Ping
# Ping with 3 packets
# Extract and display average latency


# TODO: Section 3: HTTP/HTTPS Connectivity
# Test both http:// and https://
# Show response codes and times


# TODO: Section 4: Port Check
# Check common ports (80, 443)
# Use /dev/tcp method with timeout


# TODO: Section 5: Route Tracing
# Use traceroute if available (first 10 hops)


# TODO: Section 6: DNS Details
# Show A and AAAA records using dig or nslookup


# TODO: Display completion footer

