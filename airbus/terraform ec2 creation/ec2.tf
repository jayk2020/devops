
module "jenkins" {
  source                  = "./ec2"
  ami_id                  = "ami-XXXXXXXXXXXXXX"
  root_vol_size           = "100"
  instance_profile_name   = module.jenkins_instance_profile.iam_ssm_access_name
  subnet_id               = "XXXXXXXXXXXXX"
  sg_id                   = module.sg-jenkins.sg_id
  key_name                = module.jenkins-keypair.id
  instance_type           = "m5.xlarge"
  tag                     = "Airbus-Jenkins"
  root_delete_termination = "true"
  ebs_delete_termination  = "true"
  public_address          = "false"
  project_name            = var.project_name
  ec2_create_volume = [ ]
}
