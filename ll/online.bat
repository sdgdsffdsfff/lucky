@echo off
echo [step 1 compile class]
cd d:/git/lucky/
#call mvn clean package -P test
#scp target/lucky.war root@my:/opt/webapp
#git add .
#git commit -am 'ALTER TABLE article ADD enable int default 1;ALTER TABLE category ADD enable int default 1;ALTER TABLE earphone ADD enable int default 1;三个表增加了一个字段，增加了排序功能'
#git push
#first push
git remote add origin git@git.oschina.net:xiayingjie/lucky.git
git commit -am "提交改动"
git push origin master

