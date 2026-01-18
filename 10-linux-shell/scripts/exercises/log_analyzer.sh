#!/bin/bash
#
# Log Analyzer Script (Exercise)
#
# OBJECTIVE:
# Analyze system log files for errors and warnings, providing useful statistics
#
# REQUIREMENTS:
# 1. Accept log file path as first argument (default: /var/log/syslog)
# 2. Accept number of lines to analyze as second argument (default: 100)
# 3. Check if log file exists, try alternative locations if not
# 4. If no log file found, create sample log data for testing
# 5. Count and display:
#    - Total errors (lines containing "error", case-insensitive)
#    - Total warnings (lines containing "warning", case-insensitive)
# 6. Show:
#    - Last 5 error messages
#    - Last 5 warning messages
#    - Most common error patterns (top 5)
# 7. Use colors: red for errors, yellow for warnings, green for completion
# 8. Format output with clear sections and separators
#
# HINTS:
# - Use 'tail -n' to get last N lines
# - Use 'grep -i' for case-insensitive search
# - Use '|| echo "0"' to handle no matches gracefully
# - For pattern analysis: awk to extract message, sort | uniq -c | sort -rn
# - Alternative log locations: /var/log/messages, /var/log/system.log
# - Create sample log with 'cat > file << EOF ... EOF'
# - Check file existence: [ -f "$LOG_FILE" ]
#
# TODO: Implement the script below

# TODO: Enable exit on error


# TODO: Get command-line arguments
# LOG_FILE (default: /var/log/syslog)
# LINES (default: 100)


# TODO: Define color variables


# TODO: Display header with log file and lines count


# TODO: Check if log file exists
# If not, try alternative locations
# If still not found, create sample log data


# TODO: Count errors
# Use grep -ci "error" on last N lines


# TODO: Count warnings
# Use grep -ci "warning" on last N lines


# TODO: Display recent errors (if any)
# Show last 5 error lines


# TODO: Display recent warnings (if any)
# Show last 5 warning lines


# TODO: Display most common error patterns
# Extract error messages, count occurrences, show top 5


# TODO: Display completion footer
