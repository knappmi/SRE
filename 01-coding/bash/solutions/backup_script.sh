#!/bin/bash
#
# Backup Script
#
# Demonstrates: file operations, compression, rotation, and error handling

set -e

# Configuration
BACKUP_SOURCE="${1:-/tmp/backup_test}"
BACKUP_DEST="${2:-/tmp/backups}"
RETENTION_DAYS=7
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Create backup directory if it doesn't exist
create_backup_dir() {
    if [ ! -d "$BACKUP_DEST" ]; then
        log "Creating backup directory: $BACKUP_DEST"
        mkdir -p "$BACKUP_DEST"
    fi
}

# Perform the backup
perform_backup() {
    log "Starting backup of $BACKUP_SOURCE"
    
    if [ ! -d "$BACKUP_SOURCE" ] && [ ! -f "$BACKUP_SOURCE" ]; then
        log_error "Source $BACKUP_SOURCE does not exist"
        exit 1
    fi
    
    cd "$(dirname "$BACKUP_SOURCE")"
    local source_name=$(basename "$BACKUP_SOURCE")
    
    tar -czf "${BACKUP_DEST}/${BACKUP_NAME}" "$source_name" 2>/dev/null || {
        log_error "Backup failed"
        exit 1
    }
    
    local size=$(du -h "${BACKUP_DEST}/${BACKUP_NAME}" | cut -f1)
    log "Backup created: ${BACKUP_NAME} (${size})"
}

# Rotate old backups
rotate_backups() {
    log "Rotating backups older than ${RETENTION_DAYS} days"
    
    local deleted=0
    while IFS= read -r -d '' backup; do
        log "Removing old backup: $(basename "$backup")"
        rm -f "$backup"
        ((deleted++))
    done < <(find "$BACKUP_DEST" -name "backup_*.tar.gz" -type f -mtime +${RETENTION_DAYS} -print0)
    
    if [ $deleted -eq 0 ]; then
        log "No old backups to remove"
    else
        log "Removed $deleted old backup(s)"
    fi
}

# List current backups
list_backups() {
    log "Current backups in $BACKUP_DEST:"
    if [ -d "$BACKUP_DEST" ]; then
        ls -lh "$BACKUP_DEST"/backup_*.tar.gz 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
    fi
}

main() {
    echo "========================================"
    echo "💾 Backup Script"
    echo "========================================"
    
    create_backup_dir
    perform_backup
    rotate_backups
    list_backups
    
    echo "========================================"
    echo -e "${GREEN}✓ Backup completed successfully${NC}"
    echo "========================================"
}

main
