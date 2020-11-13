resource "aws_key_pair" "Lab-USWest-Key" {
  key_name   = "Lab-USWest-Key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

