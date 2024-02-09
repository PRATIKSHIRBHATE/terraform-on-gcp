terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  project     = "terrafom-on-gcp"
  # credentials = "C:/Users/Pratik.Shirbhate/Desktop/important_documents/learning_projects/terraform-on-gcp/secrets/credentials-terraform-gcp.json"
  credentials = var.credentials_file
  region      = "us-central1"
  zone        = "us-central1-a"
}