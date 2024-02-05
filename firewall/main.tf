resource "google_compute_firewall" "allow_ingress" {
  name    = "allow-ingress"
  network = "demovpc1"  # Specify the network where the firewall rule applies, e.g., "default"

  allow {
    protocol = "icmp"  # Allow ping (ICMP) protocol
  }

  allow {
    protocol = "tcp"   # Allow HTTP (TCP) protocol
    ports    = ["80"]
  }

  allow {
    protocol = "tcp"   # Allow RDP (TCP) protocol
    ports    = ["3389"]
  }

  allow {
    protocol       = "tcp"   # Allow SSH (TCP) protocol
    ports          = ["22"]
  }

  # Add additional rules as needed for other protocols or ports
  source_ranges = ["10.3.1.0/24", "10.3.2.0/24", "0.0.0.0/0"]  # Adjust this to the specific IP range or ranges you want to allow for SSH.
}