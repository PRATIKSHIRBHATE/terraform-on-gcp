variable "project" {}
variable "credentials_file" {}
variable "cloud_function_name" {}

variable "region" {
		default = "us-central1"
}
variable "zone" {
	default = "us-central1-a"
}
variable "os_image" {
	default = "debian-cloud/debian-11"
}

variable "location" {
  description = "Location of the storage bucket"
  type        = string
  default     = "us-central"
}