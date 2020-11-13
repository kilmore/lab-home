resource "aws_security_group" "default_allow_all" {
  vpc_id      = aws_vpc.vpc-lab.id
  description = "security group that allows ssh and all egress traffic"
  name        = "default-allow-all"

  tags = {
    Name = "default-allow-all"
  }
}

resource "aws_security_group_rule" "allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default_allow_all.id
}

resource "aws_security_group_rule" "allow_all_from_security_group" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.default_allow_all.id
  source_security_group_id = aws_security_group.default_allow_all.id
}

resource "aws_security_group_rule" "allow_all_from_dan_home" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.default_allow_all.id
  cidr_blocks       = [var.home_ip]
}
