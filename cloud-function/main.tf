provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

// Enable required APIs
resource "google_project_service" "cloud_build" {
  project             = var.project
  service             = "cloudbuild.googleapis.com"
  disable_on_destroy  = false
}
resource "google_project_service" "cloud_functions" {
  project = var.project
  service = "cloudfunctions.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "cloud_logging" {
  project = var.project
  service = "logging.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "cloud_pubsub" {
  project = var.project
  service = "pubsub.googleapis.com"
  disable_on_destroy  = false
}


resource "google_cloudfunctions_function" "terraform_function" {
  name                  = var.cloud_function_name
  description           = "Cloud Function created by Terraform"
  runtime               = "python38"
  entry_point           = "hello_http"
  trigger_http          = true
  timeout               = "60"
  available_memory_mb   = 256

  source_repository {
    url = "https://source.developers.google.com/projects/terrafom-on-gcp/repos/github_PRATIKSHIRBHATE_gcp-cloud-function-terraform/revisions/main/paths/"
  }

  # You can customize additional settings here if needed
  # For example:
  # environment_variables = {
  #   "ENV_VAR_1" = "value1"
  #   "ENV_VAR_2" = "value2"
  # }
}
