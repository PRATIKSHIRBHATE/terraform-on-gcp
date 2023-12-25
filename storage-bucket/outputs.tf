output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "bucket_name" {
    description = "Name of the bucket created"
    value       = var.bucket_name
}