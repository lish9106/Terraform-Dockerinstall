resource "aws_instance" "my_ec2" {
	ami = var.ec2_ami
	instance_type = var.ec2_type
	key_name = var.ec2_key
	tags = {
		Name = var.ec2_name
	}
	vpc_security_group_ids = ["${aws_security_group.sg3.id}"]
}

resource "aws_security_group" "sg3" {
	name = "sg3"
	description = "Terraform security group"
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]	
	}
}