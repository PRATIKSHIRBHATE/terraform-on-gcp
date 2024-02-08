output "project_id" {
  description = "The ID of the project in which resources are provisioned."
  value       = var.project
}

output "compute_instance_name" {
    description = "Name of the Compute engine instance created"
    value       = var.instance_name
}

output "network_IP" {
  value = google_compute_instance.terraform-vm.network_interface[0]
  description = "The internal ip address of the instance"
}
output "instance_link" {
  value = google_compute_instance.terraform-vm.self_link
  description = "The URI of the created resource."
}

# Output variables to display disk sizes
output "boot_disk_size" {
  value = google_compute_instance.terraform-vm.boot_disk[0].initialize_params[0].size
}
/*
output "data_disk_size" {
  value = google_compute_disk.data_disk.size
}
*/