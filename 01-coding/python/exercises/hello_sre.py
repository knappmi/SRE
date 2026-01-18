#!/usr/bin/env python3
"""
Hello SRE - Python Edition (Exercise)

OBJECTIVE:
Create a simple Python script that demonstrates SRE fundamentals:
- Logging configuration
- Error handling
- System information gathering

REQUIREMENTS:
1. Configure logging with timestamp, level, and message format
2. Create a function get_system_info() that returns a dictionary containing:
   - hostname
   - operating system
   - os version
   - architecture
   - python version
   - current timestamp (ISO format)
3. Implement proper error handling in get_system_info()
4. Create a main() function that:
   - Logs script start and completion
   - Calls get_system_info()
   - Displays results in a formatted way
   - Returns 0 on success, 1 on error
5. Use proper if __name__ == "__main__" pattern

HINTS:
- Use the logging module for structured logging
- Use the platform module for system information
- Use datetime.now().isoformat() for timestamps
- Wrap operations in try-except blocks
- Use f-strings for formatted output

TODO: Implement the script below
"""

import logging
import platform
import sys
from datetime import datetime

# TODO: Configure logging with appropriate format


# TODO: Create logger instance


def get_system_info():
    """
    Gather system information - a common SRE task.
    
    Returns:
        dict: System information
    """
    # TODO: Implement this function
    # Return a dictionary with hostname, os, os_version, architecture, 
    # python_version, and timestamp
    pass


def main():
    """Main function with proper error handling."""
    # TODO: Implement main function
    # - Log script start
    # - Get system info
    # - Display results with nice formatting
    # - Log completion
    # - Return appropriate exit code
    pass


if __name__ == "__main__":
    # TODO: Call main() and exit with its return value
    pass
