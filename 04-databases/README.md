# 04 - Databases

## 🎯 Importance

Database knowledge is critical for SREs because:

- **Performance**: Optimize queries and database design
- **Reliability**: Ensure high availability and disaster recovery
- **Scalability**: Handle growing data and traffic
- **Troubleshooting**: Debug slow queries and connection issues
- **Monitoring**: Track database health and metrics
- **Backup & Recovery**: Protect against data loss

SREs need to understand both SQL (relational) and NoSQL (non-relational) databases.

## 🗄️ Database Types Covered

### SQL (Relational)
- PostgreSQL - Popular open-source RDBMS
- MySQL - Widely used web application database
- Structured data with ACID guarantees
- Complex queries with JOINs

### NoSQL (Non-Relational)
- MongoDB - Document database
- Redis - In-memory key-value store
- Flexible schemas
- Horizontal scalability

## 🚀 Getting Started

### Using Docker Compose

```bash
cd 04-databases

# Start all database containers
docker-compose up -d

# Check container status
docker-compose ps

# Stop containers
docker-compose down

# Stop and remove volumes (clean slate)
docker-compose down -v
```

### Connecting to Databases

**PostgreSQL:**
```bash
docker exec -it sre-postgres psql -U sre_user -d sre_db
```

**MySQL:**
```bash
docker exec -it sre-mysql mysql -u sre_user -psre_password sre_db
```

**MongoDB:**
```bash
docker exec -it sre-mongo mongosh -u sre_user -p sre_password --authenticationDatabase admin
```

**Redis:**
```bash
docker exec -it sre-redis redis-cli
```

## 📖 What You'll Learn

1. **SQL Basics**: SELECT, INSERT, UPDATE, DELETE
2. **Database Design**: Normalization, indexes, relationships
3. **Query Optimization**: EXPLAIN, indexes, query planning
4. **Transactions**: ACID properties, isolation levels
5. **Replication**: Master-slave, multi-master
6. **Backup Strategies**: Logical vs physical backups
7. **NoSQL Patterns**: Document stores, key-value, caching
8. **Monitoring**: Connection pools, slow queries, locks

## 💡 Best Practices

### General
- Use connection pooling
- Implement proper indexing
- Monitor slow queries
- Regular backups with testing
- Use read replicas for scaling reads
- Implement retry logic with exponential backoff

### SQL-Specific
- Use prepared statements (prevent SQL injection)
- Normalize data appropriately
- Avoid SELECT *
- Use transactions for data consistency
- Monitor table bloat

### NoSQL-Specific
- Design for your query patterns
- Understand consistency models
- Use appropriate data structures (Redis)
- Plan for sharding (MongoDB)
- Monitor memory usage (Redis)

## 🎓 Exercise Progression

1. Create databases and tables
2. Perform CRUD operations
3. Write complex queries with JOINs
4. Optimize slow queries
5. Implement backups
6. Test failover scenarios
7. Monitor database metrics

## 📚 Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MongoDB University](https://university.mongodb.com/)
- [Redis Documentation](https://redis.io/documentation)
- [Use The Index, Luke](https://use-the-index-luke.com/) - SQL Performance

## ⚠️ Important Notes

- Docker Compose file includes test credentials (change for production!)
- Volumes persist data between container restarts
- Use `docker-compose down -v` to completely reset databases
- Monitor disk usage - databases can grow quickly
- Always test backups by restoring them
