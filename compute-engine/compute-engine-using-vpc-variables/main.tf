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
		network = "demovpc1" # google_compute_network.terraform_network.self_link
		subnetwork = "subnet1" # google_compute_subnetwork.terraform_subnet.self_link
		access_config {
			//necessary even empty
		}
	}
	
}


/*
resource "google_compute_network" "terraform_network" {
	name = "terraform-network"
	auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnet" {
	name = "terraform-subnetwork"
	ip_cidr_range = "10.20.0.0/16"
	region = var.region
	network = google_compute_network.terraform_network.id
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.terraform_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["10.20.0.0/16", "0.0.0.0/0"]  # Adjust this to the specific IP range or ranges you want to allow for SSH.
}
*/