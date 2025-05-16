variable "application_name" {
  description = "The name of the Elastic Beanstalk application"
  type        = string
}

variable "environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to use for the environment"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "The AWS region to deploy the application"
  type        = string
  default     = "us-east-1"
}

variable "version_label" {
  description = "The version label for the application"
  type        = string
}