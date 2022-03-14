output "iam_ssm_access_name" {
  value = aws_iam_role.ssms3fullaccess.name
}
output "arn" {
  value = aws_iam_role.ssms3fullaccess.arn
}