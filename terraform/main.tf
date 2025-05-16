resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = "Elastic Beanstalk Application for ${var.application_name}"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.app.name
  platform_arn        = "arn:aws:elasticbeanstalk:us-east-1::platform/Python 3.8 running on 64bit Amazon Linux 2/5.4.0"
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PYTHONPATH"
    value     = "/var/app/current/src/app"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.application_name}-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_object" "app_zip" {
  bucket = aws_s3_bucket.app_bucket.bucket
  key    = "${var.application_name}.zip"
  source = "path/to/your/application.zip"
}

resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "v1"
  application = aws_elastic_beanstalk_application.app.name
  bucket      = aws_s3_bucket.app_bucket.bucket
  key         = aws_s3_bucket_object.app_zip.key
}