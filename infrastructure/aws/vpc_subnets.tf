# Internet VPC
resource "aws_vpc" "vpc-lab" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "main"
  }
}

resource "aws_route53_zone" "private-lab-currax-io" {
  name = "lab.currax.io"

  vpc {
    vpc_id = aws_vpc.vpc-lab.id
  }
}


# Subnets
resource "aws_subnet" "lab-public-1" {
  vpc_id                  = aws_vpc.vpc-lab.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "lab-public-1"
  }
}

resource "aws_subnet" "lab-public-2" {
  vpc_id                  = aws_vpc.vpc-lab.id
  cidr_block              = "10.1.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1b"

  tags = {
    Name = "lab-public-2"
  }
}

resource "aws_subnet" "lab-private-1" {
  vpc_id                  = aws_vpc.vpc-lab.id
  cidr_block              = "10.1.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "lab-private-1"
  }
}

resource "aws_subnet" "lab-private-2" {
  vpc_id                  = aws_vpc.vpc-lab.id
  cidr_block              = "10.1.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1b"

  tags = {
    Name = "lab-private-2"
  }
}

# Internet GW
resource "aws_internet_gateway" "lab-main-gw" {
  vpc_id = aws_vpc.vpc-lab.id

  tags = {
    Name = "lab-gw"
  }
}

# route tables
resource "aws_route_table" "lab-public" {
  vpc_id = aws_vpc.vpc-lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab-main-gw.id
  }

  tags = {
    Name = "lab-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "lab-public-1-a" {
  subnet_id      = aws_subnet.lab-public-1.id
  route_table_id = aws_route_table.lab-public.id
}

resource "aws_route_table_association" "lab-public-2-a" {
  subnet_id      = aws_subnet.lab-public-2.id
  route_table_id = aws_route_table.lab-public.id
}
