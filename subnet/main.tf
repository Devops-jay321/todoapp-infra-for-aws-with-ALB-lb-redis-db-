resource "aws_subnet" "subnet" {
    for_each = var.subnets
  vpc_id                  = data.aws_vpc.main_vpc.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = each.value.availability_zone
  tags = {
    Name = each.value.name
  }
}