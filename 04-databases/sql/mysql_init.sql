-- MySQL Initialization Script
-- This creates sample tables and data for SRE training

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

-- Create metrics table (for time-series data)
CREATE TABLE IF NOT EXISTS metrics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    metric_name VARCHAR(100) NOT NULL,
    value DECIMAL(10, 2) NOT NULL,
    tags JSON,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_metric_name (metric_name),
    INDEX idx_timestamp (timestamp)
);

-- Create alerts table
CREATE TABLE IF NOT EXISTS alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alert_name VARCHAR(100) NOT NULL,
    message TEXT,
    severity ENUM('info', 'warning', 'critical') DEFAULT 'info',
    status ENUM('active', 'acknowledged', 'resolved') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_status (status),
    INDEX idx_severity (severity)
);

-- Insert sample data
INSERT INTO users (username, email) VALUES
    ('admin', 'admin@example.com'),
    ('operator', 'operator@example.com'),
    ('viewer', 'viewer@example.com');

INSERT INTO metrics (metric_name, value, tags) VALUES
    ('cpu_usage', 45.5, '{"host": "web-01", "region": "us-east"}'),
    ('memory_usage', 78.2, '{"host": "web-01", "region": "us-east"}'),
    ('disk_usage', 62.1, '{"host": "web-01", "region": "us-east"}'),
    ('response_time', 156.3, '{"service": "api", "endpoint": "/users"}');

INSERT INTO alerts (alert_name, message, severity, status) VALUES
    ('High CPU Usage', 'CPU usage exceeded 80% threshold', 'warning', 'acknowledged'),
    ('Disk Space Low', 'Disk usage at 90%', 'critical', 'active'),
    ('Service Degraded', 'API response time increased', 'warning', 'resolved');

-- Create a stored procedure for common query
DELIMITER //
CREATE PROCEDURE GetActiveAlerts()
BEGIN
    SELECT 
        alert_name,
        severity,
        message,
        created_at
    FROM alerts
    WHERE status = 'active'
    ORDER BY 
        FIELD(severity, 'critical', 'warning', 'info'),
        created_at DESC;
END //
DELIMITER ;
