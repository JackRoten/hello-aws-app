resource "aws_ecs_cluster" "this" {
  name = "hello-cluster"
}

resource "aws_ecs_task_definition" "backend" {
  family                   = "backend"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([
    {
      name  = "backend"
      image = var.backend_image
      portMappings = [{ containerPort = 5000 }]
      environment = [
        { name = "DB_HOST", value = aws_db_instance.postgres.address },
        { name = "DB_NAME", value = "appdb" },
        { name = "DB_USER", value = var.db_user },
        { name = "DB_PASS", value = var.db_pass }
      ]
    }
  ])
}
