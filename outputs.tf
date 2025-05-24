output "application_url" {
  value = aws_elastic_beanstalk_environment.env.endpoint_url
}

output "application_name" {
  value = aws_elastic_beanstalk_application.app.name
}

output "environment_name" {
  value = aws_elastic_beanstalk_environment.env.name
}