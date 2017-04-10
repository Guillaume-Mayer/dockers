FROM centos:latest

LABEL maintainer gmayer@arkho.tech

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-x86_64.rpm && \
    rpm -vi filebeat-5.3.0-x86_64.rpm && \
    rm filebeat-5.3.0-x86_64.rpm

