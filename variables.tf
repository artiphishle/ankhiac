#
# AWS
#
variable "region" {
  default = "us-east-1"
}
variable "tags" {
  default = {
    ConfigManagement = "Terraform"
    Environment      = "dev"
  }
}

#
# EKS
#
variable "eks_name" {
  default = "eks-demo"
}

#
# VPC
#
variable "vpc_name" {
  default = "eks"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
