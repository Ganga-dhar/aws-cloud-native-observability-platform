# ---------------------------------------------------------
# GitHub OIDC Provider
# ---------------------------------------------------------

//resource "aws_iam_openid_connect_provider" "github" {

//url = "https://token.actions.githubusercontent.com"

//client_id_list = [
//"sts.amazonaws.com"
//]

//tags = {
//Name        = "github-actions-oidc"
//Project     = "aws-cloud-native-observability-platform"
//ManagedBy   = "Terraform"
//}
//}


# ---------------------------------------------------------
# IAM Trust Policy
# ---------------------------------------------------------

//data "aws_iam_policy_document" "github_actions_assume_role" {

//statement {

// effect = "Allow"

//principals {
//type = "Federated"

//identifiers = [
//aws_iam_openid_connect_provider.github.arn
//]
//}

//actions = [
//"sts:AssumeRoleWithWebIdentity"
//]

//condition {

//test = "StringEquals"

//variable = "token.actions.githubusercontent.com:aud"

//values = [
//"sts.amazonaws.com"
//]
//}

//condition {

//test = "StringEquals"

//variable = "token.actions.githubusercontent.com:sub"

//values = [
// "repo:${var.github_repository}:ref:refs/heads/${var.github_branch}"
//]
//}
//}
//}


# ---------------------------------------------------------
# GitHub Actions IAM Role
# ---------------------------------------------------------

//resource "aws_iam_role" "github_actions" {

//name = var.github_actions_role_name

//assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role.json

//tags = {
//Name      = var.github_actions_role_name
//Project   = "aws-cloud-native-observability-platform"
//ManagedBy = "Terraform"
//}
//}