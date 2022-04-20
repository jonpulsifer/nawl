locals {
  project = "nawl-migration"
  region  = "northamerica-northeast1"
  zone    = join("-", [local.region, "a"])
}

provider "google" {
  project = local.project
  region  = local.region
  zone    = local.zone
  version = "~> 4.0"
}

provider "google-beta" {
  project = local.project
  region  = local.region
  zone    = local.zone
  version = "~> 4.0"
}

terraform {
  required_version = ">= 0.12"
  backend "gcs" {
    bucket = "terraform-nawl-migration"
    prefix = "state/migration"
  }
}
