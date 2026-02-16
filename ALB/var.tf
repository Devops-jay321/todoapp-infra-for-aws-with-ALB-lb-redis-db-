variable "albgw" {
  type = map(object({
    name = string
    subnet_keys = list(string)
    load_balancer_type = string
  }))
}
variable "alb_subnets" {
  type = map(object({
    subnet_name = string
  }))
}
