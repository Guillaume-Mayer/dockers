# Originally from: http://blog.couchbase.com/2015/december/jboss-eap7-nosql-javaee-docker

# Use latest jboss/base-jdk:8 image as the base
FROM jboss/base-jdk:8
MAINTAINER Stephen Doxsee

# Set the JBOSS_VERSION env variable
ENV JBOSS_VERSION 6.4.0
ENV JBOSS_SHA1 9ac2979fe92040a039a3a3db8b4ce8d166e2c872
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4/

# Add the JBoss distribution to /opt, and make jboss the owner of the extracted zip content
# Make sure the distribution is available from a well-known place
RUN cd $HOME \
    && curl --remote-name https://media.githubusercontent.com/media/sdoxsee/docker-jboss-eap/master/files/jboss-eap-6.4.0.zip \
    && sha1sum jboss-eap-$JBOSS_VERSION.zip | grep $JBOSS_SHA1 \
    && unzip jboss-eap-$JBOSS_VERSION.zip \
    && rm jboss-eap-$JBOSS_VERSION.zip

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Expose the ports we're interested in
# http://stackoverflow.com/a/32213512/1098564
EXPOSE 8080 9990 4447 9999

# Set the default command to run on boot
# This will boot JBoss EAP in the standalone mode and bind to all interface
CMD ["/opt/jboss/jboss-eap-6.4/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]