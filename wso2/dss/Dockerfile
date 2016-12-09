FROM server-jre:8

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY wso2dss-3.5.1.zip /opt/wso2dss-3.5.1.zip

RUN apt-get update && apt-get install -y unzip && apt-get clean && \
	cd /opt && unzip wso2dss-3.5.1.zip && rm wso2dss-3.5.1.zip

EXPOSE 9443

ENTRYPOINT /opt/wso2dss-3.5.1/bin/wso2server.sh
