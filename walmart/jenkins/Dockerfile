FROM registry.access.redhat.com/rhel7

ADD server-jre-8u144-linux-x64.tar.gz /opt

ENV JAVA_HOME=/opt/jdk1.8.0_144
ENV PATH=${PATH}:${JAVA_HOME}/bin

RUN useradd jenkins

COPY jenkins.war /home/jenkins/

RUN chown jenkins:jenkins /home/jenkins/jenkins.war

USER jenkins

WORKDIR /home/jenkins

EXPOSE 8080

VOLUME /home/jenkins/.jenkins

ENTRYPOINT java -jar jenkins.war
