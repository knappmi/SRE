package main

/*
HTTP Health Checker - Go Edition

Demonstrates:
- HTTP client usage
- Concurrency with goroutines
- Channels for communication
- Context for timeouts
*/

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"time"
)

// HealthCheck represents a health check result
type HealthCheck struct {
	URL          string
	StatusCode   int
	ResponseTime time.Duration
	Healthy      bool
	Error        error
}

// CheckHealth performs a health check on a URL
func CheckHealth(ctx context.Context, url string) HealthCheck {
	start := time.Now()
	result := HealthCheck{
		URL:     url,
		Healthy: false,
	}

	req, err := http.NewRequestWithContext(ctx, "GET", url, nil)
	if err != nil {
		result.Error = err
		return result
	}

	client := &http.Client{
		Timeout: 5 * time.Second,
	}

	resp, err := client.Do(req)
	if err != nil {
		result.Error = err
		return result
	}
	defer resp.Body.Close()

	result.StatusCode = resp.StatusCode
	result.ResponseTime = time.Since(start)
	result.Healthy = resp.StatusCode >= 200 && resp.StatusCode < 300

	return result
}

// CheckMultipleServices checks multiple services concurrently
func CheckMultipleServices(urls []string) []HealthCheck {
	results := make([]HealthCheck, len(urls))
	resultChan := make(chan HealthCheck, len(urls))

	// Start health checks concurrently
	for _, url := range urls {
		go func(u string) {
			ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
			defer cancel()
			resultChan <- CheckHealth(ctx, u)
		}(url)
	}

	// Collect results
	for i := 0; i < len(urls); i++ {
		results[i] = <-resultChan
	}

	return results
}

func main() {
	urls := []string{
		"https://www.google.com",
		"https://www.github.com",
		"https://httpbin.org/status/200",
	}

	if len(os.Args) > 1 {
		urls = os.Args[1:]
	}

	fmt.Println("🏥 Health Check Tool")
	fmt.Println("=" * 50)
	fmt.Printf("\nChecking %d service(s)...\n\n", len(urls))

	results := CheckMultipleServices(urls)

	// Display results
	healthyCount := 0
	for _, result := range results {
		status := "❌ UNHEALTHY"
		if result.Healthy {
			status = "✅ HEALTHY"
			healthyCount++
		}

		fmt.Printf("%s %s\n", status, result.URL)
		if result.Error != nil {
			fmt.Printf("  Error: %v\n", result.Error)
		} else {
			fmt.Printf("  Status: %d, Response Time: %v\n", result.StatusCode, result.ResponseTime)
		}
		fmt.Println()
	}

	fmt.Println("=" * 50)
	fmt.Printf("Summary: %d/%d services healthy\n", healthyCount, len(urls))

	if healthyCount < len(urls) {
		os.Exit(1)
	}
}
