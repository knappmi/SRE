# 05 - Kubernetes

## 🎯 Importance

Kubernetes is essential for modern SREs because:

- **Container Orchestration**: Manage containers at scale
- **Self-Healing**: Automatic restarts, replacements, and rescheduling
- **Scaling**: Horizontal and vertical autoscaling
- **Service Discovery**: Built-in DNS and load balancing
- **Rolling Updates**: Zero-downtime deployments
- **Infrastructure Abstraction**: Run anywhere (cloud, on-prem, hybrid)

## ☸️ Concepts Covered

- **Pods**: Smallest deployable units
- **Deployments**: Declarative updates for Pods
- **Services**: Network abstraction for Pods
- **ConfigMaps & Secrets**: Configuration management
- **Ingress**: HTTP/HTTPS routing
- **Namespaces**: Resource isolation
- **ResourceQuotas**: Resource limits
- **Health Checks**: Liveness and readiness probes

## 🚀 Getting Started

### Prerequisites

```bash
# Install kubectl
# macOS
brew install kubectl

# Linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verify installation
kubectl version --client
```

### Local Kubernetes Options

**Kind (Kubernetes in Docker):**
```bash
brew install kind  # or download from https://kind.sigs.k8s.io/
kind create cluster --name sre-training
```

**Minikube:**
```bash
brew install minikube
minikube start
```

**Docker Desktop:**
- Enable Kubernetes in Docker Desktop settings

### Using the Examples

```bash
cd manifests/

# Apply a manifest
kubectl apply -f deployment.yaml

# View resources
kubectl get pods
kubectl get services
kubectl get deployments

# Describe a resource
kubectl describe pod <pod-name>

# View logs
kubectl logs <pod-name>

# Delete resources
kubectl delete -f deployment.yaml
```

## 📖 What You'll Learn

1. **Pod Management**: Create, inspect, and debug pods
2. **Deployments**: Rolling updates and rollbacks
3. **Services**: Expose applications internally and externally
4. **Configuration**: Use ConfigMaps and Secrets
5. **Health Checks**: Implement liveness and readiness probes
6. **Scaling**: Manual and autoscaling
7. **Troubleshooting**: Debug issues in clusters
8. **Monitoring**: Metrics and logging

## 💡 Best Practices

### Resource Management
- Always set resource requests and limits
- Use namespaces for isolation
- Implement proper labels and selectors
- Use readiness probes for zero-downtime deployments

### Security
- Use Secrets for sensitive data
- Apply RBAC policies
- Run containers as non-root
- Use Pod Security Policies/Standards
- Regularly update images

### Reliability
- Set up liveness and readiness probes
- Use PodDisruptionBudgets
- Implement proper health checks
- Use anti-affinity rules for HA
- Set up monitoring and alerting

### Configuration
- Use ConfigMaps for configuration
- Externalize configuration from images
- Use declarative YAML (avoid imperative commands)
- Version control all manifests

## 🎓 Exercise Progression

1. Deploy a simple pod
2. Create a deployment with multiple replicas
3. Expose with a service
4. Add ConfigMaps and Secrets
5. Implement health checks
6. Set up ingress
7. Configure autoscaling
8. Practice troubleshooting scenarios

## 📚 Additional Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [CNCF Landscape](https://landscape.cncf.io/)

## ⚠️ Important Notes

- Examples use simple configurations for learning
- Production requires more robust configurations
- Always test in dev/staging before production
- Monitor resource usage in your cluster
- Use namespaces to organize resources
- Clean up resources when done practicing
