FROM jboss-eap:6.4

LABEL Author gmayer@arkho.tech

# Driver MySql
COPY com /opt/jboss/modules/com

# Configuration
COPY standalone.xml /opt/jboss/standalone/configuration/standalone.xml

# Debug port
EXPOSE 8787

# Standalone + debug
ENTRYPOINT /opt/jboss/bin/standalone.sh --debug