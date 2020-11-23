resource "aws_route53_zone" "lab_private" {
  name = "lab.currax.io"

  vpc {
    vpc_id = aws_vpc.vpc-lab.id
  }
}