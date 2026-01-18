# 01 - Coding for SREs

## 🎯 Importance

Coding is a fundamental skill for SREs. While you don't need to be a software engineer, you must be comfortable writing scripts, tools, and automation code. SREs typically use programming to:

- Automate repetitive operational tasks
- Build internal tools and utilities
- Process and analyze logs and metrics
- Implement reliability improvements
- Create custom monitoring and alerting solutions

## 📚 Languages Covered

### Python
- Most popular language for SRE work
- Excellent for automation, data processing, and tooling
- Rich ecosystem of libraries

### Go (Golang)
- Preferred for building high-performance tools
- Used by many cloud-native projects (Kubernetes, Docker, Prometheus)
- Great for concurrent operations

### Bash
- Essential for system administration
- Quick scripting and glue code
- Understanding Linux/Unix environments

## 📁 Directory Structure

Each language has two directories:
- **exercises/** - Practice problems for you to solve (with TODO comments)
- **solutions/** - Complete reference implementations

## 🚀 How to Use This Section

### Step 1: Work on Exercises
Start with the exercise files to test your knowledge:

**Python Exercises:**
```bash
cd python/exercises
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 hello_sre.py  # Start here
python3 log_analyzer.py <logfile>
python3 health_checker.py <url>
```

**Go Exercises:**
```bash
cd golang/exercises
go run hello_sre.go  # Start here
go run health_checker.go <url1> <url2>
```

**Bash Exercises:**
```bash
cd bash/exercises
chmod +x *.sh
./hello_sre.sh  # Start here
./system_monitor.sh
./backup_script.sh /source/path /backup/destination
```

### Step 2: Check Solutions
After attempting the exercises, compare your solution with the reference implementations in the `solutions/` directory.

### Step 3: Iterate
Refine your code based on what you learned from the solutions!

## 📖 What You'll Learn

1. **Automation Scripts**: Write scripts to automate common tasks
2. **System Monitoring**: Gather and analyze system metrics
3. **Log Processing**: Parse and analyze log files
4. **Health Checks**: Implement robust service health monitoring
5. **Error Handling**: Build robust, production-ready code
6. **Concurrency**: Use goroutines, async operations effectively

## 💡 Best Practices

- Write idempotent scripts (safe to run multiple times)
- Include proper error handling and logging
- Make scripts configurable (avoid hardcoding)
- Document your code with comments
- Version control everything
- Write tests for critical automation

## 🎓 Exercise Progression

### Beginner Level
1. **hello_sre** - Basic script structure, logging, system info gathering

### Intermediate Level
2. **system_monitor** (Bash) - System health checks, thresholds, status reporting
3. **backup_script** (Bash) - File operations, compression, rotation

### Advanced Level
4. **log_analyzer** (Python) - Regex parsing, data aggregation, reporting
5. **health_checker** (Python/Go) - HTTP clients, retry logic, concurrency

## 📝 Tips for Success

- Read the requirements carefully in each exercise file
- Follow the hints provided in the TODO comments
- Start simple - get basic functionality working first
- Test incrementally as you build
- Compare with solutions only after attempting the exercise
- Try to understand _why_ the solution is structured that way

## 📚 Additional Resources

- [Python for DevOps](https://www.oreilly.com/library/view/python-for-devops/9781492057680/)
- [The Go Programming Language](https://golang.org/doc/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
