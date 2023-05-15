#* VPC
variable "name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

#* Subnet
variable "public_subnets" {
  type = list(object({
    cidr = string
    availabilityZone = string
  }))
}

variable "private_subnets" {
  type = list(object({
    cidr = string
    availabilityZone = string
  }))
}