resource "aws_db_instance" "postgres" {
  allocated_storage   = 20
  engine              = "postgres"
  engine_version      = "15"
  instance_class      = "db.t3.micro"
  db_name             = "appdb"
  username            = var.db_user
  password            = var.db_pass
  skip_final_snapshot = true
  publicly_accessible = true
}

resource "null_resource" "db_init" {
  depends_on = [aws_db_instance.postgres]

  provisioner "local-exec" {
    command = <<EOT
PGPASSWORD=${var.db_pass} psql \
  -h ${aws_db_instance.postgres.address} \
  -U ${var.db_user} \
  -d appdb \
  -c "CREATE TABLE IF NOT EXISTS messages (text TEXT);
      INSERT INTO messages (text)
      VALUES ('Hello, World!')
      ON CONFLICT DO NOTHING;"
EOT
  }
}
