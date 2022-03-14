resource "aws_iam_instance_profile" "ssms3fullaccess" {
  name = var.name
  role = var.role
  lifecycle {
    create_before_destroy = true
  }
}