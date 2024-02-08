resource "google_sql_database_instance" "example" {
  provider     = google
  name         = "example-instance"
  deletion_protection = false
  database_version = "MYSQL_5_7"
  region       = "us-central1"
  settings {
    tier = "db-f1-micro"
    
    # other configurations...
  }
}