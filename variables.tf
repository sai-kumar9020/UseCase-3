variable "region" {
    description = "AWS region for deployment"
    type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

 variable "key_name" {
   description = "SSH Key Pair Name for EC2"
   type        = string
 }

variable "ami_id" {
  description = "ami id"
  type        = string

}


variable "vpc_cidr" {
   description = "CIDR block for VPC"
   type        = string
}

variable "public_subnet_cidr" {
   description = "CIDR block for Public Subnet 1"
  type        = string
}

variable "public_subnet_cidr2" {
   description = "CIDR block for Public Subnet 2"
  type        = string
}



