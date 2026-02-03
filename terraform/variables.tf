variable "region" {
  default = "us-west-2"
}

variable "db_user" {}
variable "db_pass" {}

variable "backend_image" {
  default = "backend:latest"
}
variable "frontend_image" {
  default = "frontend:latest"
}
