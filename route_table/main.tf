resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"}
}
resource "aws_route_table" "private_rt" {
  vpc_id = data.aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }
  tags = {
    Name = "private-rt"}
    depends_on = [ aws_route_table.public_rt ]
}