FROM java:nginx

COPY wso2esb-5.0.0.zip /opt

RUN apk --no-cache add unzip && \
    cd /opt && \
    unzip wso2esb-5.0.0.zip && \
    rm wso2esb-5.0.0.zip && \
    apk del unzip
