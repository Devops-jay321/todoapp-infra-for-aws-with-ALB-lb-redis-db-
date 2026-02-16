resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.main_vpc.id
  tags = {
    Name = "jay-igw"
  }
}
