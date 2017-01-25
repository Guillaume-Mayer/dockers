FROM java:debian

LABEL maintainer gmayer@arkho.tech

COPY scripts /scripts

RUN apt-get update && \
    apt-get install -y curl unzip && \
    mkdir /data

VOLUME /data

CMD /scripts/eanHotels.sh ; \
    /scripts/eanRegions.sh ; \
    /scripts/bkgHotelsLastChange.sh