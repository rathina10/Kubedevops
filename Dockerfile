FROM almalinux:8

# Install necessary packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip && yum clean all

# Download the zip file
ADD little-fashion.zip /home/ubuntu/ 
RUN cd /home/ubuntu/ && unzip little-fashion.zip && rm -f little-fashion.zip
RUN curl -fSL -o /home/ubuntu/little-fashion.zip https://www.free-css.com/free-css-templates/page296/little-fashion && \
    cd /home/ubuntu/ && unzip little-fashion.zip && rm -f little-fashion.zip
RUN for i in 1 2 3; do curl -fSL -o //home/ubuntu/ little-fashion.zip https://www.free-css.com/free-css-templates/page296/little-fashion && break || sleep 5; done && \
    cd /home/ubuntu/ && unzip little-fashion.zip && rm -f little-fashion.zip

 # Extract the zip file and organize the contents
 RUN cd /home/ubuntu/ && \
 if ! unzip -t little-fashion.zip; then echo "Invalid ZIP file"; exit 1; fi && \
 unzip little-fashion.zip && \
 rm -f little-fashion.zip

# Expose HTTP port
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]