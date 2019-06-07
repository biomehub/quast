FROM debian:latest
MAINTAINER lfelipedeoliveira, felipe@lfelipedeoliveira.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; \
    apt-get install -y curl wget g++ make libboost-all-dev \
        tar gzip bzip2 build-essential \
        python2.7-dev python-setuptools python-pip python-virtualenv \
        zlib1g-dev default-jdk perl; \
    apt-get update && apt-get install -y pkg-config libfreetype6-dev \
    libpng-dev python-matplotlib; \
    apt-get upgrade; \
    apt-get clean

# Download & install Diamond

 RUN wget https://downloads.sourceforge.net/project/quast/quast-5.0.2.tar.gz \
  && tar -C /opt/ -zxf quast-5.0.2.tar.gz \
  && rm quast-5.0.2.tar.gz
#  && sh /opt/quast-5.0.2/install_full.sh

RUN pip install --upgrade setuptools pip \
    && python /opt/quast-5.0.2/setup.py install_full \

ENV PATH /opt/quast-5.0.2/:$PATH
