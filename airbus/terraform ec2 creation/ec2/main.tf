resource "aws_instance" "ec2" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [ var.sg_id ]
  associate_public_ip_address = var.public_address
  iam_instance_profile= var.instance_profile_name
  user_data   = data.template_file.user_data.rendered

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_vol_size
    delete_on_termination = var.root_delete_termination
  }
  

  tags = {
    Name = var.tag
    Project_Name= var.project_name
}
}

resource "aws_ebs_volume" "ebsvolume" {
  count = length(var.ec2_create_volume)
  availability_zone = var.ec2_create_volume[count.index].az_zone
  size              = var.ec2_create_volume[count.index].ebs_size
  encrypted = var.encrypted_volume

  tags = {
    Name = var.tag
    Project_Name= var.project_name
  }
}
resource "aws_volume_attachment" "ebs_attachment" {
  count = length(var.ec2_create_volume)
  device_name = var.ec2_create_volume[count.index].device_name
  volume_id   = aws_ebs_volume.ebsvolume[count.index].id
  instance_id = aws_instance.ec2.id
}

data "template_file" "user_data" {
template = file("${path.root}/${var.file_name}")
}
