data "aws_lb" "alb" {
  for_each = var.listener_alb
  name = each.value.alb_name
}
data "aws_lb_target_group" "tg" {
  for_each = var.listener_alb
  name = each.value.tg_name
}
