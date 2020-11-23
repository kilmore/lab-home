resource "aws_instance" "workstation0" {
  ami                    = data.aws_ami.centos.id
  instance_type          = "t3a.large"
  subnet_id              = aws_subnet.lab-public-1.id
  vpc_security_group_ids = [aws_security_group.default_allow_all.id]
  key_name               = aws_key_pair.Lab-USWest-Key.key_name
  private_ip             = "10.1.1.50"

  tags = {
    Name = "workstation0"
  }
}

resource "aws_route53_record" "workstation0" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "workstation0.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.kubernetes_control0.public_ip]
}

# --------------------------------------------------

output "workstation_instance_public_ip_addr" {
  value = aws_instance.workstation0.public_ip
}

output "workstation_control_dns_name" {
    value = "workstation0.${data.aws_route53_zone.selected.name}"
}