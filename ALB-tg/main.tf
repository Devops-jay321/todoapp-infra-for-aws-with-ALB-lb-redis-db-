resource "aws_lb_target_group" "frontend_tg" {
  for_each = var.tgs
  name     = each.value.name
  port     = each.value.port
  protocol = each.value.protocol
  vpc_id   = data.aws_vpc.main_vpc.id   # ← change if using data source

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
