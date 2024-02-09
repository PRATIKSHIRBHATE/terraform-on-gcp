provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

# Enable Cloud Run API
resource "google_project_service" "cloudrun_api" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

# Create basic cloud run job
resource "google_cloud_run_service" "pratik_shirbhate_service" {
  name     = "my-service"
  location = var.region  # Replace with your desired location

  template {
    spec {
      containers {
        image = "gcr.io/terrafom-on-gcp/profile-matching-streamlit-app"  # Replace with your container image URL
      }
    }
  }
}

# Code to allow the service for public without any authentication
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.pratik_shirbhate_service.location
  project     = google_cloud_run_service.pratik_shirbhate_service.project
  service     = google_cloud_run_service.pratik_shirbhate_service.name

  policy_data = data.google_iam_policy.noauth.policy_data
}