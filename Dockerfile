# =============================================================================

# cetres/centos-apache-php

#

# CentOS-7, Apache 2.4, PHP 5.6

#

# =============================================================================

FROM centos:centos7

MAINTAINER Ferdie Culibao



# -----------------------------------------------------------------------------

# Import the RPM GPG keys for Repositories

# -----------------------------------------------------------------------------

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \

    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm



# -----------------------------------------------------------------------------

# Apache + (PHP 5.6 from https://webtatic.com)

# -----------------------------------------------------------------------------

RUN  yum --setopt=tsflags=nodocs -y update && \

     yum --setopt=tsflags=nodocs -y install \

        httpd \

        php56w \

        php56w-common \

        php56w-devel \

        php56w-mysql \

	php56w-mbstring \

	php56w-soap \

	php56w-gd \

        php56w-ldap \

        php56w-mssql \

        php56w-pear \

        php56w-pdo \

	php56w-intl \

	php56w-xml \

        php56w-pecl-xdebug \

        libaio

RUN yum clean all



RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf


# -----------------------------------------------------------------------------

# Set ports and env variable HOME

# -----------------------------------------------------------------------------

EXPOSE 8080

ENV HOME /var/www

# -----------------------------------------------------------------------------

# Start

# -----------------------------------------------------------------------------

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]


