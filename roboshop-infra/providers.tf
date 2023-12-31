
# this repo /project is to create vpc and subnets & route tables and internet gateway setup and assign the to subnets 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }

  backend "s3" {
    bucket = "roboshop-remote-state-sp"
    key = "LockID"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking"
  }
}

provider "aws" {
  # Configuration options
  # you can give access key and secret key here, but security problem
  region = "us-east-1"
}