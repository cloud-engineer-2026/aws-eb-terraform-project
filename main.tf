
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-eb-app-bucket-moses2025"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "app_bucket_acl" {
  bucket = aws_s3_bucket.app_bucket.id
  acl = "private"
}
/*
resource "aws_s3_bucket_object" "app_zip" {
  bucket = aws_s3_bucket.app_bucket.bucket
  key    = "${var.application_name}.zip"
  source = "path/to/your/application.zip"
  etag = filemd5("path/to/your/application.zip")
}
*/

resource "aws_s3_bucket_object" "app_zip" {
  bucket = aws_s3_bucket.app_bucket.bucket
  key    = "app.zip"
  source = "${path.module}/app.zip"
  etag = filemd5("${path.module}/app.zip")
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = "Elastic Beanstalk Application for ${var.application_name}"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.app.name
  #platform_arn        = "arn:aws:elasticbeanstalk:us-east-1::platform/Python 3.8 running on 64bit Amazon Linux 2/5.4.0"
  solution_stack_name = "64bit Amazon Linux 2 v5.4.0 running Python 3.8"
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PYTHONPATH"
    value     = "/var/app/current/src/app"
  }
}

resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "var.version_label"
  application = aws_elastic_beanstalk_application.app.name
  bucket      = aws_s3_bucket.app_bucket.bucket
  key         = aws_s3_bucket_object.app_zip.key
}