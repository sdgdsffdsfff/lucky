@echo off
echo [step 1 compile class]
cd d:/git/lucky/
call mvn clean package -P test
scp target/lucky.war root@my:/opt/webapp
ssh root@my "mv /opt/webapp/webapp/WEB-INF/lib /opt/webapp/; mv /opt/webapp/webapp/upload /opt/webapp/; cd /opt/webapp;rm -rf webapp;unzip lucky.war -d webapp;mv  /opt/webapp/upload /opt/webapp/webapp/;mv /opt/webapp/lib /opt/webapp/webapp/WEB-INF/;source /etc/profile; /opt/tomcat8/bin/catalina.sh stop;/opt/tomcat8/bin/catalina.sh start;"




