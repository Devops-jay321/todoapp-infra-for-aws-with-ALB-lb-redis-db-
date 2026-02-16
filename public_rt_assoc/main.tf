resource "aws_route_table_association" "public_assoc" {
  for_each = var.public_subnet_assoc
  subnet_id      = data.aws_subnet.public_subnet[each.key].id
  route_table_id = data.aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private_assoc" {
    for_each = var.private_subnet_assoc
  subnet_id      = data.aws_subnet.private_subnet[each.key].id
  route_table_id = data.aws_route_table.private_rt.id

  }
