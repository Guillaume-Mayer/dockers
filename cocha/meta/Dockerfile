FROM jboss-eap:6.4

LABEL Author gmayer@arkho.tech

# JBoss Configuration
COPY standalone.xml /opt/jboss/jboss-eap-6.4/standalone/configuration/standalone.xml

# Driver MySql
COPY com /opt/jboss/jboss-eap-6.4/modules/com

# FileBeat configuration
#COPY filebeat.yml /etc/filebeat/filebeat.yml

# Directory for storing files to import
RUN mkdir /opt/jboss/data
VOLUME /opt/jboss/data
