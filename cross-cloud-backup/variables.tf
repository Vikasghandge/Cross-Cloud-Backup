# AWS
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "s3_bucket_name" {
  description = "Existing S3 bucket name (read-only)"
  type        = string
}

# Azure
variable "azure_location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
