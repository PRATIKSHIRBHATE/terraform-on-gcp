output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "cloud_function_name" {
    description = "Name of the cloud function created"
    value       = var.cloud_function_name
}