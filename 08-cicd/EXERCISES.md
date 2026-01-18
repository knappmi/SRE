# CI/CD Pipeline Exercises

## 📁 Structure

- **github-actions/** - GitHub Actions workflow
- **gitlab-ci/** - GitLab CI pipeline
- **jenkins/** - Jenkins pipeline (Jenkinsfile)

## 🎯 Exercise Approach

### 1. Study the Existing Pipelines

```bash
# GitHub Actions
cat github-actions/ci-cd.yml

# GitLab CI
cat gitlab-ci/.gitlab-ci.yml

# Jenkins
cat jenkins/Jenkinsfile
```

### 2. Practice Exercises

**Beginner:**
- Understand pipeline stages (build, test, deploy)
- Identify when each stage runs
- Modify environment variables
- Change Docker images used

**Intermediate:**
- Add new pipeline stages
- Implement caching for faster builds
- Add test result reporting
- Configure different environments (dev, staging, prod)
- Add manual approval steps

**Advanced:**
- Implement matrix builds (multiple versions)
- Set up deployment strategies (blue-green, canary)
- Add security scanning
- Implement GitOps workflows
- Configure pipeline as code with templates

## 💡 Practice Ideas

### General CI/CD Exercises

1. **Build Stage**
   - Compile code
   - Run linters
   - Generate artifacts
   - Build Docker images

2. **Test Stage**
   - Run unit tests
   - Run integration tests
   - Generate test coverage
   - Static code analysis

3. **Deploy Stage**
   - Deploy to environments
   - Run smoke tests
   - Implement rollback
   - Send notifications

### Platform-Specific Exercises

#### GitHub Actions
```yaml
# Add a new job
- name: Security Scan
  run: |
    npm audit
    docker scan myapp:latest

# Use matrix strategy
strategy:
  matrix:
    node: [14, 16, 18]
    os: [ubuntu-latest, macos-latest]
```

#### GitLab CI
```yaml
# Add cache
cache:
  paths:
    - node_modules/

# Add artifacts
artifacts:
  paths:
    - build/
  expire_in: 1 week
```

#### Jenkins
```groovy
// Add parallel stages
parallel {
  stage('Unit Tests') { /* ... */ }
  stage('Lint') { /* ... */ }
}

// Add input step
input message: 'Deploy to production?', ok: 'Deploy'
```

## 🔧 Common Pipeline Patterns

### 1. Basic Pipeline
```
Build → Test → Deploy
```

### 2. Multi-Environment
```
Build → Test → Deploy Dev → Deploy Staging → Deploy Prod
```

### 3. Feature Branch
```
Build → Test (runs on every commit)
Deploy (runs only on main branch)
```

### 4. With Approval
```
Build → Test → Staging → [Approval] → Production
```

## 📚 Key Concepts

- Pipeline as code
- Build artifacts
- Caching dependencies
- Environment variables and secrets
- Deployment strategies
- Testing in pipelines
- Docker in pipelines
- Notifications
- Pipeline optimization

## 🎓 Best Practices

1. **Keep pipelines fast**
   - Use caching
   - Run tests in parallel
   - Use appropriate runners

2. **Make pipelines reliable**
   - Handle failures gracefully
   - Implement retries
   - Clean up resources

3. **Security**
   - Use secrets management
   - Scan for vulnerabilities
   - Sign artifacts

4. **Visibility**
   - Clear stage names
   - Good log messages
   - Notifications on failure
   - Dashboard metrics

5. **Maintainability**
   - Use templates/reusable workflows
   - Document pipeline stages
   - Keep configuration DRY
   - Version control everything

## 💡 Tips

- Start simple and iterate
- Test pipeline changes in branches
- Use pipeline visualization tools
- Monitor pipeline metrics (duration, success rate)
- Implement gradual rollouts
- Always have a rollback plan
