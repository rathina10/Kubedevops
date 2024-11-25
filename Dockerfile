FROM almalinux:8

# Install necessary packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip && yum clean all

# Download the zip file
COPY little-fashion.zip /home/ubuntu/
RUN cd /home/ubuntu/ && unzip little-fashion.zip && rm -f little-fashion.zip


# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]