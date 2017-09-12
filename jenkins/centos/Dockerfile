FROM centos

ADD server-jre-8u144-linux-x64.tar.gz /opt

COPY *.repo /etc/yum.repos.d/

ENV JAVA_HOME=/opt/jdk1.8.0_144
ENV PATH=${PATH}:${JAVA_HOME}/bin

#RUN yum install -y wget && \
#    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
#    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
#    yum install -y jenkins