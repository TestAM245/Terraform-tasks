
# _____________Creating IAM role with trusted policy______________

resource "aws_iam_role" "sm_access" {
  name = "sm_access"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}



# ____________Attach permanent IAM policy to role___________

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.sm_access.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}


#______________Create instance profile_____________________

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "sm_profile"
  role = aws_iam_role.sm_access.name
}

