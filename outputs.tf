# Output public IP for EC2 instance

output "instance_public_ip" {
  description = "Show Elastic IP for test_ec2 instance"
  value       = aws_eip.eip_demo.public_ip
}


# Output effective account name 

data "aws_caller_identity" "current" {}

output "aws_user_name" {
  description = "Show AWS user name"
  value = tolist(split("/", data.aws_caller_identity.current.arn))[1]
}

