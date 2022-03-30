
module "jenkins" {
  source                  = "./ec2"
  ami_id                  = "ami-0c02fb55956c7d316"
  root_vol_size           = "100"
  instance_profile_name   = module.jenkins_instance_profile.iam_ssm_access_name
  subnet_id               = "subnet-0ef37284f92d76757"
  sg_id                   = module.sg-jenkins.sg_id
  key_name                = module.jenkins-keypair.id
  instance_type           = "t2.micro"
  tag                     = "Airbus-Jenkins"
  root_delete_termination = "true"
  ebs_delete_termination  = "true"
  public_address          = "true"
  project_name            = var.project_name
  ec2_create_volume = [ ]
  file_name = "userdata.tpl"
  
}
