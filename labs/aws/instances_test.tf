# resource "aws_instance" "web_server0" {
#   ami                    = "${var.consul_instanceId}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${aws_subnet.lab-public-1.id}"
#   vpc_security_group_ids = ["${aws_security_group.default_allow_all.id}"]
#   key_name               = "${aws_key_pair.Lab-USWest-Key.key_name}"
#   private_ip             = "10.1.1.20"

#   tags {
#     Name = "web-server-0"
#   }
# }

# resource "aws_instance" "web_server1" {
#   ami                    = "${var.consul_instanceId}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${aws_subnet.lab-public-1.id}"
#   vpc_security_group_ids = ["${aws_security_group.default_allow_all.id}"]
#   key_name               = "${aws_key_pair.Lab-USWest-Key.key_name}"
#   private_ip             = "10.1.1.21"


#   tags {
#     Name = "web-server-1"
#   }
# }


# resource "aws_instance" "mysql_0" {
#   ami                    = "${var.consul_instanceId}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${aws_subnet.lab-public-1.id}"
#   vpc_security_group_ids = ["${aws_security_group.default_allow_all.id}"]
#   key_name               = "${aws_key_pair.Lab-USWest-Key.key_name}"
#   private_ip             = "10.1.1.22"


#   tags {
#     Name = "mysql_0"
#   }
# }

