FROM almalinux:8

RUN yum install -y httpd \zip\unzip
ADD https://www.free-css.com/free-css-templates/little-fashion.zip /home/ubuntu/
WORKDIR /home/ubuntu/
RUN unzip little-fashion.zip
RUN cp -rvf little-fashion/* .
RUN rm -rf little-fashion little-fashion.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22