data "aws_route53_zone" "selected" {
  name         = "lab.currax.io."
  private_zone = false
}

data "aws_route53_zone" "oclab_zone_info" {
  name         = "oclab.currax.io."
  private_zone = false
}
