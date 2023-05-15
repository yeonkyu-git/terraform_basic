#? Network
module "network" {
  source = "./network"

  name = var.name
  vpc_cidr = var.vpc_cidr

  private_subnets = var.public_subnets
  public_subnets  = var.private_subnets
}