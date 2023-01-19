# Retrieve git-user as a resource
data "aws_iam_user" "user" {
  user_name = var.uname
}

# Create the policy to access the S3 bucket
resource "aws_iam_policy" "ci_policy" {
  name        = var.policy_name
  path        = "/"
  description = "Github CI policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:PutObjectAcl"
        ],
        Effect = "Allow",
        Resource = [
          "${var.arn}/*"
        ]
      },
      {
        Action = [
          "s3:ListBucket"
        ],
        Effect = "Allow",
        Resource = [
          var.arn
        ]
      },
    ]
  })
}

# Attach the policy to our user
resource "aws_iam_policy_attachment" "github_policy_attachment" {
  name       = var.policy_attach
  users      = [data.aws_iam_user.user.user_name]
  policy_arn = aws_iam_policy.ci_policy.arn
}