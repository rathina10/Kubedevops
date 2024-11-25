FROM almalinux:8

# Install necessary packages (httpd, zip, unzip, curl)
RUN yum install -y httpd zip unzip curl && yum clean all

# Download the zip file from the correct URL
RUN curl -fSL -o /home/ubuntu/little-fashion.zip https://www.free-css.com/free-css-templates/little-fashion.zip && \
    cd /home/ubuntu/ && \
    if ! unzip -t little-fashion.zip; then echo "Invalid ZIP file"; exit 1; fi && \
    unzip little-fashion.zip && rm -f little-fashion.zip

# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]
