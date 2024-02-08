resource "google_compute_instance" "terraform-vm" {
	# Commented below lines create the multiple vm instances based on the names defined above
	for_each = var.instance_types
	name = "demo-${each.key}"
	machine_type = each.value
	zone = var.zone
	allow_stopping_for_update = true

	boot_disk {
		initialize_params {
			image = var.os_image
			size  = 10
		}
	}
	
	network_interface {
		network = "default"
		subnetwork = "default"
	}

	tags = ["${each.key}", "dev"]
	
}