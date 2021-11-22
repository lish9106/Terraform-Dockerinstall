variable "root_ec2_ami" {
	default = "ami-0629230e074c580f2"
	type = string
}

variable "root_ec2_type" {
	default = "t2.micro"
	type = string
}

variable "root_ec2_key" {
	default = "dev-training"
	type = string
}
variable "root_ec2_name" {
	default = "my_ec2"
	type = string
}

variable "root_ec2-user" {
	default = "ubuntu"
	type = string
}