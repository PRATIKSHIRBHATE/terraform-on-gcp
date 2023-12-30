terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"

    }
  }
}
provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}