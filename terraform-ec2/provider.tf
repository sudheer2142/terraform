terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
}

provider "aws" {
  # Configuration options
  # we shoud not add the user key and password in this loctiaon not a best practise
  region ="us-east-1"
}