resource "aws_security_group_rule" "db_from_backend" {

  type = "ingress"

  from_port = 1433
  to_port   = 1433
  protocol  = "tcp"

  security_group_id        = data.aws_security_group.sg_db.id
   source_security_group_id = data.aws_security_group.sg_backend.id
  }