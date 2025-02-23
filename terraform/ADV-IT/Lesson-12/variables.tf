
variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type        = string
  default     = "ca-central-1"
}

variable "instance_type" {
  description = "Enter Instance type"
  type        = string
  default     = "t3.micro"
}

variable "allow_ports" {
  description = "List of Ports to open for server"
  type        = list(number)
  default     = ["80", "443", "22", "8080"]
}

variable "enable_default_monitoring" {
  type    = bool
  default = false
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map(string)
  default = {
    Owner       = "DIMMM"
    Project     = "Phoenix"
    CostCenter  = "12345"
    Environment = "Development"
  }
}