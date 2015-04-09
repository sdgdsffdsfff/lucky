@echo off
echo [step 1 compile class]
cd d:/git/lucky/
call mvn clean package -P test1
scp target/lucky.war root@my:/opt/webapp
ssh root@my "cd /opt/webapp;rm -rf webapp;unzip lucky.war -d webapp;source /etc/profile; /opt/tomcat8/bin/catalina.sh stop;/opt/tomcat8/bin/catalina.sh start;"




