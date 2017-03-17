FROM java-filebeat-debian

LABEL maintainer gmayer@arkho.tech

COPY hazelcast-server.jar /hazelcast-server.jar

EXPOSE 5701

ENTRYPOINT java -jar hazelcast-server.jar