
module "sg-jenkins" {
  source      = "./security_groups"
  description = "airbus-Jenkins-sg"
  name        = "airbus-Jenkins-sg"
  tag         = "airbus-Jenkins-sg"
  vpc_id      = "XXXXXXXXXXXXX"
  ingress_ssg_rules = [  ]

ingress_rules = [ 
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "XXXXXXXXXX"
      description = "ssh access"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_block  = "XXXXXXXXXX"
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

