#!/usr/bin/env python3
"""
Log Analyzer (Exercise)

OBJECTIVE:
Build a log analyzer that processes web server logs and generates statistics.

REQUIREMENTS:
1. Parse Apache/Nginx Common Log Format:
   - IP address, timestamp, HTTP method, path, status code, response size
   - Example: 192.168.1.1 - - [01/Jan/2024:12:00:00 +0000] "GET /api/users HTTP/1.1" 200 1234

2. Track and count:
   - Total requests
   - Status codes (with counts)
   - Most accessed paths (top 5)
   - Unique IP addresses
   - HTTP methods used
   - Errors (4xx and 5xx responses)

3. Generate a report displaying:
   - Summary statistics (total requests, unique IPs, error rate)
   - Top 5 paths by request count
   - Status code distribution with percentages
   - Top 5 IP addresses
   - Last 10 errors with details

4. Accept log file path as command-line argument
5. Handle file not found and parsing errors gracefully

SAMPLE LOG FORMAT:
192.168.1.1 - - [01/Jan/2024:12:00:00 +0000] "GET /index.html HTTP/1.1" 200 1234
10.0.0.1 - - [01/Jan/2024:12:00:01 +0000] "POST /api/users HTTP/1.1" 201 567
192.168.1.5 - - [01/Jan/2024:12:00:02 +0000] "GET /api/404 HTTP/1.1" 404 0

HINTS:
- Use re (regular expressions) module for parsing
- Use collections.Counter for counting
- Use argparse for command-line arguments
- Store errors in a list for reporting

TODO: Implement the log analyzer below
"""

import re
import sys
import argparse
from collections import Counter, defaultdict
from typing import Dict, List

# TODO: Define a class LogAnalyzer

class LogAnalyzer:
    """Analyze web server logs."""
    
    # TODO: Define a regex pattern for common log format
    # Common log format structure:
    # IP - - [timestamp] "METHOD path PROTOCOL" status size
    # Example: 192.168.1.1 - - [01/Jan/2024:12:00:00 +0000] "GET /index.html HTTP/1.1" 200 1234
    # Use named groups: (?P<name>pattern)
    # \S+ matches non-whitespace, \d+ matches digits, [^\]]+ matches anything except ]
    LOG_PATTERN = None  # Replace with proper regex
    
    def __init__(self, log_file: str):
        # TODO: Initialize instance variables:
        # - log_file path
        # - total_requests counter
        # - status_codes Counter
        # - paths Counter
        # - ips Counter
        # - methods Counter
        # - errors list
        pass
    
    def parse_log_line(self, line: str) -> Dict:
        """Parse a single log line."""
        # TODO: Implement parsing using LOG_PATTERN
        # Return a dictionary with: ip, timestamp, method, path, status, size
        # Return None if line doesn't match pattern
        pass
    
    def analyze(self):
        """Analyze the log file."""
        # TODO: Implement log file analysis
        # - Open and read the log file
        # - Parse each line
        # - Update counters (total_requests, status_codes, paths, ips, methods)
        # - Track errors (4xx and 5xx status codes)
        # - Handle FileNotFoundError and other exceptions
        pass
    
    def generate_report(self):
        """Generate analysis report."""
        # TODO: Implement report generation
        # Display:
        # - Summary (total requests, unique IPs, error rate)
        # - Top 5 paths
        # - Status code distribution with percentages
        # - Top 5 IPs
        # - Last 10 errors with line numbers and details
        pass


def main():
    # TODO: Implement main function
    # - Use argparse to get log file path
    # - Create LogAnalyzer instance
    # - Call analyze() method
    # - Call generate_report() method
    pass


if __name__ == "__main__":
    main()
