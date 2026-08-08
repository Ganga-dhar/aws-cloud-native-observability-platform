variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "github_repository" {
  description = "GitHub repository in owner/repository format"
  type        = string
  default     = "Ganga-dhar/aws-cloud-native-observability-platform"
}

variable "github_branch" {
  description = "GitHub branch allowed to assume the AWS role"
  type        = string
  default     = "main"
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "aws-cloud-native-observability-platform"
}

variable "github_actions_role_name" {
  description = "IAM role used by GitHub Actions"
  type        = string
  default     = "github-actions-ecr-role"
}