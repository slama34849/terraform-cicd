# terraform-cicd

The terraform code will provision 2 ec2 instance in the defualt VPC. To install Jenkins and Tomcat, it uses the user_data option.

There are two sh files for Tomcat and Jenkins we provide for user_data. 
#tomcat.sh
- It will install Java 1.8
- Add java path to ~/.bash_profile file
- Download tomcat binary - un tar it and rename it to tomcat in /opt
- Comment a line in context.xml to being able to login from browser.
- Add new user to tomcat-user.xml

#jenkins.sh
- Install java and add path to ~/bash_profile
- Download required repo and install jenkins
- Install Git
- Download Maven 3.6.3 in /opt - Rename it to maven
- Add maven path to ~/.bash_profile



#Jenkins setup 
When the Jenkins server is up, we can login to Jenkins UI using the <ec2-public-ip>:8080. While loging in we need to provide a password which 
can be found in,
cat /var/lib/jenkins/secrets/initialAdminPassword
Once logged is change the password from the settings. Then move on to adding the plugins for Git and Maven. Download below plugins without 
restart,
- GitHub
- Maven Integration
- Maven Invoker
Note: It will download other plugins aswell which are dependencies for our plugins.
Now, go to Global tool Configuration and add followig,
Java,
Name - JAVA_HOME
JAVA_HOME - /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.272.b10-1.amzn2.0.1.x86_64

Git,
Name - github
Path to Git executable - /usr/bin/git

Maven,
Name - M2_HOME
MAVEN_HOME - /opt/maven




#Things needs to be added
#Deploy war file to tomcat
#output jenkins server temp pw
#output public ips
#Include Docker 
#include Ansible
#include Kubernetes
