FROM server-jre:7

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY escritorio_empresa /escritorio_empresa

COPY id_rsa /id_rsa

ENV JBOSS_HOME /escritorio_empresa/runtime/jboss-fuse

ENV JAVA_OPTS -server -Xms1024m -Xmx2048m -XX:MaxPermSize=256m -Dorg.jboss.resolver.warning=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Dsun.lang.ClassLoader.allowArraySyntax=true -DEE_HOME=/escritorio_empresa -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0

RUN apt-get update && apt-get install -y openssh-client && apt-get clean

VOLUME /escritorio_empresa/runtime/jboss-fuse/standalone/configuration
VOLUME /escritorio_empresa/runtime/jboss-fuse/standalone/deployments
VOLUME /escritorio_empresa/runtime/config

EXPOSE 8081 8161 8787 9990

CMD cd /escritorio_empresa/runtime/apache-activemq-5.9.1 && \
	./activemq-start.sh && \
	cd /escritorio_empresa/runtime/jboss-fuse/bin && \
	bash standalone.sh -c ee-standalone.xml --debug
