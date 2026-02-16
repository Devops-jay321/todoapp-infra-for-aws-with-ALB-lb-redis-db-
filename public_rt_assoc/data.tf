data "aws_subnet" "public_subnet" {
    for_each = var.public_subnet_assoc 
    filter {
        name = "tag:Name"
        values = [each.value.subnet_name]
    }
}

data "aws_route_table" "public_rt" {
    filter {
        name = "tag:Name"
        values = ["public-rt"]
    }
  
}
data "aws_route_table" "private_rt" {
    filter {
        name = "tag:Name"
        values = ["private-rt"]
    }
  
}

data "aws_subnet" "private_subnet" {
  for_each = var.private_subnet_assoc   

  filter {
    name   = "tag:Name"
    values = [each.value.subnet_name]
  }
}
