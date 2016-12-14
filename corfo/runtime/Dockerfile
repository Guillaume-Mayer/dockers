FROM corfo-base

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

EXPOSE 8081 8161 9990

CMD cd /escritorio_empresa/runtime/apache-activemq-5.9.1 && \
	./activemq-start.sh && \
	cd /escritorio_empresa/runtime/jboss-fuse && \
	./jfuse-start.sh
