# ---------------------------------------------------------------------------------------------------------------------
# DEFIINE SUPPORTED TERRAFORM VERSIONS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# INCLUDE THE AWS PROVIDER
# The aws provider will be leveraged to provision aws resources
# https://www.terraform.io/docs/providers/aws/index.html
#---------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region  = "us-east-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEFINE RESOURCES
# Define resources to create an S3 bucket and DynamoDB table for state file storage and locking
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  # Enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }

  # This is only here so we can destroy the bucket as part of automated tests. You should not copy this for production usage
  force_destroy = true

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "state_lock" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

