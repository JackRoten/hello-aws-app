variable "region" {
  default = "us-west-2"
}

variable "db_user" {
  default = var.db_user
}
variable "db_pass" {
  default = var.db_pass
}

variable "backend_image" {
  default = var.backend_image
}
variable "frontend_image" {
  default = var.frontend_image
}
