FROM centos:7

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY jre-8u112-linux-x64.tar.gz /opt/jre-8u112-linux-x64.tar.gz

RUN cd /opt && tar -xzf jre-8u112-linux-x64.tar.gz && rm jre-8u112-linux-x64.tar.gz

ENV JAVA_HOME=/opt/jre1.8.0_112 
