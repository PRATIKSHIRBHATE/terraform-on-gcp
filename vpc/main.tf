resource "google_compute_network" "vpc" {
  name                    = "demovpc1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "10.3.1.0/24"
  network       = google_compute_network.vpc.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet2"
  ip_cidr_range = "10.3.2.0/24"
  network       = google_compute_network.vpc.self_link
  region        = var.region
}
