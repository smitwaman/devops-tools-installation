#Run using sudo -i
apt install docker-compose 

apt install unzip

adduser sonarqube

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip

unzip sonarqube-9.4.0.54424.zip 

chmod -R 755 sonarqube-9.4.0.54424

chown -R sonarqube:sonarqube sonarqube-9.4.0.54424

cd sonarqube-9.4.0.54424/bin/linux-x86-64/

./sonar.sh start

