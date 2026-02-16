variable "sg" {
  type = map(object({
    name = string
    tags = map(string)
  }))
}
variable "alb_sg" {
  type = map(object({
    name = string
    tags = map(string)
  }))
}