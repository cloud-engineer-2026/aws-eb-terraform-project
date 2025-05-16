output "application_url" {
  value = "http://${aws_elastic_beanstalk_environment.my_app.endpoint}"
}

output "application_name" {
  value = aws_elastic_beanstalk_application.my_app.name
}

output "environment_name" {
  value = aws_elastic_beanstalk_environment.my_app.name
}