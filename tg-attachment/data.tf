data "aws_lb_target_group" "tg" {
  for_each = var.tg_attachments
    name = each.value.tg_name
    }

data "aws_instance" "ec2" {
  for_each = var.tg_attachments
    filter {
        name   = "tag:Name"
        values = [each.value.ec2_name]
    }
     filter {
    name   = "instance-state-name"
    values = ["running"]
  }
  
}