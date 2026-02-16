data "aws_lb" "alb" {
  name = "jay-alb"
}
data "aws_lb_target_group" "tg" {
  name = "frontend-tg"
}
