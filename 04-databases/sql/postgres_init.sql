-- PostgreSQL Initialization Script
-- This creates sample tables and data for SRE training

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- Create services table (for monitoring)
CREATE TABLE IF NOT EXISTS services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'unknown',
    url VARCHAR(255),
    last_check TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    response_time_ms INTEGER
);

-- Create incidents table (for tracking)
CREATE TABLE IF NOT EXISTS incidents (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    severity VARCHAR(20) CHECK (severity IN ('low', 'medium', 'high', 'critical')),
    status VARCHAR(20) DEFAULT 'open' CHECK (status IN ('open', 'investigating', 'resolved', 'closed')),
    service_id INTEGER REFERENCES services(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP
);

-- Create index for better query performance
CREATE INDEX idx_services_status ON services(status);
CREATE INDEX idx_incidents_status ON incidents(status);
CREATE INDEX idx_incidents_service ON incidents(service_id);

-- Insert sample data
INSERT INTO users (username, email) VALUES
    ('alice', 'alice@example.com'),
    ('bob', 'bob@example.com'),
    ('charlie', 'charlie@example.com');

INSERT INTO services (name, status, url, response_time_ms) VALUES
    ('Web Frontend', 'healthy', 'https://web.example.com', 150),
    ('API Gateway', 'healthy', 'https://api.example.com', 75),
    ('Database', 'degraded', 'postgres://db.example.com', 250),
    ('Cache', 'healthy', 'redis://cache.example.com', 5);

INSERT INTO incidents (title, description, severity, status, service_id) VALUES
    ('High latency on database', 'Database queries taking longer than usual', 'medium', 'investigating', 3),
    ('API rate limiting errors', 'Seeing increased 429 errors', 'low', 'resolved', 2);

-- Create a view for service health summary
CREATE VIEW service_health_summary AS
SELECT 
    s.name,
    s.status,
    s.response_time_ms,
    COUNT(i.id) as open_incidents
FROM services s
LEFT JOIN incidents i ON s.id = i.service_id AND i.status != 'closed'
GROUP BY s.id, s.name, s.status, s.response_time_ms;
