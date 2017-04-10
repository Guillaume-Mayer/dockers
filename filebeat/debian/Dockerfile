FROM debian:latest

LABEL Maintainer gmayer@arkho.tech

RUN apt-get update && apt-get install -y curl && apt-get clean && \
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-amd64.deb && \
    dpkg -i filebeat-5.3.0-amd64.deb && \
    rm filebeat-5.3.0-amd64.deb
