provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

resource "google_cloudfunctions_function" "terraform_function" {
  name                  = "terraform_function"
  description           = "Cloud Function created by Terraform"
  runtime               = "python38"
  entry_point           = "hello_http"
  trigger_http          = true
  timeout               = "60"
  available_memory_mb   = 256

  source_repository {
    url = "https://source.developers.google.com/projects/mlflow-jet2/repos/github_PRATIKSHIRBHATE_gcp-cloud-function-terraform/revisions/main/paths/"
  }

  # You can customize additional settings here if needed
  # For example:
  # environment_variables = {
  #   "ENV_VAR_1" = "value1"
  #   "ENV_VAR_2" = "value2"
  # }
}
