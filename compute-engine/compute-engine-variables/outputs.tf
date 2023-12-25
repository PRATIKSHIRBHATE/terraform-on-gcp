output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "compute_instance_name" {
    description = "Name of the Compute engine instance created"
    value       = var.instance_name
}