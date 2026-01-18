#!/usr/bin/env python3
"""
Service Health Checker (Exercise)

OBJECTIVE:
Build a robust HTTP health checker with retry logic and exponential backoff.

REQUIREMENTS:
1. Create a HealthChecker class that:
   - Takes URL, timeout, and max_retries as parameters
   - Performs HTTP GET health checks
   - Implements retry logic with exponential backoff (2^attempt seconds)
   - Returns detailed health check results

2. Health check should return a dictionary with:
   - url: The URL checked
   - status_code: HTTP status code
   - response_time: Time taken for the request (in seconds)
   - healthy: Boolean (True if status code is 2xx)
   - attempt: Which attempt succeeded (or total attempts if failed)

3. Retry behavior:
   - Retry on timeout, connection errors, or non-2xx responses
   - Wait 2^attempt seconds between retries (2s, 4s, 8s, etc.)
   - After all retries fail, return unhealthy status with error message

4. Use structured logging to track:
   - Each attempt and its outcome
   - Wait times between retries
   - Success or failure status

5. Accept command-line arguments:
   - url (required): URL to check
   - --timeout: Request timeout in seconds (default: 5)
   - --retries: Number of retry attempts (default: 3)

6. Exit with code 0 if healthy, 1 if unhealthy (for monitoring integration)

HINTS:
- Use requests library (pip install requests)
- Use time.sleep() for waits
- Use time.time() to measure response time
- Catch requests.exceptions.Timeout and requests.exceptions.ConnectionError
- Use argparse for command-line arguments
- Use logging module for structured logging

TODO: Implement the health checker below
"""

import sys
import time
import logging
import argparse
from typing import Dict, Optional

# TODO: Import requests library and handle ImportError if not installed


# TODO: Configure logging


class HealthChecker:
    """Service health checker with retry logic."""
    
    def __init__(self, url: str, timeout: int = 5, max_retries: int = 3):
        # TODO: Initialize instance variables
        pass
    
    def check_health(self) -> Dict[str, any]:
        """
        Check service health with retry logic.
        
        Returns:
            dict: Health check results including status, response time, etc.
        """
        # TODO: Implement health check with retry logic
        # - Loop through attempts (1 to max_retries)
        # - Make HTTP GET request with timeout
        # - Measure response time
        # - Check if status code is 2xx (healthy)
        # - If healthy, return success result
        # - If unhealthy or error, log and retry after exponential backoff
        # - Return failure result if all retries exhausted
        pass


def main():
    # TODO: Implement main function
    # - Parse command-line arguments (url, timeout, retries)
    # - Create HealthChecker instance
    # - Call check_health()
    # - Display results
    # - Return 0 if healthy, 1 if unhealthy
    pass


if __name__ == "__main__":
    # TODO: Call main() and exit with its return value
    pass
