# Transpile the ts code into js
resource "null_resource" "run_compile"{
  provisioner "local-exec" {
    working_dir = "${path.module}/../"
    command ="npm run compile"
  }
}

data "archive_file" "zip_hello" {
  depends_on = [null_resource.run_compile]
  type        = "zip"
  source_dir  = "${path.module}/../dist/lambda/hello"
  output_path = "${path.module}/../dist/nodejs.zip"
}

data "archive_file" "zip_bucket" {
  depends_on = [null_resource.run_compile]
  type        = "zip"
  source_dir  = "${path.module}/../dist/lambda/retrieve-from-bucket"
  output_path = "${path.module}/../dist/bucket.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello"

  filename         = data.archive_file.zip_hello.output_path
  source_code_hash = data.archive_file.zip_hello.output_base64sha256

  role    = aws_iam_role.iam_for_lambda.arn
  handler = "hello.handler"
  runtime = "nodejs16.x"
}

resource "aws_lambda_function" "bucket-lambda" {
  function_name = "bucket"

  filename         = data.archive_file.zip_bucket.output_path
  source_code_hash = data.archive_file.zip_bucket.output_base64sha256

  role    = aws_iam_role.iam_for_lambda.arn
  handler = "bucket.handler"
  runtime = "nodejs16.x"
}
