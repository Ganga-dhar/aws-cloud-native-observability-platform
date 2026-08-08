module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name = "${var.project_name}-${var.environment}"

  kubernetes_version = "1.33"

  endpoint_public_access = true

  vpc_id = var.vpc_id

  subnet_ids = var.private_subnet_ids

  enable_irsa = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {

    default = {

      name = "default"

      instance_types = [
        "t3.medium"
      ]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "ON_DEMAND"

      disk_size = 30

      labels = {
        Environment = var.environment
      }
    }
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}