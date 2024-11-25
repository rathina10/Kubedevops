# Base image
FROM almalinux:8

# Install necessary tools
RUN yum install -y httpd && yum clean all

# Create an images folder
RUN mkdir -p /home/ubuntu

# Copy the image into the container
COPY image.jpg /home/ubuntu/

# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]