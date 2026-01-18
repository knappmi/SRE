#!/usr/bin/env python3
"""
Service Health Checker

This script demonstrates:
- HTTP health checks
- Retry logic with exponential backoff
- Structured logging
- Exit codes for monitoring integration
"""

import sys
import time
import logging
import argparse
from typing import Dict, Optional

try:
    import requests
except ImportError:
    print("Error: requests library not installed. Run: pip install requests")
    sys.exit(1)

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


class HealthChecker:
    """Service health checker with retry logic."""
    
    def __init__(self, url: str, timeout: int = 5, max_retries: int = 3):
        self.url = url
        self.timeout = timeout
        self.max_retries = max_retries
    
    def check_health(self) -> Dict[str, any]:
        """
        Check service health with retry logic.
        
        Returns:
            dict: Health check results including status, response time, etc.
        """
        for attempt in range(1, self.max_retries + 1):
            try:
                logger.info(f"Health check attempt {attempt}/{self.max_retries} for {self.url}")
                
                start_time = time.time()
                response = requests.get(self.url, timeout=self.timeout)
                response_time = time.time() - start_time
                
                result = {
                    'url': self.url,
                    'status_code': response.status_code,
                    'response_time': round(response_time, 3),
                    'healthy': 200 <= response.status_code < 300,
                    'attempt': attempt
                }
                
                if result['healthy']:
                    logger.info(f"✓ Service healthy - Status: {result['status_code']}, "
                              f"Response time: {result['response_time']}s")
                    return result
                else:
                    logger.warning(f"✗ Service unhealthy - Status: {result['status_code']}")
                    
            except requests.exceptions.Timeout:
                logger.error(f"Timeout on attempt {attempt}")
            except requests.exceptions.ConnectionError:
                logger.error(f"Connection error on attempt {attempt}")
            except Exception as e:
                logger.error(f"Unexpected error on attempt {attempt}: {e}")
            
            # Exponential backoff
            if attempt < self.max_retries:
                wait_time = 2 ** attempt
                logger.info(f"Waiting {wait_time}s before retry...")
                time.sleep(wait_time)
        
        # All retries failed
        return {
            'url': self.url,
            'healthy': False,
            'error': 'All retries exhausted'
        }


def main():
    parser = argparse.ArgumentParser(description='Service Health Checker')
    parser.add_argument('url', help='URL to check')
    parser.add_argument('--timeout', type=int, default=5, help='Request timeout in seconds')
    parser.add_argument('--retries', type=int, default=3, help='Number of retry attempts')
    
    args = parser.parse_args()
    
    checker = HealthChecker(args.url, args.timeout, args.retries)
    result = checker.check_health()
    
    # Exit with appropriate code for monitoring systems
    if result['healthy']:
        print(f"\n✓ Service is HEALTHY")
        print(f"  Response time: {result.get('response_time', 'N/A')}s")
        return 0
    else:
        print(f"\n✗ Service is UNHEALTHY")
        print(f"  Error: {result.get('error', 'Unknown error')}")
        return 1


if __name__ == "__main__":
    sys.exit(main())
