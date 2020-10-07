terraform {
  backend "s3" {
    bucket = "alexkilla-terraform-state"
    key = "staging/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.default_region
  version = "~> 3.9"
}

resource "aws_db_instance" "example" {
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"
  password          = "${var.db_password}"
}