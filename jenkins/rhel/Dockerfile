FROM registry.access.redhat.com/rhel7

ADD server-jre-8u144-linux-x64.tar.gz /opt

COPY *.repo /etc/yum.repos.d/
COPY RPM-GPG-KEY-CentOS-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

ENV JAVA_HOME=/opt/jdk1.8.0_144
ENV PATH=${PATH}:${JAVA_HOME}/bin

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
#RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
#    yum install -y jenkins