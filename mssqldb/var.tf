variable "dbsql" {
    type =map(object({
        identifier = string
        username = string
        password = string
        engine = string
        instance_class = string   
    }))
  
}