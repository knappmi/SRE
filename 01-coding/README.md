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

## 🚀 Getting Started

### Python Exercises
```bash
cd python
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 hello_sre.py
```

### Go Exercises
```bash
cd golang
go run hello_sre.go
```

### Bash Exercises
```bash
cd bash
chmod +x *.sh
./hello_sre.sh
```

## 📖 What You'll Learn

1. **Automation Scripts**: Write scripts to automate common tasks
2. **API Integration**: Interact with REST APIs for monitoring and deployment
3. **Log Processing**: Parse and analyze log files
4. **Error Handling**: Build robust, production-ready code
5. **Testing**: Write tests for your automation code

## 💡 Best Practices

- Write idempotent scripts (safe to run multiple times)
- Include proper error handling and logging
- Make scripts configurable (avoid hardcoding)
- Document your code with comments
- Version control everything
- Write tests for critical automation

## 🎓 Exercise Progression

1. Start with `hello_sre` examples in each language
2. Move to automation scripts
3. Try the API integration exercises
4. Work on the log processing challenges
5. Build a complete tool combining concepts

## 📚 Additional Resources

- [Python for DevOps](https://www.oreilly.com/library/view/python-for-devops/9781492057680/)
- [The Go Programming Language](https://golang.org/doc/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
