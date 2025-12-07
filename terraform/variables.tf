variable "region" { default = "us-east-1" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet" { default = "10.0.1.0/24" }
variable "instance_type" { default = "t3.micro" }
variable "key_name" { description = "SSH key pair name" }
variable "my_ip" { description = "Your IP for SSH", default = "0.0.0.0/0" }
