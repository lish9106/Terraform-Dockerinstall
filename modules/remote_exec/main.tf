resource "null_resource" "remote_exec" {
	connection {
		type = "ssh"
		agent = false
		host = "${var.ec2_public_ip}"
		private_key = file("keys/dev-training.pem")
		user = var.ec2_user
}
	
	provisioner "remote-exec" {
		inline = [
			"sudo apt update -y", 
			"sudo apt-get install -y ca-certificates curl gnupg lsb-release",
			"curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
			"echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
			"sudo apt-get update -y",
			"sudo apt-get -y install docker-ce docker-ce-cli containerd.io"
		]
	}
}