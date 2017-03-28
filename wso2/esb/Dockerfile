FROM server-jre:8

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY wso2esb-5.0.0.zip /opt/wso2esb-5.0.0.zip

RUN apt-get update && apt-get install -y unzip && apt-get clean && \
	cd /opt && unzip wso2esb-5.0.0.zip && rm wso2esb-5.0.0.zip

COPY master-datasources.xml /opt/wso2esb-5.0.0/repository/conf/datasources/master-datasources.xml
COPY mysql-connector-java-5.1.40-bin.jar /opt/wso2esb-5.0.0/repository/components/lib/mysql-connector-java-5.1.40-bin.jar
COPY postgresql-9.4.1212.jar /opt/wso2esb-5.0.0/repository/components/lib/postgresql-9.4.1212.jar

VOLUME /opt/wso2esb-5.0.0/repository/deployment/server/carbonapps

EXPOSE 9443 9763 8243 8280

ENTRYPOINT /opt/wso2esb-5.0.0/bin/wso2server.sh
