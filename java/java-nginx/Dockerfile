FROM nginx:alpine

RUN apk --no-cache add wget ca-certificates && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    apk add glibc-2.25-r0.apk && \
    rm glibc-2.25-r0.apk && \
    apk del wget ca-certificates

ADD server-jre-8u144-linux-x64.tar.gz /opt

ENV JAVA_HOME=/opt/jdk1.8.0_144 \
    PATH=${PATH}:/opt/jdk1.8.0_144/bin