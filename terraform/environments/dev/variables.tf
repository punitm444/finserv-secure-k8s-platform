variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "dev"
}

variable "availability_zone" {
  description = "Availability Zone for the initial environment"
  type        = string
  default     = "ap-south-1a"
}

variable "vpc_cidr" {
  description = "CIDR block for FinServ VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "admin_cidrs" {
  description = "Allowed public IP addresses for administrative access"
  type        = list(string)
}