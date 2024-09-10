resource "aws_instance" "test_ec2" {
  ami             = "ami-0e04bcbe83a83792e"
  instance_type   = "t2.micro"
  user_data       = file("script.sh")
  security_groups = [aws_security_group.EC2_SG.name]
  key_name        = "for_ssh"
  depends_on      = [ 
    aws_key_pair.ssh_key
   ]
}



resource "aws_security_group" "EC2_SG" {
  name        = "for_ec2"
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
    cidr_blocks      = ["178.159.239.135/32"]
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvvKXEaj9ZT5czvaG5lToCZMx5DMwwU4ndtWmpXqvi1yIc2QlYSkmSQWhuSfN2RoIPZjGwnd3mxscynPDLhceU1yuEMsZRBIGZEkq+9qxXovtAxsCF4bZ2hWhc7fgXyzP7OIemSMKDZrOVlKdn9uVXXfCfpJ3REwEgs+gNyfKfqf0pSqgV5Fc/ALIHUF7keadG0WJkaEB5OgzAZAitxtF1Drmyq7ZCDlpJlV3Y7IRBVGnsbOlhZzW1T2NbLrMkWz6FhJTS68nPZZ5i1x5csp75H1somZNi2a0j79YLphLGqCOBgZBB/Yx1XMGSM7SHjFXLo5VJbw9ywm6r9wofn5OUujmrabZ0r8c2W51dVJnr9wxu7AQ1ngEADBw+V9EjRKfXP/Dj1x6YyfFTjSza28KUXdv+c+ujEhpa5wfXTqPhrZS5N8LpTolClrZYYQc1qF1Z2u15sXokuuf9H8gYLIvyvmpdIAP1Nqa+LxhaMGhizsyNfEKFCDiw79rld1Qi7H4D+PPXa6LQu4xtvZ/u6qxoLrKqPPebC/TY2tNbpQQAb5NBQ/lDvQIhB6OSDBSyXtWDFQZ9TkdGikFq95jQLsVQF0BTR+adj7JMo30Vds38r/ij6u/wPfwnalyCRZ3EG2aKXSXpjDQ7g0AtLETT+zZR4IGjz5lFW343F4OxHnBTIQ== anrey@DESKTOP-ECBG7A8"
}