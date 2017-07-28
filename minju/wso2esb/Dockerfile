FROM java:oraclelinux

COPY wso2esb-5.0.0.zip /opt

RUN yum -y install unzip && \
    cd /opt && \
    unzip wso2esb-5.0.0.zip && \
    rm wso2esb-5.0.0.zip && \
    yum -y remove unzip && \
    yum clean all
