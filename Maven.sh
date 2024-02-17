sudo apt update -y
sudo apt install maven -y
mvn -version

vi /etc/profile.d/maven.sh
 -------------------------------------------------
  export MAVEN_HOME=/opt/apache-maven-3.6.3
  export PATH=$PATH:$MAVEN_HOME/bin
 -------------------------------------------------
source /etc/profile.d/maven.sh
mvn -version
