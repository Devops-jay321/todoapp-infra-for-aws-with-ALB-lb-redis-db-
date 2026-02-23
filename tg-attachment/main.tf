resource "aws_lb_target_group_attachment" "tg_attach" {
  for_each = var.tg_attachments
  target_group_arn = data.aws_lb_target_group.tg[each.key].arn
  target_id        = data.aws_instance.ec2[each.key].id
  port             = each.value.port
}

