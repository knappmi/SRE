# Simple Dockerfile Example
# Creates a basic web server with nginx

FROM nginx:1.25-alpine

# Set maintainer label
LABEL maintainer="sre-training"
LABEL description="Simple nginx web server for SRE training"

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static website content
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1
