variable "region" {
  type = string 
  default = "ap-northeast-2"
}

variable "access_key" {}
variable "secret_key" {}

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