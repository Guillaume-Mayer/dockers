FROM jenkins/jenkins:alpine

ADD apache-maven-3.5.0-bin.tar.gz /usr/lib

USER root

RUN ln -s ../lib/apache-maven-3.5.0/bin/mvn /usr/bin/mvn

USER jenkins