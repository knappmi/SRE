# Database Exercises

## 📁 Structure

- **sql/** - SQL initialization scripts (MySQL, PostgreSQL)
- **nosql/** - NoSQL initialization scripts (MongoDB)
- **docker-compose.yml** - Multi-database setup

## 🎯 Exercise Approach

### 1. Study the Existing Scripts

```bash
# Review SQL scripts
cat sql/mysql_init.sql
cat sql/postgres_init.sql

# Review NoSQL scripts
cat nosql/mongo_init.js
```

### 2. Practice Exercises

**Beginner:**
- Start databases: `docker-compose up -d`
- Connect to databases and explore the schema
- Run SELECT queries on the sample data
- Insert new records

**Intermediate:**
- Modify the init scripts to add new tables/collections
- Create indexes for better performance
- Write JOIN queries (SQL)
- Implement aggregation pipelines (MongoDB)

**Advanced:**
- Design a new database schema for an application
- Implement transactions
- Set up replication
- Configure backups and restore
- Add database monitoring

## 💡 Practice Ideas

### SQL Exercises (MySQL/PostgreSQL)

1. **Schema Design**
   - Add a new table for blog posts
   - Create relationships (foreign keys)
   - Add constraints (unique, not null, check)

2. **Queries**
   - SELECT with WHERE, ORDER BY, LIMIT
   - JOIN queries (INNER, LEFT, RIGHT)
   - Aggregate functions (COUNT, SUM, AVG)
   - Subqueries and CTEs

3. **Performance**
   - Create indexes
   - Analyze query execution plans (EXPLAIN)
   - Optimize slow queries

### NoSQL Exercises (MongoDB)

1. **Collections**
   - Design document structure
   - Use embedded vs referenced documents
   - Create compound documents

2. **Queries**
   - Find with filters
   - Projection and sorting
   - Aggregation pipelines
   - Update and upsert operations

3. **Indexes**
   - Create single and compound indexes
   - Use text indexes for search
   - Monitor index usage

## 🔧 Useful Commands

### MySQL
```bash
# Connect
docker exec -it <mysql-container> mysql -u root -p

# Commands
SHOW DATABASES;
USE sre_db;
SHOW TABLES;
DESCRIBE users;
SELECT * FROM users;
```

### PostgreSQL
```bash
# Connect
docker exec -it <postgres-container> psql -U postgres

# Commands
\l          # List databases
\c sre_db   # Connect to database
\dt         # List tables
\d users    # Describe table
SELECT * FROM users;
```

### MongoDB
```bash
# Connect
docker exec -it <mongo-container> mongosh

# Commands
show dbs
use sre_db
show collections
db.users.find()
db.users.find().pretty()
```

## 📚 Key Concepts

- SQL vs NoSQL trade-offs
- Schema design and normalization
- Indexes and query optimization
- Transactions and ACID properties
- Backup and restore strategies
- Replication and high availability
- Security and access control
