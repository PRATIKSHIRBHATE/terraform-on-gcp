# [START compute_zonal_mig_set_autoscaling]
resource "google_compute_autoscaler" "default" {
  name   = "example-autoscaler"
  zone   = "us-central1-f"
  target = google_compute_instance_group_manager.default.id
  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 90
    cpu_utilization {
      target = 0.60
    }
  }
}
resource "google_compute_instance_template" "default" {
  machine_type = "e2-medium"
  disk {
    source_image = "debian-cloud/debian-11"
  }
  network_interface {
    network = "default"
  }  
  }
resource "google_compute_instance_group_manager" "default" {
  name               = "example-managed-instance-group"
  zone               = "us-central1-f"
  base_instance_name = "instance"
  version {
    instance_template = google_compute_instance_template.default.id
  }
}