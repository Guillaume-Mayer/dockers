FROM registry.access.redhat.com/rhel7

ADD server-jre-8u144-linux-x64.tar.gz /opt

ENV JAVA_HOME=/opt/jdk1.8.0_144
ENV PATH=${PATH}:${JAVA_HOME}/bin

COPY centos.repo /etc/yum.repos.d/
COPY RPM-GPG-KEY-CentOS-7 /etc/pki/rpm-gpg/
COPY epel-release-latest-7.noarch.rpm /
COPY ius-release-1.0-15.ius.el7.noarch.rpm /
COPY docker.repo /etc/yum.repos.d/

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    rpm -i /epel-release-latest-7.noarch.rpm && \
    rpm -i /ius-release-1.0-15.ius.el7.noarch.rpm && \
    yum install -y git && \
    useradd jenkins

COPY jenkins.war /home/jenkins/

RUN chown jenkins:jenkins /home/jenkins/jenkins.war

USER jenkins

WORKDIR /home/jenkins

EXPOSE 8080

VOLUME /home/jenkins/.jenkins

ENTRYPOINT java -jar jenkins.war --httpPort=8080
