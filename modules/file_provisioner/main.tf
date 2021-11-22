resource "null_resource" "file_copy" {
	connection {
		type = "ssh"
		agent = false
		host = "${var.ec2_public_ip}"
		private_key = file("keys/dev-training.pem")
		user = var.ec2_user
	}
	
	provisioner "file" {
		source = "file/test.txt"
		destination = "/home/ubuntu/test.txt"
	}
}