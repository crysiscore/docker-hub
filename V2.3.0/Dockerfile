#Base image for openmrs 2.x.x
#Download base image ubuntu 18.04
FROM tomcat:8-jre8-temurin

LABEL mantainer="Agnaldo Samuel  <agnaldosamuel@ccsaude.org.mz>"

COPY OpenMRS/modules/  /usr/local/tomcat/.OpenMRS/modules
COPY openmrs-runtime.properties /usr/local/tomcat/.OpenMRS
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
COPY localtime /etc/localtime

COPY webapps/openmrs.war   /var/lib/tomcat8/webapps/
WORKDIR /var/lib/tomcat8/bin

EXPOSE 8080