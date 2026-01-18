# 06 - Containers (Docker)

## 🎯 Importance

Container knowledge is fundamental for SREs because:

- **Consistency**: "Works on my machine" → "Works everywhere"
- **Isolation**: Applications run independently
- **Portability**: Run anywhere Docker is installed
- **Efficiency**: Lightweight compared to VMs
- **Scalability**: Quick startup and shutdown
- **DevOps Integration**: Foundation for CI/CD and orchestration

## 🐳 Concepts Covered

- **Images**: Blueprint for containers
- **Containers**: Running instances of images
- **Dockerfile**: Instructions to build images
- **Volumes**: Persistent data storage
- **Networks**: Container communication
- **Docker Compose**: Multi-container applications
- **Best Practices**: Security, optimization, and patterns

## 🚀 Getting Started

### Prerequisites

```bash
# Install Docker
# macOS/Windows: Download Docker Desktop
# Linux (Ubuntu):
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Verify installation
docker --version
docker run hello-world
```

### Basic Docker Commands

```bash
# Images
docker images                    # List images
docker pull nginx               # Pull an image
docker build -t myapp .         # Build from Dockerfile
docker rmi image-name           # Remove image

# Containers
docker ps                       # List running containers
docker ps -a                    # List all containers
docker run -d -p 8080:80 nginx  # Run container
docker stop container-id        # Stop container
docker rm container-id          # Remove container
docker logs container-id        # View logs
docker exec -it container-id sh # Execute command

# System
docker system df                # Check disk usage
docker system prune             # Clean up unused resources
```

### Using the Examples

```bash
cd examples/

# Build an image
docker build -t sre-training-web -f Dockerfile .

# Run the container
docker run -d -p 8080:80 --name my-web sre-training-web

# View in browser
curl http://localhost:8080

# Use Docker Compose
docker-compose up -d
docker-compose ps
docker-compose logs
docker-compose down
```

## 📖 What You'll Learn

1. **Dockerfile Creation**: Build custom images
2. **Image Optimization**: Multi-stage builds, layer caching
3. **Container Networking**: Bridge, host, overlay networks
4. **Volume Management**: Data persistence
5. **Docker Compose**: Multi-container orchestration
6. **Security**: Scanning, non-root users, secrets
7. **Debugging**: Inspect, logs, exec
8. **Best Practices**: Image size, caching, security

## 💡 Best Practices

### Dockerfile
- Use official base images
- Use specific tags (not `latest`)
- Multi-stage builds for smaller images
- Minimize layers (combine RUN commands)
- Use .dockerignore
- Run as non-root user
- Set proper labels

### Images
- Keep images small
- One process per container
- Use Alpine or distroless when possible
- Scan for vulnerabilities
- Tag images semantically

### Containers
- Make containers ephemeral
- Use volumes for data persistence
- Set resource limits
- Implement health checks
- Use environment variables for config
- Never store secrets in images

### Operations
- Use docker-compose for local development
- Implement proper logging
- Monitor container metrics
- Regular security updates
- Clean up unused resources

## 🎓 Exercise Progression

1. Run existing images (nginx, redis)
2. Write your first Dockerfile
3. Build and run custom images
4. Use volumes for data persistence
5. Network multiple containers
6. Create multi-container apps with Compose
7. Optimize image sizes
8. Implement security best practices

## 📚 Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Play with Docker](https://labs.play-with-docker.com/) - Online playground

## ⚠️ Important Notes

- Containers are NOT virtual machines
- Container processes run on host kernel
- Volumes persist data outside containers
- Networks allow container communication
- Always clean up stopped containers and unused images
- Production containers need monitoring and security scanning
