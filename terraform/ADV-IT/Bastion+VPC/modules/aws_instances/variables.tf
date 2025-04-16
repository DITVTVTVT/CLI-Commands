variable "instance_type" {
  type = string                     # The type of the variable, in this case a string
  default = "t2.micro"                 # Default value for the variable
  description = "The type of EC2 instance" # Description of what this variable represents
}

variable "public_subnets_ids" {
  default = "subnet-123abc"
}

variable "security_group_ids" {
  type = string
  default = "sg-123abc"
}

variable "key_name" {
  type = string
}