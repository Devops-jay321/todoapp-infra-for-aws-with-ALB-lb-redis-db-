data "aws_subnet" "public_subnet" {
    filter {
        name = "tag:Name"
        values = ["public-subnet-1a"]
    }
  
}
data "aws_eip" "nat_eip" {
    filter {
        name = "tag:Name"
        values = ["jay-nat-eip"]
    }
}