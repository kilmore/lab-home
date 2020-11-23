
# resource "aws_eip" "lb" {
#   instance = aws_instance.kubernetes_control.id
#   vpc      = true
# }

resource "aws_instance" "kubernetes_control0" {
  ami                    = data.aws_ami.centos.id
  instance_type          = "t3a.large"
  subnet_id              = aws_subnet.lab-public-1.id
  vpc_security_group_ids = [aws_security_group.default_allow_all.id]
  key_name               = aws_key_pair.Lab-USWest-Key.key_name
  private_ip             = "10.1.1.10"

  tags = {
    Name = "kubernetes-control0"
    Kubernetes-Node-Type = "control"
  }
}

resource "aws_route53_record" "kubernetes-cluster" {
  # zone_id = data.aws_route53_zone.selected.zone_id
  zone_id = aws_route53_zone.lab_private.zone_id
  name    = "kubernetes-control0.lab.currax.io"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.kubernetes_control0.public_ip]
}

# --

# resource "aws_instance" "kubernetes-node-0" {
#   ami                    = data.aws_ami.centos.image_id
#   instance_type          = "t3a.large"
#   subnet_id              = aws_subnet.lab-public-1.id
#   vpc_security_group_ids = [aws_security_group.default_allow_all.id]
#   key_name               = aws_key_pair.Lab-USWest-Key.key_name
#   private_ip             = "10.1.1.100"

#   tags = {
#     Name = "kubernetes-control-0"
#     Kubernetes-Node-Type = "worker"
#   }
# }

# resource "aws_route53_record" "kubernetes-node-0" {
#   zone_id = data.aws_route53_zone.selected.zone_id
#   name    = "kubernetes-node-0.${data.aws_route53_zone.selected.name}"
#   type    = "A"
#   ttl     = "300"
#   allow_overwrite = true
#   records = [aws_instance.kubernetes-node-0.public_ip]
# }

# --

# resource "aws_instance" "kubernetes-node-1" {
#   ami                    = var.kubernetes_instanceId
#   instance_type          = "t3a.large"
#   subnet_id              = aws_subnet.lab-public-1.id
#   vpc_security_group_ids = [aws_security_group.default_allow_all.id]
#   key_name               = aws_key_pair.Lab-USWest-Key.key_name
#   private_ip             = "10.1.1.101"

#   tags = {
#     Name = "kubernetes-node-1"
#     Kubernetes-Node-Type = "worker"
#   }
# }

# resource "aws_route53_record" "kubernetes-node-1" {
#   zone_id = data.aws_route53_zone.selected.zone_id
#   name    = "kubernetes-node-1.${data.aws_route53_zone.selected.name}"
#   type    = "A"
#   ttl     = "300"
#   allow_overwrite = true
#   records = [aws_instance.kubernetes-node-1.public_ip]
# }

# ----------------------------------------
output "kubernetes_control0_public_ip_addr" {
  value = aws_instance.kubernetes_control0.public_ip
}

output "kubernetes_control0_private_ip_addr" {
  value = aws_instance.kubernetes_control0.private_ip
}

output "kubernetes_control_dns_name" {
    value = "kubernetes-control0.${data.aws_route53_zone.selected.name}"
}