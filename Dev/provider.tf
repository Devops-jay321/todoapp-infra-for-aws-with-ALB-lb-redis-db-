terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "jaydeep3231"
    key    = "state/terraform.tfstate"
    region = "ap-south-1"
  }
}

# ✅ Provider ALWAYS outside terraform block
provider "aws" {
  region = "ap-south-1"
}
