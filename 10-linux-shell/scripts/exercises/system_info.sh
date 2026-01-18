#!/bin/bash
#
# System Information Script (Exercise)
#
# OBJECTIVE:
# Create a comprehensive system information gathering script for SRE work
#
# REQUIREMENTS:
# 1. Display the following information sections:
#    - System: hostname, OS, kernel version, architecture, uptime
#    - CPU: model name, number of cores
#    - Memory: total, used, free (for RAM and swap)
#    - Disk: usage information for mounted filesystems
#    - Network: interface names and IP addresses
#    - Load: system load averages
#    - Processes: top 5 processes by CPU and memory usage
#
# 2. Use colors for section headers (blue) and success messages (green)
# 3. Handle both Linux and macOS where commands differ
# 4. Format output in a clean, readable table format
# 5. Handle missing commands gracefully (check with 'command -v')
#
# HINTS:
# - Use 'hostname', 'uname', 'uptime' for system info
# - Check /proc/cpuinfo on Linux for CPU details
# - Use 'free -h' on Linux for memory
# - Use 'df -h' for disk usage, filter with 'grep -E "^/dev"'
# - Use 'ip -brief addr' or 'ifconfig' for network interfaces
# - Use 'ps aux --sort=-%cpu' on Linux (different on macOS)
# - Use awk for formatting: '{printf "  %-20s %s\n", $1, $2}'
#
# TODO: Implement the script below

# TODO: Enable exit on error (set -e)


# TODO: Define color variables (BLUE, GREEN, NC)


# TODO: Display header


# TODO: System Information section
# Display hostname, OS, kernel, architecture, uptime


# TODO: CPU Information section
# Read from /proc/cpuinfo if available


# TODO: Memory Information section
# Use 'free -h' if available


# TODO: Disk Usage section
# Use 'df -h' and filter mounted filesystems


# TODO: Network Interfaces section
# Use 'ip' or 'ifconfig' based on availability


# TODO: Load Average section
# Parse from 'uptime' command


# TODO: Top 5 Processes by CPU section
# Use 'ps aux' with sorting


# TODO: Top 5 Processes by Memory section
# Use 'ps aux' with sorting


# TODO: Display footer with completion message
