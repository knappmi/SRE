#!/bin/bash
#
# System Health Monitor (Exercise)
#
# OBJECTIVE:
# Create a system monitoring script that checks key metrics and alerts on thresholds
#
# REQUIREMENTS:
# 1. Check CPU usage and compare against threshold (80%)
# 2. Check memory usage and compare against threshold (80%)
# 3. Check disk usage and compare against threshold (85%)
# 4. Check if critical services are running (e.g., sshd, cron)
# 5. Display status with colored output:
#    - GREEN [OK] if metric is below threshold
#    - RED [ALERT] if metric is above threshold
# 6. Exit with code 0 if all checks pass, 1 if any check fails
# 7. Support both Linux and macOS commands where possible
#
# HINTS:
# - Use 'top -bn1' on Linux or 'ps' on macOS for CPU usage
# - Use 'free' on Linux or 'ps' on macOS for memory usage
# - Use 'df /' for disk usage
# - Use 'pgrep' to check if a service is running
# - Use ANSI color codes: RED='\033[0;31m', GREEN='\033[0;32m', NC='\033[0m'
# - Use 'uname' to detect OS (Linux vs Darwin for macOS)
# - Use bash arithmetic: (( value > threshold ))
# - Use 'set -e' carefully - turn off for checks that might fail
#
# TODO: Implement the script below

# TODO: Define configuration variables (thresholds)


# TODO: Define color variables


# TODO: Implement check_cpu() function
# Should display CPU usage and return 0 if OK, 1 if over threshold


# TODO: Implement check_memory() function
# Should display memory usage and return 0 if OK, 1 if over threshold


# TODO: Implement check_disk() function
# Should display disk usage and return 0 if OK, 1 if over threshold


# TODO: Implement check_services() function
# Should check if sshd and cron are running and display status


# TODO: Implement main() function
# Should call all check functions and display summary


# TODO: Call main function
