#!/bin/bash
#
# Service Monitor Script (Exercise)
#
# OBJECTIVE:
# Build a service monitoring script that checks if critical services are running
# and optionally restarts them
#
# REQUIREMENTS:
# 1. Monitor a configurable list of services (e.g., ssh, cron)
# 2. Support both one-time check (--once flag) and continuous monitoring
# 3. In continuous mode, check services every N seconds (configurable)
# 4. Log all events to a log file with timestamps
# 5. Check service status using multiple methods (systemctl, pgrep)
# 6. Optionally restart services that are down (commented out by default)
# 7. Use colors for status display (green=running, red=down, yellow=restarting)
#
# HINTS:
# - Use arrays for service list: SERVICES=("ssh" "cron")
# - Use 'systemctl is-active --quiet' on systemd systems
# - Use 'pgrep' as fallback for other systems
# - Log format: "[YYYY-MM-DD HH:MM:SS] message"
# - Use 'tee -a' to write to both stdout and log file
# - Use 'sleep' for check intervals
# - Use while true loop for continuous monitoring
#
# TODO: Implement the script below

# TODO: Enable exit on error


# TODO: Configuration variables
# - SERVICES array
# - CHECK_INTERVAL (seconds)
# - LOG_FILE path


# TODO: Define color variables


# TODO: Implement log() function
# Takes message as parameter, adds timestamp, writes to stdout and log file


# TODO: Implement check_service() function
# Takes service name as parameter
# Returns 0 if running, 1 if not
# Try systemctl first, then pgrep


# TODO: Implement restart_service() function
# Takes service name as parameter
# Logs restart attempt, uses systemctl, checks if successful


# TODO: Implement main() function
# Continuous monitoring loop
# Check each service, log status, optionally restart


# TODO: Handle --once flag
# If present, run checks once and exit
# Otherwise, run main() loop
