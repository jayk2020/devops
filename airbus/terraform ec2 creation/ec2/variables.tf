variable "subnet_id" {}
variable "sg_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "ami_id" {}
variable "tag" {}
variable "root_vol_size" {}
variable "instance_profile_name" {}
variable "project_name" {}
variable "root_delete_termination" {}
variable "ebs_delete_termination" {}
variable "public_address" {}
variable "encrypted_volume" {
  default=false
}
variable "ec2_create_volume" {
    type = list(object({
       az_zone = string
       ebs_size = number
       device_name = string

    }))
}
variable "file_name" { }