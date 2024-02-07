locals {
  vm_names = ["terraform-dev-vm", "terraform-test-vm", "terraform-prod-vm"]
}
resource "google_compute_instance" "terraform-vm" {
	# Commented below lines create the multiple vm instances based on the names defined above
	for_each = toset(local.vm_names)
	name = each.value
	machine_type = var.instance_type
	zone = var.zone
	allow_stopping_for_update = true

	scheduling {
    	on_host_maintenance = "TERMINATE"
  	}

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
	
}