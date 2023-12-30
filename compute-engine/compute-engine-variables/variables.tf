variable "project" {}
variable "credentials_file" {}
variable "instance_name" {}

variable "region" {
		default = "us-central1"
}
variable "zone" {
	default = "us-central1-a"
}
variable "os_image" {
	default = "debian-cloud/debian-11"
}

variable "instance_type" {
  type        = string
  description = "Disk type of the Google Compute instance"
  default     = "f1-micro"
  }