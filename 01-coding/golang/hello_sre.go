package main

/*
Hello SRE - Go Edition

This demonstrates basic Go programming for SREs:
- Structs and methods
- Error handling
- JSON encoding
- Concurrent operations
*/

import (
	"encoding/json"
	"fmt"
	"os"
	"runtime"
	"time"
)

// SystemInfo represents system information
type SystemInfo struct {
	Hostname     string    `json:"hostname"`
	OS           string    `json:"os"`
	Architecture string    `json:"architecture"`
	NumCPU       int       `json:"num_cpu"`
	GoVersion    string    `json:"go_version"`
	Timestamp    time.Time `json:"timestamp"`
}

// GetSystemInfo gathers system information
func GetSystemInfo() (*SystemInfo, error) {
	hostname, err := os.Hostname()
	if err != nil {
		return nil, fmt.Errorf("failed to get hostname: %w", err)
	}

	info := &SystemInfo{
		Hostname:     hostname,
		OS:           runtime.GOOS,
		Architecture: runtime.GOARCH,
		NumCPU:       runtime.NumCPU(),
		GoVersion:    runtime.Version(),
		Timestamp:    time.Now(),
	}

	return info, nil
}

// PrintSystemInfo displays system information in a formatted way
func PrintSystemInfo(info *SystemInfo) {
	fmt.Println("\n" + "="*50)
	fmt.Println("🚀 Hello from SRE Training!")
	fmt.Println("="*50)
	fmt.Println("\n📊 System Information:")
	fmt.Printf("  Hostname: %s\n", info.Hostname)
	fmt.Printf("  OS: %s\n", info.OS)
	fmt.Printf("  Architecture: %s\n", info.Architecture)
	fmt.Printf("  CPU Cores: %d\n", info.NumCPU)
	fmt.Printf("  Go Version: %s\n", info.GoVersion)
	fmt.Printf("  Timestamp: %s\n", info.Timestamp.Format(time.RFC3339))
	fmt.Println("\n" + "="*50)
}

// ExportJSON exports system info as JSON
func ExportJSON(info *SystemInfo) (string, error) {
	data, err := json.MarshalIndent(info, "", "  ")
	if err != nil {
		return "", fmt.Errorf("failed to marshal JSON: %w", err)
	}
	return string(data), nil
}

func main() {
	// Gather system information
	info, err := GetSystemInfo()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}

	// Print formatted output
	PrintSystemInfo(info)

	// Export as JSON
	jsonOutput, err := ExportJSON(info)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error exporting JSON: %v\n", err)
		os.Exit(1)
	}

	fmt.Println("📄 JSON Export:")
	fmt.Println(jsonOutput)
}
