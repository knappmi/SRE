#!/bin/bash
#
# Backup Script (Exercise)
#
# OBJECTIVE:
# Create a backup script with compression, rotation, and error handling
#
# REQUIREMENTS:
# 1. Accept two command-line arguments:
#    - Source directory/file to backup (default: /tmp/backup_test)
#    - Destination directory for backups (default: /tmp/backups)
# 2. Create timestamped backup using tar and gzip (backup_YYYYMMDD_HHMMSS.tar.gz)
# 3. Implement backup rotation:
#    - Keep backups for 7 days
#    - Delete backups older than retention period
# 4. Display backup information:
#    - Show current backups with sizes
#    - Show which old backups were removed
# 5. Use structured logging with timestamps
# 6. Handle errors:
#    - Check if source exists
#    - Check if backup was created successfully
#    - Exit with code 1 on failure
# 7. Use colors: GREEN for success, RED for errors
#
# HINTS:
# - Use 'date +%Y%m%d_%H%M%S' for timestamp
# - Use 'tar -czf' to create compressed archives
# - Use 'find' with '-mtime +7' to find old files
# - Use 'du -h' to get human-readable sizes
# - Use 'set -e' but turn off for checks
# - Test if file/directory exists: [ -d "$path" ] or [ -f "$path" ]
# - Get directory name: dirname "$path"
# - Get file/directory name: basename "$path"
#
# TODO: Implement the script below

# TODO: Define configuration variables


# TODO: Define color variables


# TODO: Implement log() function for structured logging


# TODO: Implement log_error() function for error logging


# TODO: Implement create_backup_dir() function
# Create backup destination directory if it doesn't exist


# TODO: Implement perform_backup() function
# - Check if source exists
# - Create tar.gz backup
# - Display backup size


# TODO: Implement rotate_backups() function
# - Find backups older than retention period
# - Delete old backups
# - Report how many were deleted


# TODO: Implement list_backups() function
# Display current backups with sizes


# TODO: Implement main() function
# Call all functions in order and display summary


# TODO: Call main function
