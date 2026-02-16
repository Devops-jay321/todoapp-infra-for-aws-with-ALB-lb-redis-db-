resource "aws_lb_target_group_attachment" "tg_attach" {
  target_group_arn = data.aws_lb_target_group.tg.arn
  target_id        = data.aws_instance.ec2.id
  port             = 80
}

