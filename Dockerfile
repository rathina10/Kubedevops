FROM almalinux:8

# Install necessary packages (httpd, curl, wget)
RUN yum install -y httpd curl wget && yum clean all

# Download an image from a direct URL (replace with correct image URL)
RUN curl -o /var/www/html/image.jpg https://www.freepik.com/free-photo/image.jpg

# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]
