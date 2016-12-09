#FROM server-jre:8
FROM anapsix/alpine-java

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY qpid-broker-6.1.0-bin.tar.gz /opt/qpid-broker-6.1.0-bin.tar.gz

RUN cd /opt && tar -xzf qpid-broker-6.1.0-bin.tar.gz && rm qpid-broker-6.1.0-bin.tar.gz \
	&& mkdir /var/qpidwork

ENV QPID_HOME /opt/qpid-broker/6.1.0
ENV QPID_WORK /var/qpidwork
ENV PATH ${PATH}:${JAVA_HOME}/bin

ENTRYPOINT /opt/qpid-broker/6.1.0/bin/qpid-server

EXPOSE 8080 5672

