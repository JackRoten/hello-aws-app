resource "aws_ecr_repository" "backend" {
  name                 = "hello-app-backend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "frontend" {
  name                 = "hello-app-frontend"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_backend_uri" {
  value = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_uri" {
  value = aws_ecr_repository.frontend.repository_url
}
