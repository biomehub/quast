FROM debian:latest
MAINTAINER lfelipedeoliveira, felipe@lfelipedeoliveira.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; \
    apt-get install -y apt-utils

RUN apt-get install -y wget; \
    apt-get install -y zlib1g-dev; \
    apt-get install -y pkg-config libfreetype6-dev libpng-dev python-matplotlib; \
    apt-get install -y python-pip; \
    apt-get update; \
    apt-get clean

# Download & install Diamond

RUN wget https://downloads.sourceforge.net/project/quast/quast-5.0.2.tar.gz \
    && tar -C /opt/ -zxf quast-5.0.2.tar.gz \
    && rm quast-5.0.2.tar.gz
#  && sh /opt/quast-5.0.2/install_full.sh

RUN pip install --upgrade setuptools pip \
    && cd /opt/quast-5.0.2 \
    && python setup.py install_full \
    && cd /

ENV PATH /opt/quast-5.0.2/:$PATH
