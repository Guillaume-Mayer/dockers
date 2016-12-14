#FROM server-jre:8
FROM anapsix/alpine-java

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

ADD jboss-eap-7.0.0.tar.gz /

ENV JBOSS_HOME /jboss-eap-7.0

RUN $JBOSS_HOME/bin/add-user.sh admin admin123., --silent

RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

VOLUME /jboss-eap-7.0/standalone/deployments

EXPOSE 8080 9990

ENTRYPOINT /jboss-eap-7.0/bin/standalone.sh

