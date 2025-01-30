# variable "mysql_username" {
#   description = "MySQL user name"
#   type = string
#   sensitive = true
# }
#
# variable "mysql_password" {
#   description = "MySQL password"
#   type = string
#   sensitive = true
# }

variable "vault_token" {
  description = "Vault token for authentication"
  type = string
  sensitive = true
}