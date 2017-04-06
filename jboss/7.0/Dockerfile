FROM jboss/base-jdk:8

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

ADD jboss-eap-7.0.0.tar.gz /opt/jboss

ENV JBOSS_HOME /opt/jboss/jboss-eap-7.0

USER root

RUN chown -R jboss:jboss $JBOSS_HOME && \
    $JBOSS_HOME/bin/add-user.sh admin admin123., --silent && \
    echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

USER jboss

EXPOSE 8080 9990

CMD $JBOSS_HOME/bin/standalone.sh

