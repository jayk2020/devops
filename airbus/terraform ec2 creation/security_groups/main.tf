resource "aws_security_group" "sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

    tags = {
    Name = var.tag
    Project_Name= var.project_name

  }
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.ingress_rules)

  type              = "ingress"
  from_port         = var.ingress_rules[count.index].from_port
  to_port           = var.ingress_rules[count.index].to_port
  protocol          = var.ingress_rules[count.index].protocol
  cidr_blocks       = [var.ingress_rules[count.index].cidr_block]
  description       = var.ingress_rules[count.index].description
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "egress_rules" {
  count = length(var.egress_rules)

  type              = "egress"
  from_port         = var.egress_rules[count.index].from_port
  to_port           = var.egress_rules[count.index].to_port
  protocol          = var.egress_rules[count.index].protocol
  cidr_blocks       = [var.egress_rules[count.index].cidr_block]
  description       = var.egress_rules[count.index].description
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_ssg_rules" {
  count = length(var.ingress_ssg_rules)

  type              = "ingress"
  from_port         = var.ingress_ssg_rules[count.index].from_port
  to_port           = var.ingress_ssg_rules[count.index].to_port
  protocol          = var.ingress_ssg_rules[count.index].protocol
  source_security_group_id = var.ingress_ssg_rules[count.index].source_security_group_id
  description       = var.ingress_ssg_rules[count.index].description
  security_group_id = aws_security_group.sg.id
}
