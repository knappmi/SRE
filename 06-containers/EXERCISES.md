# Docker & Container Exercises

## 📁 Structure

All files in this directory are reference implementations. Practice by modifying and extending them.

## 🎯 Exercise Approach

### 1. Study the Existing Files

```bash
# Review the Dockerfiles
cat Dockerfile
cat Dockerfile.multistage

# Review the compose file
cat docker-compose.yml
```

### 2. Practice Exercises

**Beginner:**
- Build the Docker image: `docker build -t my-nginx .`
- Run a container: `docker run -p 8080:80 my-nginx`
- Access the web app at http://localhost:8080
- Modify index.html and rebuild

**Intermediate:**
- Modify Dockerfile to use a different base image
- Add environment variables to the container
- Mount a volume for persistent data
- Add health checks to docker-compose.yml
- Create a multi-container setup

**Advanced:**
- Optimize the Dockerfile for smaller image size
- Implement multi-stage builds for a real application
- Add container networking and service discovery
- Configure resource limits (CPU, memory)
- Set up logging and monitoring

## 💡 Practice Ideas

1. **Image Optimization**
   - Compare image sizes: `docker images`
   - Use multi-stage builds
   - Minimize layers
   - Use .dockerignore

2. **Compose Orchestration**
   - Add a database service (postgres, mysql)
   - Add redis for caching
   - Configure service dependencies
   - Set up service networks

3. **Configuration Management**
   - Use environment files (.env)
   - Mount configuration files
   - Use secrets for sensitive data

4. **Networking**
   - Create custom networks
   - Test service-to-service communication
   - Configure port mapping

## 🔧 Useful Commands

```bash
# Build
docker build -t myapp .
docker build -f Dockerfile.multistage -t myapp:optimized .

# Run
docker run -d -p 8080:80 --name web myapp
docker run -it myapp /bin/sh

# Compose
docker-compose up -d
docker-compose ps
docker-compose logs -f
docker-compose down

# Inspect
docker ps
docker images
docker inspect <container>
docker logs <container>

# Clean up
docker stop <container>
docker rm <container>
docker rmi <image>
docker system prune -a
```

## 📚 Key Concepts

- Dockerfile instructions (FROM, RUN, COPY, CMD, ENTRYPOINT)
- Layer caching and optimization
- Multi-stage builds
- Docker Compose services
- Volumes and bind mounts
- Container networking
- Environment variables
- Health checks
