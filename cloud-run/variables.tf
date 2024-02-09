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