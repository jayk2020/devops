resource "aws_iam_role" "ssms3fullaccess" {
  name               = var.name
  assume_role_policy = var.policy_document
}


