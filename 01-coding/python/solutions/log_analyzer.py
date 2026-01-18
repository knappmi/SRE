#!/usr/bin/env python3
"""
Log Analyzer

Demonstrates:
- File I/O and processing
- Regular expressions
- Data aggregation
- Reporting
"""

import re
import sys
import argparse
from collections import Counter, defaultdict
from datetime import datetime
from typing import Dict, List


class LogAnalyzer:
    """Analyze web server logs."""
    
    # Common log format pattern
    LOG_PATTERN = re.compile(
        r'(?P<ip>\S+) \S+ \S+ \[(?P<timestamp>[^\]]+)\] '
        r'"(?P<method>\S+) (?P<path>\S+) \S+" '
        r'(?P<status>\d+) (?P<size>\d+|-)'
    )
    
    def __init__(self, log_file: str):
        self.log_file = log_file
        self.total_requests = 0
        self.status_codes = Counter()
        self.paths = Counter()
        self.ips = Counter()
        self.methods = Counter()
        self.errors = []
    
    def parse_log_line(self, line: str) -> Dict:
        """Parse a single log line."""
        match = self.LOG_PATTERN.match(line)
        if match:
            return match.groupdict()
        return None
    
    def analyze(self):
        """Analyze the log file."""
        print(f"Analyzing log file: {self.log_file}")
        
        try:
            with open(self.log_file, 'r') as f:
                for line_num, line in enumerate(f, 1):
                    parsed = self.parse_log_line(line.strip())
                    
                    if parsed:
                        self.total_requests += 1
                        self.status_codes[parsed['status']] += 1
                        self.paths[parsed['path']] += 1
                        self.ips[parsed['ip']] += 1
                        self.methods[parsed['method']] += 1
                        
                        # Track errors (4xx, 5xx)
                        if parsed['status'].startswith(('4', '5')):
                            self.errors.append({
                                'line': line_num,
                                'status': parsed['status'],
                                'path': parsed['path'],
                                'ip': parsed['ip']
                            })
        
        except FileNotFoundError:
            print(f"Error: File {self.log_file} not found")
            sys.exit(1)
        except Exception as e:
            print(f"Error analyzing log: {e}")
            sys.exit(1)
    
    def generate_report(self):
        """Generate analysis report."""
        print("\n" + "="*60)
        print("LOG ANALYSIS REPORT")
        print("="*60)
        
        print(f"\n📊 Summary:")
        print(f"  Total Requests: {self.total_requests}")
        print(f"  Unique IPs: {len(self.ips)}")
        print(f"  Error Rate: {len(self.errors)/self.total_requests*100:.2f}%")
        
        print(f"\n📈 Top 5 Paths:")
        for path, count in self.paths.most_common(5):
            print(f"  {count:>6} - {path}")
        
        print(f"\n🔢 Status Code Distribution:")
        for status, count in sorted(self.status_codes.items()):
            percentage = count / self.total_requests * 100
            print(f"  {status}: {count:>6} ({percentage:>5.1f}%)")
        
        print(f"\n🌐 Top 5 IP Addresses:")
        for ip, count in self.ips.most_common(5):
            print(f"  {count:>6} - {ip}")
        
        print(f"\n⚠️  Recent Errors (last 10):")
        for error in self.errors[-10:]:
            print(f"  Line {error['line']}: {error['status']} - "
                  f"{error['path']} from {error['ip']}")
        
        print("\n" + "="*60)


def main():
    parser = argparse.ArgumentParser(description='Analyze web server logs')
    parser.add_argument('logfile', help='Path to log file')
    args = parser.parse_args()
    
    analyzer = LogAnalyzer(args.logfile)
    analyzer.analyze()
    analyzer.generate_report()


if __name__ == "__main__":
    main()
