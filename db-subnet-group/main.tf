resource "aws_db_subnet_group" "db_subnet_group" {
    for_each = var.db-subnet-group
  name       = each.value.name
  subnet_ids = data.aws_subnets.subnets[each.key].ids
  tags = {
    Name = "db-subnet-group"
  }
  
}