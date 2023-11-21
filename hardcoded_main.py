provider "google" {
	project = "mlflow-jet2"
	credentials = "${file("credentials.json")}"
	region = "us-central1"
	zone = "us-centarl1-a"

}

resource "google_compute_instance" "terraform-vm" {
	# Uncomment below line to delete the instance
	# count = 0
	name = "terraform-instance"
	machine_type = "f1-micro"
	zone = "us-central1-a"
	allow_stopping_for_update = true

	scheduling {
    	on_host_maintenance = "TERMINATE"
  	}

	boot_disk {
		initialize_params {
			image = "debian-cloud/debian-11"
		}
	}

	network_interface {
		network = google_compute_network.terraform_network.self_link
		subnetwork = google_compute_subnetwork.terraform_subnet.self_link
		access_config {
			//necessary even empty
		}
	}
}

resource "google_compute_network" "terraform_network" {
	name = "terraform-network"
	auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnet" {
	name = "terraform-subnetwork"
	ip_cidr_range = "10.20.0.0/16"
	region = "us-central1"
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