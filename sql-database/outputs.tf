output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "instance_connection_name" {
  value = google_sql_database_instance.example.connection_name
}