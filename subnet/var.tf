variable "subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    name = string
    map_public_ip_on_launch = bool
  }))
}