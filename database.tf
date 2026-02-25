resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = { Name = "${var.project_name}-db-subnets" }
}

resource "aws_db_instance" "main" {
  identifier     = "${var.project_name}-db"
  engine         = "postgres"
  engine_version = "16.12"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  # When creating from a snapshot, the snapshot provides db_name, username, and data.
  # The password is still needed to set the new instance's password.
  snapshot_identifier = var.db_snapshot_identifier != "" ? var.db_snapshot_identifier : null
  db_name             = var.db_snapshot_identifier != "" ? null : var.db_name
  username            = var.db_snapshot_identifier != "" ? null : var.db_username
  password            = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible     = false
  multi_az                = false
  skip_final_snapshot     = true
  backup_retention_period = 7

  tags = { Name = "${var.project_name}-db" }
}