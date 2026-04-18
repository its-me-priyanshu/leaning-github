# Use Ubuntu base image
FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Create working directory
RUN mkdir -p /home/nginx

# Set working directory
WORKDIR /home/nginx

# Copy Index.html file
COPY index.html /var/www/html/

# Expose port 80
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
