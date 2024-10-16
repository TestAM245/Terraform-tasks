# #__________Security Group for ALB________

# resource "aws_security_group" "EC2_SG" {
#   name        = "ALB_SG"
#   description = "security group for load balancer"

#   ingress {
#     description      = "HTTP"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }


#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

# }


# #_________Retreive existing ASG______

# data "aws_autoscaling_group" "asg" {
#   name = "test_asg"
# }


# #__________Get default VPC and Subnets ID__________

# data "aws_vpc" "default" {
#     default = true
  
# }


# data "aws_subnets" "subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }


# #__________Create ALB_________

# resource "aws_lb" "my_alb" {
#   name               = "demo-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups = [ aws_security_group.EC2_SG.id ]
#   enable_deletion_protection = false
#   subnets = data.aws_subnets.subnets.ids
# }


# #___________Create Target Group__________

# resource "aws_lb_target_group" "ec2_tg" {
#   name     = "demo-tg-ec2"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = data.aws_vpc.default.id  
#   health_check {
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#     timeout             = 5
#     interval            = 30
#     path                = "/"
#     matcher             = "200"
#   }
# }



# # __________Create a new load balancer attachment_______
# resource "aws_autoscaling_attachment" "asg_attach" {
#   autoscaling_group_name = data.aws_autoscaling_group.asg.id
#   lb_target_group_arn    = aws_lb_target_group.ec2_tg.arn
# }



# #___________Attach EC2 to Target Group________

# # resource "aws_lb_target_group_attachment" "ec2_attachment" {
# #   target_group_arn = aws_lb_target_group.ec2_tg.arn
# #   target_id        = module.ec2_instance.ec2_id
# #   port             = 80
# # }


# #_________Create Listener for HTTP trafic____________

# resource "aws_lb_listener" "alb_listener" {
#   load_balancer_arn = aws_lb.my_alb.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ec2_tg.arn
#   }
# }




