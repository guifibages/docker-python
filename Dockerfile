FROM python:2.7

MAINTAINER Ignacio Torres Masdeu <i@itorres.net>

# Mimics 2-onbuild except for the inclusion of LDAP development libraries

COPY certs/* /usr/local/share/ca-certificates/
RUN apt-get update && apt-get install -y libldap2-dev libsasl2-dev && /usr/sbin/update-ca-certificates

COPY ldap.conf /etc/ldap/ldap.conf

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY . /usr/src/app
