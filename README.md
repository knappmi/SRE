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

1. **Choose a Concept**: Navigate to any concept directory that interests you
2. **Read the README**: Each directory has a detailed README explaining the concept's importance
3. **Follow Along**: Work through the examples and exercises in order
4. **Practice**: Modify the examples and create your own variations
5. **Test Your Knowledge**: Complete the challenges in each section

## 🛠️ Directory Structure

```
.
├── README.md (this file)
├── Makefile (infrastructure setup)
├── 01-coding/
├── 02-iac/
├── 03-configuration-management/
├── 04-databases/
├── 05-kubernetes/
├── 06-containers/
├── 07-monitoring/
├── 08-cicd/
├── 09-networking/
└── 10-linux-shell/
```

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