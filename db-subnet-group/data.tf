data "aws_subnets" "subnets" {
  for_each = var.db-subnet-group

  filter {
    name = "tag:Name"

    values = [
      each.value.db-1.subnet_name,
      each.value.db-2.subnet_name
    ]
  }
}
