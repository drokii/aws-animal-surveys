# Policies
resource "aws_iam_policy" "bucket_policy" {
  name   = "bucket_policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}

# Roles
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": ["s3.amazonaws.com", "lambda.amazonaws.com"]
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
    EOF
}

# Attachments
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.bucket_policy.arn
}

# VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

