variable "vpc_cidr" {
    type = map(object({
        cidr_block = string
        name = string
    }))
}