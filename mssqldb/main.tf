resource "aws_db_instance" "mssql" {
    for_each = var.dbsql
  identifier = each.value.identifier

  engine         = each.value.engine
  instance_class = each.value.instance_class


  allocated_storage = 20

  username = each.value.username
  password = each.value.password

  skip_final_snapshot = true

  publicly_accessible = false

  db_subnet_group_name   = data.aws_db_subnet_group.mssql-subnet.name
  vpc_security_group_ids = [data.aws_security_group.mssql-sg.id]
}