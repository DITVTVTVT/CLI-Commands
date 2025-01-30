terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}
# terraform {
#   required_providers {
#     local = {
#       source  = "hashicorp/local"
#       version = "2.5.2"
#     }
#   }
# }
provider "vault" {
  address = "http://127.0.0.1:8200"
  token = var.vault_token
}

data "vault_generic_secret" "database" {
  path = "secret/myapp/database"
}

resource "local_file" "credentials_file" {
  filename = "${path.module}/mysql_credentials.txt"
  content = <<EOT
MySQL Username: ${data.vault_generic_secret.database.data["mysql_username"]}
MySQL Password: ${data.vault_generic_secret.database.data["mysql_password"]}
EOT
}