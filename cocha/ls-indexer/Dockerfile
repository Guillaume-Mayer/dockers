FROM logstash:alpine

LABEL maintainer gmayer@arkho.tech

# LogStash Configuration
COPY logstash.conf /logstash.conf

EXPOSE 5044

CMD ["-f", "/logstash.conf"]