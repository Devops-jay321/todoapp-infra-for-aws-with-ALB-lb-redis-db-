data "aws_db_subnet_group" "mssql-subnet" {
    name = "db-subnet-group"
  
}
data "aws_vpc" "main_vpc" {
    filter {
        name = "tag:Name"
        values = ["jay-vpc"]
    }
}
data "aws_security_group" "mssql-sg" {
    name = "db-sg"
    vpc_id = data.aws_vpc.main_vpc.id
}