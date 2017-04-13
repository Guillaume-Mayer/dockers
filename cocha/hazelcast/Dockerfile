FROM java-filebeat-debian

LABEL maintainer gmayer@arkho.tech

COPY hazelcast-server.jar /hazelcast-server.jar

EXPOSE 5701

# FileBeat configuration
COPY filebeat.yml /etc/filebeat/filebeat.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir log

ENTRYPOINT /docker-entrypoint.sh