data "aws_subnet" "subnets" {
  for_each = var.alb_subnets 

  filter {
    name   = "tag:Name"
    values = [each.value.subnet_name]
  }
}
data "aws_security_group" "albsg" {
    filter {
        name = "tag:Name"
        values = ["alb-sg"]
    }
  
}