data "aws_security_group" "sg" {
    for_each = var.bastion_hosts
    filter {
        name = "tag:Name"
        values = [each.value.sg_name]
    }
}
data "aws_subnet" "subnets" {
    for_each = var.bastion_hosts
    filter {
        name = "tag:Name"
        values = [each.value.subnet_name]
    }
  
}
