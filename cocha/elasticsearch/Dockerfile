FROM java-filebeat-debian

LABEL Maintainer gmayer@arkho.tech

COPY elasticsearch-1.7.1 /elasticsearch-1.7.1

EXPOSE 9200 9300

# FileBeat configuration
COPY filebeat.yml /etc/filebeat/filebeat.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT /docker-entrypoint.sh