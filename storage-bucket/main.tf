provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

resource "google_storage_bucket" "terraform_bucket" {
  name     = var.bucket_name
  location = var.region  # Replace with your desired location

  uniform_bucket_level_access = true

  # You can customize additional settings here if needed
  # For example:
  # labels = {
  #   environment = "production"
  # }
}