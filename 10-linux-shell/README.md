# 10 - Linux & Shell Scripting

## 🎯 Importance

Linux and shell scripting are foundational for SREs:

- **System Administration**: Manage servers and services
- **Automation**: Automate repetitive tasks
- **Troubleshooting**: Debug system issues
- **Log Analysis**: Parse and analyze log files
- **Configuration**: Manage system settings
- **Scripting**: Write tools and utilities

## 🐧 Concepts Covered

### Linux Fundamentals
- File system hierarchy
- Process management
- User and permissions
- Package management
- System services (systemd)
- Cron jobs and scheduling

### Shell Scripting
- Bash syntax and features
- Variables and conditionals
- Loops and functions
- Input/output redirection
- Pipes and filters
- Text processing (awk, sed, grep)

### Essential Commands
- File operations: ls, cp, mv, rm, find
- Text processing: cat, grep, sed, awk, cut
- System info: top, ps, df, du, free
- Networking: curl, wget, netstat, ss
- Archives: tar, gzip, zip

## 🚀 Getting Started

### Essential Commands Quick Reference

```bash
# File operations
ls -lah              # List files with details
find . -name "*.log" # Find files
grep "error" *.log   # Search in files
tail -f /var/log/syslog  # Follow log file

# Process management
ps aux               # List all processes
top                  # Interactive process viewer
htop                 # Better process viewer
kill -9 PID          # Kill process
pgrep nginx          # Find process by name

# System information
df -h                # Disk usage
du -sh *             # Directory sizes
free -h              # Memory usage
uptime               # System uptime
uname -a             # System information

# User management
whoami               # Current user
id                   # User ID and groups
sudo -i              # Switch to root
chmod 755 file.sh    # Change permissions
chown user:group file  # Change ownership

# Package management (Ubuntu/Debian)
apt update           # Update package list
apt install package  # Install package
apt remove package   # Remove package

# Package management (RHEL/CentOS)
yum update           # Update packages
yum install package  # Install package

# Service management (systemd)
systemctl status service    # Check status
systemctl start service     # Start service
systemctl stop service      # Stop service
systemctl restart service   # Restart service
systemctl enable service    # Enable at boot
```

## 📖 What You'll Learn

1. **File System**: Navigate and manage files
2. **Processes**: Monitor and control processes
3. **Permissions**: Understand and set file permissions
4. **Shell Scripting**: Write automation scripts
5. **Text Processing**: Master awk, sed, grep
6. **System Monitoring**: Track system resources
7. **Log Analysis**: Parse and analyze logs
8. **Cron Jobs**: Schedule automated tasks

## 💡 Best Practices

### Scripting
- Always use `#!/bin/bash` shebang
- Use `set -e` to exit on errors
- Quote variables: `"$variable"`
- Use functions for reusability
- Add comments and documentation
- Handle errors gracefully
- Make scripts idempotent

### Security
- Never run scripts as root unnecessarily
- Validate user input
- Use absolute paths
- Set proper file permissions (chmod 700)
- Don't store secrets in scripts
- Use sudo judiciously

### Performance
- Avoid unnecessary command calls
- Use built-in shell features
- Minimize pipe chains
- Use appropriate tools (awk vs sed vs grep)
- Consider script complexity

### Debugging
- Use `set -x` for verbose output
- Add echo statements
- Check exit codes: `$?`
- Use shellcheck for linting
- Test in isolation first

## 🎓 Exercise Progression

1. Basic file operations
2. Process management
3. Text processing with grep/sed/awk
4. Write simple shell scripts
5. System monitoring scripts
6. Log analysis scripts
7. Automated backup scripts
8. Complex multi-function scripts

## 📚 Additional Resources

- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
- [Linux Command Line](https://linuxcommand.org/)
- [ShellCheck](https://www.shellcheck.net/) - Script linting
- [Explain Shell](https://explainshell.com/) - Command explanations
- [The Linux Command Line Book](http://linuxcommand.org/tlcl.php)

## ⚠️ Important Notes

- Always test scripts in non-production first
- Be careful with `rm -rf` commands
- Use version control for scripts
- Document script behavior
- Consider edge cases and error conditions
- Make scripts portable when possible
