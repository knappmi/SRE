// MongoDB Initialization Script
// This creates sample collections and data for SRE training

// Switch to the SRE database
db = db.getSiblingDB('sre_db');

// Create logs collection with sample data
db.logs.insertMany([
    {
        timestamp: new Date(),
        level: "INFO",
        service: "web-frontend",
        message: "Application started successfully",
        metadata: {
            version: "1.2.3",
            environment: "production"
        }
    },
    {
        timestamp: new Date(Date.now() - 3600000),
        level: "ERROR",
        service: "api-gateway",
        message: "Connection timeout to downstream service",
        metadata: {
            downstream: "payment-service",
            timeout_ms: 5000
        }
    },
    {
        timestamp: new Date(Date.now() - 7200000),
        level: "WARNING",
        service: "worker",
        message: "Queue processing slow",
        metadata: {
            queue: "email-notifications",
            items_pending: 1500
        }
    }
]);

// Create deployments collection
db.deployments.insertMany([
    {
        service: "web-frontend",
        version: "1.2.3",
        deployed_at: new Date(),
        deployed_by: "alice",
        status: "success",
        duration_seconds: 120,
        rollback: false
    },
    {
        service: "api-gateway",
        version: "2.0.1",
        deployed_at: new Date(Date.now() - 86400000),
        deployed_by: "bob",
        status: "success",
        duration_seconds: 95,
        rollback: false
    }
]);

// Create metrics collection for time-series data
db.metrics.insertMany([
    {
        metric: "request_count",
        value: 15230,
        tags: {
            service: "api-gateway",
            endpoint: "/api/v1/users",
            method: "GET"
        },
        timestamp: new Date()
    },
    {
        metric: "error_rate",
        value: 0.02,
        tags: {
            service: "api-gateway",
            endpoint: "/api/v1/users",
            method: "POST"
        },
        timestamp: new Date()
    }
]);

// Create indexes for better query performance
db.logs.createIndex({ timestamp: -1 });
db.logs.createIndex({ level: 1, timestamp: -1 });
db.logs.createIndex({ service: 1, timestamp: -1 });

db.metrics.createIndex({ timestamp: -1 });
db.metrics.createIndex({ metric: 1, timestamp: -1 });
db.metrics.createIndex({ "tags.service": 1 });

db.deployments.createIndex({ deployed_at: -1 });
db.deployments.createIndex({ service: 1, deployed_at: -1 });

print("MongoDB initialization completed successfully!");
