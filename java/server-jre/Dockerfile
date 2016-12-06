FROM debian:jessie

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY server-jre-8u112-linux-x64.tar.gz /opt/server-jre-8u112-linux-x64.tar.gz

RUN cd /opt && tar -xzf server-jre-8u112-linux-x64.tar.gz && rm server-jre-8u112-linux-x64.tar.gz

ENV JAVA_HOME=/opt/jdk1.8.0_112 
