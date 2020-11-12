resource "aws_key_pair" "Lab-USWest-Key" {
  key_name   = "Lab-USWest-Key"
  public_key = file("${var.PATH_TO_PUBLIC_KEY}")
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/currax_lab.key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/currax_lab.pub"
}
