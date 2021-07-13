variable "aws_region" {
  description = "The AWS region to create things in."
  type        = string
  default = "eu-central-1"
}

variable "aws_private_key" {
  description = "The AWS SSH key pair in PEM format."
  type        = string
}

variable "aws_env_tag" {
  description = "The AWS environment tag: dev or prd"
  type        = string
}