module "aws_ec2_create" {
	source = "./modules/ec2_create"
	ec2_ami = var.root_ec2_ami
	ec2_type = var.root_ec2_type
	ec2_key = var.root_ec2_key
	ec2_name = var.root_ec2_name
}

module "aws_file_provisioner" {
	source = "./modules/file_provisioner"
	ec2_public_ip = module.aws_ec2_create.ec2_public_ip
	ec2_user = var.root_ec2-user
}

module "aws_local_exec" {
	source = "./modules/local_exec"
	ec2_public_ip = module.aws_ec2_create.ec2_public_ip
}

module "aws_remote_exec" {
	source = "./modules/remote_exec"
	ec2_public_ip = module.aws_ec2_create.ec2_public_ip
	ec2_user = var.root_ec2-user
}