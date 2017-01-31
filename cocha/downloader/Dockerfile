FROM debian:latest

LABEL maintainer gmayer@arkho.tech

COPY scripts /scripts

RUN apt-get update && \
    apt-get install -y curl unzip && \
    mkdir /data

VOLUME /data

WORKDIR /scripts

CMD ./eanHotels.sh ; \
    ./eanRegions.sh ; \
    ./bkgHotelsLastChange.sh