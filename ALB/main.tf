resource "aws_lb" "alb" {
    for_each = var.albgw
  name               = each.value.name
  load_balancer_type = each.value.load_balancer_type
  security_groups    = [data.aws_security_group.albsg.id]

  subnets = [
    for subnet_key in each.value.subnet_keys :
    data.aws_subnet.subnets[subnet_key].id
  ]
  tags = {
    Name = "alb"
  }
}
