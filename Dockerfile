FROM almalinux:8

# Install necessary packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip && yum clean all

# Download the zip file
ADD little-fashion.zip /var/www/html/
RUN cd /var/www/html/ && unzip little-fashion.zip && rm -f little-fashion.zip

RUN curl -fSL -o /var/www/html/little-fashion.zip https://www.free-css.com/free-css-templates/page296/little-fashion && \
    cd /var/www/html/ && unzip little-fashion.zip && rm -f little-fashion.zip

RUN for i in 1 2 3; do curl -fSL -o /var/www/html/little-fashion.zip https://www.free-css.com/free-css-templates/page296/little-fashion && break || sleep 5; done && \
    cd /var/www/html/ && unzip little-fashion.zip && rm -f little-fashion.zip

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

