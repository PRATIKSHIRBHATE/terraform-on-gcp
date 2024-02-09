# Note: We cannot pass the values to the variables for modules at run time 
# Modules Registry: https://registry.terraform.io/search/modules?namespace=terraform-google-modules

/*
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

*/
module "google-storage-bucket" {
  source     = "terraform-google-modules/cloud-storage/google"
  version    = "~> 5.0"
  project_id = "terrafom-on-gcp"
  names      = ["terraform-temp-bucket-2"]
}