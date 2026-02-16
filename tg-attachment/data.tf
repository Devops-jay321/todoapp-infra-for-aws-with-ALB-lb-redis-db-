data "aws_lb_target_group" "tg" {
  name = "frontend-tg"
}
data "aws_instance" "ec2" {
    filter {
        name   = "tag:Name"
        values = ["frontend-host"]
    }
     filter {
    name   = "instance-state-name"
    values = ["running"]
  }
  
}