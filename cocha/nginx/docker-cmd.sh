/filebeat-5.3.0-linux-x86_64/filebeat -c /etc/filebeat/filebeat.yml -path.home /filebeat-5.3.0-linux-x86_64 -path.config /etc/filebeat -path.data /var/lib/filebeat -path.logs /var/log/filebeat &

nginx -g "daemon off;"