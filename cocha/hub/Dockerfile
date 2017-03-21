FROM sdoxsee/jboss-eap

LABEL Author gmayer@arkho.tech

# JBoss Configuration
COPY standalone.xml /opt/jboss/jboss-eap-6.4/standalone/configuration/standalone.xml

# Driver MySql
COPY com /opt/jboss/jboss-eap-6.4/modules/com

# FileBeat configuration
#COPY filebeat.yml /etc/filebeat/filebeat.yml

# EAR
COPY cocha-hotels-core.ear /opt/jboss/jboss-eap-6.4/standalone/deployments/cocha-hotels-core.ear

