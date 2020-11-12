
resource "aws_eip" "oc_bootstrap" {
  instance = aws_instance.oc_bootstrap.id
  vpc      = true
}

resource "aws_instance" "oc_bootstrap" {
  ami                    = var.oc_bootstrap_instanceId
  instance_type          = "t3a.large"
  subnet_id              = aws_subnet.lab-public-1.id
  vpc_security_group_ids = [aws_security_group.default_allow_all.id]
  key_name               = aws_key_pair.Lab-USWest-Key.key_name
  private_ip             = "10.1.1.20"

  tags = {
    Name = "oc_bootstrap"
    OC-Node-Type = "bootstrap"
  }
}

resource "aws_route53_record" "oc_bootstrap" {
  zone_id = data.aws_route53_zone.oclab_zone_info.zone_id
  name    = "ocbootstrap.${data.aws_route53_zone.oclab_zone_info.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.oc_bootstrap.public_ip]
}

