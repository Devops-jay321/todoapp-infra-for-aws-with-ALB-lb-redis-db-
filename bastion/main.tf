resource "aws_instance" "bastion" {
  for_each = var.bastion_hosts
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = data.aws_subnet.subnets[each.key].id
  vpc_security_group_ids = [data.aws_security_group.sg[each.key].id]
  key_name               = "bastion-key"

  associate_public_ip_address = each.value.associate_public_ip_address
  user_data_base64 = each.value.user_data != null ? filebase64(each.value.user_data) : null


    tags = each.value.tags

    }