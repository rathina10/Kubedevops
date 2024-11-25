FROM almalinux:8

# Install necessary packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip && yum clean all

# Download the zip file
ADD https://www.free-css.com/free-css-templates/page296/little-fashion /var/www/html/
RUN curl -o /var/www/html/little-fashion.zip https://www.free-css.com/free-css-templates/page296/little-fashion && \
    unzip /var/www/html/little-fashion.zip -d /var/www/html/ && \
    rm /var/www/html/little-fashion.zip


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

