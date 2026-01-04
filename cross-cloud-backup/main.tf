# -------------------------------
# AWS IAM Module
# -------------------------------
module "aws_iam" {
  source = "./modules/aws"

  s3_bucket_name = var.s3_bucket_name
}
