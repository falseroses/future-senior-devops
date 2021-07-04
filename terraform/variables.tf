variable "aws_region" {
  description = "The AWS region to create things in."
  default = "eu-central-1"
}

variable "aws_credentials" {
  description = "The AWS credentials."
  default = "terraform-credentials"
}