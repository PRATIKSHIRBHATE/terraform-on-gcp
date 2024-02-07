resource "google_compute_instance" "terraform-vm" {
	name = var.instance_name
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