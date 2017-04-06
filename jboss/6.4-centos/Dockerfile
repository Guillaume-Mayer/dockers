FROM jboss/base-jdk:8

LABEL Maintainer gmayer@arkho.tech

ADD jboss-eap-6.4.0.tar.gz /opt/jboss

ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4
ENV JBOSS_VERSION 6.4.0
ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER root

RUN $JBOSS_HOME/bin/add-user.sh admin admin123., --silent && \
    echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf && \
    chown -R jboss:jboss $JBOSS_HOME

USER jboss

EXPOSE 8080 9990

CMD $JBOSS_HOME/bin/standalone.sh

