vpc_cidr_x = {
  "vpc" = {
    cidr_block = "10.0.0.0/16"
    name = "jay-vpc"
    
  }
}
subnets_x = {
  "public-1a" = {
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
    name = "public-subnet-1a"    
  }
  "public-1b" = {
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true
    name = "public-subnet-1b"    
  }

  "frontend" = {
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = false
    name = "frontend-subnet"  
  }
  "backend" = {
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1c"
    map_public_ip_on_launch = false
    name = "backend-subnet"    
  }
}
bastion_hosts_x = {
  "bastion-host" = {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t3.micro"
    subnet_name = "public-subnet-1a"
    sg_name = "bastion-sg"
    user_data = null
    associate_public_ip_address = true
    tags = {
      Name = "bastion-host"
    }
  }
  "frontend-host" = {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t3.micro"
    subnet_name = "frontend-subnet"
    sg_name = "frontend-sg"
    user_data = "userdata/frontend.sh"
    associate_public_ip_address = false
    tags = {
      Name = "frontend-host"
    }
  }
  "backend-host" = {
    ami = "ami-02521d90e7410d9f0"
    instance_type = "t3.micro"
    subnet_name = "backend-subnet"
    sg_name = "backend-sg"
    user_data = "userdata/backend.sh"
    associate_public_ip_address = false
    tags = {
      Name = "backend-host"
    }
  }
}
sg_x = {
  "bastion-sg" = {
    name = "bastion-sg"
    tags= {
      Name = "bastion-sg"
    }
  }
  "frontend-sg" = {
    name = "frontend-sg"
    tags = {
      Name = "frontend-sg"
    }
  }
  "backend-sg" = {
    name = "backend-sg"
    tags = {
      Name = "backend-sg"
    }
  }
}

alb_sg_x = {
  "alb-sg" = {
    name = "alb-sg"
    tags = {
      Name = "alb-sg"
    }
  }
}
private_subnet_assoc_x = {
  "frontend-assoc" = {
    subnet_name = "frontend-subnet"
    tags = {
      Name = "frontend-rt-assoc"
    }
  }
  "backend-assoc" = {
    subnet_name = "backend-subnet"
    tags = {
      Name = "backend-rt-assoc"
    }
  }
}
public_subnet_assoc_x = {
  "public-assoc-1a" = {
    subnet_name = "public-subnet-1a"
    tags = {
      Name = "public-rt-assoc"
    }
  }
  "public-assoc-1b" = {
    subnet_name = "public-subnet-1b"
    tags = {
      Name = "public-rt-assoc-1b"
    }
  }
}
albgw_x = {
  "alb" = {
    name = "jay-alb"
    subnet_keys = ["public_1a", "public_1b"]
    load_balancer_type = "application"
  }
}
alb_subnets_x = {
  public_1a = { subnet_name = "public-subnet-1a" }
  public_1b = { subnet_name = "public-subnet-1b" }
}
