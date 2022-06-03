#FROM ubuntu:focal
FROM php:apache

RUN apt-get update && apt-get -y upgrade &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && apt-get install -y apache2 libapache2-mod-auth-mellon

WORKDIR /etc/apache2/conf-enabled/

COPY adas.xml .
COPY mellon.conf .
COPY mellontest.* ./

WORKDIR /var/www/html/secret/
COPY index.php .

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
