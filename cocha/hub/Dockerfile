FROM jboss-eap:6.4

LABEL Author gmayer@arkho.tech

# JBoss Configuration
COPY standalone.xml /opt/jboss/standalone/configuration/standalone.xml

# Driver MySql
COPY com /opt/jboss/modules/com

# FileBeat configuration
COPY filebeat.yml /etc/filebeat/filebeat.yml

# EAR
COPY cocha-hotels-core.ear /opt/jboss/standalone/deployments/cocha-hotels-core.ear
