variable "AWS_REGION" {
  default = "us-west-1"
}

variable "home_ip" {
  default = "98.245.63.16/32"
}

# Paths to Keys..... 
variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa.pub"
}
