terraform {

  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

provider "ncloud" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  region      = "KR"
  site        = "PUBLIC"
  support_vpc = true
}

locals {
  env     = "staging"
  db      = "postgres"
  db_port = "5432"
}

module "network" {
  source = "../modules/network"

  env            = local.env
  access_key = var.access_key
  secret_key = var.secret_key
}