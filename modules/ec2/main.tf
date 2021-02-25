data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"                              #cahnge for tuts
  key_name = "suryaraj"                                   #change for tuts
  associate_public_ip_address = var.public_ip             
  user_data = var.user_data
  count = var.Number_of_instance
  tags = {
      Name = var.Name_of_the_instance
   }

} 

