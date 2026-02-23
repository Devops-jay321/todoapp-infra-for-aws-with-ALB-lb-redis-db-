variable "db-subnet-group" {
  type = map(object({
    name = string

    db-1 = object({
      subnet_name = string
    })

    db-2 = object({
      subnet_name = string
    })
  }))
}