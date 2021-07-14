variable "aws_region" {
  description = "The AWS region to create things in."
  type        = string
  default = "eu-central-1"
}

variable "aws_private_key" {
  description = "The AWS SSH key pair in PEM format."
  type        = string
}

variable "github_private_key" {
  description = "The private key use to access Github."
  type        = string
}

variable "github_public_key" {
  description = "The public key use to access Github."
  type        = string
}