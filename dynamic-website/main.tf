
# Create a Cloud Storage bucket
resource "google_storage_bucket" "storage_bucket" {
  name          = "my-storage-bucket"
  location      = var.region
}
 
# Create a Cloud Pub/Sub topic
resource "google_pubsub_topic" "pubsub_topic" {
  name = "my-topic"
}
 
# Create a Cloud Function
resource "google_cloudfunctions_function" "function" {
  name        = "my-function"
  runtime     = "nodejs14"
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = "function.zip"
  trigger_http = true
 
  entry_point = "handler"
  timeout     = "60"
 
  available_memory_mb = 256
 
  environment_variables = {
    PUBSUB_TOPIC = google_pubsub_topic.pubsub_topic.name
  }
}
 
# Create a Cloud Firestore database
resource "google_firestore_database" "firestore_database" {
  name = "my-firestore"
  location_id     = "us-west1"  # Specify the location ID here
  type         = "FIRESTORE_NATIVE"   
}
 
# Create a Cloud Scheduler job
resource "google_cloud_scheduler_job" "scheduler_job" {
  name        = "my-scheduled-job"
  schedule    = "every 1 hour"
  description = "Run my function every hour"
  target {
    project_id = var.project_id
    job_type   = "pubsub"
    data       = base64encode(jsonencode({
      topic_name = google_pubsub_topic.pubsub_topic.name
    }))
  }
}
 
# Output
output "function_url" {
  value = google_cloudfunctions_function.function.https_trigger_url
}