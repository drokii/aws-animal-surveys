# Specify the provider and access details
provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

provider "archive" {}


data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}

data "archive_file" "zip_ts" {
  type        = "zip"
  source_dir  = "${path.module}/../src/lambda/"
  output_path = "${path.module}/../target/nodejs.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello"

  filename         = data.archive_file.zip_ts.output_path
  source_code_hash = data.archive_file.zip_ts.output_base64sha256

  role    = aws_iam_role.iam_for_lambda.arn
  handler = "hello.lambdaHandler"
  runtime = "nodejs16.x"
}
