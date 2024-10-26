required_providers {
  null = {
    source  = "hashicorp/null"
    version = "~> 3.1"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.3"
  }
}

variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}

provider "null" "main" {}

provider "random" "main" {}

component "pet" {
  source = "./pet"
  inputs = {
    prefix = var.prefix
  }
  providers = {
    random = provider.random.main
  }
}

component "nulls" {
  source = "./nulls"
  inputs = {
    pet       = component.pet.name
    instances = var.instances
  }
  providers = {
    null = provider.null.main
  }
}

output "static" {
  type = string
  value = "static"
}

output "name" {
  type = string
  value = component.pet.name
}

output "sensitive-name" {
  type = string
  sensitive = true
  value = component.pet.name
}

# output "ephemeral-sensitive-name" {
#   type = string
#   sensitive = true
#   ephemeral = true
#   value = component.pet.name
# }
