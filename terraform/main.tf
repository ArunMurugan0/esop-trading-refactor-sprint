terraform {
  backend "s3" {
    bucket = "tf-learn-state"
    key = "state"
    region = "ap-south-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
     }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_key_pair" "tf" {
  key_name = "tf"
}

resource "aws_security_group" "allow_only_conn_to_server" {
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
  }
}

resource "aws_instance" "esop_app_server" {
  ami = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  tags = {
    CreatedBy = "arun"
  }

  key_name = data.aws_key_pair.tf.key_name
  security_groups = [ aws_security_group.allow_only_conn_to_server.name ]
}
