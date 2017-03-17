#FROM java:centos
FROM java-filebeat-debian

LABEL maintainer gmayer@arkho.tech

ADD jboss-eap-6.4.0.tar.gz /opt

RUN ln -s /opt/jboss-eap-6.4 /opt/jboss

ENV JBOSS_HOME /opt/jboss

#RUN yum update -y && yum -y install xmlstarlet saxon augeas bsdtar unzip && yum clean all

RUN $JBOSS_HOME/bin/add-user.sh admin admin123., --silent

RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

EXPOSE 8080 9990


