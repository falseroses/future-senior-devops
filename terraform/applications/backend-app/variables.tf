variable "aws_region" {
  description = "The AWS region to create things in."
  type        = string
}

variable "aws_private_key" {
  description = "The AWS SSH key pair in PEM format."
  type        = string
}