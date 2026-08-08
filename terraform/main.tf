

# ---------------------------------------------------------
# ECR Repository
# ---------------------------------------------------------

resource "aws_ecr_repository" "app" {

  name = var.ecr_repository_name

  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  force_delete = true

  tags = {
    Name      = var.ecr_repository_name
    Project   = "aws-cloud-native-observability-platform"
    ManagedBy = "Terraform"
  }
}