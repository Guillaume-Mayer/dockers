FROM jboss-eap:6.4

LABEL maintainer gmayer@arkho.tech

COPY standalone.xml /opt/jboss/standalone/configuration/standalone.xml

COPY com /opt/jboss/modules/com

RUN mkdir /data

VOLUME /data

EXPOSE 9999