############################################################
# Dockerfile to build Centos-LEMP installed  Container
# Based on CentOS
############################################################

# Set the base image to Ubuntu
FROM centos:centos6

# File Author / Maintainer
MAINTAINER Ludo Bermejo <ludobermejo@gmail.com> based on a docker file by kaushal.rahuljaiswal@gmail.com

# Install epel repos
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Installing epel
RUN yum -y install epel-release

# Clean up yum repos to save spaces
RUN yum update -y


# MariaDB
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
ADD mariadb.sql /root/mariadb.sql
ADD server.cnf /etc/my.cnf.d/server.cnf

RUN yum -y install MariaDB MariaDB-server
RUN yum clean all

# Add the ngix and PHP dependent repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing PHP
RUN yum -y --enablerepo=remi,remi-php56 install nginx php-fpm php-common
RUN yum -y --enablerepo=remi,remi-php56 install php-cli php-pear php-pdo php-mysqlnd php-pgsql php-gd php-mbstring php-mcrypt php-xml

# Adding the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

ADD execute.sh /execute.sh
RUN chmod 755 /*.sh



# Executing supervisord
CMD ["/execute.sh"]
