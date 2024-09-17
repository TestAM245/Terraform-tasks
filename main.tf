resource "aws_instance" "test_ec2" {
  ami             = var.ami_id
  instance_type   = var.ec_type
  user_data       = file("script.sh")
  security_groups = [aws_security_group.EC2_SG.name]
  key_name        = "for_ssh"
  depends_on      = [ 
    aws_key_pair.ssh_key
   ]
}


resource "aws_security_group" "EC2_SG" {
  name        = var.sg_name
  description = "demo security group"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.ssh_ip
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}




resource "aws_eip" "eip_demo" {
    instance = aws_instance.test_ec2.id
}



resource "aws_key_pair" "ssh_key" {
  key_name   = "for_ssh"
  public_key = var.ssh_key
}



# Generate a random password
resource "random_password" "my_password" {
  length  = 16
  special = true
}


# Update the existing AWS Secrets Manager secret with the new password
resource "aws_secretsmanager_secret_version" "test_secret" {
  secret_id = "my-test-secret"
  secret_string = jsonencode({
    password = random_password.my_password.result
  })
}