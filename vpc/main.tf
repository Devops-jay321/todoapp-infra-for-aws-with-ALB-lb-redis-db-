resource "aws_vpc" "main_vpc" {
    for_each = var.vpc_cidr
  cidr_block = each.value.cidr_block
  tags = {
    Name = each.value.name
  }
 
  }


