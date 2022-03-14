variable "vpc_id" {}
variable "name" {}
variable "description" {}

variable "ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))

}

variable "egress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))

}

variable "tag" {
  
}

variable "project_name" {
  
}

variable "ingress_ssg_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      source_security_group_id = string
      description = string
    }))

}