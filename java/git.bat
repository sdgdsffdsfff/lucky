@echo off
call mvn clean package -P online
cd D:/git_online/lucky/draw.busdh.com
rm -rf *
cp D:/git/lucky/target/lucky.war  D:/git_online/lucky/draw.busdh.com/
unzip lucky.war
rm  D:/git_online/lucky/draw.busdh.com/lucky.war

git add .
git commit -am '增加批量删除功能'
git push origin master

