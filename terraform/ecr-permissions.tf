# ---------------------------------------------------------
# ECR Permissions
# ---------------------------------------------------------

data "aws_iam_policy_document" "github_actions_ecr" {

  statement {

    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = [
      "*"
    ]
  }

  statement {

    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]

    resources = [
      aws_ecr_repository.app.arn
    ]
  }
}


resource "aws_iam_policy" "github_actions_ecr" {

  name = "github-actions-ecr-push"

  policy = data.aws_iam_policy_document.github_actions_ecr.json

  tags = {
    Project   = "aws-cloud-native-observability-platform"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "github_actions_ecr" {

  role = data.aws_iam_role.github_actions.name

  policy_arn = aws_iam_policy.github_actions_ecr.arn
}