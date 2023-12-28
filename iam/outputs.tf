output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "user_email" {
    description = "User Email Address"
    value       = var.user_email
}

output "user_role" {
    description = "User Permissions"
    value       = var.user_role
}