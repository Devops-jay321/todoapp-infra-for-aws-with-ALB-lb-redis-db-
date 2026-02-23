variable "listener_alb" {
  description = "Listener for ALB"
  type        = map(object({
    port     = number
    protocol = string
    tg_name  = string
    alb_name = string
  }))
  
}