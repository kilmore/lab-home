# resource "aws_instance" "consul_0" {
#   ami                    = "${var.consul_instanceId}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${aws_subnet.lab-public-1.id}"
#   vpc_security_group_ids = ["${aws_security_group.default_allow_all.id}"]
#   key_name               = "${aws_key_pair.Lab-USWest-Key.key_name}"
#   private_ip             = "10.1.1.10"

#   tags {
#     Name = "Consul-0"
#   }
# }

# resource "aws_instance" "consul_2" {
#   ami                    = "${var.consul_instanceId}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${aws_subnet.lab-public-2.id}"
#   vpc_security_group_ids = ["${aws_security_group.default_allow_all.id}"]
#   key_name               = "${aws_key_pair.Lab-USWest-Key.key_name}"
#   private_ip             = "10.1.2.10"


#   tags {
#     Name = "Consul-2"
#   }
# }


# resource "aws_instance" "consul_3" {
#   ami                    = "${var.consul_instanceId}"
#   instance_type          = "t2.micro"
#   subnet_id              = "${aws_subnet.lab-public-1.id}"
#   vpc_security_group_ids = ["${aws_security_group.default_allow_all.id}"]
#   key_name               = "${aws_key_pair.Lab-USWest-Key.key_name}"
#   private_ip             = "10.1.1.11"


#   tags {
#     Name = "Consul-3"
#   }
# }

