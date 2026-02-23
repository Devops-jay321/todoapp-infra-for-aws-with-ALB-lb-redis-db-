resource "aws_lb_listener" "listener" {
  for_each = var.listener_alb
  load_balancer_arn = data.aws_lb.alb[each.key].arn
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type             = "forward"
    target_group_arn = data.aws_lb_target_group.tg[each.key].arn
  }
}
