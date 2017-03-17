FROM logstash:alpine

LABEL Author gmayer@arkho.tech

# LogStash Configuration
COPY logstash.conf /logstash.conf

# MySql Driver
COPY mysql-connector-java-5.1.35.jar /mysql-connector-java-5.1.35.jar

EXPOSE 5044

CMD ["-f", "/logstash.conf"]