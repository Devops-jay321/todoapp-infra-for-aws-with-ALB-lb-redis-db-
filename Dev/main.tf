module "vpc" {
  source = "../vpc"
  vpc_cidr = var.vpc_cidr_x
}
module "subnet" {
    source = "../subnet"
    subnets = var.subnets_x
    depends_on = [ module.vpc ]
  
}
module "eip" {
    source = "../Elasticip"
    depends_on = [ module.vpc ]
  
}
module "igw" {
    source = "../internetgw"
    depends_on = [ module.vpc ]
  
}
module "natgw" {
    source = "../NatGateway"
    depends_on = [ module.subnet, module.eip]
}
module "pub-rt-table" {
    source = "../route_table"
    nat_gateway_id = module.natgw.nat_gateway_id
    depends_on = [ module.vpc, module.igw]
}
module "rt_assoc" {
    source = "../public_rt_assoc"
    private_subnet_assoc = var.private_subnet_assoc_x
    public_subnet_assoc = var.public_subnet_assoc_x
    depends_on = [ module.subnet, module.pub-rt-table]
}
module "securitygroup-pub" {
  source = "../securitygroup-pub"
  sg = var.sg_x
  alb_sg = var.alb_sg_x
  depends_on = [ module.vpc ]
}
module "bastion" {
    source = "../bastion"
    bastion_hosts = var.bastion_hosts_x
    depends_on = [ module.subnet, module.securitygroup-pub, module.natgw ]
}
module "alb_tg" {
    source = "../ALB-tg"
    depends_on = [ module.vpc, module.bastion ]
  
}
module "albgw" {
  source = "../ALB"
  albgw = var.albgw_x
  alb_subnets = var.alb_subnets_x
  depends_on = [ module.vpc, module.subnet, module.securitygroup-pub, module.alb_tg ]
}
module "lstnr" {
  source = "../listener-alb"
  depends_on = [ module.albgw, module.alb_tg ]
}
module "tg-attachment" {
  source = "../tg-attachment"
  depends_on = [ module.albgw, module.alb_tg, module.lstnr ]
}