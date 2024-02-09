provider "google" {
	project = var.project
	credentials = file(var.credentials_file)
	region = var.region
	zone = var.zone
}
/*
resource "google_project_iam_member" "user_iam_member" {
	project = var.project
	role    = "roles/iam.securityAdmin"
	member  = "user:${var.user_email}"
}
*/
resource "google_storage_bucket_iam_binding" "gcs_bucket_binding" {
	bucket = "terraform-temp-bucket-2"
	role = "roles/storage.objectViewer"
	members = ["allUsers"]
}