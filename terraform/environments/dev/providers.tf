provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      Project     = "FinServ-Digital"
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
  }
}