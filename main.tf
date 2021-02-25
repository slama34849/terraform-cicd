provider "aws" {
  region = "us-east-2"
}


# #Jenkins
module "Jenkins" {
  source = "./modules/ec2/"
  public_ip = true
  user_data = file("jenkins.sh")
  Number_of_instance = 1
  Name_of_the_instance = "Jenkins_Server"

}


#Tomcat
module "Tomcat" {
  source = "./modules/ec2"
  public_ip = true
  user_data = file("tomcat.sh")
  Number_of_instance = 1
  Name_of_the_instance = "Tomcat_Server"
}






#output jenkins server pw
#output public ips














# resource "aws_eip" "jenkins-ip" {
#   instance = aws_instance.ec2_instance.id
#   vpc      = true
# }


# resource "aws_security_group" "demo_sg" {
#   name = "Jenkins_SG"
#   description = "Ingress for Jenkins"
  
# dynamic "ingress" {
#     for_each = var.jenkins_ports
#     content {
#       from_port = ingress.value
#       to_port = ingress.value
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
# }
