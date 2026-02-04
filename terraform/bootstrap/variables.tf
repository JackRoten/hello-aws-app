variable "region" {
  description = "AWS region for state resources"
  type        = string
  default     = "us-east-1"
}

variable "state_bucket_name" {
  description = "Name of S3 bucket for Terraform state"
  type        = string
  default     = "hello-aws-app-terraform-state"
}

variable "lock_table_name" {
  description = "Name of DynamoDB table for state locking"
  type        = string
  default     = "hello-aws-app-terraform-locks"
}
