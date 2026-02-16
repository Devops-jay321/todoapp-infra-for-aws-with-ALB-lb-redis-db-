variable "bastion_hosts" {
    type = map(object({
        ami           = string
        instance_type = string
        subnet_name   = string
        sg_name      = string
        tags         = map(string)
        user_data   = optional(string)
        associate_public_ip_address = bool
    }))
  
}

