data "aws_vpc" "main_vpc" {
    filter {
        name = "tag:Name"
        values = ["jay-vpc"]
    }
}
data "aws_internet_gateway" "igw" {
    filter {
        name = "tag:Name"
        values = ["jay-igw"]
    }
  
}
