variable "name" {
  type        = string
  description = "The name of the VPC"
  default     = "my_vpc"
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"


}

variable "azs" {
  type        = list(string)
  description = "List of availability zones to use for the VPC"
  default     = ["ap-south-1a", "ap-south-1b"]

}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]


}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]

}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway"
  default     = true

}

variable "enable_vpn_gateway" {
  type        = bool
  description = "Enable VPN Gateway"
  default     = true

}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the VPC and its resources"
  default = {
    "Terraform" = "true"
    "Project"   = "my_project"
  }

}