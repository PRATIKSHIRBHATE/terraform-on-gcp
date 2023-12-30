output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "compute_instance_name" {
    description = "Name of the Compute engine instance created"
    value       = var.instance_name
}

output "network_IP" {
  value = google_compute_instance.terraform-vm.instance_id
  description = "The internal ip address of the instance"
}
output "instance_link" {
  value = google_compute_instance.terraform-vm.self_link
  description = "The URI of the created resource."
}