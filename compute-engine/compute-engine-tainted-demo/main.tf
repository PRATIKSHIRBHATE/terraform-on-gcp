resource "google_compute_instance" "europe_instance"{
        name            = "europe-instance-1"
        machine_type    = "e2-small"
        zone            = "europe-west1-b"
        boot_disk {
                initialize_params {
                        image = "ubuntu-2004-focal-v20231130"
                }
        }
        network_interface {
                network = "default"
        }
}

resource "google_compute_instance" "us_instance"{
        name            = "us-instance-2"
        machine_type    = "e2-small"
        zone            = "us-west1-c"
        boot_disk {
                initialize_params {
                        image = "ubuntu-minimal-2204-lts"
                }
        }
        network_interface {
                network = "default"
        }
}

#terraform taint google_compute_instance.europe_instance