#!/usr/bin/env python3
"""
Hello SRE - Python Edition

This is a simple introduction to Python scripting for SREs.
Demonstrates basic concepts: logging, error handling, and system information gathering.
"""

import logging
import platform
import sys
from datetime import datetime

# Configure logging - essential for operational scripts
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


def get_system_info():
    """
    Gather system information - a common SRE task.
    
    Returns:
        dict: System information
    """
    try:
        info = {
            'hostname': platform.node(),
            'os': platform.system(),
            'os_version': platform.release(),
            'architecture': platform.machine(),
            'python_version': platform.python_version(),
            'timestamp': datetime.now().isoformat()
        }
        return info
    except Exception as e:
        logger.error(f"Error gathering system info: {e}")
        raise


def main():
    """Main function with proper error handling."""
    try:
        logger.info("Starting SRE Hello World script")
        
        # Gather system information
        sys_info = get_system_info()
        
        # Display results
        print("\n" + "="*50)
        print("🚀 Hello from SRE Training!")
        print("="*50)
        print(f"\n📊 System Information:")
        for key, value in sys_info.items():
            print(f"  {key}: {value}")
        print("\n" + "="*50)
        
        logger.info("Script completed successfully")
        return 0
        
    except Exception as e:
        logger.error(f"Script failed: {e}")
        return 1


if __name__ == "__main__":
    sys.exit(main())
