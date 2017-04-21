#FROM jboss-eap:6.4
FROM sdoxsee/jboss-eap

LABEL Author gmayer@arkho.tech

# JBoss Configuration
COPY standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml
COPY logging.properties $JBOSS_HOME/standalone/configuration/logging.properties

# Driver MySql
COPY com $JBOSS_HOME/modules/com

# Updated modules
COPY javax-jaxrs/jaxrs-api-3.0.2.Final.jar $JBOSS_HOME/modules/system/layers/base/javax/ws/rs/api/main/jaxrs-api-3.0.2.Final.jar
COPY javax-jaxrs/module.xml $JBOSS_HOME/modules/system/layers/base/javax/ws/rs/api/main/module.xml
COPY resteasy-jaxb/resteasy-jaxb-provider-3.0.2.Final.jar $JBOSS_HOME/modules/system/layers/base/org/jboss/resteasy/resteasy-jaxb-provider/main/resteasy-jaxb-provider-3.0.2.Final.jar
COPY resteasy-jaxb/module.xml $JBOSS_HOME/modules/system/layers/base/org/jboss/resteasy/resteasy-jaxb-provider/main/module.xml
COPY resteasy-jaxrs/resteasy-jaxrs-3.0.2.Final.jar $JBOSS_HOME/modules/system/layers/base/org/jboss/resteasy/resteasy-jaxrs/main/resteasy-jaxrs-3.0.2.Final.jar
COPY resteasy-jaxrs/module.xml $JBOSS_HOME/modules/system/layers/base/org/jboss/resteasy/resteasy-jaxrs/main/module.xml

# Entry Point
COPY docker-entrypoint.sh /docker-entrypoint.sh

USER root

# Install FileBeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-x86_64.rpm && \
    rpm -vi filebeat-5.3.0-x86_64.rpm && \
    chmod a+x /docker-entrypoint.sh && \
    $JBOSS_HOME/bin/add-user.sh admin admin123., --silent && \
    echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

# FileBeat configuration
COPY filebeat.yml /etc/filebeat/filebeat.yml

CMD /docker-entrypoint.sh
