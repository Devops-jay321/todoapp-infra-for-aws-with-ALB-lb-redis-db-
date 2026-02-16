variable "private_subnet_assoc" {
    type = map(object({
        tags = map(string)
        subnet_name = string
    }))
  
}

variable "public_subnet_assoc" {
    type = map(object({
        tags = map(string)
        subnet_name = string
    }))
  
}