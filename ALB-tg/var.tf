variable "tgs" {
  description = "Target groups for ALB"
  type        = map(object({
    name     = string
    port     = number
    protocol = string
  }))
}