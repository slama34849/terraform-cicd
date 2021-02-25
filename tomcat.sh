#!/bin/bash

sudo hostname tomcat
#Install Java
yum install java-1.8* -y
sudo sed -i '/^PATH=*/i JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.272.b10-1.amzn2.0.1.x86_64' ~/.bash_profile
sudo sed -i '/^PATH=*/c PATH=$PATH:$HOME/bin:$JAVA_HOME' ~/.bash_profile
source ~/.bash_profile

#Install Tomcat
wget https://apache.claz.org/tomcat/tomcat-8/v8.5.63/bin/apache-tomcat-8.5.63.tar.gz -P /opt
sudo tar -xvf /opt/apache-tomcat-8.5.63.tar.gz -C /opt/
sudo mv /opt/apache-tomcat-8.5.63 /opt/tomcat

sudo sed -ir '/^\s*<Valve className\s*=\s*"org\.apache\.catalina\.valves\.RemoteAddrValve"\s*$/{h;z;N;s:^\n::;H;/^\s*allow\s*=\s*"127\\\.\\d\+\\\.\\d\+\\\.\\d\+\|::1\|0:0:0:0:0:0:0:1"\s*\/>\s*$/{g;s/.*/<!--\n&\n-->/}}' /opt/tomcat/webapps/host-manager/META-INF/context.xml
sudo sed -ir '/^\s*<Valve className\s*=\s*"org\.apache\.catalina\.valves\.RemoteAddrValve"\s*$/{h;z;N;s:^\n::;H;/^\s*allow\s*=\s*"127\\\.\\d\+\\\.\\d\+\\\.\\d\+\|::1\|0:0:0:0:0:0:0:1"\s*\/>\s*$/{g;s/.*/<!--\n&\n-->/}}' /opt/tomcat/webapps/manager/META-INF/context.xml
sudo sed -i '/<\/tomcat-users\>/d' /opt/tomcat/conf/tomcat-users.xml

sudo cat <<EOF >> /opt/tomcat/conf/tomcat-users.xml
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <role rolename="manager-jmx"/>
  <role rolename="manager-status"/>
  <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
  <user username="deployer" password="deployer" roles="manager-script"/>
  <user username="tomcat" password="s3cret" roles="manager-gui"/>
  </tomcat-users\>
EOF

sudo sh /opt/tomcat/bin/shutdown.sh
sudo sh /opt/tomcat/bin/startup.sh