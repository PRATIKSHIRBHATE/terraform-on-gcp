resource "google_storage_bucket" "terraform_bucket" {
  name     = var.bucket_name
  location = var.region # Replace with your desired location

  uniform_bucket_level_access = true

  # You can customize additional settings here if needed
  # For example:
  # labels = {
  #   environment = "production"
  # }
}

# Create a text object in cloud google_storage_bucket
resource "google_storage_bucket_object" "my_object" {
  name         = "new-object"
  content      = "My name is Pratik"
  content_type = "text/plain"
  bucket       = google_storage_bucket.terraform_bucket.id
}

# Get bucket metadata
data "google_storage_bucket" "my_object" {
  name = google_storage_bucket.terraform_bucket.id
}

output "bucket_metadata" {
  value = data.google_storage_bucket.my_object
}