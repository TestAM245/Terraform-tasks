# Output public IP for EC2 instance

output "instance_public_ip" {
  description = "Show Elastic IP for test_ec2 instance"
  value       = aws_eip.eip_demo.public_ip
}



output "ec2_id" {
  value = aws_instance.test_ec2.id
}