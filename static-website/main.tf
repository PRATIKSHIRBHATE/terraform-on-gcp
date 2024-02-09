resource "google_storage_bucket" "website_bucket" {
  name     = "my-jet2-website-bucket"
  location = "us-central1" # Choose your desired location
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
resource "google_storage_bucket_object" "index_page" {
  name   = "index.html"
  bucket = google_storage_bucket.website_bucket.name
  source = "index.html" # Replace with the path to your index.html file
  content_type = "text/html"
}
resource "google_storage_bucket_object" "error_page" {
  name   = "404.html"
  bucket = google_storage_bucket.website_bucket.name
  source = "404.html" # Replace with the path to your 404.html file
  content_type = "text/html"
}


resource "google_storage_bucket_iam_binding" "index_page_binding" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  members = ["allUsers"]
}
 
output "website_url" {
  value = "https://${google_storage_bucket.website_bucket.name}.storage.googleapis.com"
}

