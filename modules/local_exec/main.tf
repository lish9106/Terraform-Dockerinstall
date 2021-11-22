resource "null_resource" "local_exec" {
	
	provisioner "local-exec" {
		command = "echo ${var.ec2_public_ip} > file/public_ip.txt"
	}
}