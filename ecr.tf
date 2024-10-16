
resource "aws_ecr_repository" "test-app" {
  name                 = "test-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}