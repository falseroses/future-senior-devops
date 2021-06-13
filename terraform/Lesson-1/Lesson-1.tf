provider "aws" {}


resource "aws_instance" "my_Ubuntu" {
      ami = "ami-05f7491af5eef733a"
      instance_type = "t2.micro"
      tags = {
            Name = "My Ubuntu Server"
            Owner = "Oleksandr Dumynskyi"
            Project = "Terraform Lessons"
      }
}

resource "aws_instance" "my_Amazon" {
      ami = "ami-0bad4a5e987bdebde"
      instance_type = "t2.micro"
      tags = {
            Name = "My Amazon Server"
            Owner = "Oleksandr Dumynskyi"
            Project = "Terraform Lessons"
      }
}

