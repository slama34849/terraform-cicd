variable "jenkins_ports" {
  type = list(number)
  description = "List of ingress ports"
  default = [22, 8080]
}



variable "server_names" {
    type = list
    default = ["Jenkins Server", "Tomcat Server"]
}

# locals {
#     servertags = [
#         {
#             Name = "Jenkins Server"
#         },
#         {
#             Name = "Tomcat Server"
#         },
#     ]
# }