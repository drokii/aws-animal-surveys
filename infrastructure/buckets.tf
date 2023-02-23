resource "aws_s3_bucket" "animal-bucket" {
  bucket = "aws-animal-surveys-bucket"
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.animal-bucket.id
  acl = "private"
}
