FROM tomcat:8

# must install the full JDK to be have the "jar" command
RUN apt-get update

# cleam up default web apps
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/docs \
           /usr/local/tomcat/webapps/examples \
           /usr/local/tomcat/webapps/host-manager \
           /usr/local/tomcat/webapps/manager

# Download war file
# FIXME
#RUN cd /tmp &&\
#    curl -O https://aims1.llnl.gov/esgf/dist/esg-search/esg-search.war
COPY esg-search.war /tmp/esg-search.war
RUN cd /tmp && unzip esg-search.war -d /usr/local/tomcat/webapps/esg-search
    
# copy configuration files
COPY config/esgf.properties /esg/config/esgf.properties 
COPY config/esgf_shards.xml /esg/config/esgf_shards.xml
COPY config/esgf_shards_static.xml /esg/config/esgf_shards_static.xml
COPY config/application.properties /usr/local/tomcat/webapps/esg-search/WEB-INF/classes/esg/search/config/application.properties
    
CMD catalina.sh run
    
