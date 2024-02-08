variable "project" {}
variable "credentials_file" {}

variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "os_image" {
  default = "debian-cloud/debian-11"
}

variable "instance_types" {
  type        = map
  description = "Disk types of the Google Compute instance"
  default     = {
    "web" : "e2-micro"
    "app" : "e2-small"
    "db" : "e2-medium"
  }
}