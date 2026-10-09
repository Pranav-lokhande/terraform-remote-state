locals {
  project_name = "terraform-devops"

  common_tags = {
    Project     = local.project_name
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
