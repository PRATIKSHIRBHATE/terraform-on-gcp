resource "google_app_engine_application" "terraform_app_v" {
  project     = var.project
  location_id = var.location
}