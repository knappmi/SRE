# Kubernetes Exercises

This directory contains Kubernetes manifest exercises to practice creating and managing Kubernetes resources.

## 📁 Structure

- **exercises/** - Partial manifests for you to complete
- **manifests/** (solutions) - Complete reference implementations

## 🎯 Exercises

### 1. Basic Deployment (deployment.yaml)
Create a Deployment with:
- 3 nginx replicas
- Resource limits and requests
- Health checks (liveness & readiness probes)
- Service to expose the deployment

### 2. ConfigMaps and Secrets (configmap-secret.yaml)
Practice with:
- ConfigMap for application configuration
- Secret for sensitive data
- Mounting them in pods

### 3. Ingress and Networking (ingress-network.yaml)
Learn about:
- Ingress rules for HTTP routing
- NetworkPolicy for pod security

### 4. Namespaces and Quotas (namespace-quota.yaml)
Work with:
- Creating namespaces
- Setting resource quotas
- Applying limits

## 🚀 How to Practice

1. **Work on exercises:**
   ```bash
   cd exercises
   # Edit the YAML files, fill in TODO sections
   kubectl apply -f deployment.yaml --dry-run=client
   ```

2. **Validate syntax:**
   ```bash
   kubectl apply -f deployment.yaml --dry-run=client -o yaml
   ```

3. **Apply to cluster (if available):**
   ```bash
   # Start minikube or use existing cluster
   minikube start
   kubectl apply -f deployment.yaml
   kubectl get deployments
   kubectl get pods
   ```

4. **Compare with solutions:**
   ```bash
   diff exercises/deployment.yaml manifests/deployment.yaml
   ```

## 📚 Key Concepts

- **Deployments**: Manage replica sets and rolling updates
- **Services**: Network access to pods
- **ConfigMaps**: Non-sensitive configuration
- **Secrets**: Sensitive data (base64 encoded)
- **Ingress**: HTTP/HTTPS routing
- **NetworkPolicy**: Pod-to-pod communication rules
- **ResourceQuota**: Limit resource consumption in namespaces

## 💡 Tips

- Use `kubectl explain <resource>` to see field documentation
- Use `kubectl apply --dry-run=client` to validate without applying
- Use `kubectl describe` to see detailed resource information
- Labels and selectors must match between resources
- Resource names must be DNS-compatible (lowercase, hyphens)

## 🔧 Useful Commands

```bash
# Validate YAML
kubectl apply -f file.yaml --dry-run=client

# Apply manifest
kubectl apply -f file.yaml

# View resources
kubectl get deployments,pods,services
kubectl describe deployment nginx-deployment

# View logs
kubectl logs <pod-name>

# Delete resources
kubectl delete -f file.yaml
```
