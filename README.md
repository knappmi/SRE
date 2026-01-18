# SRE Concepts Training Repository

Welcome to the SRE (Site Reliability Engineering) Concepts Training Repository! This repository is designed to help you learn, practice, and reinforce essential SRE skills through hands-on exercises and examples.

## 🎯 Purpose

This repository serves as a comprehensive training ground for SRE concepts, covering everything from coding and infrastructure automation to databases, containers, and orchestration. Each concept is organized in its own directory with practical examples, exercises, and explanations.

## 📚 Concepts Covered

1. **[Coding](./01-coding/)** - Programming fundamentals for SREs (Python, Go, Bash)
2. **[Infrastructure as Code (IaC)](./02-iac/)** - Terraform and infrastructure automation
3. **[Configuration Management](./03-configuration-management/)** - Ansible for system configuration
4. **[Databases](./04-databases/)** - SQL and NoSQL database management
5. **[Kubernetes](./05-kubernetes/)** - Container orchestration and cluster management
6. **[Containers](./06-containers/)** - Docker and containerization concepts
7. **[Monitoring & Observability](./07-monitoring/)** - Prometheus, Grafana, and logging
8. **[CI/CD](./08-cicd/)** - Continuous Integration and Deployment pipelines
9. **[Networking](./09-networking/)** - Network fundamentals and troubleshooting
10. **[Linux & Shell Scripting](./10-linux-shell/)** - Linux administration and automation

## 🚀 Getting Started

### Prerequisites

- Git
- Docker and Docker Compose
- Python 3.8+
- kubectl (for Kubernetes exercises)
- Terraform (for IaC exercises)
- Ansible (for configuration management)
- A text editor or IDE

### Setup

Use the provided Makefile to set up your environment:

```bash
# Install prerequisites and verify tools
make setup

# Set up infrastructure for specific concepts
make setup-all

# Clean up all resources
make cleanup
```

## 📖 How to Use This Repository

This repository is structured to support **active learning** through hands-on practice:

### Two Learning Approaches

#### 1. **Coding & Scripting** (01-coding, 09-networking, 10-linux-shell)
These directories contain:
- **exercises/** - Incomplete scripts with TODO comments and requirements
- **solutions/** - Complete reference implementations

**How to practice:**
1. Start with exercise files
2. Read the requirements and hints
3. Fill in the TODO sections
4. Test your implementation
5. Compare with solutions

#### 2. **Configuration & Infrastructure** (02-iac, 03-config-mgmt, 04-databases, 05-kubernetes, 06-containers, 07-monitoring, 08-cicd)
These directories contain:
- Complete working examples (reference implementations)
- **EXERCISES.md** - Practice ideas and modification suggestions

**How to practice:**
1. Study the working examples
2. Follow the practice ideas in EXERCISES.md
3. Modify and extend the configurations
4. Apply changes and test
5. Build on the examples with your own scenarios

### Recommended Workflow

1. **Choose a Concept**: Navigate to any directory that interests you
2. **Read the README**: Understand the concept's importance and key ideas
3. **Work on Exercises**: 
   - For coding: Complete TODO sections in exercise files
   - For config: Follow EXERCISES.md practice ideas
4. **Test Your Work**: Run, validate, and verify your implementations
5. **Compare**: Check solutions or reference implementations
6. **Iterate**: Refine based on what you learned

## 🛠️ Repository Structure

Each concept directory follows one of these patterns:

### Pattern 1: Exercises + Solutions
```
01-coding/
├── README.md
├── python/
│   ├── exercises/     # TODO templates to complete
│   └── solutions/     # Reference implementations
├── bash/
│   ├── exercises/
│   └── solutions/
└── golang/
    ├── exercises/
    └── solutions/
```

### Pattern 2: Examples + Practice Guide
```
02-iac/
├── README.md
├── EXERCISES.md       # Practice ideas and modifications
└── terraform/         # Working examples to study and modify
```

**Directories with exercises/solutions pattern:**
- 01-coding (Python, Bash, Go)
- 05-kubernetes (partial YAML templates)
- 09-networking (shell scripts)
- 10-linux-shell (shell scripts)

**Directories with examples + practice guide:**
- 02-iac (Terraform)
- 03-configuration-management (Ansible)
- 04-databases (SQL, NoSQL)
- 06-containers (Docker)
- 07-monitoring (Prometheus, Grafana)
- 08-cicd (GitHub Actions, GitLab CI, Jenkins)

## 🤝 Contributing

Feel free to add more examples, improve existing ones, or fix issues. This is a learning repository, and contributions are welcome!

## 📝 License

This repository is for educational purposes.

## 🎓 Learning Path

**Beginner**: Start with Coding → Linux & Shell → Containers → Databases

**Intermediate**: Configuration Management → IaC → CI/CD → Networking

**Advanced**: Kubernetes → Monitoring & Observability

---

Happy Learning! 🚀