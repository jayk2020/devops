
module "sg-jenkins" {
  source      = "./security_groups"
  description = "airbus-Jenkins-sg"
  name        = "airbus-Jenkins-sg"
  tag         = "airbus-Jenkins-sg"
  vpc_id      = "vpc-0dcb6396b03b5b54b"
  ingress_ssg_rules = [  ]

ingress_rules = [ 
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "172.31.0.0/16"
      description = "ssh access"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_block  = "172.31.0.0/16"
      description = "jenkins port access for alb"
    },    

]
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
      description = "This is for internet access"
    },
  ]
  project_name = var.project_name


}

