resource "aws_iam_role_policy_attachment" "pa" {
  role       = var.role
  policy_arn = var.policy_arn
}