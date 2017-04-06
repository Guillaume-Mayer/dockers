FROM java-filebeat-debian

LABEL Maintainer gmayer@arkho.tech

ADD jboss-eap-6.4.0.tar.gz /opt

ENV JBOSS_HOME /opt/jboss
ENV JBOSS_VERSION 6.4.0
ENV LAUNCH_JBOSS_IN_BACKGROUND true

RUN ln -s /opt/jboss-eap-6.4 /opt/jboss && \
    apt-get update && apt-get install -y bsdtar unzip && apt-get clean && \
    $JBOSS_HOME/bin/add-user.sh admin admin123., --silent && \
    echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf && \
    groupadd -r jboss && useradd -r -g jboss -m -d /home/jboss jboss && chmod 755 /home/jboss && \
    chown -RL jboss:jboss $JBOSS_HOME

USER jboss

EXPOSE 8080 9990

CMD /opt/jboss/bin/standalone.sh

