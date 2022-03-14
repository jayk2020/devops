data "aws_iam_policy_document" "ec2-policy-doc" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

  }
}

module "jenkinsrole" {
  source          = "./iam_role"
  name            = "airbus-jenkins-ec2-role"
  policy_document = data.aws_iam_policy_document.ec2-policy-doc.json
  tag          = "airbus-jenkins-ec2-role"
  project_name = var.project_name

}

module "ssmfullaccess" {
  source     = "./iam_policy_attachment"
  role       = module.jenkinsrole.iam_ssm_access_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"

}

module "jenkins_instance_profile" {
  source = "./iam_instance_profile"
  name   = "jenkins-ec2-instance-profile"
  role   = module.jenkinsrole.iam_ssm_access_name

}
