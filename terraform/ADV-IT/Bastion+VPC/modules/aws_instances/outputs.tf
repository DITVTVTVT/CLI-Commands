
output "bastion_public_ip" {
  value = data.aws_instances.bastion_instance.public_ips
}