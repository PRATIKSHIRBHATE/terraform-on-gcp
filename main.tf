# Note: We cannot pass the values to the variables for modules at run time 
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
    credentials = "C:/Users/Pratik.Shirbhate/Desktop/important_documents/learning_projects/terraform-on-gcp/secrets/credentials-terraform-gcp.json"
    region      = "us-central1"
    zone        = "us-central1-a"
}

module "compute-instance" {
        source            = "github.com/PRATIKSHIRBHATE/terraform-on-gcp/modules/compute-engine"
        # source            = "./modules/compute-engine"
        project           = "terrafom-on-gcp"
        credentials_file  = "C:/Users/Pratik.Shirbhate/Desktop/important_documents/learning_projects/terraform-on-gcp/secrets/credentials-terraform-gcp.json"
        instance_name     = "terraform-temp-vm"

        region  = "us-central1"
        zone = "us-central1-a"
        os_image = "debian-cloud/debian-11"
        instance_type = "n1-standard-1"
  }

module "google-storage-bucket" {
        source            = "github.com/PRATIKSHIRBHATE/terraform-on-gcp/modules/storage-bucket"
        # source            = "./modules/storage-bucket"
        project           = "terrafom-on-gcp"
        credentials_file  = "C:/Users/Pratik.Shirbhate/Desktop/important_documents/learning_projects/terraform-on-gcp/secrets/credentials-terraform-gcp.json"
        bucket_name       = "terraform-temp-bucket"
}