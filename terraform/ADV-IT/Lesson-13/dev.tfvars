# Auto fill parameters for DEV

# File can be named as:
# terraform.tfvars or
# *.auto.tfvars

region                     = "ca-central-1"
instance_type              = "t2.micro"
enable_detailed_monitoring = false
allow_ports                = ["80", "22", "8080"]

common_tags = {
  Owner       = "DIMMM"
  Project     = "Phoenix"
  CostCenter  = "12345"
  Environment = "dev"
}
