
data "archive_file" "zip_ts" {
  type        = "zip"
  source_dir  = "${path.module}/../dist/lambda/hello"
  output_path = "${path.module}/../dist/nodejs.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello"

  filename         = data.archive_file.zip_ts.output_path
  source_code_hash = data.archive_file.zip_ts.output_base64sha256

  role    = aws_iam_role.iam_for_lambda.arn
  handler = "hello.handler"
  runtime = "nodejs18.x"
}
