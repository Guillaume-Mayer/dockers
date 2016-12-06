FROM centos:7

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY jdk-8u112-linux-x64.tar.gz /opt/jdk-8u112-linux-x64.tar.gz

RUN cd /opt && tar -xzf jdk-8u112-linux-x64.tar.gz && rm jdk-8u112-linux-x64.tar.gz

ENV JAVA_HOME=/opt/jdk1.8.0_112 
