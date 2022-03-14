resource "aws_key_pair" "keypair" {
  key_name   = var.key_name
  public_key = var.public_key

    tags = {
    Name = var.tag
    Project= var.project_name

  }
}