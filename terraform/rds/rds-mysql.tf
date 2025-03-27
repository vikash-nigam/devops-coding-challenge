provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "springboot_mysql" {
  identifier            = "springboot-mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  username            = "admin"
  password            = "Welcome123"
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "default" {
  name       = "mysql-subnet-group"
  subnet_ids = ["subnet-0f530593675fa9825", "subnet-0d2f936699149a2f0"]
}

resource "aws_security_group" "db_sg" {
  name        = "mysql-security-group"
  description = "Allow MySQL access"
  vpc_id      = "vpc-0c3936d579aa7fcb8"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.16.0/20"]
  }
}

output "rds_endpoint" {
  value = aws_db_instance.springboot_mysql.endpoint
}
