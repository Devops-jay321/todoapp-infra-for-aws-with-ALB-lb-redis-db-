
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = data.aws_eip.nat_eip.id
  subnet_id     = data.aws_subnet.public_subnet.id
  tags = {
    Name = "Jay-NATGateway"
  }
}
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}
