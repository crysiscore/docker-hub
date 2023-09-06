#Base image for openmrs 2.x.x
#Download base image ubuntu 18.04
FROM tomcat:8-jre8-temurin

LABEL mantainer="Agnaldo Samuel  <agnaldosamuel@ccsaude.org.mz>"

RUN apt-get update && apt-get install -y nano  inetutils-ping
# COPY OpenMRS/modules/  /usr/local/tomcat/.OpenMRS/modules
COPY openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
COPY localtime /etc/localtime

COPY webapps/openmrs.war   /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat

EXPOSE 8080

# When creating the container a volume containing the module must be mapped to /usr/local/tomcat/.OpenMRS/modules
# docker build -t crysiscore/openmrs:v2.3.3 .


# docker run -d   --name openmrs_2x   -p 8080:8080 -v /home/ccsadmin/.OpenMRS/modules:/usr/local/tomcat/.OpenMRS/modules  crysiscore/openmrs:v2.3.3
#  docker run -d   --name openmrs_2x   -p 8081:8080 -v /home/ccsadmin/.OpenMRS/modules:/data/modules    crysiscore/openmrs:v2.3.3