variable "region" {
description = "AWS region"
type = string
default = "us-east-1"
}


variable "vpc_cidr" {
description = "VPC CIDR block"
type = string
default = "10.0.0.0/16"
}


variable "public_subnets" {
description = "List of public subnets CIDRs"
type = list(string)
default = ["10.0.1.0/24", "10.0.2.0/24"]
}


variable "private_subnets" {
description = "List of private subnets CIDRs"
type = list(string)
default = ["10.0.101.0/24", "10.0.102.0/24"]
}


variable "instance_type" {
description = "EC2 instance type"
type = string
default = "t3.micro"
}


variable "desired_capacity" {
description = "Desired ASG capacity"
type = number
default = 1
}


variable "min_size" {
description = "ASG min size"
type = number
default = 1
}


variable "max_size" {
description = "ASG max size"
type = number
default = 2
}
