FROM server-jre:8

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY wso2dss-3.5.1.zip /opt/wso2dss-3.5.1.zip

RUN apt-get update && apt-get install -y unzip && apt-get clean && \
	cd /opt && unzip wso2dss-3.5.1.zip && rm wso2dss-3.5.1.zip

COPY master-datasources.xml /opt/wso2dss-3.5.1/repository/conf/datasources/master-datasources.xml
COPY mysql-connector-java-5.1.40-bin.jar /opt/wso2dss-3.5.1/repository/components/lib/mysql-connector-java-5.1.40-bin.jar
COPY postgresql-9.4.1212.jar /opt/wso2dss-3.5.1/repository/components/lib/postgresql-9.4.1212.jar

EXPOSE 9443 9763

ENTRYPOINT /opt/wso2dss-3.5.1/bin/wso2server.sh
