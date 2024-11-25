FROM almalinux:8

# Install necessary packages (httpd, zip, unzip, file)
RUN yum install -y httpd zip unzip file && yum clean all

# Copy the ZIP file into the container
COPY little-fashion.zip /home/ubuntu/

# Check the file type and list contents
RUN ls -lh /home/ubuntu/ && file /home/ubuntu/little-fashion.zip

# Continue with your previous steps
RUN cd /home/ubuntu/ && unzip little-fashion.zip && rm -f little-fashion.zip

# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]
