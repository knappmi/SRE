#!/bin/bash
#
# Port Scanner Script (Exercise)
#
# OBJECTIVE:
# Create a simple port scanner to check which ports are open on a target
#
# REQUIREMENTS:
# 1. Accept target hostname/IP as first argument (default: localhost)
# 2. Accept comma-separated port list as second argument
#    (default: 22,80,443,3306,5432,6379,8080,9090)
# 3. Validate target format to prevent command injection
#    (only alphanumeric, dots, and hyphens allowed)
# 4. For each port, check if it's open using TCP connection
# 5. Display results with status indicators (✓ OPEN or ✗ CLOSED)
# 6. Use timeout to avoid hanging on closed ports
#
# HINTS:
# - Use regex to validate target: [[ "$TARGET" =~ ^[a-zA-Z0-9.-]+$ ]]
# - Split ports: IFS=',' read -ra PORT_ARRAY <<< "$PORTS"
# - Check port: timeout 1 bash -c "cat < /dev/null > /dev/tcp/${TARGET}/${port}"
# - Use 2>/dev/null to suppress error messages
# - Exit with code 1 if target validation fails
#
# TODO: Implement the script below

# TODO: Enable exit on error


# TODO: Get target and ports from arguments (with defaults)


# TODO: Validate target format (alphanumeric, dots, hyphens only)
# If invalid, print error and exit


# TODO: Display header with target and ports


# TODO: Split ports into array (use IFS and read)


# TODO: Loop through each port and check if open
# Use timeout and /dev/tcp method
# Display ✓ OPEN or ✗ CLOSED for each port

