
# Output effective account name 

data "aws_caller_identity" "current" {}

output "aws_user_name" {
  description = "Show AWS user name"
  value = tolist(split("/", data.aws_caller_identity.current.arn))[1]
}

