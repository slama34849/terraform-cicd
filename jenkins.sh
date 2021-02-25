#!/bin/bash
sudo hostname jenkins

#Install Java
yum install java-1.8* -y


#Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y

#Install Git
yum install git -y


#Install Maven
wget https://mirrors.ocf.berkeley.edu/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /opt/
sudo tar -xvf /opt/apache-maven-3.6.3-bin.tar.gz -C /opt
sudo mv /opt/apache-maven-3.6.3 /opt/maven


sed -i '/^PATH=*/i JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.272.b10-1.amzn2.0.1.x86_64\nM2_HOME=/opt/maven\nM2=/opt/maven' ~/.bash_profile
sed -i '/^PATH=*/c PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2:$M2_HOME' ~/.bash_profile
source ~/.bash_profile


#Start Service
sudo systemctl enable jenkins
sudo systemctl start jenkins