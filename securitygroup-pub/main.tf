resource "aws_security_group" "bastion_sg" {
  for_each = var.sg
  name   = each.value.name
  vpc_id = data.aws_vpc.main_vpc.id

  ingress {
    description = "SSH from my laptop"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # ← change this
  }
   dynamic "ingress" {
    for_each = each.key == "frontend-sg" ? [1] : []

    content {
      description     = "HTTP from ALB"
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      security_groups = [
        aws_security_group.alb_sg["alb-sg"].id
      ]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags=each.value.tags
  depends_on = [ aws_security_group.alb_sg ]
}
resource "aws_security_group" "alb_sg" {
  for_each = var.alb_sg
  name   = each.value.name
  vpc_id = data.aws_vpc.main_vpc.id

  ingress {
    description = "SSH from my laptop"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # ← change this
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags=each.value.tags
}
