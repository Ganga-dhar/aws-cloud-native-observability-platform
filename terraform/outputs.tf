output "ecr_repository_url" {

  description = "ECR repository URL"

  value = aws_ecr_repository.app.repository_url
}


output "ecr_repository_arn" {

  description = "ECR repository ARN"

  value = aws_ecr_repository.app.arn
}


//output "github_actions_role_arn" {

//description = "IAM role ARN used by GitHub Actions"

//value = aws_iam_role.github_actions.arn
//}