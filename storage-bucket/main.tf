provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

resource "google_storage_bucket" "terraform_datasets" {
  name     = "terraform_datasets"
  location = var.region  # Replace with your desired location

  uniform_bucket_level_access = true

  # You can customize additional settings here if needed
  # For example:
  # labels = {
  #   environment = "production"
  # }
}