FROM debian:latest

LABEL maintainer gmayer@arkho.tech

COPY filebeat-5.2.2-amd64.deb /filebeat-5.2.2-amd64.deb

RUN dpkg -i /filebeat-5.2.2-amd64.deb && \
    rm /filebeat-5.2.2-amd64.deb

