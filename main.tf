
module "aws_security_group" {
  source = "./modules/security_group" 
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  security_group_id = [module.aws_security_group.security_group_id]
  custom_data = templatefile("script.sh", {PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.ec2_secret.secret_string)["password"]})
  instance_profile = aws_iam_instance_profile.ec2_profile.name
}



# Generate a random password
resource "random_password" "my_password" {
  length  = 16
  special = true
}


# Update the existing AWS Secrets Manager secret with the new password
resource "aws_secretsmanager_secret_version" "test_secret" {
  secret_id = "my-test-secret1"
  secret_string = jsonencode({
    password = random_password.my_password.result
  })
}




data "aws_secretsmanager_secret_version" "ec2_secret" {
  secret_id = "my-test-secret1"
}

