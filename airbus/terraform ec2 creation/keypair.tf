module "jenkins-keypair" {
  source       = "./ec2_keypair"
  key_name          = "airbus-jenkins"
  public_key        = var.public_key_jenkins
  tag = "airbus-jenkins"
  project_name = var.project_name
}
