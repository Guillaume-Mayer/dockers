/etc/init.d/filebeat start && java -jar /hazelcast-server.jar 2>&1 | tee /log/hazelcast.log