FROM registry.access.redhat.com/rhel7

ARG package

COPY *.repo /etc/yum.repos.d/
COPY RPM-GPG-KEY-CentOS-7 /etc/pki/rpm-gpg/

RUN mkdir /rpm && \
    cd /rpm && \
    yumdownloader --resolve $package && \
    cd .. && \
    tar -czf $package.tar.gz rpm/ && \
    rm -rf rpm
