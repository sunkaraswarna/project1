FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN dnf install httpd unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/photosec.zip /var/www/html
WORKDIR /var/www/html
RUN unzip photosec.zip
RUN rm -rf photosec.zip && \
    cp -rf photosec-html/* . && \
    rm -rf photosec-html 
EXPOSE 80
CMD ["/usr/sbin/httpd" "-D" "FOREGROUND"]
