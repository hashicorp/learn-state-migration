# Terraform configuration
terraform {
  backend "remote" {
    hostname      = "app.terraform.io"
    organization  = "ross-moug-test"

    workspaces {
      name = "state-migration"
    }
  }
}

variable "name_length" {
  description = "The number of words in the pet name"
  default     = "3"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}
