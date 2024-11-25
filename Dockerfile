FROM almalinux:8

# Install necessary packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip curl && yum clean all

# Set the working directory
WORKDIR /var/www/html/

# Download the zip file and handle retries in case of failure
RUN for i in 1 2 3; do \
    curl -fSL -o little-fashion.zip https://www.free-css.com/free-css-templates/page296/little-fashion.zip && \
    unzip -t little-fashion.zip && break || sleep 5; \
    done && \
    unzip little-fashion.zip && \
    rm -f little-fashion.zip

# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]
