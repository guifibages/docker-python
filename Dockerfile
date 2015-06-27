FROM python:2.7
MAINTAINER Ignacio Torres Masdeu <i@itorres.net>

# Mimics 2-onbuild except for the inclusion of ldap libraries

RUN apt-get update && apt-get install python-ldap

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY . /usr/src/app
