#FROM jboss-eap:6.4
FROM sdoxsee/jboss-eap

LABEL Author gmayer@arkho.tech

# JBoss Configuration
COPY standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml

# Driver MySql
COPY com $JBOSS_HOME/modules/com

# Entry Point
COPY docker-entrypoint.sh /docker-entrypoint.sh

USER root

# Install FileBeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-x86_64.rpm && \
    rpm -vi filebeat-5.3.0-x86_64.rpm && \
    chmod a+x /docker-entrypoint.sh && \
    $JBOSS_HOME/bin/add-user.sh admin admin123., --silent && \
    echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf && \
    mkdir $JBOSS_HOME/data

# FileBeat configuration
COPY filebeat.yml /etc/filebeat/filebeat.yml

CMD /docker-entrypoint.sh
