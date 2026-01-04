
# -------------------------------
# IAM Policy: S3 Read-Only Access
# -------------------------------
resource "aws_iam_policy" "s3_readonly_policy" {
  name        = "lambda-s3-readonly-policy"
  description = "Read-only access to existing S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::${var.s3_bucket_name}"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject"
        ]
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
      }
    ]
  })
}

# -------------------------------
# IAM Role for Lambda
# -------------------------------
resource "aws_iam_role" "lambda_role" {
  name = "crosscloud-backup-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# -------------------------------
# Attach Policy to Role
# -------------------------------
resource "aws_iam_role_policy_attachment" "attach_s3_readonly" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.s3_readonly_policy.arn
}

