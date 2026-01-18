package main

/*
HTTP Health Checker - Go Edition (Exercise)

OBJECTIVE:
Build a concurrent health checker that can check multiple URLs simultaneously.

REQUIREMENTS:
1. Create a HealthCheck struct with fields:
   - URL (string)
   - StatusCode (int)
   - ResponseTime (time.Duration)
   - Healthy (bool)
   - Error (error)

2. Implement CheckHealth() function:
   - Takes context and URL as parameters
   - Makes HTTP GET request with 5-second timeout
   - Returns HealthCheck struct with results
   - Mark as healthy if status code is 2xx
   - Measure response time

3. Implement CheckMultipleServices() function:
   - Takes slice of URLs
   - Checks all URLs concurrently using goroutines
   - Uses channels to collect results
   - Returns slice of HealthCheck results

4. Main function should:
   - Define default URLs or accept them as command-line arguments
   - Call CheckMultipleServices()
   - Display results for each service
   - Show summary (X/Y services healthy)
   - Exit with code 1 if any service is unhealthy

HINTS:
- Use net/http package for HTTP requests
- Use context.WithTimeout() for request timeouts
- Use goroutines for concurrent checks: go func() { ... }()
- Use channels to collect results: make(chan HealthCheck, len(urls))
- Use time.Since() to measure duration
- Use http.NewRequestWithContext() to create requests with context
- Check status code: resp.StatusCode >= 200 && resp.StatusCode < 300
- Don't forget to close response body: defer resp.Body.Close()

TODO: Implement the program below
*/

import (
	// TODO: Import required packages:
	// - context
	// - fmt
	// - net/http
	// - os
	// - strings
	// - time
)

// TODO: Define HealthCheck struct


// TODO: Implement CheckHealth function
// func CheckHealth(ctx context.Context, url string) HealthCheck


// TODO: Implement CheckMultipleServices function
// func CheckMultipleServices(urls []string) []HealthCheck


func main() {
	// TODO: Define default URLs (or get from command-line arguments)
	
	
	// TODO: Display header
	
	
	// TODO: Call CheckMultipleServices and get results
	
	
	// TODO: Display results for each service
	// Show status (✅ HEALTHY or ❌ UNHEALTHY), URL, status code, response time
	
	
	// TODO: Display summary showing healthy count vs total
	
	
	// TODO: Exit with code 1 if any service is unhealthy
	
}
