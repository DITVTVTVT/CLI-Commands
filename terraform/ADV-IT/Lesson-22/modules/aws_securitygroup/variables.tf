variable "vpc_id" {
  description = "ID of the VPC to associate with the security group"
  type        = string
}

variable "port_cidr_map" {
  description = "Map of ports and corresponding CIDR blocks"
  type = map(object({
    port      = number
    cidr_block = string
  }))
}
