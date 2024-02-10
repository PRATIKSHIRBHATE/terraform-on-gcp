provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

// Enable required APIs
resource "google_project_service" "cloud_build" {
  project            = var.project
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}
resource "google_project_service" "cloud_functions" {
  project            = var.project
  service            = "cloudfunctions.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloud_logging" {
  project            = var.project
  service            = "logging.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloud_pubsub" {
  project            = var.project
  service            = "pubsub.googleapis.com"
  disable_on_destroy = false
}


resource "google_storage_bucket" "function_bucket" {
  name     = "${var.project}-function-bucket"
  location = var.region
}

# Generates an archive of the source code compressed as a .zip file.
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "./src"
  output_path = "./tmp/function.zip"
}

# Add source code zip to the Cloud Function's bucket
resource "google_storage_bucket_object" "zip" {
  source       = data.archive_file.source.output_path
  content_type = "application/zip"

  # Append to the MD5 checksum of the files's content
  # to force the zip to be updated as soon as a change occurs
  name   = "src-${data.archive_file.source.output_md5}.zip"
  bucket = google_storage_bucket.function_bucket.name

  # Dependencies are automatically inferred so these lines can be deleted
  depends_on = [
    google_storage_bucket.function_bucket,
    data.archive_file.source
  ]
}

resource "google_cloudfunctions_function" "terraform_function" {
  name                = var.cloud_function_name
  description         = "Cloud Function created by Terraform"
  runtime             = "python38"
  entry_point         = "hello_http"
  trigger_http        = true
  timeout             = "60"
  available_memory_mb = 256

  # Get the source code of the cloud function as a Zip compression
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.zip.name

  # Dependencies are automatically inferred so these lines can be deleted
  depends_on = [
    google_storage_bucket.function_bucket,
    google_storage_bucket_object.zip
  ]
}
