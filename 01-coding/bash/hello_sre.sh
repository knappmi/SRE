#!/bin/bash
#
# Hello SRE - Bash Edition
#
# This script demonstrates basic bash scripting concepts for SREs:
# - Variables and string manipulation
# - Functions
# - Error handling with set -e
# - System information gathering
# - Logging

# Exit on any error
set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Function to gather system information
get_system_info() {
    log "Gathering system information..."
    
    echo ""
    echo "========================================"
    echo "🚀 Hello from SRE Training!"
    echo "========================================"
    echo ""
    echo "📊 System Information:"
    echo "  Hostname: $(hostname)"
    echo "  OS: $(uname -s)"
    echo "  Kernel: $(uname -r)"
    echo "  Architecture: $(uname -m)"
    echo "  Uptime: $(uptime -p 2>/dev/null || uptime)"
    echo "  Current User: $(whoami)"
    echo "  Shell: $SHELL"
    echo "  Date: $(date)"
    echo ""
    echo "========================================"
    echo ""
}

# Function to check disk usage
check_disk_usage() {
    log "Checking disk usage..."
    echo "💾 Disk Usage:"
    df -h / | tail -n 1 | awk '{print "  Root partition: " $5 " used (" $3 " / " $2 ")"}'
}

# Main function
main() {
    log "Starting SRE Hello World script"
    
    get_system_info
    check_disk_usage
    
    log_success "Script completed successfully"
}

# Run main function
main
