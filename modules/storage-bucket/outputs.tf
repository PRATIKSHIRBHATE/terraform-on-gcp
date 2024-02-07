output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "bucket_name" {
  description = "Name of the bucket created"
  value       = var.bucket_name
}

# Get bucket metadata
data "google_storage_bucket" "my_object" {
  name = google_storage_bucket.terraform_bucket.id
}

output "bucket_metadata" {
  value = data.google_storage_bucket.my_object
}