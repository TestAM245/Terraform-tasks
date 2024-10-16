
# module "aws_security_group" {
#   source = "./modules/security_group" 
# }

# module "ec2_instance" {
#   source = "./modules/ec2_instance"
#   security_group_id = [module.aws_security_group.security_group_id]
#   custom_data = templatefile("script.sh", {PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.ec2_secret.secret_string)["password"]})
#   instance_profile = aws_iam_instance_profile.ec2_profile.name
# }



# Generate a random password
# resource "random_password" "my_password" {
#   length  = 16
#   special = true
# }


# Update the existing AWS Secrets Manager secret with the new password
# resource "aws_secretsmanager_secret_version" "test_secret" {
#   secret_id = "my-test-secret1"
#   secret_string = jsonencode({
#     password = random_password.my_password.result
#   })
# }




# data "aws_secretsmanager_secret_version" "ec2_secret" {
#   secret_id = "my-test-secret1"
# }




# resource "aws_db_instance" "mysqldb" {
#   allocated_storage      = 20
#   db_name                = "myappdb"
#   engine                 = "mysql"
#   engine_version         = "8.0.35"
#   instance_class         = "db.t4g.micro"
#   vpc_security_group_ids = [ module.aws_security_group.security_group_id ]
#   username               = var.db_username
#   password               = var.db_password
#   skip_final_snapshot    = true
# }




# data "aws_launch_template" "packer_template" {
#   name = "packer_template"
# }


# #__________Set UP ASG______________

# resource "aws_autoscaling_group" "asg_1" {
#   name                  = "demo_asg"  
#   availability_zones    = ["eu-central-1c"]
#   desired_capacity      = 1
#   max_size              = 2
#   min_size              = 1
#   health_check_type     = "EC2"
#   termination_policies  = ["OldestInstance"]

#   launch_template {
#     id      = data.aws_launch_template.packer_template.id
#   }
# }


# #__________ASG Schedulers___________

# resource "aws_autoscaling_schedule" "scale_up" {
#   scheduled_action_name  = "scale_up"
#   desired_capacity       = 2
#   max_size               = 2
#   recurrence             = "0 8 * * *"
#   autoscaling_group_name = aws_autoscaling_group.asg_1.name
# }


# resource "aws_autoscaling_schedule" "scale_down" {
#   scheduled_action_name  = "scale_down"
#   desired_capacity       = 1
#   max_size               = 1
#   recurrence             = "0 10 * * *"
#   autoscaling_group_name = aws_autoscaling_group.asg_1.name
# }







