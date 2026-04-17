provider "aws" {
  region  = "us-east-1"
  profile = "T2Kloud" # Make sure you ran 'aws configure --profile T2Kloud'
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}