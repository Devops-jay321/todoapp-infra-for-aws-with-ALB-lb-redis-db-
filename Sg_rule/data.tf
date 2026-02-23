data "aws_security_group" "sg_db" {
    filter {
        name = "tag:Name"
        values = ["db-sg"]
    }
}

data "aws_security_group" "sg_backend" {
    filter {
        name = "tag:Name"
        values = ["backend-sg"]
    }
}