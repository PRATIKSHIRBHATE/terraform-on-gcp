provider "google" {
	project = var.project
	credentials = file(var.credentials_file)
	region = var.region
	zone = var.zone
}

resource "google_project_iam_member" "user_iam_member" {
	project = var.project
	role    = "roles/iam.securityAdmin"
	member  = "user:${var.user_email}"
}