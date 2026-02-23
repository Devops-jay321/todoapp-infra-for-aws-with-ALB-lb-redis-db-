variable "tg_attachments" {
  type = map(object({
    tg_name  = string
    ec2_name = string
    port     = number
  }))
  
}