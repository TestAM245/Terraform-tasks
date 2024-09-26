resource "aws_instance" "test_ec2" {
  ami             = var.ami_id
  instance_type   = var.ec_type
  user_data       = var.custom_data
  vpc_security_group_ids = var.security_group_id
  iam_instance_profile = var.instance_profile
  key_name        = "for_ssh"
  depends_on      = [ 
    aws_key_pair.ssh_key
   ]
}

resource "aws_eip" "eip_demo" {
    instance = aws_instance.test_ec2.id
}



resource "aws_key_pair" "ssh_key" {
  key_name   = "for_ssh"
  public_key = var.ssh_key
}