FROM centos:latest

# Install necessary packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip && yum clean all

# Download the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Extract the zip file and organize the contents
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose ports
EXPOSE 80 22

# Start the HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
