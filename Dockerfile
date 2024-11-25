FROM almalinux:8

# Install necessary packages
RUN yum install -y httpd zip unzip && yum clean all

# Copy ZIP file into the container
COPY little-fashion.zip /home/ubuntu/
RUN ls -lh /home/ubuntu/ && file /home/ubuntu/little-fashion.zip


# Ensure ZIP file is valid and extract it
RUN cd /home/ubuntu/ && \
    if ! unzip -t little-fashion.zip; then echo "Invalid ZIP file"; exit 1; fi && \
    unzip little-fashion.zip && rm -f little-fashion.zip



# Expose HTTP port
EXPOSE 80

# Start Apache server
CMD ["httpd", "-D", "FOREGROUND"]
