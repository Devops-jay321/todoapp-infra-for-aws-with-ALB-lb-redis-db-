variable "vpc_cidr_x" {
    type = map(object({
        cidr_block = string
        name = string
    }))
}
variable "subnets_x" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    name = string
    map_public_ip_on_launch = bool
  }))
}
variable "bastion_hosts_x" {
    type = map(object({
        ami           = string
        instance_type = string
        subnet_name   = string
        sg_name      = string
        user_data   = optional(string)
        associate_public_ip_address = bool
        tags         = map(string)
    }))
  
}
variable "sg_x" {
  type = map(object({
    name = string
    tags = map(string)
  }))
}

variable "private_subnet_assoc_x" {
    type = map(object({
        tags = map(string)
        subnet_name = string
    }))
  
}
variable "public_subnet_assoc_x" {
    type = map(object({
        tags = map(string)
        subnet_name = string
    }))
  
}
variable "alb_sg_x" {
  type = map(object({
    name = string
    tags = map(string)
  }))
}
variable "albgw_x" {
  type = map(object({
    name = string
    subnet_keys = list(string)
    load_balancer_type = string
  }))
}
variable "alb_subnets_x" {
  type = map(object({
    subnet_name = string
  }))
}