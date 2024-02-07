output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "private_IP_EU" {
  value = google_compute_instance.europe_instance.network_interface.0.network_ip
  description = "The internal ip address of the instance"
}

output "private_IP_US" {
  value = google_compute_instance.us_instance.network_interface.0.network_ip
  description = "The internal ip address of the instance"
}